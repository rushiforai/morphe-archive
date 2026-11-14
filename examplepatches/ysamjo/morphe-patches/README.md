# ysamjo Morphe Patches

Morphe-Patch-Bundle für drei Android-TV-Apps aus einem Repo.

| App | Paket | Patches |
| --- | --- | --- |
| **YouTube for Android TV** | `com.google.android.youtube.tv` | Cobalt-Start-URL, Werbe-Blocker-Userscript |
| **TizenTube Cobalt** | `io.gh.reisxd.tizentube.cobalt` | Werbe-Blocker-Userscript, MOD-Kennzeichnung |
| **RTL+** | `de.rtli.tvnow` | Werbung deaktivieren (Yospace DAI) |

Dieses Repo führt die beiden Vorgänger `ysamjo-youtubetv-patches` und
`ysamjo-rtlplus-patches` zusammen. Was dabei angepasst werden musste und worauf beim Weiterbauen
zu achten ist, steht in [`docs/ZUSAMMENFUEHRUNG.md`](docs/ZUSAMMENFUEHRUNG.md).

## ❓ Über dieses Projekt

Drei Apps, drei sehr unterschiedliche Wände — und für jede genau ein Hebel, an dem der Patch
greift. Vor dem ersten Eingriff in den Code `docs/ARCHITEKTUR.md` lesen; dort steht jeweils,
warum der naheliegende Weg scheitert.

### YouTube for Android TV

Keine native App, deren Werbe-Code im Dex liegt, sondern eine **Cobalt-Shell** (Chromium), die
zur Laufzeit die Leanback-Web-App von YouTube aus dem Netz lädt und in einer nativen Engine
ausführt. „Die Ad-Funktion patchen" hat hier nichts, woran es greifen könnte — es gibt aber
echte Seams, und dieses Repo zielt darauf.

### TizenTube Cobalt

Ein eigener Cobalt-Build, **kein** Patch der YouTube-TV-App. Er bringt die übrigen
TizenTube-Mods (SponsorBlock, Geschwindigkeit, PiP, DeArrow) auf Android TV, die es im
offiziellen Morphe-Bundle für die TV-App nicht gibt. Die Engine-Bibliothek heißt dort ebenfalls
`libchrobalt.so`, also greift derselbe Seam.

### RTL+

RTL+ nutzt **Yospace DAI** (Dynamic Ad Insertion) — die Werbung wird serverseitig in den Stream
eingestochen. Die Entscheidung, überhaupt den DAI-Pfad zu nehmen, trifft aber der Client. Genau
diese eine Stelle wird gepatcht: die Wiederherstellung einer bezahlten Funktion für
Premium-Abonnenten, kein Bypass eines Abo-Modells.

### Patches einbinden

Sobald ein Release existiert, diese Quelle in Morphe hinzufügen:

```
https://morphe.software/add-source?github=ysamjo/morphe-patches
```

Oder im Morphe Manager: **Sources → + → Remote** und `github.com/ysamjo/morphe-patches`
eintragen. Der Manager liest `patches-bundle.json` aus dem Repo und die `.mpp` aus dessen
Releases; alle drei Apps erscheinen als eigene Gruppe.

