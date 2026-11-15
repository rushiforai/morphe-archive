package app.brokenn.patches.octogram.content

import app.brokenn.patches.octogram.shared.Constants.COMPATIBILITY_OCTOGRAM
import app.brokenn.patches.octogram.shared.readsField
import app.brokenn.patches.octogram.shared.stringConstants
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.ClassDef

@Suppress("unused")
val bypassContentRestrictionsPatch = bytecodePatch(
    name = "Bypass content restrictions",
    description = "Bypasses restricted-content gates and channel no-forward checks.",
) {
    compatibleWith(COMPATIBILITY_OCTOGRAM)

    execute {
        val platformCheckers = mutableListOf<ClassDef>()
        val noForwardCheckers = mutableListOf<ClassDef>()
        classDefForEach { c ->
            // R8-extracted platform helper shared by getRestrictionReason and isSensitive.
            c.methods.forEach { m ->
                val strings = m.stringConstants()
                if (m.returnType == "Z" && m.parameters.toList() == listOf("Ljava/lang/String;") &&
                    setOf("all", "android", "android-all").all { it in strings }
                ) {
                    platformCheckers.add(c)
                }
            }
            // isChatNoForwards(Chat): reads the kept Chat.noforwards field.
            if (c.methods.any {
                    it.returnType == "Z" &&
                        it.parameters.toList() == listOf("Lorg/telegram/tgnet/TLRPC\$Chat;") &&
                        it.readsField("Lorg/telegram/tgnet/TLRPC\$Chat;->noforwards:Z")
                }
            ) {
                noForwardCheckers.add(c)
            }
        }
        if (platformCheckers.isEmpty() || noForwardCheckers.isEmpty()) {
            throw PatchException("restriction-check methods not found")
        }

        var patched = 0
        for (c in platformCheckers) {
            mutableClassDefBy(c).methods.filter {
                it.returnType == "Z" && it.parameters.toList() == listOf("Ljava/lang/String;") &&
                    setOf("all", "android", "android-all").all { s -> s in it.stringConstants() }
            }.forEach { m ->
                // False = no platform restriction ever matches.
                m.addInstructions(0, """
                    const/4 v0, 0x0
                    return v0
                """)
                patched++
            }
        }
        for (c in noForwardCheckers) {
            mutableClassDefBy(c).methods.filter {
                it.returnType == "Z" &&
                    it.parameters.toList() == listOf("Lorg/telegram/tgnet/TLRPC\$Chat;") &&
                    it.readsField("Lorg/telegram/tgnet/TLRPC\$Chat;->noforwards:Z")
            }.forEach { m ->
                m.addInstructions(0, """
                    const/4 v0, 0x0
                    return v0
                """)
                patched++
            }
        }
        if (patched < 2) {
            throw PatchException("Expected 2 restriction methods, patched $patched")
        }
    }
}
