# AGENTS.md — ysamjo-rtlplus-patches

Repo für Morphe-Patches für **RTL+** (`de.rtli.tvnow`) auf Android TV.

## 1. Projekt-Kontext

Morphe-Patch-Quelle (Gradle/Kotlin) für **RTL+** (`de.rtli.tvnow`). Ziel ist eine
werbefreie Wiedergabe für **Premium-Abonnenten**, die trotz Bezahlung Werbung
erhalten. Ergebnis ist eine `.mpp`-Datei, die der Morphe Manager als Patch-Quelle lädt.

Wesentlicher Unterschied zu manchen anderen Projekten: RTL+ nutzt **Yospace DAI**
(Dynamic Ad Insertion) — die Werbung wird **serverseitig** in den Stream eingestochen.
Die Entscheidung, überhaupt den DAI-Pfad zu nehmen, trifft aber der Client. Genau
diese eine Stelle wird gepatcht. Details in `docs/ARCHITEKTUR.md` — vor jeder Änderung
lesen.

| Modul | Pfad | Zweck |
| --- | --- | --- |
| Patches | `patches/src/main/kotlin/app/ysamjo/patches/` | Patch-Definitionen, Fingerprints, App-Deklaration |
| Extension | `extensions/extension/src/main/java/app/ysamjo/extension/` | Laufzeit-Code (aktuell **ungenutzt** — kein Patch nutzt `extendWith`) |
| Doku | `docs/` | Architektur, Bauen, Verifikation |

Basis ist `MorpheApp/morphe-patches-template`. Umbenannt auf Gruppe `app.ysamjo`.

## 2. Spezifische Konventionen

- **Fingerprints ankern auf un-obfuscaten Klassen.** RTL+ ist teils obfuskiert
  (`O9`, `T9`, `Ie`, `nx` …), teils nicht (`com.bedrockstreaming.*`,
  `com.npaw.*`). Die Werbe-/DAI-Logik von Bedrock/Yospace ist **nicht** obfuscatiert
  — das ist der stabile Anker. Obfuskatierte Methodennamen wie `a`/`b` sind
  versionsheikel; bei RTL+-Updates immer prüfen, ob sich Signatur oder
  Klassenzugehörigkeit geändert hat (siehe `docs/ARCHITEKTUR.md`).
- **`de.rtli.tvnow` ist die Paket-ID**, nicht `…rtlplus`. RTL+ wird als Split-Bundle
  (`.apkm`) ausgeliefert — `base.apk` + `split_config.armeabi_v7a.apk` +
  `split_config.xhdpi.apk`. `apkFileType = ApkFileType.APKM`.
- **Nur 32-Bit-ARM** (`armeabi-v7a`) verifiziert, auf dem Google TV Streamer
  (`kirkwood`, Android 14) gezogen.
- **`import ...Constants.COMPATIBILITY_RTLPLUS` (Member-Import) kompiliert hier NICHT.**
  Stattdessen `import app.ysamjo.patches.shared.Constants` und
  `Constants.COMPATIBILITY_RTLPLUS` verwenden. Das ist ein erwiesener Gotcha in diesem
  Setup, keine Geschmacksfrage.
- **Sprache:** Doku, Commit-Messages, Fehlermeldungen auf Deutsch; Code-Identifier
  englisch.
- **Kein manuelles Release.** `release.yml` schreibt `CHANGELOG.md`, `gradle.properties`,
  `patches-bundle.json`, `patches-list.json` und die Patch-Liste im README. Nie von Hand
  anfassen. Nicht force-pushen.
- **Commit-Typen:** `feat:` (Minor), `fix:` (Patch), `chore:` (kein Release).
- **Zielversion pflegen.** Neue App-Versionen in `shared/Constants.kt` als `AppTarget`
  eintragen, mit Kommentar, ob statisch oder am Gerät verifiziert.

## 3. Commands

```bash
# Einmalig: Android-SDK-Pfad (gitignored, maschinenspezifisch)
printf 'sdk.dir=/Users/family/Library/Android/sdk\n' > local.properties

# Bauen (braucht read:packages-Token, siehe docs/BUILD.md)
GITHUB_ACTOR=ysamjo GITHUB_TOKEN="$(gh auth token)" ./gradlew :patches:buildAndroid
# → patches/build/libs/patches-<version>.mpp

# Patch-Liste neu schreiben (schreibt patches-list.json)
GITHUB_ACTOR=ysamjo GITHUB_TOKEN="$(gh auth token)" ./gradlew generatePatchesList

# Lokal patchen — fertiges JAR nehmen, nicht selbst bauen
gh release download v1.18.0 -R MorpheApp/morphe-cli -p "morphe-desktop-1.18.0-all.jar" -O /tmp/morphe.jar

# Splits in ein ZIP (.apkm) legen; der Patcher merged selbst
zip -q -0 rtlplus.apkm base.apk split_config.armeabi_v7a.apk split_config.xhdpi.apk

java -Xms1024m -jar /tmp/morphe.jar patch \
  --patches patches/build/libs/patches-*.mpp \
  -e "RTL+ Werbung deaktivieren (Yospace DAI)" \
  -o /tmp/rtlplus-patched.apk \
  rtlplus.apkm

# Patch-Bundle prüfen, ohne zu patchen
java -jar /tmp/morphe.jar list-patches --patches=patches/build/libs/patches-*.mpp -p -v -o

# Auf den TV
adb connect <TV-IP>:5555
adb install -r /tmp/rtlplus-patched.apk
```

Bei `list-patches` ist `-p` mit `--with-packages` belegt; die Patch-Datei geht nur über
`--patches=`. Beim `patch`-Unterbefehl ist `-p` die Kurzform für `--patches`.

Falls `gpr.user` / `gpr.key` in `~/.gradle/gradle.properties` liegen, entfällt das
`GITHUB_ACTOR=… GITHUB_TOKEN=…`-Präfix.

## 4. Grenzen & Sicherheitsregeln

- **Statisch belegt, Laufzeit offen.** Der Fingerprint löst auf dem echten APK auf
  (Zielmethode `YospaceIsDaiAssetUseCase.a` im Dex bestätigt), und die injizierte
  Bytecode-Transformation ist registerkorrekt. Ob die Wiedergabe danach wirklich
  werbefrei ist **und** nicht kaputtgeht, lässt sich nur am Gerät zeigen —
  `docs/VERIFIKATION.md`.
- **Kein Secret ins Repo.** Der `read:packages`-Token gehört nach
  `~/.gradle/gradle.properties`, nie in dieses Verzeichnis.
- **Kein Proxy-/Netzwerk-Umbau hier.** Der Seam ist rein client-seitig (DAI-Entscheidung
  erzwingen). Wenn eine Netzwerk-Ebene (MITM/DNS) gebraucht wird, eigenes Projekt.
- **Rechtlicher Rahmen.** Die Patches verändern ein RTL+-APK für den privaten Gebrauch
  eines zahlenden Premium-Nutzers (Wiederherstellung einer bezahlten Funktion). Keine
  Builds weiterverteilen, die RTL+-Signatur tragen, und den Source-Stamp nicht als
  gültig darstellen.
