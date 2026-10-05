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
| Android SDK | nötig für das Extension-Modul — `ANDROID_HOME` oder `~/Library/Android/sdk` |
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
Das Bundle enthält beide Patch-Klassen, beide Fingerprints und `extensions/extension.mpe`
(2,3 MB). `./gradlew generatePatchesList` listet beide Patches mit korrekter Kompatibilität
auf `com.google.android.youtube.tv` / APKM / 7.11.300 und 7.25.302.

Ein Hinweis zur Umgebung: Der Morphe-Plugin-Token muss beim Build verfügbar sein, und das
Extension-Modul braucht die SDK-Angabe aus `local.properties`. Beides ist oben beschrieben.

## Lokal patchen mit Morphe Desktop

Das fertige JAR aus den Releases reicht — der Selbstbau aus dem Quelltext ist nicht nötig und
dauert nur länger:

```bash
gh release download v1.18.0 -R MorpheApp/morphe-cli \
  -p "morphe-desktop-1.18.0-all.jar" -O /tmp/morphe.jar
```

Beide Splits in ein ZIP legen; der Patcher merged das Bundle selbst und signiert das Ergebnis:

```bash
zip -q -0 youtube-tv.apkm base.apk split_config.armeabi_v7a.apk

java -Xms1024m -jar /tmp/morphe.jar patch \
  --patches patches/build/libs/patches-*.mpp \
  -e "Cobalt-Start-URL ändern" \
  -e "Werbe-Blocker-Userscript einspritzen" \
  -O "startupUrl=https://www.youtube.com/tv" \
  -o /tmp/youtube-tv-patched.apk \
  youtube-tv.apkm
```

`-e` aktiviert einen Patch über seinen Namen, `-O key=value` setzt eine Option. Ohne `-e` wird
nichts angewandt — die Patches sind bewusst alle `default = false`.

Nützlich zum schnellen Prüfen eines Bundles, ohne zu patchen:

```bash
java -jar /tmp/morphe.jar list-patches --patches=patches/build/libs/patches-*.mpp -p -v -o
```

Achtung: Bei `list-patches` ist `-p` mit `--with-packages` belegt, die Patch-Datei geht dort
nur über `--patches=`. Beim Unterbefehl `patch` ist `-p` dagegen die Kurzform für `--patches`.

## Als Morphe-Patch-Quelle veröffentlichen

Der Morphe Manager akzeptiert eine GitHub-Repository-URL direkt:

```
github.com/ysamjo/ysamjo-youtubetv-patches
```

oder den Deep-Link:

```
https://morphe.software/add-source?github=ysamjo/ysamjo-youtubetv-patches
```

Der Manager liest `patches-bundle.json` aus dem Repository und die `.mpp` aus dessen Releases.

### Repo anlegen

```bash
cd ~/Developer/ysamjo-youtubetv-patches
gh repo create ysamjo-youtubetv-patches --private --source=. --remote=origin
git push -u origin main
git push origin main:dev
```

Das Template bringt beide Branches mit und `.releaserc` erwartet sie: gearbeitet wird auf
`dev`, stabile Releases kommen aus `main`. `dev` mitpushen, sonst hat der Prerelease-Kanal
nichts zu bauen.

### Eine Einstellung im Repo

**Settings → Actions → General → Workflow permissions →**
*Allow GitHub Actions to create and approve pull requests* aktivieren. Ohne das kann
`release.yml` den generierten Changelog und die Patch-Liste nicht zurückschreiben.

Der Workflow selbst braucht **keine Secrets**: Er authentifiziert sich gegenüber GitHub
Packages mit dem eingebauten `GITHUB_TOKEN`. Deshalb läuft der CI-Build auch dann, wenn ein
lokaler Build deinen PAT braucht.

### Release-Ablauf

- Commit-Messages steuern es: `fix:` → Patch-Release, `feat:` → Minor, `chore:` → kein Release.
- Pushes auf `dev` erzeugen Prereleases (Nutzer aktivieren *Pre-release patches* im Manager).
- Merge von `dev` nach `main` erzeugt ein stabiles Release.

Releases nie von Hand anlegen oder ändern — `release.yml` schreibt außerdem `CHANGELOG.md`,
`gradle.properties`, `patches-bundle.json`, `patches-list.json` und die Patch-Liste im README
neu.

### Zwei Stolperfallen, die beim ersten Setup aufgetreten sind

**1. `release.yml` fehlen Scopes.** Der `success`-Hook von `@semantic-release/github`
kommentiert zugehörige Issues und Pull Requests. Das `permissions`-Block des Templates vergibt
nur `contents`, `packages`, `id-token` und `attestations` — der Lauf bricht dann **nach** dem
erfolgreichen Release mit `Resource not accessible by integration`
(`path: repository.issues`) ab. Tag und Release-Asset sind zu dem Zeitpunkt schon geschrieben,
der rote Haken ist also irreführend. In diesem Repo behoben; bei einem neuen Template-Klon
`issues: write` und `pull-requests: write` ergänzen.

**2. `dev` und `main` nicht gleichzeitig pushen.** Beide Läufe erzeugen ihren eigenen
Release-Commit auf den generierten Dateien (`CHANGELOG.md`, `README.md`,
`gradle.properties`, `patches-bundle.json`, `patches-list.json`). Der Backmerge von `main`
nach `dev` versucht danach einen Rebase und kollidiert in genau diesen Dateien. Erst auf
`dev` arbeiten, dann nach `main` mergen und pushen — nicht beide in einem Rutsch.

Falls es doch passiert: `main` nach `dev` nachziehen (`git merge origin/main -X theirs`) und
`dev` auf den stabilen Stand zurücksetzen, damit beide inhaltsgleich sind.

### Sichtbarkeit des Repos

Ein Patch-Quelle für den Morphe Manager muss **öffentlich** sein — der Manager liest
`patches-bundle.json` und das `.mpp` ohne Authentifizierung. Ein privates Repo funktioniert
nur mit hinterlegtem Token im Manager. Umschalten mit:

```bash
gh repo edit ysamjo/ysamjo-youtubetv-patches --visibility public --accept-visibility-change-consequences
```

## Fehlerbehebung

| Symptom | Ursache |
| --- | --- |
| `Plugin [id: 'app.morphe.patches'] was not found` | Kein Token mit `read:packages`. Siehe oben. |
| `Failed to apply plugin 'app.morphe.patches'` / `IllegalArgumentException (no error message)` | Weder `gpr.user`/`gpr.key` noch `GITHUB_ACTOR`/`GITHUB_TOKEN` gesetzt. Mit `--stacktrace` steht `SettingsPlugin.configureDependencies` im Trace. |
| `SDK location not found` | Android SDK fehlt oder `ANDROID_HOME` nicht gesetzt — betrifft nur das Extension-Modul. |
| `Could not resolve app.morphe:morphe-patcher` | Token ohne den Scope, oder GitHub Packages drosselt. Erneut versuchen. |
| `Invalid register: vNN. Must be between v0 and v15` | Injizierte Instruktion nutzt `invoke-static` (Format 35c) mit einem Register über v15. `invoke-static/range` verwenden. |
| Release-Workflow tut nichts | Commit-Typ war `chore:`, oder der Push ging auf einen anderen Branch als `main` / `dev`. |
