# Network Guard for Gboard by zipzopzippy

<a href="https://morphe.software/add-source?github=zipzopzippy/gboard-morphe-patch"><img alt="Add to Morphe" src=".github/assets/add-to-morphe.svg"></a>

To install: tap **Add to Morphe** above on your phone, or in Morphe Manager add the patch source `https://github.com/zipzopzippy/gboard-morphe-patch`. Then patch Gboard (tested with 18.6.10.1002251336, arm64-v8a nodpi APK from APKMirror). Updates arrive through Morphe Manager.

A [Morphe](https://github.com/MorpheApp) patch for Gboard (`com.google.android.inputmethod.latin`) that **blocks every network request except the ones you allow**. The default allowlist is just enough for **Emoji Kitchen**.

## What it does

- **Network guard** (one patch, on by default):
  - Rewrites every call site in Gboard that reaches the network through:
    - `URL.openConnection` / `openStream`, `Network.openConnection`
    - Cronet `newUrlRequestBuilder` / `newBidirectionalStreamBuilder` (Gboard's main HTTP and gRPC stack)
    - `InetAddress.getByName` / `getAllByName`, `Network.getByName` (DNS, covers OkHttp)
    - `Socket.connect`, `SocketChannel.connect`, `SocketFactory.createSocket` (catch-all)
  - Each of these calls now goes through `NetworkGuard`. A blocked request fails the way a dead network would: an `IOException`/`UnknownHostException`, or for Cronet a dead local URL, so `onFailed()` runs.
  - **Play services hand-offs:** Gboard's `bindService` calls to `com.google.android.gms` (Clearcut logging, Phenotype sync, …) are refused unless their action is allowlisted. Gboard sees the same result as "Play services unavailable".
  - Adds **Settings → Network access** inside Gboard, where you can:
    - switch blocking on or off
    - edit the host allowlist and the Play services action allowlist
    - view a request log; tap a blocked entry to add it to the allowlist

The patch only hooks framework and Cronet APIs, whose names survive obfuscation, never obfuscated Gboard methods. So it should work on most Gboard versions without per-version fingerprints. It fails at patch time, rather than doing nothing, if it finds no URL or Cronet call sites.

- **Enable feature flags** (on by default): switches on Gboard features that ship turned off and that Google normally enables remotely, which the network guard prevents. The flags are set with the `enabledFlags` option:
  - `enable_ocr`: Scan text, which lets you photograph text to type it. Supported languages default to English.
  - `enable_device_intelligence`: inline autofill suggestions, so password managers such as Bitwarden show their suggestions in Gboard's suggestion strip instead of a popup over the text field.

- **Offline voice typing** (on by default, English only): lets Gboard's built-in on-device speech recognizer handle every English variant (Gboard only allows English (US); en-AU, en-GB, en-IN, ... now work too) and, for English voice sessions, skips Google's online recognizer while "Prefer offline voice typing" is on (Gboard settings > Network access). Gboard's on-device engine only accepts its English (US) speech pack, so the patch always uses that pack and makes Gboard download it (once, from `dl.google.com`) as soon as the phone is on Wi-Fi, without waiting for charging or needing English (US) enabled. Other languages keep Gboard's normal (online) voice typing, which the network guard blocks unless you allow Google's speech servers.

## Allowlist rules

| Rule | Allows |
|---|---|
| `example.com` | that host only |
| `*.example.com` | the host and its subdomains |
| `example.com/some/path/` | URLs under that path. At the DNS/socket level the whole host is allowed, because paths aren't visible there. |
| `# comment` | ignored |

Defaults (patch option `allowedRules`):

```
*.gstatic.com                          # Google's static CDN: Emoji Kitchen, language/dictionary packs, emoji data
tenor.googleapis.com                   # Emoji Kitchen combinations
translation.googleapis.com             # Translate
dl.google.com/android/voice/gboard/    # offline voice typing speech packs
```

Default Play services allowlist (patch option `allowedPlayServicesActions`): `com.google.android.gms.chimera.container.moduleinstall.ModuleInstallService.START` and `com.google.android.chimera.BoundService.START`, which Scan text needs to load its on-device text recognition module. Play services logging (`clearcut`) and remote flags (`phenotype`) stay blocked.

Defaults added by a newer patch version are merged into an existing saved allowlist automatically; defaults you removed yourself stay removed.

These are the image CDN path and the Tenor API that Emoji Kitchen is known to use. If Emoji Kitchen doesn't load:

1. Clear the log.
2. Open Emoji Kitchen.
3. Tap **Refresh**.
4. Tap the blocked entries to allow them, then tap **Save**.

## Patch options

| Option | Default | |
|---|---|---|
| `allowedRules` | Emoji Kitchen hosts | initial host allowlist |
| `blockByDefault` | `true` | whether blocking is on right after install |
| `blockPlayServices` | `true` | whether Play services hand-offs are blocked right after install |
| `enabledFlags` | `enable_ocr`, `enable_device_intelligence` | Gboard boolean flags switched on by **Enable feature flags** |

## Limits (not covered)

- Traffic that **Google Play services sends by itself**. Only Gboard's request to Play services is blocked; Play services' own syncing isn't. Use a firewall (NetGuard, RethinkDNS) or Private DNS for that.
- Redirects that Cronet follows on its own, to another host, after an allowed request.
- Native code that opens sockets directly, and WebView traffic.
- `bindService` calls whose reference type is an obfuscated Gboard subclass rather than a framework `Context` type. These are uncommon.

## Building

Needs JDK 17+ and a GitHub token with `read:packages`, because the Morphe Gradle plugin is hosted on GitHub Packages. Put it in `~/.gradle/gradle.properties`:

```
gpr.user=<github username>
gpr.key=<token>
```

Set `JAVA_HOME` to a JDK 17+ and run `./gradlew buildAndroid`. The patches file goes to `patches/build/libs/*.mpp`; load it in Morphe Manager or Morphe CLI together with a Gboard APK.

## Credits

Built from [morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template). The way the settings entry is injected follows [jasonwu1994/Gboard-patches](https://github.com/jasonwu1994/Gboard-patches). GPLv3.
