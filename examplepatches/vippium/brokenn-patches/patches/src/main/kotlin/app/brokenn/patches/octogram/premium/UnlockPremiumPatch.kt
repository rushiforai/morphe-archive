package app.brokenn.patches.octogram.premium

import app.brokenn.patches.octogram.shared.Constants.COMPATIBILITY_OCTOGRAM
import app.brokenn.patches.shared.classStrings
import app.brokenn.patches.shared.isStatic
import app.brokenn.patches.shared.readsField
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.ClassDef

private const val PREMIUM_FIELD = "Lorg/telegram/tgnet/TLRPC\$User;->premium:Z"

// Flips the client-side premium flag for the signed-in account only. Other users keep the
// premium flag the server sent, so their badges stay off. Entitlements remain server-side.
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Enable premium",
    description = "Unlocks premium feature UI and shows the premium badge on self only.",
) {
    compatibleWith(COMPATIBILITY_OCTOGRAM)

    execute {
        val premiumGetters = mutableListOf<Pair<ClassDef, String>>()
        classDefForEach { c ->
            if ("registeredForPush" in c.classStrings()) {
                c.methods.forEach { m ->
                    if (!m.isStatic() && m.returnType == "Z" && m.parameters.isEmpty() && m.readsField(PREMIUM_FIELD)) {
                        premiumGetters.add(c to m.name)
                    }
                }
            }
        }

        // Every premium-only UI path reads this cached flag, so pinning it unlocks the account
        // without touching isPremiumUser(User), which only paints badges on other people.
        var patched = 0
        for ((cls, name) in premiumGetters) {
            mutableClassDefBy(cls).methods.filter { it.name == name && it.returnType == "Z" }.forEach { m ->
                m.addInstructions(0, """
                    const/4 v0, 0x1
                    return v0
                """)
                patched++
            }
        }
        if (patched < 1) throw PatchException("UserConfig.isPremium not found")
    }
}
