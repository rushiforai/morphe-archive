# Bauen und veröffentlichen

## Die eine harte Voraussetzung: GitHub-Packages-Auth

Das Morphe-Gradle-Plugin (`app.morphe.patches`) liegt auf GitHub Packages unter
`maven.pkg.github.com/MorpheApp/registry`. GitHub Packages verlangt **immer**
Authentifizierung, auch für öffentliche Pakete. Der Build scheitert deshalb mit
`Plugin [id: 'app.morphe.patches'] was not found`, bis ein Token mit dem Scope
`read:packages` hinterlegt ist. Alles andere am Setup ist Standard.

Ein Token reicht — einer dieser beiden Wege:

**Variante A — `gh`-Token erweitern** (interaktiv, öffnet den Browser):

```bash
gh auth refresh -h github.com -s read:packages
```

Danach dem Build über die Umgebung mitgeben, weil `settings.gradle.kts` als Fallback
`GITHUB_ACTOR` / `GITHUB_TOKEN` liest:

```bash
GITHUB_ACTOR=ysamjo GITHUB_TOKEN="$(gh auth token)" ./gradlew :patches:buildAndroid
```

**Variante B — klassischer PAT** (empfohlen, stabil):

1. Anlegen unter <https://github.com/settings/tokens/new?scopes=read:packages&description=Morphe>
   mit dem Scope `read:packages`.
2. In `~/.gradle/gradle.properties` eintragen (Datei anlegen, falls nicht vorhanden):

```properties
gpr.user = ysamjo
gpr.key = ghp_xxxxxxxxxxxxxxxxxxxx
```

Das ist der Weg, den die Morphe-Doku empfiehlt, und er gilt projektübergreifend.

### Wenn beide Quellen leer sind, kommt eine irreführende Meldung

Fehlen sowohl `gpr.user`/`gpr.key` als auch `GITHUB_ACTOR`/`GITHUB_TOKEN`, bricht der Build
nicht mit einem Auth-Fehler ab, sondern mit:

```
Failed to apply plugin 'app.morphe.patches'.
> java.lang.IllegalArgumentException (no error message)
```

Der Stacktrace führt auf `SettingsPlugin.configureDependencies` — das Plugin registriert das
GitHub-Packages-Repo und wirft, sobald beide Credential-Quellen leer sind. Mit
`--stacktrace` sieht man es, ohne bleibt die Meldung nichtssagend. Die Lösung ist dieselbe wie
oben: Token setzen. `~/.gradle/gradle.properties` existiert auf einer frischen Maschine oft
gar nicht.

In jeder neuen Shell müssen `GITHUB_ACTOR` und `GITHUB_TOKEN` erneut exportiert werden — sie
überleben kein Terminal-Fenster. Deshalb ist Variante B (Datei) die bequemere.

## Voraussetzungen

| | |
| --- | --- |
| JDK | 21 oder neuer (verifiziert mit JBR 21.0.11) |
| Android SDK | nötig für das optionale Extension-Modul — `ANDROID_HOME` oder `~/Library/Android/sdk` |
| Gradle | kommt über den Wrapper (9.8.0), keine Installation nötig |
| Netzwerk | der erste Build lädt Gradle sowie Patcher- und Smali-Abhängigkeiten |

### Android-SDK-Pfad eintragen

Das Extension-Modul ist ein Android-Library-Modul und braucht eine SDK-Angabe. Ohne sie
bricht der Build mit `SDK location not found` ab. `local.properties` im Projekt-Root anlegen
(die Datei ist gitignored und maschinenspezifisch):

```properties
sdk.dir=/Users/family/Library/Android/sdk
```

Alternativ `ANDROID_HOME` exportieren. Auf CI-Runnern ist beides bereits gesetzt.

## Bauen

```bash
./gradlew :patches:buildAndroid
```

Ergebnis: `patches/build/libs/patches-<version>.mpp`.

**Verifiziert am 2026-10-04:** Build läuft durch (Gradle 9.8.0, JBR 21.0.11, SDK android-37.0).
Das Bundle enthält die Patch-Klasse, den Fingerprint und die `Compatibility` auf
`de.rtli.tvnow` / APKM / 7.15.2. `./gradlew generatePatchesList` listet den Patch mit
korrekter Kompatibilität auf.

Hinweis: `compileKotlin` meldet bei `import ...Constants.COMPATIBILITY_RTLPLUS`
(Member-Import) `Unresolved reference 'Constants'`. Stattdessen das Objekt importieren
(`import app.ysamjo.patches.shared.Constants`) und `Constants.COMPATIBILITY_RTLPLUS`
verwenden.

## Lokal patchen mit Morphe Desktop

Das fertige JAR aus den Releases reicht — der Selbstbau aus dem Quelltext ist nicht nötig:

```bash
gh release download v1.18.0 -R MorpheApp/morphe-cli \
  -p "morphe-desktop-1.18.0-all.jar" -O /tmp/morphe.jar
```

