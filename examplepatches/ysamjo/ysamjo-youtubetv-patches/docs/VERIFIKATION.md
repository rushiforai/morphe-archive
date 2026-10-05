# Verifikationsplan

## Stand 2026-10-04 — statisch belegt

Gegen das echte 7.25.302-APK, gezogen von einem Google TV Streamer, gepatcht mit Morphe
Desktop 1.18.0:

- Beide Fingerprints lösen auf dem echten APK auf (`CobaltActivity.onCreate`,
  `CobaltActivity.getActiveWebContents`). Hätte einer nicht gematcht, wäre der Patch vor dem
  Injizieren abgebrochen.
- Beide Patches werden angewandt; das APKM wird automatisch gemerged, das Ergebnis ist
  signiert.
- `cobalt.APP_URL` steht danach in **beiden** Activities auf dem eigenen Wert.
- `CobaltActivity.onCreate` beginnt mit
  `invoke-static/range {v24}, …CobaltScriptInjector;.schedule:(Landroid/app/Activity;)V`
  — Index 0, also vor `super.onCreate()`. `v24` ist nachweislich `this`, die
  `invoke-super`-Zeile direkt darunter nutzt dasselbe Register.

**Nicht belegt:** dass die Injektion zur Laufzeit greift und die Payload Werbung entfernt.
Dafür muss das gepatchte APK auf dem Gerät laufen. Die Schritte unten sind genau dafür da —
jeder ist so gebaut, dass er billig scheitert und verrät, welche Schicht kaputt ist.

## Stand 2026-10-04 — zur Laufzeit belegt

Auf dem Google TV Streamer, `com.google.android.youtube.tv` 7.25.302 und
`io.gh.reisxd.tizentube.cobalt` 2.0.2:

- **Der Seam ist offen.** `userscript injected` erscheint, danach `re-injected (n)`.
- **Das Skript läuft in der Main-World der Seite.** Eine `location.hash`-Zuweisung aus dem
  injizierten Skript erscheint im Cobalt-Log als
  `Navigated to https://www.youtube.com/tv?ysamjo=1#ysamjo-exec`. Das ist eine
  Same-Document-Navigation und damit eine engine-seitige Beobachtung — sie lässt sich nicht
  durch eine verschluckte Konsolenzeile vortäuschen.
- **Die Payload läuft vollständig durch.** Auf TizenTube erscheint
  `CONSOLE:1] "YSAMJO_ADBLOCK_ACTIVE"`.
- **JavaScript-Werte kommen nach Java zurück.** Der Rücklese-Callback meldet
  `js callback handleJavaScriptResult -> ["complete|42"]` — `document.readyState` und
  `40 + 2`. Auf der Stock-App ist das nicht möglich: dort ist der Callback R8-umbenannt und
  hat gar keine Argumente.
- **Der Hook greift zu.** Ein instrumentierter Lauf zählte 982 `JSON.parse`-Aufrufe, darunter
  Ergebnisse mit Ad-Keys (`adPlacements` u. a.), die entfernt wurden.

### MOD-Kennzeichnung (2026-10-04)

- **Der Tausch liegt im Artefakt.** Nach `-e "MOD-Kennzeichnung für Icon und Banner"` meldet der
  Patcher `Branding: 10 von 10 Ressourcen ersetzt`; alle zehn Dateien im Ausgabe-APK sind
  byte-identisch mit den Bildern im Bundle. Die Ressourcentabelle ist unverändert —
  `aapt2 dump resources` zeigt vorher und nachher dieselben Pfade, und
  `android:icon`/`android:banner` zeigen weiter auf `0x7f0f0000` bzw. `0x7f090053`.
- **Dasselbe gilt auf dem Gerät.** Das zurückgeholte `base.apk` (97 357 305 Bytes) enthält
  dieselben zehn Bilder; `firstInstallTime` blieb stehen, `lastUpdateTime` wanderte.
- **Das Icon wird gerendert.** `Einstellungen → Apps → Alle Apps` zeigt für TizenTube das
  YouTube-Logo mit MOD-Pille.
- **Der Banner ist nur indirekt belegt.** Der Projectivy Launcher hält Icon und Banner in seiner
  eigenen Datenbank; `am force-stop`, `pm clear --cache-only` und ein Reboot lesen sie nicht neu
  ein, die Kachel zeigt weiter das **Original-Artwork von TizenTube** — auch nach dem Umbau des
  Banners auf das YouTube-Logo. Ein Pixelvergleich der Kachel gegen das Original und gegen den
  neuen Banner bestätigt das. Die Manifest-Verweise sind dabei unverändert
  (`android:icon` → `0x7f0f0000`, `android:banner` → `0x7f090053`, vorher wie nachher), ein
  Fehler im Patch ist damit ausgeschlossen. Belegt ist also nur, dass das APK die richtigen
  Bytes trägt — nicht, dass dieser Launcher sie anzeigt.

