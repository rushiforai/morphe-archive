package app.brokenn.patches.jiohotstar.notification

import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR
import app.brokenn.patches.shared.constructsType
import app.brokenn.patches.shared.instrs
import app.brokenn.patches.shared.referenceText
import app.brokenn.patches.shared.stringConstants
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.ClassDef

private const val NUDGE_FCAP_ID = "notification_nudge_fcap"
private const val FCAP_STATUS_ACTION = "Lcom/hotstar/bff/models/common/FrequencyCappedStatusAction;"
private const val COMPOSER = "Landroidx/compose/runtime/b;"

@Suppress("unused")
val hideNotificationPopupPatch = bytecodePatch(
    name = "Disable notification permission prompt",
    description = "Disables the recurring notification permission nag shown every few app launches " +
        "enabled from My Space."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        var nudgeClass: ClassDef? = null
        classDefForEach { c ->
            if (nudgeClass != null) return@classDefForEach
            if (c.methods.any { m -> m.stringConstants().any { NUDGE_FCAP_ID in it } }) nudgeClass = c
        }
        val nudge = nudgeClass ?: throw PatchException("Notification nudge fcap not found")
        val nudgeType = nudge.type

        val gate = mutableClassDefBy(nudge).methods.filter {
            it.returnType == "Ljava/lang/Object;" &&
                it.parameterTypes.size == 2 &&
                it.parameterTypes[1].toString() == "Liv/d;" &&
                it.instrs().any { ins -> ins.referenceText()?.contains(FCAP_STATUS_ACTION) == true }
        }.singleOrNull() ?: throw PatchException("Notification nudge gate not found")

        // The nudge gate: a constant "no" means the popup is never authorised, whatever the fcap decides.
        gate.addInstructions(
            0,
            "sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;\n" +
                "return-object v0\n",
        )

        // The host composable the nudge mounts: blank it so no state can draw the sheet.
        val hosts = mutableListOf<String>()
        classDefForEach { c ->
            if (c.methods.any { m ->
                    m.returnType == "V" &&
                        m.parameterTypes.size == 3 &&
                        m.parameterTypes[1].toString() == COMPOSER &&
                        m.parameterTypes[2].toString() == "I" &&
                        m.constructsType(nudgeType)
                }
            ) hosts += c.type
        }
        if (hosts.isEmpty()) throw PatchException("Notification nudge host not found")
        hosts.forEach { type ->
            mutableClassDefBy(type).methods.filter { m ->
                m.returnType == "V" &&
                    m.parameterTypes.size == 3 &&
                    m.parameterTypes[1].toString() == COMPOSER &&
                    m.parameterTypes[2].toString() == "I" &&
                    m.constructsType(nudgeType)
            }.forEach { it.addInstructions(0, "return-void\n") }
        }
    }
}
