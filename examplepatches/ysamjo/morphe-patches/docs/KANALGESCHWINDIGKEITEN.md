# Kanalgeschwindigkeiten auf dem TV

Öffne im Player **Geschwindigkeit → Kanalgeschwindigkeiten**. Wähle dort den aktuellen Kanal, um eine Vorgabe hinzuzufügen. Gespeicherte Regeln lassen sich mit der Fernbedienung ändern oder entfernen. Unter **Standardtempo** stellst du das Tempo für alle übrigen Kanäle ein. Beim ersten Start übernimmt die App das bisher gespeicherte TV-Tempo.

Die vorinstallierten Regeln umfassen sportstudio, Sportschau, Sky Sport, Sky Sport DE, Sky Sport Austria, DAZN, DAZN DE, RTL Sport, Prime Video Sport, Eurosport Deutschland, SPORT1, ran, kicker, Magenta Sport, NFL, NBA, MotoGP, Formula 1, Bundesliga, DFB und UEFA — jeweils 1,0×. YouTube Kids startet im erkannten Kids-Modus mit 1,0×. Die Regeln werden auf dem TV gespeichert.

Auf Kanälen ohne Sonderregel speichert die normale Tempoauswahl im Player das Standardtempo dauerhaft. Beim Wechsel von einem Sonderkanal zu einem normalen Kanal gilt wieder dieses Standardtempo. Auf Sonderkanälen und in YouTube Kids ändert die normale Tempoauswahl nur das laufende Video. Die Tasten D, S und R gelten auf allen Kanälen nur bis zum nächsten Video.

Beim Update wird RTL Sport einmalig zu bestehenden Regeln hinzugefügt. Unveränderte Altinstallationen übernehmen zusätzlich den erweiterten Sport-Kanalsatz. Selbst angelegte oder geänderte Regeln bleiben unangetastet. Ein zuvor in der Kanalverwaltung festgelegtes Standardtempo bleibt erhalten. Stand dort noch der anfängliche Wert 1,0×, übernimmt das Update die zuletzt im normalen TV-Tempomenü gespeicherte Auswahl.

Der Patch unterstützt die offizielle ARM-Ausgabe von [TizenTube Cobalt 2.0.3](https://github.com/reisxd/TizenTubeCobalt/releases/tag/v2.0.3).

Der Kanalsatz wird mit der Chrome-Erweiterung geteilt: `../video-speed-control-chrome/channels.json` ist der kanonische Katalog, `test/channel-catalog.test.cjs` gleicht `DEFAULT_CHANNELS` dagegen ab. In einem alleinigen Morphe-Checkout ohne Nachbar-Repo wird dieser Abgleich übersprungen.
