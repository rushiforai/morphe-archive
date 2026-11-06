# Bakaláři Morphe Patches — APK Patching for cz.bakalari.mobile

## Repository Status

**Patches blocked due to Flutter architecture.** `cz.bakalari.mobile` (Bakaláři OnLine v4.3.2) is a Flutter application where all ad logic lives in Dart code compiled to `libapp.so`, not in DEX bytecode that Morphe patches can modify.

## Why Morphe Patches Don't Work

| Approach | Result |
|----------|--------|
| Morphe patches (DEX modification) | ❌ App is Flutter, all ad logic is in `libapp.so`, not DEX |
| Binary patching `libapp.so` | ❌ Crashes app — corrupts Flutter AOT snapshot |
| Frida runtime instrumentation | ⚠️ Possible but unstable — Flutter uses its own Dart VM networking, not standard OkHttp |

## Working Solution: Binary-Patched APK

I successfully patched `libapp.so` by replacing ad-serving CDN domain names with `localhost` + null bytes (same-length replacement, so the Flutter snapshot stays intact).

### Blocked Domains

| Domain | Offset | Purpose |
|--------|--------|---------|
| `campaign.bakalari.cz` | `0x0007d02a` | Ad banner API |
| `campaign-dev.bakalari.cz` | `0x0023e3c6` | Dev ad API |
| `netglade.cz` | `0x00079dd6` | Ad network |
| `netglade.cz` | `0x001b0c70` | Ad network domain reference |

### How the Patch Works

The Dart app constructs ad request URLs at runtime from string constants embedded in `libapp.so`. By replacing the domain names with `localhost` followed by null bytes (same length), all ad requests resolve to `localhost` which doesn't serve ads, causing them to fail silently.

## Patched APK

**File:** `cz.bakalari.mobile_4.3.2_patched_v3.apk`

| Check | Result |
|-------|--------|
| Size | ~49.7 MB |
| Signature (v2/v3) | ✅ Valid |
| Zip alignment | ✅ Verified |
| Patched CDN URLs | ✅ All 4 replaced with `localhost` |
| App runs without crashing | ✅ Verified on Android 17 (API 37) |

### Installation

```bash
# Uninstall original first (signature mismatch)
adb uninstall cz.bakalari.mobile

# Install patched APK
adb install cz.bakalari.mobile_4.3.2_patched_v3.apk
```

### Files in This Repository

| File | Purpose |
|------|---------|
| `README.md` | This documentation |
| `cancel_ads.js` | Frida script (alternative approach — runtime instrumentation) |
| `patch_apk.py` | Python script to patch `libapp.so` |
| `repack_apk.py` | Script to repack `.so` back into APK |
| `repack_and_sign.sh` | Full pipeline script |

## Why Binary Patching Works (This Time)

The key insight: **replace domain names with `localhost` + null bytes of the SAME LENGTH.** This keeps the Flutter snapshot's string table offsets valid while making the URLs resolve to `localhost` instead of ad servers.

### Patch Details

| Offset | Domain | Replacement |
|--------|--------|-------------|
| `0x0007d02a` | `campaign.bakalari.cz` | `localhost\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00` |
| `0x0023e3c6` | `campaign-dev.bakalari.cz` | `localhost\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00` |
| `0x00079dd6` | `netglade.cz` | `localhost\x00\x00` |
| `0x001b0c70` | `netglade.cz` | `localhost\x00\x00` |

## Alternative: Frida Script

The `cancel_ads.js` script provides an alternative runtime-interception approach using Frida. Hooks `HttpURLConnection.connect()`, `okhttp3.HttpUrl.Companion.d()`, and other HTTP methods to block ad requests before they're sent.

### Usage

```bash
# On rooted device with frida-server running:
frida -U -l cancel_ads.js -f cz.bakalari.mobile
```

---

**Bottom line:** The patched APK at `cz.bakalari.mobile_4.3.2_patched_v3.apk` works — it installs, runs without crashing, and blocks sponsored ad pop-ups by redirecting ad CDN URLs to localhost.
