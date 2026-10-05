# AGENTS.md — ysamjo-youtubetv-patches

Projektspezifischer Kontext. Übergeordnet gilt `/Users/family/Developer/AGENTS.md`.

## 1. Projekt-Kontext

Morphe-Patch-Quelle (Gradle/Kotlin) für **YouTube for Android TV**
(`com.google.android.youtube.tv`) und **TizenTube Cobalt** (`io.gh.reisxd.tizentube.cobalt`).
Ziel ist ein werbefreier Client auf Android TV, ohne die App zu forken. Ergebnis ist eine
`.mpp`-Datei, die der Morphe Manager als Patch-Quelle lädt.

Die zentrale architektonische Tatsache: Die App ist eine **Cobalt-Shell**, kein natives
Android-Programm. UI, Player und Werbung werden zur Laufzeit von `https://www.youtube.com/tv`
geladen und im nativen `libchrobalt.so` ausgeführt. Im APK liegt keine Ad-Logik, die man
patchen könnte. Details in `docs/ARCHITEKTUR.md` — vor jeder Änderung an den Patches lesen.

TizenTube Cobalt ist **kein** Patch dieser App, sondern ein eigener Cobalt-Build aus derselben
Codebasis (Engine ebenfalls `libchrobalt.so`). Er bringt die übrigen TizenTube-Mods mit
(SponsorBlock, Geschwindigkeit, PiP, DeArrow), die es im offiziellen Morphe-Bundle für die
TV-App nicht gibt — das deckt nur `com.google.android.youtube`, `.music` und `reddit` ab.

| Modul | Pfad | Zweck |
| --- | --- | --- |
| Patches | `patches/src/main/kotlin/app/ysamjo/patches/` | Patch-Definitionen, Fingerprints, App-Deklaration |
| Extension | `extensions/extension/src/main/java/app/ysamjo/extension/youtubetv/` | Laufzeit-Code, der ins gepatchte APK gemerged wird (JS-Injektion) |
| Doku | `docs/` | Architektur, Bauen, Verifikation |

Basis ist `MorpheApp/morphe-patches-template`. Umbenannt auf Gruppe `app.ysamjo`.

## 2. Spezifische Konventionen

- **Fingerprints ankern auf Cobalt, nicht auf Google-Code.** `dev.cobalt.coat.*` ist Open
  Source und behält seine Namen. Alles andere im APK ist R8-umbenannt und ändert sich pro
  Version. Keine obfuskierten Feld- oder Methodennamen hart kodieren — zur Laufzeit nach Form
  auflösen (siehe `CobaltScriptInjector.readNativePointer`).
- **Cobalt liegt unter `cobalt.org.chromium.*`**, nicht unter `org.chromium.*`. Chromium-Pfade
  aus der Literatur greifen hier daneben. **Aber:** TizenTube Cobalt nutzt das nackte
  `org.chromium.*`. Nie einen Namensraum hart kodieren — beide Kandidaten durchprobieren
  (`CobaltScriptInjector.CALLBACK_CLASS_NAMES`). Alles andere wird über das von
  `getActiveWebContents()` zurückgegebene Objekt reflektiert und ist damit ohnehin
  namensraumunabhängig.
- **`CobaltActivity` ist die richtige Injektionsstelle in beiden Apps**, auch wenn der
  Launcher anders heißt: in der Stock-App `...tv.activity.MainActivity`, in TizenTube
  `dev.cobalt.app.MainActivity`. Beide erben von `dev.cobalt.coat.CobaltActivity`, das dort
  `onCreate` definiert.
- **Injizierte Instruktionen brauchen die Range-Form, wenn `p0` über v15 liegt.**
  `invoke-static` nutzt Dex-Format 35c (4-Bit-Register, v0–v15). `CobaltActivity.onCreate` hat
  26 Register, `p0` liegt also auf v24 — `invoke-static { p0 }` scheitert mit
  `Invalid register: v24`. Immer `invoke-static/range { p0 .. p0 }` verwenden. Bei einem
  anderen Injektionspunkt die Registerzahl erneut prüfen.
- **Die App braucht ihren ABI-Split.** Manifest setzt `splits.required=true` und
  `requiredSplitTypes="base__abi"`. `base.apk` allein läuft nicht. Morphe Desktop merged ein
  `.apkm` (beide Dateien in ein ZIP) selbst.
- **Nur 32-Bit-ARM.** Verifiziert auf dem Google TV Streamer (`kirkwood`): `armeabi-v7a`,
  kein `arm64_v8a`.