**Was weiterhin nicht belegt ist:** dass die Payload Werbung *beweisbar* entfernt. Ein
kontrollierter A/B-Test über den Ad-Beacon ist gescheitert — siehe Abschnitt 4.

## 0. Was gebraucht wird

| | |
| --- | --- |
| TV oder Box | Android TV / Google TV mit aktiviertem ADB-Netzwerk-Debugging |
| Original-APKM | `com.google.android.youtube.tv`, 32-Bit-ARM-Bundle (`armeabi_v7a`) |
| Gepatchtes APK | gebaut mit `./gradlew :patches:buildAndroid`, gepatcht über Morphe Desktop |
| ADB | `adb connect <TV-IP>:5555` |

Das APK direkt vom Gerät ziehen ist der zuverlässigste Weg — man patcht dann genau das Build,
das auch läuft:

```bash
adb shell pm path com.google.android.youtube.tv
adb pull /data/app/.../base.apk
adb pull /data/app/.../split_config.armeabi_v7a.apk
```

Morphe Desktop nimmt die beiden Dateien auch als `.apkm` (einfach beide in ein ZIP) und merged
selbst.

Um die Injektion zu beobachten, in einem zweiten Terminal `adb logcat -s ysamjo-tv-adblock`
mitlaufen lassen. Jeder Versuch loggt sein Ergebnis.

## 1. Basislinie — läuft die Stock-App überhaupt per Sideload?

Bevor ein Patch verantwortlich gemacht wird: das ungepatchte Bundle installieren und
Wiedergabe prüfen.

```bash
adb install-multiple base.apk split_config.armeabi_v7a.apk
```

Das Manifest verlangt den ABI-Split, `base.apk` allein scheitert. Liefert Morphe Desktop ein
einzelnes gemergtes APK, dieses installieren.

## 2. Nur Patch A — Cobalt-Start-URL ändern

Zweck: beweisen, dass die Startup-URL tatsächlich entscheidet, was geladen wird — ohne JS im
Spiel.

