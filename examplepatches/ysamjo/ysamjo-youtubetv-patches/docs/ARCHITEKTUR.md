# Architektur: warum YouTube for Android TV sich sträubt — und wo die Seams sind

Diese Datei vor dem ersten Patch lesen. Sie hält fest, was belegt ist und was noch Annahme ist.
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

## Seam 2 — JS-Injektion in die laufende Seite (implementiert, Injektion kompiliert)

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

## Quellen

- `ajstrick81/morphe-androidtv-patches` — die Statik-Analyse zu 7.11.300, auf der das
  Verständnis dieses Repos aufbaut (`analysis/youtube-tv/711300320/`).
- `MorpheApp/morphe-patcher`, `src/main/kotlin/app/morphe/patcher/util/smali/InlineSmaliCompiler.kt`
  — erklärt, warum injizierter Smali gegen einen Dummy-Rumpf mit der Registerzahl der
  Zielmethode kompiliert wird, und damit die `v0`–`v15`-Grenze oben.
- [Morphe-Patcher-Doku](https://github.com/MorpheApp/morphe-patcher/tree/main/docs)
- [Cobalt](https://github.com/youtube/cobalt) — die Engine, und der Grund, warum
  `dev.cobalt.coat.*` ein stabiler Anker ist.
