# AGENTS.md — morphe-patches

Projektspezifischer Kontext. Übergeordnet gilt `/Users/family/Developer/AGENTS.md`.

## 1. Projekt-Kontext

Morphe-Patch-Quelle (Gradle/Kotlin) für **drei** Android-TV-Apps. Ergebnis ist eine einzelne
`.mpp`-Datei, die der Morphe Manager als Patch-Quelle lädt; jede App erscheint dort als eigene
Gruppe.

| App | Paket | Wand | Seam |
| --- | --- | --- | --- |
| YouTube for Android TV | `com.google.android.youtube.tv` | Cobalt-Shell, kein Ad-Code im APK | Manifest-URL + JS-Injektion |
| TizenTube Cobalt | `io.gh.reisxd.tizentube.cobalt` | dito, eigener Build | JS-Injektion |
| RTL+ | `de.rtli.tvnow` | Yospace DAI, serverseitige Werbung | DAI-Entscheidung im Client |

Die zentrale architektonische Tatsache bei YouTube: Die App ist eine **Cobalt-Shell**, kein
natives Android-Programm. UI, Player und Werbung werden zur Laufzeit von
`https://www.youtube.com/tv` geladen und im nativen `libchrobalt.so` ausgeführt. Im APK liegt
keine Ad-Logik, die man patchen könnte.

TizenTube Cobalt ist **kein** Patch der TV-App, sondern ein eigener Cobalt-Build aus derselben
Codebasis (Engine ebenfalls `libchrobalt.so`). Er bringt die übrigen TizenTube-Mods mit
(SponsorBlock, Geschwindigkeit, PiP, DeArrow), die es im offiziellen Morphe-Bundle für die
TV-App nicht gibt — das deckt nur `com.google.android.youtube`, `.music` und `reddit` ab.

RTL+ ist der Gegenentwurf: kein Cobalt, sondern eine normale Android-App. Die Werbung kommt
**serverseitig** über Yospace DAI; patchbar ist nur die eine Stelle, an der der Client
entscheidet, überhaupt den DAI-Pfad zu nehmen.

Vor jeder Änderung an den Patches `docs/ARCHITEKTUR.md` lesen — dort steht pro Ziel, warum der
naheliegende Weg scheitert.

| Modul | Pfad | Zweck |
| --- | --- | --- |
| Patches | `patches/src/main/kotlin/app/ysamjo/patches/` | Patch-Definitionen, Fingerprints, App-Deklaration |
| Extension | `extensions/extension/src/main/java/app/ysamjo/extension/youtubetv/` | Laufzeit-Code, der ins gepatchte APK gemerged wird (JS-Injektion) |
| Doku | `docs/` | Architektur, Bauen, Verifikation, Zusammenführung |

Basis ist `MorpheApp/morphe-patches-template`. Umbenannt auf Gruppe `app.ysamjo`.
Die Paket-Unterordner unter `app/ysamjo/patches/` sind produktweise geschnitten
(`youtubetv/`, `tizentube/`, `rtlplus/`, `shared/`).

## 2. Spezifische Konventionen

### 2.1 YouTube for Android TV und TizenTube Cobalt

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
- **`console.log` aus dem injizierten Skript landet im Logcat — aber nur bei TizenTube.** Im
  Stock-YouTube-TV wird die Ausgabe verworfen, in TizenTube als
  `I/cobalt: [pid:pid:…:INFO:CONSOLE:1] "…"` sichtbar. Das ist der schnellste Diagnosekanal;
  Zeilen gehen allerdings gelegentlich verloren, also nie aus dem Fehlen einer Zeile auf
  fehlende Ausführung schließen.
