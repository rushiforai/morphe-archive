package app.brokenn.patches.octogram.content

import app.brokenn.patches.octogram.shared.Constants.COMPATIBILITY_OCTOGRAM
import app.brokenn.patches.octogram.shared.constructsType
import app.brokenn.patches.octogram.shared.isStatic
import app.brokenn.patches.octogram.shared.startsWithInstanceOf
import app.brokenn.patches.octogram.shared.startsWithMessageOwnerSecretCheck
import app.brokenn.patches.octogram.shared.stringConstants
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

private const val TL_SECRET = "Lorg/telegram/tgnet/TLRPC\$TL_message_secret;"
private const val PAID_MEDIA = "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaPaidMedia;"
private const val MSG_PARAM = "Lorg/telegram/tgnet/TLRPC\$Message;"

private fun Method.hasWideLiteral(value: Long) =
    implementation?.instructions?.any { (it as? WideLiteralInstruction)?.wideLiteral == value } == true

private fun Method.hasNarrowLiteral(value: Int) =
    implementation?.instructions?.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == value } == true

// MessageObject is located by its unique sponsored-caption joiner string.
private fun isMessageObject(c: ClassDef): Boolean =
    c.methods.any { " featuring " in it.stringConstants() }

@Suppress("unused")
val antiDisappearingMediaPatch = bytecodePatch(
    name = "Anti-disappearing media",
    description = "Keeps view-once and self-destructing media viewable forever.",
) {
    compatibleWith(COMPATIBILITY_OCTOGRAM)

    execute {
        val messageObjectClasses = mutableListOf<ClassDef>()
        classDefForEach { c ->
            if (isMessageObject(c)) {
                messageObjectClasses.add(c)
            }
        }
        if (messageObjectClasses.isEmpty()) {
            throw PatchException("MessageObject class not found")
        }

        var patched = 0
        for (c in messageObjectClasses) {
            mutableClassDefBy(c).methods.forEach { m ->
                if (m.returnType != "Z") return@forEach

                if (!m.isStatic() && m.parameters.isEmpty() && m.startsWithMessageOwnerSecretCheck()) {

                    m.addInstructions(0, """
                        const/4 v0, 0x0
                        return v0
                    """)
                    patched++
                } else if (!m.isStatic() && m.parameters.isEmpty() && m.hasWideLiteral(0x7FFFFFFF)) {
                    m.addInstructions(0, """
                        const/4 v0, 0x0
                        return v0
                    """)
                    patched++
                } else if (m.isStatic() && m.parameters.toList() == listOf(MSG_PARAM) &&
                    m.startsWithInstanceOf(TL_SECRET)
                ) {
                    // static isSecretMedia / isSecretPhotoOrVideo
                    m.addInstructions(0, """
                        const/4 v0, 0x0
                        return v0
                    """)
                    patched++
                } else if (m.isStatic() && m.parameters.toList() == listOf(MSG_PARAM) &&
                    m.constructsType(PAID_MEDIA)
                ) {
                    // shouldEncryptPhotoOrVideo
                    m.addInstructions(0, """
                        const/4 v0, 0x0
                        return v0
                    """)
                    patched++
                }
            }
        }
        if (patched < 4) {
            throw PatchException("Expected at least 4 media-check methods, patched $patched")
        }
    }
}