1. Patchen mit **ausschließlich** `Cobalt-Start-URL ändern`, gerichtet auf eine URL, die du
   kontrollierst und an der du eine Seite erkennst (eine schlichte „hello"-Seite reicht).
2. Installieren, starten.
3. Erwartung: Die Engine lädt deine Seite statt der YouTube-Leanback-UI.

Zeigt sie weiter YouTube, hat der Meta-Data-Rewrite nicht gegriffen — gepatchtes Manifest mit
`aapt2 dump xmltree` prüfen und bestätigen, dass `cobalt.APP_URL` den eigenen Wert trägt.

Bleibt der Bildschirm schwarz, ist das für diesen Schritt trotzdem ein **Bestanden**: Die URL
wurde geehrt, die Seite erfüllt nur die Startup-Milestones der Engine nicht. Genau das ist das
erwartete Verhalten, wenn der Watchdog disarmt wird.

## 3. Patch B, nur Sentinel — funktioniert der Injektions-Seam?

**Erst das, dann JavaScript debuggen.** Die Payload in `CobaltScriptInjector.USERSCRIPT` auf
eine einzige Sentinel-Zeile reduzieren:

```java
private static final String USERSCRIPT =
        "(function(){ window.__ysamjoSentinel = 'alive'; })();";
```

Nur mit `Werbe-Blocker-Userscript einspritzen` patchen, installieren, starten und dann prüfen
— entweder über die DevTools eines Desktop-Chrome gegen dasselbe Frontend, oder on-device über
eine zweite Zeile, die den Sentinel sichtbar macht (z. B. `document.title` ändern, das ist im
Screenshot lesbar).

Erwartung: `adb logcat -s ysamjo-tv-adblock` zeigt `userscript injected`, und der Sentinel
steht in der Seite.

- **Der Patch bricht schon beim Patchen ab** → meist ein Smali-Problem, nicht der Seam.
  `Invalid register: vNN. Must be between v0 and v15` heißt: `invoke-static` statt
  `invoke-static/range` verwendet. Siehe `docs/ARCHITEKTUR.md`.
- **Gar keine Log-Zeile** → der Fingerprint auf `CobaltActivity.onCreate` hat nicht gematcht,
  oder die Extension wurde nicht gemerged. Patcher-Log prüfen.
- **Wiederholt `injection attempt failed`, dann `gave up`** → die Reflection in
  `CobaltScriptInjector` findet kein `long`-Feld oder keine `GEN_JNI`-Methode. Die Form der
  WebContents-Klasse mit `jadx` dumpen und `readNativePointer` / `findEvaluateJavaScript`
  anpassen.
- **Log-Zeile da, aber kein Sentinel** → `evaluateJavaScript` wird gerufen, die Seite ist noch
  nicht bereit. Der Polling-Trigger ist zu früh oder die falsche World.

Erst wenn der Sentinel erscheint, lohnt es sich, die echte Payload zurückzuholen.

## 4. Patch B, volle Payload — verschwindet die Werbung?

Durchgeführt am 2026-10-04 auf dem Google TV Streamer. Ergebnis: die Payload läuft und der Hook
greift zu — aber **kein kontrollierter Nachweis**, dass die Werbung dadurch verschwindet.

### Was gemessen wurde

Ein instrumentierter Lauf zählte über den Hash-Kanal mit (`location.hash` wird als
`Navigated to` protokolliert — auf der Stock-App der einzige verlässliche Rückkanal, weil
`console.*` injizierter Skripte dort nicht in logcat ankommt):

| Zähler | Stand |
| --- | --- |
| `JSON.parse`-Aufrufe | 982 |
| davon Ergebnisse mit Ad-Key | 3–4 |
| davon `adPlacements` | 2 |
| XHR-Aufrufe gesamt / auf InnerTube | 31 / 7 |
| fetch-Aufrufe gesamt / auf InnerTube | 35 / 2 |

Daraus folgt: **`JSON.parse` ist der richtige Haken**, XHR trägt einen Teil des
InnerTube-Verkehrs, `fetch` fast nichts. Der Ad-Beacon (`ad.doubleclick.net/ddm/trackimp/…`)
geht per XHR raus.

### Warum der A/B-Test gescheitert ist

Zwei sonst identische Builds, gesteuert über `nostrip` im Start-URL-Query:

| | Ad-Keys gesehen | davon `adPlacements` | Ad-Requests | CORS-blockiert |
| --- | --- | --- | --- | --- |
| A — Strip an (`?ysamjo=1`) | 4 | 2 | 1 | 1 |
| B — Strip aus (`?ysamjo=1&nostrip=1`) | 4 | 0 | 0 | 0 |

Die Gegenprobe **ohne** Blocker lieferte *weniger* Ad-Requests. Der Ad-Beacon ist damit als
Messgröße widerlegt: YouTube liefert unregelmäßig Werbung. Wer diesen Test wiederholt, braucht
mehr als einen Lauf pro Variante oder eine deterministische Ad-Quelle.

### Was daraus für die Payload folgt

Der ursprüngliche Verdacht — „die Leanback-App nutzt andere Ad-Keys" — hat sich **nicht**
bestätigt: `adPlacements` ist dabei. Offen bleibt, ob die Player-Antwort auf einem Pfad
ankommt, den der Hook nicht sieht. Ein XHR-Hook auf `responseText`/`response` wäre der nächste
Schritt, falls Werbung sichtbar bleibt.

Ein weiterer Befund aus diesem Durchgang: Der Poll-Intervall nach dem ersten Erfolg war zu
grob. Der erste Treffer landet fast immer in ein Dokument, das die nächste Navigation wegwirft
— gemessen lag er ~300 ms vor dem Commit der Navigation, und der erste Ad-Beacon folgte
innerhalb von zwei Sekunden, also **vor** der nächsten Injektion im 2-s-Takt. `schedule()`
bleibt deshalb jetzt 30 s auf dem schnellen Intervall.

## 5. Regressionstests

- Wiedergabequalität, HDR und Widevine-Lizenzierung funktionieren weiter (die Payload berührt
  weder `googlevideo.com`-Medienverkehr noch Lizenz-Traffic).
- Anmeldung und Kontowechsel funktionieren.
- Die App übersteht Kaltstart, Netzwerkwechsel und Aufwachen aus dem Standby.

## Ergebnis dokumentieren

App-Version, Patch-Build, welche Prüfungen bestanden haben und die `adb logcat`-Ausgabe
festhalten und hier ergänzen. Ein negatives Ergebnis ist hier genauso viel wert wie ein
positives.