- **Der Morphe-Signaturschlüssel liegt in `/tmp/morphe-data/morphe.keystore` und ist
  flüchtig.** Fehlt er, erzeugt Morphe beim nächsten Lauf einen neuen — und ein so gebautes
  APK lässt sich nicht mehr über eine bestehende Installation updaten
  (`INSTALL_FAILED_UPDATE_INCOMPATIBLE`). Eine Sicherung liegt unter
  `~/.config/morphe/morphe.keystore`; vor jedem Patch-Lauf zurückkopieren:
  `mkdir -p /tmp/morphe-data && cp ~/.config/morphe/morphe.keystore /tmp/morphe-data/`.
  Ist der alte Schlüssel verloren, hilft nur Deinstallation — und `pm uninstall -k` reicht
  **nicht**, weil der behaltene Paket-Record die alte Signatur weiter erzwingt. Will man die
  App-Daten retten: altes APK installieren, per `run-as` (Paket ist `DEBUGGABLE`) ein
  `tar`-Archiv des Datenverzeichnisses ziehen, vollständig deinstallieren, neues APK
  installieren, Archiv zurückspielen.
- **In einem minifizierten Bundle zählt man Aufrufstellen, nicht Literale.** TizenTube schreibt
  `videoSpeed` sehr wohl — aber über einen generischen Mirror: jeder `setClientSettingEndpoint`
  wird zu `Ia(clientSettingEnum.item, wert)`, also `configWrite`. Das Literal `videoSpeed`
  kommt im Bundle 5× vor, nur 2× davon als Read; daraus „niemals geschrieben" zu schließen war
  falsch. Verlässlich ist nur der Gerätelog: TizenTube loggt bei jedem Write
  `"Setting key <key> to <wert>"`, und der Wert steht danach in
  `app_content_shell/content_shell/Local Storage/leveldb/` (per `run-as` lesbar).
- **Der Branding-Patch ist `default = false` und muss mit `-e` mitgegeben werden.** Ein Lauf
  nur mit dem Adblock-Patch liefert ein APK mit TizenTubes eigenem Artwork — das fällt erst am
  Fernseher auf, weil Icon und Banner reine Ressourcen sind und im Log nichts fehlt. Prüfen
  lässt sich das ohne Gerät: `unzip -p <apk> res/mipmap-xxxhdpi-v4/ic_app | md5` muss
  `6c6f55cdf9cfa3ea8b8ebea76c64e993` ergeben, `res/drawable-xhdpi-v4/app_banner`
  `83097153569f5c6350215c480f1fd24d`.
- **Der TV-Launcher cached Banner und Icon über ein Update hinweg.** Nach `adb install -r`
  zeigt die Kachel weiter das alte Bild; `am force-stop com.google.android.tvlauncher` reicht
  **nicht**, erst ein Neustart des Geräts liest die Ressource neu. Nicht als fehlgeschlagenen
  Patch deuten.

### 2.2 RTL+

- **Fingerprints ankern auf un-obfuscaten Klassen.** RTL+ ist teils obfuskiert
  (`O9`, `T9`, `Ie`, `nx` …), teils nicht (`com.bedrockstreaming.*`, `com.npaw.*`). Die
  Werbe-/DAI-Logik von Bedrock/Yospace ist **nicht** obfuskiert — das ist der stabile Anker.
  Obfuskatierte Methodennamen wie `a`/`b` sind versionsheikel; bei RTL+-Updates immer prüfen,
  ob sich Signatur oder Klassenzugehörigkeit geändert hat (siehe `docs/ARCHITEKTUR.md`).
- **`de.rtli.tvnow` ist die Paket-ID**, nicht `…rtlplus`. RTL+ wird als Split-Bundle
  (`.apkm`) ausgeliefert — `base.apk` + `split_config.armeabi_v7a.apk` +
  `split_config.xhdpi.apk`. `apkFileType = ApkFileType.APKM`.
- **Nur 32-Bit-ARM** (`armeabi-v7a`) verifiziert, auf dem Google TV Streamer
  (`kirkwood`, Android 14) gezogen.
- **Kein Payment-Bypass.** Der Patch ändert nur die Stream-Variante, nicht Authentifizierung
  oder Abo. Diese Grenze nicht überschreiten — sie ist der Grund, warum das Projekt
  vertretbar ist.

### 2.3 Repo-weit

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
GITHUB_ACTOR=ysamjo GITHUB_TOKEN="$(/opt/homebrew/bin/gh auth token)" ./gradlew :patches:buildAndroid
# → patches/build/libs/patches-<version>.mpp

# Prüfen, ob alle Patches registriert sind (schreibt patches-list.json neu)
GITHUB_ACTOR=ysamjo GITHUB_TOKEN="$(/opt/homebrew/bin/gh auth token)" ./gradlew generatePatchesList