- **`Optimize for device architecture` bleibt aus**, wenn für den TV gepatcht wird — sonst
  strippt Morphe die Native-Libs, die die Engine braucht.
- **Extension-Änderungen brauchen `clean`.** `:patches:buildAndroid` betrachtet die gebaute
  `.mpe` der Extension nicht als Input, der Task gilt also als „up-to-date". Ohne
  `./gradlew clean :patches:buildAndroid` landet eine veraltete Extension im Bundle — das
  äußert sich als Patch, der nachweislich angewandt wurde und trotzdem nichts tut. Beim
  Debuggen zuerst prüfen, ob die eigenen Marker im gepatchten Dex stehen (`strings`/`grep`
  über die `classes*.dex`).
- **`rawResourcePatch` kann keine `res/…`-Datei anfassen — dafür `resourcePatch` nehmen.**
  `ResourcePatchContext.get()` löst jeden `res/…`-Pfad über die Paket-Map des Coders auf
  (`ArsclibResourceCoder.getFile`), und die wird **nur** in `decodeResources()` gefüllt, nicht in
  `decodeRaw()`. Der `ResourceMode` ist wiederum nur dann `FULL`, wenn mindestens ein Patch der
  Runde ein `ResourcePatch` ist. Ein `rawResourcePatch` allein läuft also in `RAW_ONLY`, die Map
  bleibt leer und jeder `get("res/…")` wirft `PatchException: Package <pkg> not found` — auch
  wenn der Pfad im APK existiert. Für Bild- oder Layout-Tausch deshalb `resourcePatch`
  verwenden. (Der zweite Parameter von `get()` ist `copy`, **nicht** `decode`.)
- **Zielversion pflegen.** Neue App-Versionen in `shared/Constants.kt` als `AppTarget`
  eintragen. `7.25.302` ist am Gerät nachgeprüft, `7.11.300` nur statisch analysiert — der
  Unterschied gehört in den Kommentar. Kein `version = null` als „geht schon".
- **Sprache:** Doku, Commit-Messages und Fehlermeldungen auf Deutsch, Code-Identifier englisch.
- **Kein manuelles Release.** `release.yml` schreibt `CHANGELOG.md`, `gradle.properties`,
  `patches-bundle.json`, `patches-list.json` und die Patch-Liste im README. Nie von Hand
  anfassen. Nicht force-pushen — das bricht alle künftigen Releases.
- **Commit-Typen:** `feat:` (Minor-Release), `fix:` (Patch-Release), `chore:` (kein Release).

## 3. Commands

```bash
# Einmalig: Android-SDK-Pfad hinterlegen (gitignored, maschinenspezifisch)
printf 'sdk.dir=/Users/family/Library/Android/sdk\n' > local.properties

# Bauen (braucht read:packages-Token, siehe docs/BUILD.md)
GITHUB_ACTOR=ysamjo GITHUB_TOKEN="$(gh auth token)" ./gradlew :patches:buildAndroid
# → patches/build/libs/patches-<version>.mpp

# Prüfen, ob die Patches registriert sind (schreibt patches-list.json neu)
GITHUB_ACTOR=ysamjo GITHUB_TOKEN="$(gh auth token)" ./gradlew generatePatchesList

# Lokal patchen — das fertige JAR nehmen, nicht selbst bauen
gh release download v1.18.0 -R MorpheApp/morphe-cli -p "morphe-desktop-1.18.0-all.jar" -O /tmp/morphe.jar

# Beide Splits in ein ZIP (.apkm) legen, der Patcher merged selbst
zip -q -0 youtube-tv.apkm base.apk split_config.armeabi_v7a.apk

java -Xms1024m -jar /tmp/morphe.jar patch \
  --patches patches/build/libs/patches-*.mpp \
  -e "Cobalt-Start-URL ändern" \
  -e "Werbe-Blocker-Userscript einspritzen" \
  -O "startupUrl=https://www.youtube.com/tv" \
  -o /tmp/youtube-tv-patched.apk \
  youtube-tv.apkm

# Patches auflisten, ohne zu patchen (schneller Smoke-Test des Bundles)
java -jar /tmp/morphe.jar list-patches --patches=patches/build/libs/patches-*.mpp -p -v -o

# Auf den TV
adb connect <TV-IP>:5555
adb install -r /tmp/youtube-tv-patched.apk

# Injektion beobachten
adb logcat -s ysamjo-tv-adblock

# TizenTube Cobalt patchen (einzelne APK, nur die Injektion — die Start-URL bleibt unangetastet)
gh release download v2.0.2 -R reisxd/TizenTubeCobalt -p "cobalt-arm.apk" -O /tmp/tizentube.apk
java -Xms1024m -jar /tmp/morphe.jar patch \
  --patches patches/build/libs/patches-*.mpp \
  -e "Werbe-Blocker-Userscript einspritzen" \
  -o /tmp/tizentube-patched.apk \
  /tmp/tizentube.apk

# Gerät ist armeabi-v7a -> immer die arm-Variante nehmen, nicht arm64
```

