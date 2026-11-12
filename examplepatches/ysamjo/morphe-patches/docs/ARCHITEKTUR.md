# Architektur — drei Apps, drei Wände

Diese Datei vor dem ersten Patch lesen. Sie hält pro Ziel fest, was belegt ist und was noch
Annahme ist.

| Teil | Ziele | Grundlage |
| --- | --- | --- |
| [1](#teil-1--youtube-for-android-tv-und-tizentube-cobalt) | `com.google.android.youtube.tv` 7.25.302, `io.gh.reisxd.tizentube.cobalt` 2.0.2 | APKs vom Google TV Streamer |
| [2](#teil-2--rtl) | `de.rtli.tvnow` 7.15.2 | APK vom Google TV Streamer |

---

# Teil 1 — YouTube for Android TV und TizenTube Cobalt

Grundlage sind zwei Quellen: eine Statik-Analyse von `com.google.android.youtube.tv` 7.11.300
(Versionscode 711300320) und — belastbarer — das APK von **7.25.302**, direkt von einem
Google-TV-Gerät gezogen.

## Verifizierter Stand: 7.25.302

Am 2026-10-04 wurde das APK direkt von einem **Google TV Streamer** gezogen
(`kirkwood`, Android 14, `armeabi-v7a`) und ausgewertet. Das ist die belastbarste Grundlage,
die dieses Repo hat — alle folgenden Angaben stammen aus diesem Build, nicht aus Annahmen.

| Frage | Befund |
| --- | --- |
| Version | 7.25.302, Versionscode 725302320, `minSdk=32`, `targetSdk=36` |
| Splits | `[base, config.armeabi_v7a]`, nur 32-Bit-ARM |
| `cobalt.APP_URL` | Vorhanden, **zweimal** — `MainActivity` und `StandalonePlayerActivity` |
| Konkrete Activities | `com.google.android.apps.youtube.tv.activity.MainActivity` und `.StandalonePlayerActivity` |
| Vererbung | `MainActivity` → `Lcih;` (obfuskiert, abstract) → `dev.cobalt.coat.CobaltActivity` (abstract) → `BaseCobaltActivity` |
| `CobaltActivity.onCreate` | `(Landroid/os/Bundle;)V`, `PROTECTED`, **26 Register**, `ins=2` |
| `CobaltActivity.getActiveWebContents` | `PUBLIC FINAL`, Rückgabe `Lcobalt/org/chromium/content_public/browser/WebContents;` |
| WebContents-Implementierung | `cobalt.org.chromium.content.browser.webcontents.WebContentsImpl`, Superklasse `Ljava/lang/Object;` |
| Nativer Zeiger | Genau **ein** `long`-Feld, obfuskiert zu `b`, `PUBLIC` |
| JS-Injektion | `GEN_JNI.cobalt_org_chromium_content_browser_webcontents_WebContentsImpl_evaluateJavaScript(J,Object,Object)V` — **Rückgabetyp `V`** |
| Engine-Bibliothek | `libchrobalt.so` (62 MB, im ABI-Split) — nicht mehr `libcobalt.so` |

Zwei Konsequenzen daraus:

1. Der Cobalt-Namespace ist **`cobalt.org.chromium.*`**, nicht `org.chromium.*`. Wer
   Chromium-Pfade hart kodiert, greift daneben.
2. `android.app.lib_name = cobalt` im Manifest ist irreführend: eine `libcobalt.so` gibt es
   nicht mehr. Die Activity ist keine `NativeActivity`; die Engine wird aus Java geladen.

Beide Patches wurden gegen dieses APK ausgeführt (siehe `docs/VERIFIKATION.md`). Patch A
läuft durch, Patch B kompiliert, injiziert und greift zur Laufzeit.

## Zweite Ziel-App: TizenTube Cobalt

[TizenTube Cobalt](https://github.com/reisxd/TizenTubeCobalt) bringt die TizenTube-Mods
(SponsorBlock, Geschwindigkeit, PiP, DeArrow) auf Android TV. Es ist **kein** Patch der
YouTube-TV-App, sondern ein eigener Cobalt-Build — die Engine-Bibliothek heißt dort ebenfalls
`libchrobalt.so`. Geprüft am 2026-10-04 gegen `io.gh.reisxd.tizentube.cobalt` 2.0.2
(`cobalt-arm.apk`):

| Frage | Befund |
| --- | --- |
| Version | 2.0.2, Versionscode 202, `targetSdk=36`, nur `armeabi-v7a` |
| Splits | keine — eine einzelne APK |
| `cobalt.APP_URL` | Vorhanden, zeigt auf die projekteigene Daten-URL |
| Launcher-Activity | `dev.cobalt.app.MainActivity` (PUBLIC) |
| Vererbung | `dev.cobalt.app.MainActivity` → `dev.cobalt.coat.CobaltActivity` (abstract) → `android.app.Activity` |
| `CobaltActivity.onCreate` | `(Landroid/os/Bundle;)V`, `PROTECTED`, **7 Register**, `ins=2` → `p0` = `v5` |
| `CobaltActivity.getActiveWebContents` | `PUBLIC`, Rückgabe `Lorg/chromium/content_public/browser/WebContents;` |
| WebContents-Implementierung | `org.chromium.content.browser.webcontents.WebContentsImpl` |
| Nativer Zeiger | `mNativeWebContentsAndroid` — **nicht obfuskiert**, einziges `long`-Feld |
| JS-Injektion | `GEN_JNI.org_chromium_content_browser_webcontents_WebContentsImpl_evaluateJavaScript(J,Object,Object)V` |
| `JavaScriptCallback` | `org.chromium.content_public.browser.JavaScriptCallback.handleJavaScriptResult(String)` — **Originalname** |

Drei Unterschiede zur Stock-App, die im Code berücksichtigt sind:

1. Der Namespace ist **`org.chromium.*`** ohne das `cobalt.`-Präfix. Die Extension probiert
   beide Kandidaten durch (`CALLBACK_CLASS_NAMES`); alles andere wird über das von
   `getActiveWebContents()` gelieferte Objekt reflektiert und ist damit ohnehin
   namensraumunabhängig.
2. Der Build ist **unobfuskiert**. Deshalb funktioniert dort, was auf der Stock-App unmöglich
   ist: ein Rücklese-Wert. `probeReadBack` liefert
   `js callback handleJavaScriptResult -> ["complete|42"]`.
3. **Konsolenausgaben injizierter Skripte kommen an** (`CONSOLE:1] "YSAMJO_ADBLOCK_ACTIVE"`).
   Auf der Stock-App werden sie verschluckt. Wer dort debuggt, darf aus einer fehlenden Zeile
   keinen Rückschluss ziehen.

`CobaltActivity.onCreate` ist in beiden Apps die richtige Injektionsstelle, obwohl der Launcher
jeweils anders heißt — beide erben davon, und `p0` bleibt in beiden Fällen unter v16. Die
`invoke-static/range`-Form wird trotzdem beibehalten: sie ist in beiden Fällen korrekt, und
eine Bedingung, die nur manchmal gilt, ist ein Fehler, der auf die nächste Version wartet.

## Die Wand

Auf dem Handy wird YouTube per Smali gepatcht: Werbe- und Player-Code liegen *im* APK, ein
Patch no-op't eine Funktion und fertig. Dieses Modell überträgt sich nicht.

YouTube for Android TV ist eine **Cobalt-/COAT-Shell**:

- Das Dex ist nur ein Bootstrap — `dev.cobalt.coat.CobaltActivity`, `StarboardBridge`,
  `MediaCodecBridge`, `MediaDrmBridge`, plus eine mitgelieferte `cobalt.org.chromium.*`-Schicht.
- Das Manifest zeigt auf `cobalt.APP_URL = https://www.youtube.com/tv` und
  `android.app.lib_name = cobalt`. Die Engine selbst ist das native `libchrobalt.so` im
  ABI-Split — der Manifest-Eintrag ist ein Überbleibsel.
- In `base.apk` liegt **kein JS und kein Player-Code**. UI, Player und Werbe-Pipeline werden
  zur Laufzeit von `youtube.com/tv` geladen und von der nativen Engine ausgeführt.

Konsequenzen für den Patch-Bau:

- Es gibt keine lokale Ad-Funktion, aus der man früh zurückkehren könnte.
- Werbung wird serverseitig, in remote geladenem JS und im nativen Media-Pfad erzwungen.
- Die Engine ist kein `WebView`. Tricks über `WebViewClient.shouldInterceptRequest`, die bei
  anderen TV-Apps funktionieren (Twitch, Peacock), greifen hier nicht.

## Seam 1 — die Cobalt-Startup-URL (implementiert)

`CobaltActivity` baut die Engine-Kommandozeile. Wenn der Launch-Intent keinen `--url=`-Switch
mitbringt, liest sie das Manifest-Meta-Data `cobalt.APP_URL` und hängt `--url=<Wert>` an.

Der Startup-Guard blockiert fremde URLs **nicht**:

```
if (mStartupUrl.startsWith("https://www.youtube.com/tv")) {
    // normaler Pfad
} else {
    Log("Non-Youtube startup URL detected.");
    startupGuard.disarm();   // disarmt nur einen Watchdog
}
// lädt mStartupUrl in beiden Fällen
```

Eine einzige Manifest-Zeile entscheidet also, was die ganze App lädt.

Umgesetzt als `cobaltStartupUrlPatch`. Zwei sinnvolle Verwendungen:

1. **Filterndes Frontend.** Auf einen Proxy zeigen, der ein modifiziertes `youtube.com/tv`
   ausliefert. Antwortet der Proxy auf demselben Host, passiert der Guard unangetastet und der
   Watchdog wird nie disarmt. Das ist der update-feste Weg: kein Re-Signing, kein Re-Patchen
   bei jedem neuen Google-Build.
2. **A/B-Test.** Anderes Frontend ausprobieren, ohne die Engine anzufassen.

Nicht umgesetzt, gleicher Seam: `--url=` beim Start über `mJavaSwitches` einspeisen.

Der Patch gilt **nur** für die Stock-App. Bei TizenTube zeigt `cobalt.APP_URL` auf die eigene
Daten-URL des Projekts; sie umzuschreiben würde das Projekt zerstören.

## Seam 2 — JS-Injektion in die laufende Seite (implementiert)

Der eigentlich interessante Weg. Der ausgelieferte Build enthält die Injektions-Maschinerie
noch vollständig — R8 hat nur den Java-Aufrufer entfernt:

| Baustein | Zustand im Stock-APK (in 7.25.302 nachgeprüft) |
| --- | --- |
| `components/js_injection` (Document-Start-Injektion) | In die Engine kompiliert (`js_injection.mojom.JsCommunication`, `WebViewDocumentStartJavascriptChanged`) |
| `WebContents.evaluateJavaScript`-Native | Noch registriert: `GEN_JNI…WebContentsImpl_evaluateJavaScript(J,Object,Object)V` |
| Handle auf die laufende Seite | `CobaltActivity.getActiveWebContents()`, `PUBLIC FINAL` |
| Nativer WebContents-Pointer | Genau ein `long`-Feld auf `WebContentsImpl` (zu `b` umbenannt, `PUBLIC`) |

`evaluateJavaScript` läuft in der **Main World** der Seite. Deshalb kann die Payload das
`JSON.parse` der Seite ersetzen und InnerTube-Antworten lesen, bevor die App es tut. Das ist
derselbe Hebel, den TizenTube zieht — nur ohne Engine-Fork.

Umgesetzt als `injectAdblockUserscriptPatch`:

1. Fingerprint auf `CobaltActivity.onCreate` — Cobalt ist Open Source, `dev.cobalt.coat.*`
   behält seine Namen und ist damit ein stabiler Anker über App-Versionen hinweg.
2. Injektion von `CobaltScriptInjector.schedule(this)` an den Anfang von `onCreate`.
3. Die Extension pollt den Main-Looper, bis `getActiveWebContents()` ungleich null liefert,
   ermittelt den nativen Pointer und die `GEN_JNI`-Methode **nach Form statt nach Namen**
   (das `long`-Feld, die Methode mit Endung `_evaluateJavaScript`) und ruft sie auf.
4. Die Payload hookt `JSON.parse` und löscht `adPlacements`, `playerAds`, `adSlots`,
   `adBreakHeartbeatParams`, `importantAdBreak`, `adBreakServiceMetadata`, bevor die App die
   Antwort parst.

Die Auflösung nach Form ist Absicht: Der Feldname auf `WebContentsImpl` wird von R8 umbenannt
und ist in jeder Version anders. Ein Patch, der ihn hart kodiert, bricht bei jedem Update.
Der Anker auf `getActiveWebContents()` und den `GEN_JNI`-Namen hält einen Patch-Build über
Versionen hinweg am Leben.

Der Patch läuft auf beiden Zielen: er ist gegen `COMPATIBILITY_YOUTUBE_TV` **und**
`COMPATIBILITY_TIZENTUBE_COBALT` deklariert.

### Stolperfalle: `invoke-static` erreicht `p0` in dieser Methode nicht

Der Injektionspunkt ist `CobaltActivity.onCreate` — und die hat **26 Register**. Damit liegt
`p0` auf **v24**.

`invoke-static` kodiert seine Registerliste im Dex-Format **35c mit 4 Bit**, also `v0`–`v15`.
Ein `invoke-static { p0 }` scheitert deshalb beim Kompilieren:

```
[7,16] Invalid register: v24. Must be between v0 and v15, inclusive.
```

Richtig ist die Range-Form (Format **3rc**, 16-Bit-Register):

```smali
invoke-static/range { p0 .. p0 }, Lapp/ysamjo/extension/youtubetv/CobaltScriptInjector;->schedule(Landroid/app/Activity;)V
```

Die Alternative — `move-object/from16 v0, p0` und dann `invoke-static { v0 }` — funktioniert
ebenfalls, überschreibt aber `v0` der Originalmethode. Die Range-Form tut das nicht und ist
deshalb die gewählte Variante.

Wer den Injektionspunkt auf eine andere Methode verschiebt, muss das erneut prüfen: Sobald die
Zielmethode mehr als 16 Register hat, ist `p0` außerhalb der 4-Bit-Reichweite.

### Back-Taste → App beenden (Seam 2b, implementiert)

Die YouTube-TV-App (Cobalt-Shell) hat keinen nativen Back-Button-Handler, der auf der
Startseite die App schließt — die Zurück-Taste wird vom Navigation-Stack der Web-App
verbraucht.

Der Seam nutzt dieselbe `evaluateJavaScript`-Brücke wie der Adblock-Patch: JavaScript wird
in die Seite injiziert, aber diesmal mit einem {@code JavaScriptCallback} als drittem
Argument. Der Callback ist ein Java-Proxy, der {@code handleJavaScriptResult(String)}
implementiert. Im injizierten Skript ist er als {@code arguments[3]} verfügbar.

Ablauf:

1. Das JS registriert einen {@code popstate}-Event-Listener.
2. Wenn die URL die Home-Path ist ({@code /tv}) und {@code history.length <= 1}, ruft
   es {@code arguments[3]('BACK_TO_EXIT_HOME')} auf.
3. Der Java-Proxy empfängt den String und ruft {@code activity.finish()} auf.

Umsetzung: `InjectBackToExitPatch` injiziert `BackToExitInjector.schedule()` am Anfang von
`CobaltActivity.onCreate`. `BackToExitInjector.schedule()` pollt auf WebContents (wie der
Adblock-Injektor) und injiziert dann das Back-Exit-Skript mit dem Callback-Proxy.

**Kanalgeschwindigkeits-Regeln (ergänzend zu Seam 2):** `ChannelSpeedPayload` wird beim
Build aus `extensions/extension/src/main/js/channel-speed.js` erzeugt und definiert
JavaScript, das die Kanal-URL ausliest ({@code /channel/<id>}) und bei einem Match
{@code setClientSettingEndpoint('videoSpeed', 1.0)} aufruft. Geregelt sind die Sportkanäle
sportstudio, Sportschau, Sky Sport (DE, Austria), DAZN (DE), RTL Sport, Prime Video
Sport, Eurosport Deutschland, SPORT1, ran, kicker, Magenta Sport, NFL, NBA, MotoGP, Formula 1,
Bundesliga, DFB und UEFA — jeweils 1,0×:

```
adb logcat -s ysamjo-tv-adblock | grep channel
```

## Seam 3 — das Netzwerk (nicht umgesetzt)

Cobalt hat einen eigenen Net-Stack (`cobalt.org.chromium.net.*`). Ein Filter auf Netzwerkebene
ist deshalb verlässlicher als alles, was auf Java-Ebene hängt. Ein MITM-Proxy oder eine
DNS-Schicht, die die Antworten der Leanback-App umschreibt, braucht kein Repackaging und
übersteht App-Updates. Das ist die robusteste Antwort auf diese Architektur — es ist nur kein
APK-Patch und gehört damit nicht in dieses Repo.

## Anti-Tamper-Hinweise

- Play-**Source-Stamp** ist vorhanden; jedes Re-Signing macht ihn ungültig. Für Sideload egal.
- GMS-**DroidGuard**-Attestierung ist verdrahtet — relevant nur, wenn ein Patch
  Integritätspfade anfasst. Bisher kein Hinweis, dass sie Wiedergabe gated.
- `android:extractNativeLibs="false"` — Alignment beim Repackaging erhalten.
- Die App braucht ihren ABI-Split. Bundle mergen oder base + Split zusammen installieren.

## Offene Fragen

1. **Timing — gemessen, aber nicht abschließend gelöst.** Der erste Treffer landet fast immer
   in ein Dokument, das die nächste Navigation wegwirft (~300 ms vor dem Commit der
   Navigation), und der erste Ad-Beacon folgte innerhalb von zwei Sekunden — also vor der
   nächsten Injektion im 2-s-Takt. `schedule()` bleibt deshalb 30 s auf dem 250-ms-Intervall.
   Sauberer wäre ein Hook auf `WebContentsObserver`/Navigation-Committed statt Polling.
2. Ehrt Cobalt einen `--proxy-server`-Switch? Dann verschmelzen Seam 1 und Seam 3 zu einer
   reinen On-Device-Lösung ohne externe Proxy-Box.
3. **Ad-Keys — beantwortet, aber nicht vollständig.** `adPlacements` kommt in den
   `JSON.parse`-Ergebnissen an und wird entfernt; die Keys der Handy-App reichen also. Offen
   bleibt, ob die *Player*-Antwort zusätzlich über einen Pfad kommt, den der Hook nicht sieht.
   Ein XHR-Hook auf `responseText`/`response` wäre der nächste Schritt, falls Werbung sichtbar
   bleibt. Der Ad-Beacon taugt als Messgröße nicht — die Gegenprobe ohne Blocker lieferte
   weniger Requests als die mit (`docs/VERIFIKATION.md`, Abschnitt 4).
4. **Zeitliche Abdeckung von `schedule` — beantwortet.** Der Aufruf sitzt vor
   `super.onCreate()`, die Extension pollt danach den Main-Looper. In der Praxis erschien
   `userscript injected` zuverlässig vor dem Commit der ersten Navigation.

## Quellen (Teil 1)

- `ajstrick81/morphe-androidtv-patches` — die Statik-Analyse zu 7.11.300, auf der das
  Verständnis dieses Repos aufbaut (`analysis/youtube-tv/711300320/`).
- `MorpheApp/morphe-patcher`, `src/main/kotlin/app/morphe/patcher/util/smali/InlineSmaliCompiler.kt`
  — erklärt, warum injizierter Smali gegen einen Dummy-Rumpf mit der Registerzahl der
  Zielmethode kompiliert wird, und damit die `v0`–`v15`-Grenze oben.
- [Morphe-Patcher-Doku](https://github.com/MorpheApp/morphe-patcher/tree/main/docs)
- [Cobalt](https://github.com/youtube/cobalt) — die Engine, und der Grund, warum
  `dev.cobalt.coat.*` ein stabiler Anker ist.

---

# Teil 2 — RTL+

Grundlage ist das APK von **RTL+ 7.15.2** (Version-Code 2025100658), direkt von einem
Google TV Streamer gezogen.

## Verifizierter Stand: 7.15.2

Am 2026-10-04 wurde das APK direkt von einem **Google TV Streamer** gezogen
(`kirkwood`, Android 14, `armeabi-v7a`) und ausgewertet.

| Frage | Befund |
| --- | --- |
| Paket | `de.rtli.tvnow` (historische ID, nicht `…rtlplus`) |
| Version | 7.15.2, Versionscode 2025100658 |
| Splits | `[base, config.armeabi_v7a, config.xhdpi]` — nur 32-Bit-ARM |
| Player-Stack | `androidx/media3` (ExoPlayer), Widevine-DRM, Didomi-Consent |
| Backend | `com.bedrockstreaming.*` (RTLs Player-Plattform) |
| Ad-Stack | `com.bedrockstreaming.plugin.yospace.*` — Yospace DAI |
| Ad-Engine | `com.bedrockstreaming.feature.adengine.*` (unobfuskiert, ~100 Klassen) |

## Die Wand: SSAI statt Client-Ad-Code

Anders als bei manchen Handy-Apps liegt die Werbung bei RTL+ **nicht** als
fingerabdrückbare Logik im Dex, die man einfach no-op't. Sie wird per **Yospace DAI**
(server-side ad insertion) **in den Stream eingestochen** — die Werbeblöcke sind
physisch im Manifest/Segment des Premium-Streams.

Das heißt: Eine client-seitige Änderung kann die server-gestochenen Ads nicht einfach
„weglöschen". Sie kann aber beeinflussen, **ob** der Client überhaupt den DAI-Pfad
nimmt. Und genau das ist die eine Stelle, an der der Client die Entscheidung trifft.

## Seam — die Yospace-DAI-Entscheidung (implementiert)

`com.bedrockstreaming.plugin.yospace.YospaceIsDaiAssetUseCase` ist **unobfusziert**.
Seine Methode (dekompiliert aus 7.15.2):

```smali
# Lcom/bedrockstreaming/plugin/yospace/YospaceIsDaiAssetUseCase;
.method public final a(Lcom/bedrockstreaming/component/layout/domain/core/model/player/Asset;)Z
    const-string v0, "asset"
    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;.f:(...)V   # checkNotNull
    iget-object v3, v3, Lcom/bedrockstreaming/.../Asset;.e:Ljava/lang/String;
    const-string v0, "yospace"
    const/4 v1, #int 1
    invoke-static {v3, v0, v1}, Lnx/C;.v:(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z
    move-result v3
    return v3
.end method
```

Sie gibt `true` zurück, wenn das Asset als Yospace/DAI-Asset gilt (prägnant:
`asset.e` enthält `"yospace"`). `true` ⇒ der Player nimmt den DAI-Pfad und bekommt
den mit Werbung bestückten Stream.

Der Patch (`DisableYospaceDaiPatch`) injiziert an Index 0:

```smali
const/4 v0, 0x0
return v0
```

— die Methode liefert damit **immer `false`**, noch bevor der Original-Rumpf läuft.
Der Player nutzt dann den sauberen (Non-DAI-)Stream. Für einen authentifizierten
Premium-Client ist das der werbefreie Stream.

### Warum das kein Payment-Bypass ist

Die Entscheidung betrifft nur die **Stream-Variante**, nicht die Authentifizierung
oder das Abo. Der Client ist bereits als Premium angemeldet; er fragt nur die falsche
(DAI-)Variante an. Den Seam umzulegen ist die Wiederherstellung einer bezahlten
Funktion, kein Umgehen einer Berechtigungsprüfung.

### Register-Sicherheit

`a(...)Z` hat `registers = 4`, `ins = 2` (this + Asset-Parameter). `const/4 v0, 0x0`
und `return v0` liegen voll im Registerrahmen (v0–v3) — die Transformation ist
syntaktisch und semantisch sauber.

## Was obfusziert ist — und was nicht

| Bereich | Status | Folge für Fingerprints |
| --- | --- | --- |
| `com.bedrockstreaming.*` (Player, Yospace, AdEngine) | **unobfusziert** | stabiler Anker |
| `com.npaw.analytics.*` (Youbora) | unobfusziert, aber Analytik | `getIsAdSkippable` hier ist nur Reporting — **nicht** patchbar für Wiedergabe |
| Sonstiges (`O9`, `T9`, `Ie`, `nx`, `L9`, …) | obfusziert | meiden; namens-/methodenabhängig |

Wichtig: `getIsAdSkippable` taucht in den NPaw-Analytics-Adaptern (`O9.b`, `T9.b`,
beide `AdAdapter`-Subklassen) auf — das beeinflusst nur, was die Analytik meldet,
**nicht** die tatsächliche Wiedergabe. Deshalb ist der DAI-Seam der richtige, nicht
`AntiAdSkipConfig`/`getIsAdSkippable`.

## Anti-Tamper-Hinweise

- Play-**Source-Stamp** vorhanden; Re-Signing macht ihn ungültig. Für Sideload egal.
- `android:extractNativeLibs="false"` — Alignment beim Repackaging erhalten.
- Die App braucht ihre ABI-Splits. Bundle mergen (`.apkm`) oder base + Splits zusammen
  installieren (`adb install-multiple …`).

## Offene Fragen (Teil 2)

1. **Laufzeit-Verhalten.** Wenn RTL+ für Premium *keinen* sauberen Non-DAI-Stream
   ausliefert (sondern immer DAI), führt das Erzwingen von `false` möglicherweise zu
   fehlgeschlagener Wiedergabe statt zu Werbefreiheit. Das ist am Gerät zu prüfen
   (`docs/VERIFIKATION.md`). Falls die Wiedergabe bricht, ist der Seam falsch und ein
   anderer Ansatz (z. B. Skip-Erzwingung über `AntiAdSkipConfig`) nötig.
2. **Version-Stabilität.** `YospaceIsDaiAssetUseCase.a` ist ein obfuszierter
   Methodenname. Bei einem RTL+-Update kann die Methode `b`/`c` heißen — der
   Klassenname bleibt, der Methodenname nicht. Beim Target-Update die Signatur neu
   gegen das Dex prüfen.

## Quellen (Teil 2)

- `MorpheApp/morphe-patcher` — `src/main/kotlin/app/morphe/patcher/…` für die
  Fingerprint-/Patch-API (`Fingerprint`, `MutableMethod.addInstructions`,
  `Compatibility`, `ApkFileType`, `AppTarget`).
- [Morphe-Patcher-Doku](https://github.com/MorpheApp/morphe-patcher/tree/main/docs)
- Eigene Statik-Analyse des 7.15.2-APKs (Dex-Dump der `YospaceIsDaiAssetUseCase`).
