package app.brokenn.patches.octogram.ad

import app.brokenn.patches.octogram.shared.Constants.COMPATIBILITY_OCTOGRAM
import app.brokenn.patches.octogram.shared.constructsType
import app.brokenn.patches.octogram.shared.readsField
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.ClassDef

private const val SPONSORED_CTOR = "Lorg/telegram/tgnet/TLRPC\$TL_messages_getSponsoredMessages;"
private const val SPONSORED_ENABLED = "Lorg/telegram/tgnet/TLRPC\$UserFull;->sponsored_enabled:Z"

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove sponsored messages",
    description = "Stops sponsored messages from being fetched and shown in channels.",
) {
    compatibleWith(COMPATIBILITY_OCTOGRAM)

    execute {
        val controllerClasses = mutableListOf<ClassDef>()
        classDefForEach { c ->
            if (c.methods.any { it.constructsType(SPONSORED_CTOR) }) {
                controllerClasses.add(c)
            }
        }
        if (controllerClasses.isEmpty()) {
            throw PatchException("MessagesController class not found")
        }

        var patched = 0
        for (c in controllerClasses) {
            val mc = mutableClassDefBy(c)

            mc.methods.filter {
                it.parameters.toList() == listOf("J") && it.constructsType(SPONSORED_CTOR)
            }.forEach { m ->
                m.addInstructions(0, """
                    const/4 v0, 0x0
                    return-object v0
                """)
                patched++
            }

            mc.methods.filter {
                it.returnType == "Z" && it.parameters.isEmpty() && it.readsField(SPONSORED_ENABLED)
            }.forEach { m ->
                m.addInstructions(0, """
                    const/4 v0, 0x1
                    return v0
                """)
                patched++
            }
        }
        if (patched < 2) {
            throw PatchException("Expected 2 sponsored-message methods, patched $patched")
        }
    }
}