Splits in ein ZIP legen; der Patcher merged das Bundle selbst und signiert das Ergebnis:

```bash
zip -q -0 rtlplus.apkm base.apk split_config.armeabi_v7a.apk split_config.xhdpi.apk

java -Xms1024m -jar /tmp/morphe.jar patch \
  --patches patches/build/libs/patches-*.mpp \
  -e "RTL+ Werbung deaktivieren (Yospace DAI)" \
  -o /tmp/rtlplus-patched.apk \
  rtlplus.apkm
```

`-e` aktiviert einen Patch über seinen Namen. Ohne `-e` wird nichts angewandt.

Nützlich zum schnellen Prüfen eines Bundles, ohne zu patchen:

```bash
java -jar /tmp/morphe.jar list-patches --patches=patches/build/libs/patches-*.mpp -p -v -o
```

Achtung: Bei `list-patches` ist `-p` mit `--with-packages` belegt, die Patch-Datei geht dort
nur über `--patches=`. Beim Unterbefehl `patch` ist `-p` dagegen die Kurzform für `--patches`.

## Als Morphe-Patch-Quelle veröffentlichen

Der Morphe Manager akzeptiert eine GitHub-Repository-URL direkt:

```
github.com/ysamjo/ysamjo-rtlplus-patches
```

oder den Deep-Link:

```
https://morphe.software/add-source?github=ysamjo/ysamjo-rtlplus-patches
```

Der Manager liest `patches-bundle.json` aus dem Repository und die `.mpp` aus dessen Releases.

### Repo anlegen

```bash
cd ~/Developer/ysamjo-rtlplus-patches
gh repo create ysamjo-rtlplus-patches --public --source=. --remote=origin
git push -u origin main
git push origin main:dev
```

Das Template bringt beide Branches mit und `.releaserc` erwartet sie: gearbeitet wird auf
`dev`, stabile Releases kommen aus `main`. `dev` mitpushen, sonst hat der Prerelease-Kanal
nichts zu bauen.

### Eine Einstellung im Repo

**Settings → Actions → General → Workflow permissions →**
*Allow GitHub Actions to create and approve pull requests* muss aktiv sein. Das braucht
`open_pull_request.yml`, um bei Commits auf `dev` automatisch einen Pull-Request
`dev → main` zu öffnen (dessen Merge dann das stabile Release auslöst). `release.yml`
schreibt Changelog und Patch-Liste übrigens unabhängig davon über `contents: write` im
eigenen Job zurück — diese Einstellung betrifft ausschließlich das Öffnen von PRs.

> Stand: diese Einstellung ist im Repo bereits aktiviert.

Der Workflow selbst braucht **keine Secrets**: Er authentifiziert sich gegenüber GitHub
Packages mit dem eingebauten `GITHUB_TOKEN`.

### Release-Ablauf

- Commit-Messages steuern es: `fix:` → Patch-Release, `feat:` → Minor, `chore:` → kein Release.
- Pushes auf `dev` erzeugen Prereleases (Nutzer aktivieren *Pre-release patches* im Manager).
- Merge von `dev` nach `main` erzeugt ein stabiles Release.

Releases nie von Hand anlegen oder ändern — `release.yml` schreibt außerdem `CHANGELOG.md`,
`gradle.properties`, `patches-bundle.json`, `patches-list.json` und die Patch-Liste im README
neu.

### Sichtbarkeit des Repos

Eine Patch-Quelle für den Morphe Manager muss **öffentlich** sein — der Manager liest
`patches-bundle.json` und das `.mpp` ohne Authentifizierung. Umschalten mit:

```bash
gh repo edit ysamjo/ysamjo-rtlplus-patches --visibility public --accept-visibility-change-consequences
```

## Fehlerbehebung

| Symptom | Ursache |
| --- | --- |
| `Plugin [id: 'app.morphe.patches'] was not found` | Kein Token mit `read:packages`. Siehe oben. |
| `Failed to apply plugin 'app.morphe.patches'` / `IllegalArgumentException (no error message)` | Weder `gpr.user`/`gpr.key` noch `GITHUB_ACTOR`/`GITHUB_TOKEN` gesetzt. Mit `--stacktrace` steht `SettingsPlugin.configureDependencies` im Trace. |
| `SDK location not found` | Android SDK fehlt oder `ANDROID_HOME` nicht gesetzt — betrifft nur das Extension-Modul. |
| `Could not resolve app.morphe:morphe-patcher` | Token ohne den Scope, oder GitHub Packages drosselt. Erneut versuchen. |
| `Unresolved reference 'Constants'` | Member-Import `import …Constants.COMPATIBILITY_RTLPLUS` verwendet. Objekt importieren und `Constants.COMPATIBILITY_RTLPLUS` nutzen. |
| Release-Workflow tut nichts | Commit-Typ war `chore:`, oder der Push ging auf einen anderen Branch als `main` / `dev`. |
