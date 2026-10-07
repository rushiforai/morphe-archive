# Architektur: warum RTL+ Werbung serverseitig kommt — und wo der eine Hebel ist

Diese Datei vor dem ersten Patch lesen. Sie hält fest, was belegt ist und was noch
Annahme ist. Grundlage ist das APK von **RTL+ 7.15.2** (Version-Code 2025100658),
direkt von einem Google TV Streamer gezogen.

## Verifizierter Stand: 7.15.2

Am 2026-10-04 wurde das APK direkt von einem **Google TV Streamer** gezogen
(`kirkwood`, Android 14, `armeabi-v7a`) und ausgewertet.

| Frage | Befund |
| --- | --- |
| Paket | `de.rtli.tvnow` (historische ID, nicht `…rtlplus`) |
| Version | 7.15.2, Versionscode 2025100658 |
| Splits | `[base, config.armeabi_v7a, config.xhdpi]` — nur 32-Bit-ARM |
| Player-Stack | `androidx/media3` (ExoPlayer), Widevine-DRM, Didomi-Consent |
| Backend | `com.bedrockstreaming.*` (RTLs Player-Plattform) |
| Ad-Stack | `com.bedrockstreaming.plugin.yospace.*` — Yospace DAI |
| Ad-Engine | `com.bedrockstreaming.feature.adengine.*` (unobfuskiert, ~100 Klassen) |

## Die Wand: SSAI statt Client-Ad-Code

Anders als bei manchen Handy-Apps liegt die Werbung bei RTL+ **nicht** als
fingerabdrückbare Logik im Dex, die man einfach no-op't. Sie wird per **Yospace DAI**
(server-side ad insertion) **in den Stream eingestochen** — die Werbeblöcke sind
physisch im Manifest/Segment des Premium-Streams.

Das heißt: Eine client-seitige Änderung kann die server-gestochenen Ads nicht einfach
„weglöschen". Sie kann aber beeinflussen, **ob** der Client überhaupt den DAI-Pfad
nimmt. Und genau das ist die eine Stelle, an der der Client die Entscheidung trifft.

## Seam — die Yospace-DAI-Entscheidung (implementiert)

`com.bedrockstreaming.plugin.yospace.YospaceIsDaiAssetUseCase` ist **unobfusziert**.
Seine Methode (dekompiliert aus 7.15.2):

```smali
# Lcom/bedrockstreaming/plugin/yospace/YospaceIsDaiAssetUseCase;
.method public final a(Lcom/bedrockstreaming/component/layout/domain/core/model/player/Asset;)Z
    const-string v0, "asset"
    invoke-static {v3, v0}, Lkotlin/jvm/internal/l;.f:(...)V   # checkNotNull
    iget-object v3, v3, Lcom/bedrockstreaming/.../Asset;.e:Ljava/lang/String;
    const-string v0, "yospace"
    const/4 v1, #int 1
    invoke-static {v3, v0, v1}, Lnx/C;.v:(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z
    move-result v3
    return v3
.end method
```

Sie gibt `true` zurück, wenn das Asset als Yospace/DAI-Asset gilt (prägnant:
`asset.e` enthält `"yospace"`). `true` ⇒ der Player nimmt den DAI-Pfad und bekommt
den mit Werbung bestückten Stream.

Der Patch (`DisableYospaceDaiPatch`) injiziert an Index 0:

```smali
const/4 v0, 0x0
return v0
```

— die Methode liefert damit **immer `false`**, noch bevor der Original-Rumpf läuft.
Der Player nutzt dann den sauberen (Non-DAI-)Stream. Für einen authentifizierten
Premium-Client ist das der werbefreie Stream.

### Warum das kein Payment-Bypass ist

Die Entscheidung betrifft nur die **Stream-Variante**, nicht die Authentifizierung
oder das Abo. Der Client ist bereits als Premium angemeldet; er fragt nur die falsche
(DAI-)Variante an. Den Seam umzulegen ist die Wiederherstellung einer bezahlten
Funktion, kein Umgehen einer Berechtigungsprüfung.

### Register-Sicherheit

`a(...)Z` hat `registers = 4`, `ins = 2` (this + Asset-Parameter). `const/4 v0, 0x0`
und `return v0` liegen voll im Registerrahmen (v0–v3) — die Transformation ist
syntaktisch und semantisch sauber.

## Was obfusziert ist — und was nicht

| Bereich | Status | Folge für Fingerprints |
| --- | --- | --- |
| `com.bedrockstreaming.*` (Player, Yospace, AdEngine) | **unobfusziert** | stabiler Anker |
| `com.npaw.analytics.*` (Youbora) | unobfusziert, aber Analytik | `getIsAdSkippable` hier ist nur Reporting — **nicht** patchbar für Wiedergabe |
| Sonstiges (`O9`, `T9`, `Ie`, `nx`, `L9`, …) | obfusziert | meiden; namens-/methodenabhängig |

Wichtig: `getIsAdSkippable` taucht in den NPaw-Analytics-Adaptern (`O9.b`, `T9.b`,
beide `AdAdapter`-Subklassen) auf — das beeinflusst nur, was die Analytik meldet,
**nicht** die tatsächliche Wiedergabe. Deshalb ist der DAI-Seam der richtige, nicht
`AntiAdSkipConfig`/`getIsAdSkippable`.

## Anti-Tamper-Hinweise

- Play-**Source-Stamp** vorhanden; Re-Signing macht ihn ungültig. Für Sideload egal.
- `android:extractNativeLibs="false"` — Alignment beim Repackaging erhalten.
- Die App braucht ihre ABI-Splits. Bundle mergen (`.apkm`) oder base + Splits zusammen
  installieren (`adb install-multiple …`).

## Offene Fragen

1. **Laufzeit-Verhalten.** Wenn RTL+ für Premium *keinen* sauberen Non-DAI-Stream
   ausliefert (sondern immer DAI), führt das Erzwingen von `false` möglicherweise zu
   fehlgeschlagener Wiedergabe statt zu Werbefreiheit. Das ist am Gerät zu prüfen
   (`docs/VERIFIKATION.md`). Falls die Wiedergabe bricht, ist der Seam falsch und ein
   anderer Ansatz (z. B. Skip-Erzwling über `AntiAdSkipConfig`) nötig.
2. **Version-Stabilität.** `YospaceIsDaiAssetUseCase.a` ist ein obfuszierter
   Methodenname. Bei einem RTL+-Update kann die Methode `b`/`c` heißen — der
   Klassenname bleibt, der Methodenname nicht. Beim Target-Update die Signatur neu
   gegen das Dex prüfen.

## Quellen

- `MorpheApp/morphe-patcher` — `src/main/kotlin/app/morphe/patcher/…` für die
  Fingerprint-/Patch-API (`Fingerprint`, `MutableMethod.addInstructions`,
  `Compatibility`, `ApkFileType`, `AppTarget`).
- [Morphe-Patcher-Doku](https://github.com/MorpheApp/morphe-patcher/tree/main/docs)
- Eigene Statik-Analyse des 7.15.2-APKs (Dex-Dump der `YospaceIsDaiAssetUseCase`).
