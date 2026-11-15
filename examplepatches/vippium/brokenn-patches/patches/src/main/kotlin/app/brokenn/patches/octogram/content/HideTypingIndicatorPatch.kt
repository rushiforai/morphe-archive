package app.brokenn.patches.octogram.content

import app.brokenn.patches.octogram.shared.Constants.COMPATIBILITY_OCTOGRAM
import app.brokenn.patches.octogram.shared.constructsType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.ClassDef

// sendTyping: the only method building both the setTyping request and the typing action.
@Suppress("unused")
val hideTypingIndicatorPatch = bytecodePatch(
    name = "Hide typing indicator",
    description = "Prevents typing status from being sent to other users.",
) {
    compatibleWith(COMPATIBILITY_OCTOGRAM)

    execute {
        val targets = mutableListOf<ClassDef>()
        classDefForEach { c ->
            if (c.methods.any {
                    it.constructsType("Lorg/telegram/tgnet/TLRPC\$TL_messages_setTyping;") &&
                        it.constructsType("Lorg/telegram/tgnet/TLRPC\$TL_sendMessageTypingAction;")
                }
            ) {
                targets.add(c)
            }
        }
        if (targets.isEmpty()) {
            throw PatchException("sendTyping method not found")
        }

        var patched = 0
        for (c in targets) {
            mutableClassDefBy(c).methods.filter {
                it.constructsType("Lorg/telegram/tgnet/TLRPC\$TL_messages_setTyping;") &&
                    it.constructsType("Lorg/telegram/tgnet/TLRPC\$TL_sendMessageTypingAction;")
            }.forEach { m ->
                // Blocking all sendTyping actions also skips cancel actions; clients expire the status on their own.
                m.addInstructions(0, """
                    const/4 v0, 0x0
                    return v0
                """)
                patched++
            }
        }
        if (patched == 0) {
            throw PatchException("sendTyping method not patchable")
        }
    }
}
