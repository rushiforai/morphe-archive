package app.brokenn.patches.octogram.premium

import app.brokenn.patches.octogram.shared.Constants.COMPATIBILITY_OCTOGRAM
import app.brokenn.patches.octogram.shared.classStrings
import app.brokenn.patches.octogram.shared.constructsType
import app.brokenn.patches.octogram.shared.isStatic
import app.brokenn.patches.octogram.shared.readsField
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.AccessFlags

private const val PREMIUM_FIELD = "Lorg/telegram/tgnet/TLRPC\$User;->premium:Z"
private const val SPONSORED_CTOR = "Lorg/telegram/tgnet/TLRPC\$TL_messages_getSponsoredMessages;"

// Client-side premium state flip: shows the premium badge and premium UI.
// Server-side premium features stay locked — this is cosmetic only.
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Enable premium",
    description = "Unlocks premium feature UI and shows the premium badge on self only.",
) {
    compatibleWith(COMPATIBILITY_OCTOGRAM)

    execute {
        val userConfigGetters = mutableListOf<Pair<ClassDef, String>>()
        val controllerClasses = mutableListOf<ClassDef>()
        classDefForEach { c ->
            // UserConfig.isPremium(): instance ()Z reading the kept User.premium field.
            if ("registeredForPush" in c.classStrings()) {
                c.methods.forEach { m ->
                    if (!m.isStatic() && m.returnType == "Z" && m.parameters.isEmpty() && m.readsField(PREMIUM_FIELD)) {
                        userConfigGetters.add(c to m.name)
                    }
                }
            }
            // MessagesController: the only class constructing the sponsored-messages request.
            if (c.methods.any { it.constructsType(SPONSORED_CTOR) }) {
                controllerClasses.add(c)
            }
        }

        var patched = 0
        for ((cls, name) in userConfigGetters) {
            mutableClassDefBy(cls).methods.filter { it.name == name && it.returnType == "Z" }.forEach { m ->
                m.addInstructions(0, """
                    const/4 v0, 0x1
                    return v0
                """)
                patched++
            }
        }
        for (c in controllerClasses) {
            mutableClassDefBy(c).methods.filter {
                AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Z" &&
                    it.parameters.toList() == listOf("Lorg/telegram/tgnet/TLRPC\$User;") &&
                    it.readsField(PREMIUM_FIELD)
            }.forEach { m ->
                m.addInstructions(0, """
                    const/4 v0, 0x1
                    return v0
                """)
                patched++
            }
        }
        if (patched < 2) {
            throw PatchException("Expected 2 premium methods, patched $patched")
        }
    }
}
