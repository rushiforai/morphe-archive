# Verifikationsplan

## Stand 2026-10-04 — statisch belegt

Gegen das echte 7.15.2-APK (`de.rtli.tvnow`, Version-Code 2025100658), gezogen von einem
Google TV Streamer:

- Die Zielmethode `YospaceIsDaiAssetUseCase.a(Asset)Z` (**PUBLIC FINAL**) ist im Dex
  (`classes3.dex`) vorhanden — der Fingerprint (`definingClass`, `name = "a"`,
  `returnType = "Z"`, Parameter `Asset`, `accessFlags = PUBLIC FINAL`) löst damit auf dem
  echten APK auf. Hätte er nicht gematcht, wäre der Patch vor dem Injizieren abgebrochen.
- Der dekompilierte Rumpf liefert `asset.e.contains("yospace")` — bestätigt, dass die
  Methode die DAI-Entscheidung trifft.
- Die injizierte Transformation (`const/4 v0, 0x0` / `return v0`) liegt voll im
  Registerrahmen der Methode (`registers = 4`) — syntaktisch und semantisch sauber.

**Nicht belegt:** dass die Wiedergabe danach wirklich werbefrei ist *und* nicht kaputtgeht.
Dafür muss das gepatchte APK auf dem Gerät laufen (Schritte unten).

## 0. Was gebraucht wird

| | |
| --- | --- |
| TV oder Box | Android TV / Google TV mit aktiviertem ADB-Netzwerk-Debugging |
| Original-APKM | `de.rtli.tvnow`, 32-Bit-ARM-Bundle (`armeabi_v7a` + `xhdpi`) |
| Gepatchtes APK | gebaut mit `./gradlew :patches:buildAndroid`, gepatcht über Morphe Desktop |
| ADB | `adb connect <TV-IP>:5555` |

Das APK direkt vom Gerät ziehen ist der zuverlässigste Weg — man patcht dann genau das Build,
das auch läuft:

```bash
adb shell pm path de.rtli.tvnow
adb pull /data/app/.../base.apk
adb pull /data/app/.../split_config.armeabi_v7a.apk
adb pull /data/app/.../split_config.xhdpi.apk
```

Morphe Desktop nimmt die drei Dateien auch als `.apkm` (einfach alle in ein ZIP) und merged
selbst.

## 1. Basislinie — läuft die Stock-App überhaupt per Sideload?

Bevor ein Patch verantwortlich gemacht wird: das ungepatchte Bundle installieren und
Wiedergabe prüfen.

```bash
adb install-multiple base.apk split_config.armeabi_v7a.apk split_config.xhdpi.apk
```

Das Manifest verlangt die ABI-Splits; `base.apk` allein scheitert. Liefert Morphe Desktop ein
einzelnes gemergtes APK, dieses installieren. Anschließend mit dem Premium-Account anmelden
und einen Inhalt mit bekannter Werbung starten, um die Basislinie (Wo/Wie oft Werbung) zu
notieren.

## 2. Gepatchte App — verschwindet die Werbung?

1. Patchen mit **ausschließlich** `RTL+ Werbung deaktivieren (Yospace DAI)`.
2. Installieren (`adb install -r /tmp/rtlplus-patched.apk`), Premium-Account anmelden.
3. Denselben Inhalt wie in Schritt 1 abspielen.

Erwartung: keine bzw. deutlich weniger Werbung; Wiedergabe startet sauber und läuft durch.

Mögliche Ergebnisse und was sie bedeuten:

- **Keine Werbung, Wiedergabe OK** → Seam bestätigt. Eintrag hier ergänzen.
- **Wiedergabe bricht ab / schwarzes Bild** → Der Non-DAI-Pfad liefert offenbar keinen
  spielbaren Stream. Der Seam ist dann der falsche Hebel; `AntiAdSkipConfig` / Skip-Erzwingung
  wäre der nächste Ansatz (siehe `docs/ARCHITEKTUR.md`, offene Frage 1).
- **Werbung bleibt** → Entweder hat RTL+ für Premium tatsächlich keinen sauberen Stream, oder
  die DAI-Entscheidung wird woanders noch einmal getroffen. Dex erneut auf weitere
  Yospace-Einstiegspunkte (`YospaceDaiPluginFactory`, `YospaceDaiResourceCreator`) prüfen.

## 3. Fingerprint-Check ohne Gerät

Wer nur das Bundle prüfen will, ob der Fingerprint auf einem vorliegenden APK matcht:

```bash
java -jar /tmp/morphe.jar list-patches --patches=patches/build/libs/patches-*.mpp -p -v -o
```

Zeigt den Patch und seine `Compatibility` an. Ein echter Apply-Lauf gegen das APK (Schritt 2)
ist der endgültige Beweis, dass der Fingerprint auflöst und die Instruktion injiziert wird.

## 4. Regressionstests

- Wiedergabequalität, HDR und Widevine-Lizenzierung funktionieren weiter (der Patch berührt
  weder Medienverkehr noch Lizenz-Traffic).
- Anmeldung und Kontowechsel funktionieren.
- Die App übersteht Kaltstart, Netzwerkwechsel und Aufwachen aus dem Standby.

## Ergebnis dokumentieren

App-Version, Patch-Build, welche Prüfungen bestanden haben und (bei Abweichungen) die
beobachtete Wiedergabe hier ergänzen. Ein negatives Ergebnis ist hier genauso viel wert wie ein
positives — es entscheidet, ob der Seam der richtige ist.