## 🩹 Patch-Liste

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/ysamjo/morphe-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;7 patches total
<details open>
<summary>📦 YouTube for Android TV&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 7.11.300 | 7.25.302 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Back-Taste → App beenden](#back-taste-app-beenden) | Schließt die App, wenn auf der Startseite (YouTube TV Home) die Zurück-Taste gedrückt wird. Der Benutzer wird zum Launcher zurückgeleitet. Funktioniert auf beiden Cobalt-Zielen (Stock-App und TizenTube Cobalt). |  |
| [Cobalt-Start-URL ändern](#cobalt-start-url-ndern) | Schreibt die Meta-Data 'cobalt.APP_URL' in der AndroidManifest.xml um. Sie entscheidet, welche URL die Cobalt-Engine beim Start lädt. Damit lässt sich ein filterndes Frontend ansteuern, das eine veränderte Leanback-Web-App ausliefert und Werbung entfernt, ohne die native Engine anzufassen. Die serienmäßige Startprüfung blockiert fremde URLs nicht. | • Start-URL |
| [Werbe-Blocker-Userscript einspritzen](#werbe-blocker-userscript-einspritzen) | Spritzt ein JavaScript-Userscript in die Leanback-Web-App ein, die Cobalt von youtube.com/tv lädt — dort liegt die Werbe-Pipeline tatsächlich. Das Skript entfernt Werbeplatzierungen aus den InnerTube-Antworten, bevor die App sie auswertet. Geprüft auf einem Google TV Streamer; die Payload greift nachweislich zu. |  |

</details>

<details open>
<summary>📦 TizenTube&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 2.0.2 | 2.0.3 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Back-Taste → App beenden](#back-taste-app-beenden) | Schließt die App, wenn auf der Startseite (YouTube TV Home) die Zurück-Taste gedrückt wird. Der Benutzer wird zum Launcher zurückgeleitet. Funktioniert auf beiden Cobalt-Zielen (Stock-App und TizenTube Cobalt). |  |
| [MOD-Kennzeichnung für Icon und Banner](#mod-kennzeichnung-f-r-icon-und-banner) | Ersetzt Icon und Banner der App durch YouTube-Artwork mit MOD-Aufkleber. Das Icon ist das YouTube-Abspielsymbol mit MOD-Pille, der Banner das normale YouTube-Logo mittig, das TizenTube-Zeichen klein oben rechts und MOD klein oben links. Auf Android TV zeigt der Launcher den Banner, deshalb wird beides getauscht. Nur für TizenTube — die Stock-App behält ihr eigenes Artwork. |  |
| [Werbe-Blocker-Userscript einspritzen](#werbe-blocker-userscript-einspritzen) | Spritzt ein JavaScript-Userscript in die Leanback-Web-App ein, die Cobalt von youtube.com/tv lädt — dort liegt die Werbe-Pipeline tatsächlich. Das Skript entfernt Werbeplatzierungen aus den InnerTube-Antworten, bevor die App sie auswertet. Geprüft auf einem Google TV Streamer; die Payload greift nachweislich zu. |  |

</details>

<details open>
<summary>📦 RTL+&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 7.15.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [RTL+ Werbung deaktivieren (Yospace DAI)](#rtl-werbung-deaktivieren-yospace-dai) | Erzwingt die Yospace-DAI-Entscheidung auf false, sodass der saubere, werbefreie Premium-Stream genutzt wird. Für RTL+-Premium-Abonnenten, die trotz Bezahlung Werbung erhalten. |  |

</details>

<!-- PATCHES_END -->

## 📦 Die gepatchten Apps

### YouTube for Android TV

| | |
| --- | --- |
| Name | YouTube for Android TV |
| Paket | `com.google.android.youtube.tv` |
| Dateityp | `.apkm` (Split-Bundle — base + `split_config.armeabi_v7a`) |
| Zielversion | 7.11.300 (711300320) und **7.25.302** (725302320, am Gerät verifiziert) |

Nicht zu verwechseln mit *YouTube TV: Live TV & more*
(`com.google.android.apps.youtube.unplugged`) — das ist ein anderes Produkt.

> **Installationshinweis.** Das Manifest setzt `com.android.vending.splits.required=true`
> und `requiredSplitTypes="base__abi"`. Die App läuft deshalb nicht aus `base.apk` allein.
> Der Morphe Manager merged das Bundle vor dem Patchen; beim manuellen Bauen das Split-Set
> zusammenhalten (`adb install-multiple base.apk split_config.armeabi_v7a.apk`).

### TizenTube Cobalt

| | |
| --- | --- |
| Name | TizenTube |
| Paket | `io.gh.reisxd.tizentube.cobalt` |
| Dateityp | `.apk` (einzelne Datei, kein Split-Bundle) |
| Zielversion | **2.0.2** (202, am Gerät verifiziert) |
| Quelle | [reisxd/TizenTubeCobalt](https://github.com/reisxd/TizenTubeCobalt) |

Ein Unterschied zur Stock-App ist wichtig: der Namensraum ist dort `org.chromium.*` ohne das
`cobalt.`-Präfix, und der Build ist unobfuskiert. Die Extension löst alles zur Laufzeit nach
Form auf und deckt beide ab.

Der Patch `Cobalt-Start-URL ändern` gilt **nur** für die Stock-App. Bei TizenTube zeigt
`cobalt.APP_URL` auf die eigene Daten-URL des Projekts; sie umzuschreiben würde das Projekt
zerstören.

#### MOD-Kennzeichnung

TizenTube bringt ein eigenes Logo mit, das auf einem TV zwischen den Streaming-Apps kaum vom
Original zu unterscheiden ist. Der Patch `MOD-Kennzeichnung für Icon und Banner` (nicht
standardmäßig aktiv) tauscht es gegen YouTube-Artwork.

| | Aufbau |
| --- | --- |
| Icon | YouTubes Abspielsymbol mit dunkler `MOD`-Pille darunter |
| Banner | normales YouTube-Logo mittig, TizenTube-Zeichen klein oben rechts, `MOD` klein oben links |

Er tauscht bewusst **beides**, denn auf Android TV zeichnet der Launcher den `android:banner`,
nicht das `android:icon`; ein Patch nur auf `ic_app` wäre dort unsichtbar.

| | |
| --- | --- |
| Getauschte Dateien | 5 × `res/mipmap-*-v4/ic_app`, 5 × `res/drawable*/*app_banner` |
| Ziel-App | nur `io.gh.reisxd.tizentube.cobalt` — die Stock-App behält ihr Artwork |
| Nicht enthalten | `android:label` bleibt `TizenTube`; der Name ist kein Bild |

> **Launcher-Cache.** Manche Launcher zeigen nach dem Tausch weiter das alte Artwork, obwohl
> im APK die neuen Bytes liegen. Beim Projectivy Launcher (`com.spocky.projengmenu`) liegt das
> nicht an der App, sondern an seinem eigenen Bild-Cache: derselbe Launcher zeigt im
> Long-Press-Menü einer App bereits den neuen Banner, während die Kachel auf dem Home-Screen
> noch die alte Grafik hält. Weder `am force-stop`, noch ein Reboot, noch Neuinstallieren, noch
> ein angehobener `versionCode` entwerten diesen Cache.
>
> Was hilft (am Gerät belegt): `Einstellungen → Apps → Projectivy Launcher → Cache leeren`
> (219 MB → 2,7 MB), danach den Launcher einmal beenden. Die Kachel liest den Banner dann neu;
> die Launcher-Konfiguration bleibt erhalten, weil nur der Cache geleert wird.
>
> Unabhängig davon rendert die System-Liste (`Einstellungen → Apps → Alle Apps`) das Icon frisch
> aus dem APK und belegt den Tausch ohne Launcher-Zwischenschicht.

### RTL+

| | |
| --- | --- |
| Name | RTL+ |
| Paket | `de.rtli.tvnow` |
| Dateityp | `.apkm` (Split-Bundle — base + `split_config.armeabi_v7a` + `split_config.xhdpi`) |
| Zielversion | **7.15.2** (Version-Code 2025100658, am Gerät verifiziert) |

Der Patch greift **nicht** in eine Zahlungs- oder Berechtigungsprüfung ein. Er ändert nur,
welche Stream-Variante der bereits authentifizierte Premium-Client anfordert: statt des mit
Werbung bestückten Yospace-DAI-Streams den sauberen.

> **Installationshinweis.** RTL+ wird als Split-Bundle ausgeliefert und das Manifest
> setzt `com.android.vending.splits.required=true`. Eine nackte `base.apk` installiert
> nicht. Der Morphe Manager merged das Bundle vor dem Patchen; beim manuellen Bauen
> die Splits zusammenhalten (`adb install-multiple base.apk split_config.armeabi_v7a.apk split_config.xhdpi.apk`).

## 🚀 Bauen

Braucht JDK 21 und einen GitHub-Token mit dem Scope `read:packages`, weil das
Morphe-Gradle-Plugin auf GitHub Packages liegt. Details in [`docs/BUILD.md`](docs/BUILD.md).

```bash
./gradlew :patches:buildAndroid
```

Ergebnis: `patches/build/libs/patches-<version>.mpp` — **ein** Bundle für alle drei Apps.

Lokal testen mit [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) — das fertige
JAR aus den Releases reicht, Selbstbau ist nicht nötig:

```bash
gh release download v1.18.0 -R MorpheApp/morphe-cli \
  -p "morphe-desktop-1.18.0-all.jar" -O /tmp/morphe.jar

# YouTube for Android TV
java -Xms1024m -jar /tmp/morphe.jar patch \
  --patches patches/build/libs/patches-*.mpp \
  -e "Cobalt-Start-URL ändern" \
  -e "Werbe-Blocker-Userscript einspritzen" \
  -O "startupUrl=https://www.youtube.com/tv" \
  -o /tmp/youtube-tv-patched.apk \
  youtube-tv.apkm

# RTL+
java -Xms1024m -jar /tmp/morphe.jar patch \
  --patches patches/build/libs/patches-*.mpp \
  -e "RTL+ Werbung deaktivieren (Yospace DAI)" \
  -o /tmp/rtlplus-patched.apk \
  rtlplus.apkm
```

`-e` wählt einen Patch über seinen Namen. Ohne `-e` wird nichts angewandt — die Patches sind
bewusst fast alle `default = false`.

## 🧪 Verifizieren

Auf einem Google TV Streamer (`kirkwood`, Android 14, `armeabi-v7a`) ist die Kette für die
beiden YouTube-Ziele durchgemessen — nicht nur der Bytecode, sondern das Verhalten zur Laufzeit:

| Beobachtung | Beleg |
| --- | --- |
| Fingerprints lösen auf, Patches werden angewandt | Patcher-Log gegen 7.25.302 |
| Injektion sitzt an Index 0 von `CobaltActivity.onCreate` | `insns size` 134 → 137, erste Debug-Position `0x0000` → `0x0003` |
| Der injizierte Aufruf erreicht die Engine | `userscript injected`, danach `re-injected (n)` |
| Das Skript läuft in der Main-World der Seite | Hash-Wechsel auf `#ysamjo-exec` erscheint als `Navigated to` im Cobalt-Log |
| Die Payload läuft vollständig durch | `CONSOLE:1] "YSAMJO_ADBLOCK_ACTIVE"` (auf TizenTube) |
| JavaScript-Werte kommen nach Java zurück | `js callback handleJavaScriptResult -> ["complete|42"]` |
| Die Payload greift zu | Der `JSON.parse`-Hook sieht Ad-Keys und entfernt sie (`adPlacements` u. a.) |
| Der Icon-Tausch liegt wirklich im APK | 10/10 Ressourcen im gebauten **und** im vom Gerät zurückgeholten APK byte-identisch mit dem Bundle |
| Das neue Icon wird gerendert | System-Liste (`com.android.tv.settings/.device.apps.AllAppsActivity`) zeigt das MOD-Icon |
| Der neue Banner erscheint auf der Home-Kachel | Nach Leeren des Launcher-Caches; Screenshot im Verifikationsplan |

Für RTL+ ist die Kette **statisch** belegt (Fingerprint löst auf, Transformation ist
registerkorrekt); die Laufzeit — wirklich keine Werbung mehr, Wiedergabe nicht kaputt — ist am
Gerät noch offen.

Zwei Dinge sind **nicht** beweisbar und werden hier auch nicht behauptet:

- **Ein kontrollierter A/B-Test über den Ad-Beacon ist gescheitert.** Zwei sonst identische
  Builds, einer mit Strip, einer ohne (`?ysamjo=1&nostrip=1`), lieferten 1 bzw. 0 Ad-Requests —
  die Gegenprobe zeigte also *weniger* Werbung ohne Blocker. YouTube liefert unregelmäßig
  Werbung; der Beacon taugt nicht als Messgröße. Belastbar bleibt die Beobachtung am Gerät.
- **Konsolenausgaben injizierter Skripte kommen auf der Stock-App nicht in logcat an** — auf
  TizenTube dagegen schon. Wer dort debuggt, darf aus einer fehlenden Zeile nicht schließen,
  dass das Skript nicht läuft. Der Hash-Kanal und der Rücklese-Callback sind die verlässlichen
  Signale.

[`docs/VERIFIKATION.md`](docs/VERIFIKATION.md) enthält den vollständigen Testplan für beide
Ziele.

## ⚠️ Status

| Patch | Build | Gegen echtes APK | Auf Hardware |
| --- | --- | --- | --- |
| Cobalt-Start-URL ändern | ✅ im Bundle | ✅ angewandt, Manifest-Wert belegt | ✅ Engine lädt die gesetzte URL |
| Werbe-Blocker-Userscript einspritzen | ✅ im Bundle | ✅ angewandt, Instruktion im Bytecode belegt | ✅ läuft und greift zu; A/B-Test nicht möglich (siehe oben) |
| MOD-Kennzeichnung für Icon und Banner | ✅ im Bundle | ✅ 10/10 Ressourcen getauscht, Ressourcentabelle unverändert | ✅ installiert, Icon in der System-Liste und Banner auf der Home-Kachel sichtbar (nach Leeren des Launcher-Caches) |
| RTL+ Werbung deaktivieren (Yospace DAI) | ✅ im Bundle | ✅ Zielmethode `YospaceIsDaiAssetUseCase.a` im Dex bestätigt | ⏳ am Gerät offen |

Verifiziert gegen `com.google.android.youtube.tv` 7.25.302, `io.gh.reisxd.tizentube.cobalt`
2.0.2 und `de.rtli.tvnow` 7.15.2, alle von einem Google TV Streamer (`kirkwood`, Android 14,
`armeabi-v7a`).

## 📜 Lizenz

GNU General Public License v3.0. Siehe [LICENSE](LICENSE) und [NOTICE](NOTICE).

Eigenständiges Projekt. Nicht mit dem Morphe-Open-Source-Projekt verbunden, von ihm
unterstützt oder danach benannt — es nutzt lediglich dessen Tooling.