# Lokal patchen — das fertige JAR nehmen, nicht selbst bauen
gh release download v1.18.0 -R MorpheApp/morphe-cli -p "morphe-desktop-1.18.0-all.jar" -O /tmp/morphe.jar

# Alle Patches des Bundles auflisten (schneller Smoke-Test)
java -jar /tmp/morphe.jar list-patches --patches=patches/build/libs/patches-*.mpp -p -v -o

# Beide YouTube-Splits in ein ZIP (.apkm) legen, der Patcher merged selbst
zip -q -0 youtube-tv.apkm base.apk split_config.armeabi_v7a.apk

java -Xms1024m -jar /tmp/morphe.jar patch \
  --patches patches/build/libs/patches-*.mpp \
  -e "Cobalt-Start-URL ändern" \
  -e "Werbe-Blocker-Userscript einspritzen" \
  -O "startupUrl=https://www.youtube.com/tv" \
  -o /tmp/youtube-tv-patched.apk \
  youtube-tv.apkm

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
  -e "MOD-Kennzeichnung für Icon und Banner" \
  -o /tmp/tizentube-patched.apk \
  /tmp/tizentube.apk

# Gerät ist armeabi-v7a -> immer die arm-Variante nehmen, nicht arm64

# RTL+ patchen (drei Splits im .apkm)
zip -q -0 rtlplus.apkm base.apk split_config.armeabi_v7a.apk split_config.xhdpi.apk
java -Xms1024m -jar /tmp/morphe.jar patch \
  --patches patches/build/libs/patches-*.mpp \
  -e "RTL+ Werbung deaktivieren (Yospace DAI)" \
  -o /tmp/rtlplus-patched.apk \
  rtlplus.apkm
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
  (`com.spocky.projengmenu`, Standard-Home auf dem Streamer) hält das Artwork der Home-Kachel in
  einem eigenen Bild-Cache. Weder `am force-stop`, noch ein Reboot, noch Neuinstallieren, noch
  ein angehobener `versionCode` entwerten ihn — die Kachel zeigt weiter das alte Artwork, obwohl
  im APK die neuen Bytes liegen. `pm hide`/`unhide` ist als Auslöser nicht nutzbar
  (`MANAGE_USERS` fehlt der Shell). `pm clear --cache-only <pkg>` **hängt** über adb auf diesem
  Gerät (kein Output, Abbruch mit 137) — dafür die Einstellungen nehmen.
  - **Was hilft:** `Einstellungen → Apps → Projectivy Launcher → Cache leeren` (219 MB → 2,7 MB),
    danach den Launcher einmal beenden. Die Kachel liest den Banner dann neu, die
    Launcher-Konfiguration bleibt erhalten.
  - **Zweite Belegfläche:** dasselbe Long-Press-Menü einer App zeigt im Kopf schon das neue
    Artwork, während die Kachel noch das alte hält. Der Cache ist also pro Fläche, nicht global.
  - **Icons belegen:** `am start -n com.android.tv.settings/.device.apps.AllAppsActivity` rendert
    frisch aus dem APK und zeigt den Tausch sofort.
- **Ein Banner, das nicht wie erwartet aussieht, ist nicht automatisch ein Fehler.** SmartTube
  und Brave zeigen auf dem Streamer Banner, die man für fremdes Artwork halten kann (SmartTube:
  rot mit blauem `M`; Brave: orange „TOGGO"-Wortmarke, weil es der regionale Build ist). Vor
  einem Bugreport das `android:banner` der App selbst prüfen:
  `aapt2 dump xmltree --file AndroidManifest.xml <apk> | grep banner`, dann die Datei aus dem
  Ressourcen-Baum ziehen und ansehen.
- **Rechtlicher Rahmen.** Die Patches verändern fremde APKs für den privaten Gebrauch — bei
  YouTube ein Google-APK, bei RTL+ die Wiederherstellung einer bezahlten Funktion für einen
  zahlenden Premium-Nutzer. Keine Builds weiterverteilen, die die Originalsignatur tragen, und
  den Source-Stamp nicht als gültig darstellen.
