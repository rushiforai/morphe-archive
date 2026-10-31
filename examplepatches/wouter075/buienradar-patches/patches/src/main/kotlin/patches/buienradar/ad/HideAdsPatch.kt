package patches.buienradar.ad

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import patches.buienradar.shared.Constants.COMPATIBILITY_BUIENRADAR

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Removes the banner/native ads between the weather cards and the pre-roll ads in weather videos.",
) {
    compatibleWith(COMPATIBILITY_BUIENRADAR)

    execute {

        // region Banner / native ads in the main feed

        // Force the "isAdFree" parameter to true, exactly like the app does for premium users.
        // The method then returns an empty list and no ad slots are added or loaded.
        AdItemsFingerprint.method.addInstruction(
            0,
            "const/16 p1, 0x1"
        )

        // endregion

        // region Pre-roll ads in videos

        val adFreeClass = VideoAdFreeToStringFingerprint.originalClassDef
        val adFreeType = adFreeClass.type
        val adFreeInstanceField = adFreeClass.staticFields.first { it.type == adFreeType }
        val showAdsType = VideoShowAdsToStringFingerprint.originalClassDef.type

        // Method that decides: if (isAdFree) AdFree else ShowAds(allowPersonalizedAds).
        // Right after ShowAds is constructed, overwrite the register with the AdFree instance.
        Fingerprint(
            filters = listOf(
                fieldAccess(
                    definingClass = adFreeType,
                    type = adFreeType,
                    opcode = Opcode.SGET_OBJECT
                ),
                newInstance(showAdsType),
                methodCall(
                    definingClass = showAdsType,
                    name = "<init>",
                    opcode = Opcode.INVOKE_DIRECT
                )
            )
        ).let { fingerprint ->
            fingerprint.method.apply {
                val index = fingerprint.instructionMatches.last().index
                val register = getInstruction<FiveRegisterInstruction>(index).registerC

                addInstruction(
                    index + 1,
                    "sget-object v$register, $adFreeType->${adFreeInstanceField.name}:$adFreeType"
                )
            }
        }

        // endregion
    }
}
