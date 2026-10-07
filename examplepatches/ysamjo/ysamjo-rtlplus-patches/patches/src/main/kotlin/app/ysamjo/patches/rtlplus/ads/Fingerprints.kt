package app.ysamjo.patches.rtlplus.ads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Verankert an der un-obfuscated Bedrock/Yospace-Use-Case, die entscheidet, ob ein
 * gegebenes [Asset] über Yospace Dynamic Ad Insertion (DAI) ausgeliefert wird.
 *
 * Der Methodenrumpf (dekompiliert aus der Ziel-APK, Version 7.15.2):
 * ```
 * public final boolean a(Asset asset) {
 *     Intrinsics.checkNotNullParameter(asset, "asset");
 *     String v = asset.e;                       // ein String-Feld auf Asset
 *     return StringsKt.contains(v, "yospace", true);
 * }
 * ```
 *
 * Liefert die Methode `true`, landet das Asset auf dem DAI-Pfad, wo die
 * Werbeblöcke vom Yospace-Backend in den Stream eingestochen werden. Erzwingt man
 * `false`, verwendet der Player stattdessen die saubere (Non-DAI-)Quelle — für
 * einen Premium-Abonnenten ist das der werbefreie Stream.
 *
 * Die Klasse ist nicht obfuscated (`com.bedrockstreaming.plugin.yospace.*`), was
 * den Fingerprint über App-Updates hinweg stabil hält, solange die Methode
 * Signature und Klassenzugehörigkeit behält.
 */
object YospaceIsDaiAssetUseCaseFingerprint : Fingerprint(
    definingClass = "Lcom/bedrockstreaming/plugin/yospace/YospaceIsDaiAssetUseCase;",
    name = "a",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf(
        "Lcom/bedrockstreaming/component/layout/domain/core/model/player/Asset;",
    ),
)
