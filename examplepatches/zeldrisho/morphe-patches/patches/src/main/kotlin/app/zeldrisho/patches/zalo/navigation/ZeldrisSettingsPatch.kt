@file:OptIn(app.zeldrisho.patches.shared.bytecode.WholeBodyReplacement::class)

package app.zeldrisho.patches.zalo.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.string
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_261002_AND_EXPERIMENTAL
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
    compatibleWith(COMPATIBILITY_ZALO_261002_AND_EXPERIMENTAL)
    extendWith("extensions/extension.mpe")

    execute {
        val version261101 = packageMetadata.versionName == "26.11.01"
        for ((className, titleMethod) in listOf(
            "ZeldrisSettingsView" to "setTitle",
            "ZeldrisBackupSettingsView" to "setBackupTitle",
            "ZeldrisAccentSettingsView" to "setAccentTitle",
            "ZeldrisRingtoneSettingsView" to "setRingtoneTitle",
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
            if (version261101) options.setName("Q6")
            val optionsType = if (version261101) "[Lmny;" else "[Lz00/c8;"
            options.returnType = optionsType
            options.ensureRegisters(2)
            options.clearBody()
            options.addInstructions(0, """
                const/4 v0, 0x0
                new-array v0, v0, $optionsType
                return-object v0
            """)
            if (version261101) {
                screen.methods.single { it.name == "V6" && it.parameterTypes.isEmpty() && it.returnType == "V" }
                    .setName("T6")
                screen.methods.single {
                    it.name == "T6" && it.parameterTypes == listOf("Landroid/view/LayoutInflater;", "Landroid/widget/LinearLayout;", "Landroid/os/Bundle;") &&
                        it.returnType == "Landroid/view/View;"
                }.setName("V6")
                screen.methods.single { it.name == "R6" && it.parameterTypes.isEmpty() && it.returnType == "V" }
                    .let { method ->
                        method.setName("X6")
                        method.clearBody()
                        method.addInstructions(0, "return-void")
                    }
                screen.methods.single { it.name == "P6" && it.parameterTypes.isEmpty() && it.returnType == "I" }
                    .setName("R6")
                screen.methods.single { it.name == "c6" && it.parameterTypes.isEmpty() }
                    .let { method ->
                        method.clearBody()
                        method.addInstructions(0, "return-void")
                    }
            } else {
                val actionBar = screen.methods.single { it.name == "c6" && it.parameterTypes.isEmpty() }
                actionBar.clearBody()
                actionBar.addInstructions(0, """
                    invoke-super {p0}, Lcom/zing/zalo/ui/settings/BaseSettingView;->c6()V
                    invoke-static {p0}, Lapp/zeldrisho/zalo/extension/ZeldrisSettingsContent;->$titleMethod(Ljava/lang/Object;)V
                    return-void
                """)
            }
        }

        if (version261101) {
            val base = mutableClassDefBy("Lcom/zing/zalo/ui/settings/BaseSettingView;")
            val host = base.methods.single { method ->
                method.name == "H5" && method.parameterTypes == listOf("Landroid/view/View;", "Landroid/os/Bundle;")
            }
            val instructions = host.implementation?.instructions?.toList()
                ?: error("Zeldris settings: BaseSettingView.H5 has no implementation")
            val superCall = instructions.indices.single { index ->
                (instructions[index] as? ReferenceInstruction)?.reference?.toString() ==
                    "Lcom/zing/zalo/ui/zviews/ZaloViewNewActionBar;->H5(Landroid/view/View;Landroid/os/Bundle;)V"
            }
            host.addInstructions(superCall + 1,
                "invoke-static {p0}, Lapp/zeldrisho/zalo/extension/ZeldrisSettingsContent;->setTitleForPatchedScreen(Ljava/lang/Object;)V")
        }

        val meList = (if (version261101) ZaloMeList261101 else ZaloMeList261002).matchAll(1..1).single().method
        val listInstructions = meList.implementation?.instructions?.toList()
            ?: error("Zeldris settings: Me list builder has no implementation")
        val returns = listInstructions.indices.filter { listInstructions[it].opcode == Opcode.RETURN_OBJECT }
        val expectedListRegister = if (version261101) 3 else 2
        check(returns.size == 1 && (listInstructions[returns.single()] as? OneRegisterInstruction)?.registerA == expectedListRegister) {
            "Zeldris settings: expected one Me list return in v2"
        }
        val listReturn = returns.single()

        val adapter = (if (version261101) ZaloMeAdapter261101 else ZaloMeAdapter261002).matchAll(1..1).single().method
        val adapterInstructions = adapter.implementation?.instructions?.toList()
            ?: error("Zeldris settings: Me adapter has no implementation")
        val bindings = adapterInstructions.indices.filter { index ->
            adapterInstructions[index].opcode == Opcode.INVOKE_VIRTUAL &&
                (adapterInstructions[index] as? ReferenceInstruction)?.reference?.toString() ==
                    if (version261101) "Lcom/zing/zalo/ui/settings/widget/ListItemSetting;->y(Lqdn;Luun;)V"
                    else "Lcom/zing/zalo/ui/settings/widget/ListItemSetting;->y(Lnj1/e;Ll50/h;)V"
        }
        check(bindings.size == 1) { "Zeldris settings: expected one native row binding" }
        val binding = bindings.single()
        val bindingInvoke = adapterInstructions[binding] as? FiveRegisterInstruction
        check(bindingInvoke?.registerCount == 3 && bindingInvoke.registerC == 5 && bindingInvoke.registerD == 3) {
            "Zeldris settings: unexpected native row registers"
        }

        val separator = classDefBy(if (version261101) "Lyk7;" else "Lnj1/a;")
        check(separator.methods.count {
            it.name == "<init>" && it.parameterTypes.isEmpty() && AccessFlags.PUBLIC.isSet(it.accessFlags)
        } == 1) { "Zeldris settings: native separator constructor changed" }
        val zinstantClass = classDefBy("Lcom/zing/zalo/ui/maintab/me/TabMeZinstantView;")
        check(zinstantClass.methods.count {
            it.name == "d" && it.parameterTypes.isEmpty() && it.returnType == "Landroid/view/View;" &&
                AccessFlags.PUBLIC.isSet(it.accessFlags)
        } == 1) { "Zeldris settings: Zinstant separator method changed" }
        val zinstant = (if (version261101) ZaloMeZinstant261101 else ZaloMeZinstant261002).matchAll(1..1).single().method
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

        val nativeRoute = (if (version261101) ZaloNativeSettingsRoute261101 else ZaloNativeSettingsRoute261002).matchAll(1..1).single().method
        val routeInstructions = nativeRoute.implementation?.instructions?.toList()
            ?: error("Zeldris settings: native settings route has no implementation")
        val gearClass = routeInstructions.indices.filter { index ->
            routeInstructions[index].opcode == Opcode.CONST_CLASS &&
                (routeInstructions[index] as? ReferenceInstruction)?.reference?.toString() ==
                    "Lcom/zing/zalo/ui/settings/SettingV2View;"
        }
        check(gearClass.size == 1 && (gearClass.single() + 1..minOf(gearClass.single() + 8, routeInstructions.lastIndex)).any { index ->
            (routeInstructions[index] as? ReferenceInstruction)?.reference?.toString() ==
                (if (version261101) "Lcom/zing/zalo/zview/b;" else "Lcom/zing/zalo/zview/r0;") +
                    "->R0(Ljava/lang/Class;Landroid/os/Bundle;ILjava/lang/String;IZ)V"
        }) { "Zeldris settings: native main-manager route changed" }

        val mainView = (if (version261101) ZaloMainViewCreate261101 else ZaloMainViewCreate261002).matchAll(1..1).single().method
        mainView.addInstructions(0, "invoke-static {p0}, Lapp/zeldrisho/zalo/extension/ZeldrisSettings;->registerMainView(Ljava/lang/Object;)V")
        meList.replaceInstruction(listReturn, "invoke-static {v$expectedListRegister}, Lapp/zeldrisho/zalo/extension/ZeldrisSettings;->insertAfterProfile(Ljava/util/ArrayList;)V")
        meList.addInstructions(listReturn + 1, "return-object v$expectedListRegister")
        adapter.addInstructions(binding + 1, "invoke-static {p1, v3}, Lapp/zeldrisho/zalo/extension/ZeldrisSettings;->bindSettingsRow(Landroid/view/View;Ljava/lang/Object;)V")
        zinstant.addInstructions(headers.single() + 1, "invoke-static {p0, v6}, Lapp/zeldrisho/zalo/extension/ZeldrisSettings;->attachAfterProfile(Ljava/lang/Object;Landroid/view/View;)V")
    }
}

// Experimental target: 26.11.01 is advertised but not fully device-qualified.
private object ZaloNativeSettingsRoute261101 : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/maintab/MainTabView;", name = "w5",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL), returnType = "Z", parameters = listOf("I"),
)

internal object ZaloMainViewCreate261101 : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/maintab/MainTabView;", name = "j5",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL), returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"), filters = listOf(string("onCreate")),
)

private object ZaloMeList261101 : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/maintab/me/TabMeView;", name = "P6",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/util/ArrayList;", parameters = listOf("Lcom/zing/zalo/ui/maintab/me/TabMeView;"),
)

private object ZaloMeAdapter261101 : Fingerprint(
    definingClass = "Lntp;", name = "D", accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V", parameters = listOf("Landroidx/recyclerview/widget/o;", "I"),
)

private object ZaloMeZinstant261101 : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/maintab/me/TabMeZinstantView;", name = "<init>",
    returnType = "V", parameters = listOf("Landroid/content/Context;", "Lf0i;"),
    filters = listOf(string("ZinstantHeaderIdentifyKey")),
)

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
