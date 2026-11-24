package app.brokenn.patches.jiohotstar.settings

import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Element

private const val NAV_PRESS_CLASS = "Lapp/brokenn/extension/jiohotstar/settings/NavPress;"
private const val SETTINGS_ACTIVITY = "app.brokenn.extension.jiohotstar.settings.BrokennSettingsActivity"

/** Declares the settings activity so NavPress can launch it. */
private val brokennSettingsManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: error("AndroidManifest.xml: no <application> element")

            val activities = application.getElementsByTagName("activity")
            var declared = false
            for (i in 0 until activities.length) {
                val activity = activities.item(i) as? Element ?: continue
                if (activity.getAttribute("android:name") == SETTINGS_ACTIVITY) declared = true
            }

            if (!declared) {
                val activity = manifest.createElement("activity")
                activity.setAttribute("android:name", SETTINGS_ACTIVITY)
                activity.setAttribute("android:label", "Brokenn settings")
                activity.setAttribute("android:exported", "false")
                activity.setAttribute("android:theme", "@android:style/Theme.Material.NoActionBar")
                activity.setAttribute("android:screenOrientation", "portrait")
                application.appendChild(activity)
            }
        }
    }
}

@Suppress("unused")
val openBrokennSettingsPatch = bytecodePatch(
    name = "Add Brokenn settings",
    description = "Adds a hidden settings page, opened by double-tapping the Profile tab button.",
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    dependsOn(brokennSettingsManifestPatch)

    extendWith("extensions/brokenn-settings.mpe")

    execute {
        val composable = HSBottomNavigationFingerprint.method
        val composableInsns = composable.instructionsOrNull?.toList()
            ?: error("HSBottomNavigation composable has no instructions")

        var dispatcherType: String? = null
        discovery@ for (i in 0 until composableInsns.size) {
            if (composableInsns[i].opcode != Opcode.NEW_INSTANCE) continue
            for (j in i + 1 until minOf(i + 4, composableInsns.size)) {
                if (composableInsns[j].opcode != Opcode.INVOKE_DIRECT) continue
                val ref = (composableInsns[j] as? ReferenceInstruction)?.reference as? MethodReference
                if (ref?.name != "<init>") continue
                if (ref.parameterTypes != listOf("I", "Ljava/lang/Object;", "Ljava/lang/Object;")) continue
                dispatcherType = (composableInsns[i] as? ReferenceInstruction)
                    ?.reference
                    ?.let { it as? TypeReference }
                    ?.type
                break@discovery
            }
        }
        val dispatcherClass = dispatcherType
            ?: error("HSBottomNavigation: click dispatcher construction not found")

        val dispatcher = Fingerprint(definingClass = dispatcherClass, name = "invoke").method
        val insns = dispatcher.instructionsOrNull?.toList()
            ?: error("Click dispatcher has no instructions")

        var itemReg = -1
        var lambdaReg = -1
        var hookIndex = -1
        for (i in 3 until insns.size) {
            val invoke = insns[i] as? FiveRegisterInstruction ?: continue
            val ref = (insns[i] as? ReferenceInstruction)?.reference as? MethodReference ?: continue
            if (ref.definingClass != "Lkotlin/jvm/functions/Function1;" || ref.name != "invoke") continue
            if (insns[i - 1].opcode != Opcode.CHECK_CAST ||
                insns[i - 2].opcode != Opcode.IGET_OBJECT ||
                insns[i - 3].opcode != Opcode.CHECK_CAST
            ) {
                continue
            }

            val itemCastReg = (insns[i - 1] as OneRegisterInstruction).registerA
            val clickCastReg = (insns[i - 3] as OneRegisterInstruction).registerA
            val clickCastType = (insns[i - 3] as? ReferenceInstruction)
                ?.reference
                ?.let { (it as? TypeReference)?.type }
            if (clickCastType != "Lkotlin/jvm/functions/Function1;") continue
            if (itemCastReg != invoke.registerD || clickCastReg != invoke.registerC) continue

            hookIndex = i
            itemReg = itemCastReg
            lambdaReg = clickCastReg
            break
        }
        if (hookIndex < 0) error("Click dispatcher: nav-item case not found")

        dispatcher.replaceInstruction(
            hookIndex,
            "invoke-static {v$lambdaReg, v$itemReg}, " +
                "$NAV_PRESS_CLASS->navClick(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
        )
    }
}
