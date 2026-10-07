package app.ysamjo.patches.rtlplus.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ysamjo.patches.shared.Constants

/**
 * Schaltet die RTL+-Werbeeinblendung ab.
 *
 * RTL+-Premium-Abonnenten erhalten auf manchen Inhalten dennoch Werbung. Diese
 * Werbung wird server-seitig von Yospace eingestochen (DAI), aber die Entscheidung,
 * überhaupt den DAI-Pfad zu nutzen, trifft der Client in
 * [YospaceIsDaiAssetUseCaseFingerprint]. Erzwingt man dort `false`, fragt der
 * Player den sauberen Stream an.
 *
 * Dieser Patch umgeht keine Zahlung oder Berechtigungsprüfung — er ändert nur,
 * welche Stream-Variante der bereits authentifizierte Premium-Client anfordert.
 */
@Suppress("unused")
val disableYospaceDaiPatch = bytecodePatch(
    name = "RTL+ Werbung deaktivieren (Yospace DAI)",
    description = "Erzwingt die Yospace-DAI-Entscheidung auf false, sodass der saubere, " +
        "werbefreie Premium-Stream genutzt wird. Für RTL+-Premium-Abonnenten, die " +
        "trotz Bezahlung Werbung erhalten.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_RTLPLUS)

    execute {
        // Laut schlagen, wenn die Naht (Seam) fehlt, statt einen stillen Dead-Build
        // auszuliefern.
        YospaceIsDaiAssetUseCaseFingerprint.method

        // Methode wirft `false` zurück, bevor der Original-Rumpf läuft. Damit landet
        // kein Asset mehr auf dem DAI-Pfad und der Player nutzt den sauberen Stream.
        YospaceIsDaiAssetUseCaseFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
