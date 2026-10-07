# ysamjo RTL+ Patches

Morphe-Patch-Bundle für **RTL+** (`de.rtli.tvnow`) auf Android TV.

## ❓ Über dieses Projekt

RTL+ (RTL Plus) ist ein kostenpflichtiger Streaming-Dienst. Wer **Premium** zahlt,
erwartet einen werbefreien Stream — erhält aber auf manchen Inhalten dennoch
Werbung. Diese Patches greifen **nicht** in eine Zahlungs- oder
Berechtigungsprüfung ein. Sie ändern nur, welche Stream-Variante der bereits
authentifizierte Premium-Client anfordert: statt des mit Werbung bestückten
Yospace-DAI-Streams den sauberen (werbefreien) Stream.

Das ist die Wiederherstellung einer bezahlten Funktion am eigenen Gerät, kein
Bypass eines Abo-Modells.

Vor dem ersten Eingriff in den Code `docs/ARCHITEKTUR.md` lesen — dort steht,
warum die Werbung serverseitig kommt und an welcher exakt einen Stelle im Client
sie trotzdem umschaltbar ist.

### Patches einbinden

Sobald ein Release existiert, diese Quelle in Morphe hinzufügen:

```
https://morphe.software/add-source?github=ysamjo/ysamjo-rtlplus-patches
```

Oder im Morphe Manager: **Sources → + → Remote** und
`github.com/ysamjo/ysamjo-rtlplus-patches` eintragen.

## 🩹 Patch-Liste

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/ysamjo/ysamjo-rtlplus-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
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

## 📦 Die gepatchte App

| | |
| --- | --- |
| Name | RTL+ |
| Paket | `de.rtli.tvnow` |
| Dateityp | `.apkm` (Split-Bundle — base + `split_config.armeabi_v7a` + `split_config.xhdpi`) |
| Zielversion | **7.15.2** (Version-Code 2025100658, am Gerät verifiziert) |

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

Ergebnis: `patches/build/libs/patches-<version>.mpp`.

Lokal testen mit [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) — das fertige
JAR aus den Releases reicht, Selbstbau ist nicht nötig:

```bash
gh release download v1.18.0 -R MorpheApp/morphe-cli \
  -p "morphe-desktop-1.18.0-all.jar" -O /tmp/morphe.jar

java -Xms1024m -jar /tmp/morphe.jar patch \
  --patches patches/build/libs/patches-*.mpp \
  -e "RTL+ Werbung deaktivieren (Yospace DAI)" \
  -o /tmp/rtlplus-patched.apk \
  rtlplus.apkm
```

## 🧪 Verifizieren

Die Kette ist statisch durchgemessen (Fingerprint löst auf, Bytecode-Transformation
ist registerkorrekt). Die **Laufzeit** — wirklich keine Werbung mehr, Wiedergabe
nicht kaputt — lässt sich nur am Gerät zeigen. Plan in
[`docs/VERIFIKATION.md`](docs/VERIFIKATION.md).

Kurzfassung: gepatchte APK auf einem Google TV Streamer (`kirkwood`, Android 14,
`armeabi-v7a`) installieren, Premium-Account anmelden, Inhalt mit bekannter
Werbung abspielen und prüfen, ob die Werbeblöcke fehlen bzw. die Wiedergabe
sauber durchläuft.

## ⚠️ Status

| Patch | Build | Gegen echtes APK (Fingerprint) | Auf Hardware |
| --- | --- | --- | --- |
| RTL+ Werbung deaktivieren (Yospace DAI) | ✅ im Bundle | ✅ Zielmethode `YospaceIsDaiAssetUseCase.a` im Dex bestätigt | ⏳ am Gerät offen |

Verifiziert gegen `de.rtli.tvnow` 7.15.2, gezogen von einem Google TV Streamer
(`kirkwood`, Android 14, `armeabi-v7a`).

## 📜 Lizenz

GNU General Public License v3.0. Siehe [LICENSE](LICENSE) und [NOTICE](NOTICE).

Eigenständiges Projekt. Nicht mit dem Morphe-Open-Source-Projekt verbunden, von ihm
unterstützt oder danach benannt — es nutzt lediglich dessen Tooling.
