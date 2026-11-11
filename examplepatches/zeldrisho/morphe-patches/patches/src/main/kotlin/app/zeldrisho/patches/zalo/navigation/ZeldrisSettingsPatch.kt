@file:OptIn(app.zeldrisho.patches.shared.bytecode.WholeBodyReplacement::class)

package app.zeldrisho.patches.zalo.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_261002
import app.zeldrisho.patches.shared.bytecode.clearBody
import app.zeldrisho.patches.shared.bytecode.ensureRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/** Shared native settings infrastructure; feature patches register only their own controls. */
internal val zeldrisSettingsPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_ZALO_261002)
    extendWith("extensions/extension.mpe")

    execute {
        for ((className, titleMethod) in listOf(
            "ZeldrisSettingsView" to "setTitle",
            "ZeldrisBackupSettingsView" to "setBackupTitle",
        )) {
            val screen = mutableClassDefBy("Lapp/zeldrisho/zalo/extension/$className;")
            check(screen.superclass == "Ljava/lang/Object;") { "Zeldris settings: unexpected placeholder superclass" }
            screen.setSuperClass("Lcom/zing/zalo/ui/settings/BaseSettingView;")
            val constructor = screen.methods.single { it.name == "<init>" && it.parameterTypes.isEmpty() }
            val ctorInstructions = constructor.implementation?.instructions?.toList()
                ?: error("Zeldris settings: placeholder constructor missing")
            val objectCalls = ctorInstructions.indices.filter {
                (ctorInstructions[it] as? ReferenceInstruction)?.reference?.toString() == "Ljava/lang/Object;-><init>()V"
            }
            check(objectCalls.size == 1) { "Zeldris settings: unexpected placeholder constructor" }
            constructor.replaceInstruction(objectCalls.single(), "invoke-direct {p0}, Lcom/zing/zalo/ui/settings/BaseSettingView;-><init>()V")
            val options = screen.methods.single { it.name == "O6" && it.parameterTypes.isEmpty() }
            options.returnType = "[Lz00/c8;"
            options.ensureRegisters(2)
            options.clearBody()
            options.addInstructions(0, """
                const/4 v0, 0x0
                new-array v0, v0, [Lz00/c8;
                return-object v0
            """)
            val actionBar = screen.methods.single { it.name == "c6" && it.parameterTypes.isEmpty() }
            actionBar.clearBody()
            actionBar.addInstructions(0, """
                invoke-super {p0}, Lcom/zing/zalo/ui/settings/BaseSettingView;->c6()V
                invoke-static {p0}, Lapp/zeldrisho/zalo/extension/ZeldrisSettingsContent;->$titleMethod(Ljava/lang/Object;)V
                return-void
            """)
        }

        val meList = ZaloMeList261002.matchAll(1..1).single().method
        val listInstructions = meList.implementation?.instructions?.toList()
            ?: error("Zeldris settings: Me list builder has no implementation")
        val returns = listInstructions.indices.filter { listInstructions[it].opcode == Opcode.RETURN_OBJECT }
        check(returns.size == 1 && (listInstructions[returns.single()] as? OneRegisterInstruction)?.registerA == 2) {
            "Zeldris settings: expected one Me list return in v2"
        }
        val listReturn = returns.single()

        val adapter = ZaloMeAdapter261002.matchAll(1..1).single().method
        val adapterInstructions = adapter.implementation?.instructions?.toList()
            ?: error("Zeldris settings: Me adapter has no implementation")
        val bindings = adapterInstructions.indices.filter { index ->
            adapterInstructions[index].opcode == Opcode.INVOKE_VIRTUAL &&
                (adapterInstructions[index] as? ReferenceInstruction)?.reference?.toString() ==
                    "Lcom/zing/zalo/ui/settings/widget/ListItemSetting;->y(Lnj1/e;Ll50/h;)V"
        }
        check(bindings.size == 1) { "Zeldris settings: expected one native row binding" }
        val binding = bindings.single()
        val bindingInvoke = adapterInstructions[binding] as? FiveRegisterInstruction
        check(bindingInvoke?.registerCount == 3 && bindingInvoke.registerC == 5 && bindingInvoke.registerD == 3) {
            "Zeldris settings: unexpected native row registers"
        }

        val separator = classDefBy("Lnj1/a;")
        check(separator.methods.count {
            it.name == "<init>" && it.parameterTypes.isEmpty() && AccessFlags.PUBLIC.isSet(it.accessFlags)
        } == 1) { "Zeldris settings: native separator constructor changed" }
        val zinstantClass = classDefBy("Lcom/zing/zalo/ui/maintab/me/TabMeZinstantView;")
        check(zinstantClass.methods.count {
            it.name == "d" && it.parameterTypes.isEmpty() && it.returnType == "Landroid/view/View;" &&
                AccessFlags.PUBLIC.isSet(it.accessFlags)
        } == 1) { "Zeldris settings: Zinstant separator method changed" }
        val zinstant = ZaloMeZinstant261002.matchAll(1..1).single().method
        val zinstantInstructions = zinstant.implementation?.instructions?.toList()
            ?: error("Zeldris settings: Zinstant Me constructor has no implementation")
        val headers = zinstantInstructions.indices.filter { index ->
            zinstantInstructions[index].opcode == Opcode.IPUT_OBJECT &&
                (zinstantInstructions[index] as? ReferenceInstruction)?.reference?.toString() ==
                    "Lcom/zing/zalo/ui/maintab/me/TabMeZinstantView;->g:Lcom/zing/zalo/ui/maintab/tabmefullzinstant/TabMeZinstantSection;"
        }
        check(headers.size == 1 && (zinstantInstructions[headers.single()] as? TwoRegisterInstruction)?.registerA == 6) {
            "Zeldris settings: expected one Zinstant profile section"
        }

        val nativeRoute = ZaloNativeSettingsRoute261002.matchAll(1..1).single().method
        val routeInstructions = nativeRoute.implementation?.instructions?.toList()
            ?: error("Zeldris settings: native settings route has no implementation")
        val gearClass = routeInstructions.indices.filter { index ->
            routeInstructions[index].opcode == Opcode.CONST_CLASS &&
                (routeInstructions[index] as? ReferenceInstruction)?.reference?.toString() ==
                    "Lcom/zing/zalo/ui/settings/SettingV2View;"
        }
        check(gearClass.size == 1 && (gearClass.single() + 1..minOf(gearClass.single() + 8, routeInstructions.lastIndex)).any { index ->
            (routeInstructions[index] as? ReferenceInstruction)?.reference?.toString() ==
                "Lcom/zing/zalo/zview/r0;->R0(Ljava/lang/Class;Landroid/os/Bundle;ILjava/lang/String;IZ)V"
        }) { "Zeldris settings: native main-manager route changed" }

        val mainView = ZaloMainViewCreate261002.matchAll(1..1).single().method
        mainView.addInstructions(0, "invoke-static {p0}, Lapp/zeldrisho/zalo/extension/ZeldrisSettings;->registerMainView(Ljava/lang/Object;)V")
        meList.replaceInstruction(listReturn, "invoke-static {v2}, Lapp/zeldrisho/zalo/extension/ZeldrisSettings;->insertAfterProfile(Ljava/util/ArrayList;)V")
        meList.addInstructions(listReturn + 1, "return-object v2")
        adapter.addInstructions(binding + 1, "invoke-static {p1, v3}, Lapp/zeldrisho/zalo/extension/ZeldrisSettings;->bindSettingsRow(Landroid/view/View;Ljava/lang/Object;)V")
        zinstant.addInstructions(headers.single() + 1, "invoke-static {p0, p1}, Lapp/zeldrisho/zalo/extension/ZeldrisSettings;->attachAfterProfile(Ljava/lang/Object;Landroid/view/View;)V")
    }
}

private object ZaloNativeSettingsRoute261002 : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/maintab/MainTabView;", name = "u5",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL), returnType = "Z", parameters = listOf("I"),
)

internal object ZaloMainViewCreate261002 : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/maintab/MainTabView;", name = "h5",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL), returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"), filters = listOf(string("onCreate")),
)

private object ZaloMeList261002 : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/maintab/me/TabMeView;", name = "O6",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/util/ArrayList;", parameters = listOf("Lcom/zing/zalo/ui/maintab/me/TabMeView;"),
)

private object ZaloMeAdapter261002 : Fingerprint(
    definingClass = "Lnj1/k;", name = "D", accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V", parameters = listOf("Landroidx/recyclerview/widget/l2;", "I"),
)

private object ZaloMeZinstant261002 : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/maintab/me/TabMeZinstantView;", name = "<init>",
    returnType = "V", parameters = listOf("Landroid/content/Context;", "Lfq1/j;"),
    filters = listOf(string("ZinstantHeaderIdentifyKey")),
)