Achtung bei `list-patches`: `-p` bedeutet dort `--with-packages`, die Patch-Datei geht nur
über `--patches=`. Der Patcher selbst akzeptiert `-p` als Kurzform für `--patches`.

Falls `gpr.user` / `gpr.key` in `~/.gradle/gradle.properties` liegen, entfällt das
`GITHUB_ACTOR=... GITHUB_TOKEN=...`-Präfix. Fehlt beides, bricht schon die Settings-Phase ab:
`Failed to apply plugin 'app.morphe.patches' … IllegalArgumentException` — das ist die fehlende
Credential, nicht der Patch-Code. In nicht-interaktiven Shells liegt `gh` nicht im `PATH`,
also `/opt/homebrew/bin/gh` verwenden.

## 4. Grenzen & Sicherheitsregeln

- **Auf Hardware verifiziert — der Ad-Beweis bleibt aber indirekt.** Die Kette ist am Gerät
  durchgemessen: Injektion an Index 0, Skript läuft in der Main-World, Payload läuft durch,
  JavaScript-Werte kommen nach Java zurück. Ein kontrollierter A/B-Test über den Ad-Beacon ist
  dagegen **gescheitert**: die Gegenprobe ohne Strip (`?ysamjo=1&nostrip=1`) lieferte *weniger*
  Ad-Requests als die mit. YouTube liefert unregelmäßig Werbung, der Beacon taugt nicht als
  Messgröße. Nie behaupten, Werbung sei bewiesen blockiert — belegbar ist „der Hook greift zu".
- **Konsolenausgaben sind kein verlässliches Signal.** Auf der Stock-App kommen `console.*`
  aus injizierten Skripten **nicht** in logcat an, auf TizenTube schon. Zum Prüfen den
  Hash-Kanal (`location.hash`, wird als `Navigated to` protokolliert) oder den
  Rücklese-Callback nehmen, nie die Konsole.
- **Sentinel zuerst.** Bei Änderungen an der JS-Payload erst prüfen, ob das Skript überhaupt
  läuft, dann die echte Payload debuggen. Sonst wird JavaScript debuggt, während der Seam gar
  nicht offen ist. Dafür gibt es in `CobaltScriptInjector` den Umschalter `USERSCRIPT`
  zwischen `FULL_PAYLOAD` und `DIAG_PAYLOAD`; letztere meldet ihre Zähler über den Hash und
  trägt mit `nostrip` im URL-Query einen A/B-Schalter.
- **Kein Secret ins Repo.** Der `read:packages`-Token gehört nach
  `~/.gradle/gradle.properties`, niemals in dieses Verzeichnis.
- **Kein Proxy-Umbau hier.** Der Netzwerk-Weg (Seam 3 in `docs/ARCHITEKTUR.md`) ist bewusst
  nicht Teil dieses Repos. Wenn er gebraucht wird: eigenes Projekt, nicht hier hineinwachsen
  lassen.
- **Ein getauschtes Icon beweist sich nicht im Launcher.** Der Projectivy Launcher
  (`com.spocky.projengmenu`, Standard-Home auf dem Streamer) hält Icon und Banner in seiner
  eigenen Datenbank fest. Weder `am force-stop`, noch `pm clear --cache-only`, noch ein Reboot
  liest sie neu ein — die Kachel zeigt weiter das alte Artwork, obwohl im APK die neuen Bytes
  liegen. `pm hide`/`unhide` ist als Auslöser nicht nutzbar (`MANAGE_USERS` fehlt der Shell).
  Zum Belegen deshalb **die System-App-Liste** nehmen: `am start -n
  com.android.tv.settings/.device.apps.AllAppsActivity` rendert das Icon frisch aus dem APK und
  zeigt den Tausch sofort. Für den Banner gibt es dort keine Ansicht — der ist nur über den
  Byte-Vergleich im APK belegbar.
- **Rechtlicher Rahmen.** Die Patches verändern ein Google-APK für den privaten Gebrauch.
  Keine Builds weiterverteilen, die Googles Signatur tragen, und den Source-Stamp nicht als
  gültig darstellen.
