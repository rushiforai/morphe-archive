package app.zeldrisho.patches.zalo.navigation

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.returnEarly
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_261002
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/** Changes the native tab state before it builds the list and derives its indices. */
@Suppress("unused")
val hideZaloNavigationTabsPatch = bytecodePatch(
    name = "Hide navigation tabs",
    description = "Adds settings to hide Discovery, Contacts and Timeline individually. Tabs stay visible until hidden in Zeldris Patches; restart to apply.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO_261002)
    dependsOn(zeldrisSettingsPatch)

    execute {
        val method = NavigationTabBuilder261002.matchAll(1..1).single().method
        val instructions = method.implementation?.instructions?.toList()
            ?: error("Zalo navigation tabs: tab builder has no implementation")
        fun find(opcode: Opcode, reference: String): Int {
            val matches = instructions.indices.filter { index ->
                instructions[index].opcode == opcode &&
                    (instructions[index] as? ReferenceInstruction)?.reference?.toString() == reference
            }
            check(matches.size == 1) { "Zalo navigation tabs: expected one $reference, found ${matches.size}" }
            return matches.single()
        }
        val discoveryLoad = find(Opcode.SGET_BOOLEAN, "Lxa1/i;->b:Z")
        val discoveryStore = find(Opcode.IPUT_BOOLEAN, "Lkj1/v;->l:Z")
        check(discoveryStore == discoveryLoad + 1 &&
            (instructions[discoveryLoad] as? OneRegisterInstruction)?.registerA == 1 &&
            (instructions[discoveryStore] as? TwoRegisterInstruction)?.registerA == 1
        ) { "Zalo navigation tabs: unexpected Discovery state flow" }
        val timelineStore = find(Opcode.IPUT_BOOLEAN, "Lkj1/v;->k:Z")
        val zeroIndex = (discoveryStore + 1 until timelineStore).singleOrNull { index ->
            instructions[index].opcode == Opcode.CONST_4 &&
                (instructions[index] as? OneRegisterInstruction)?.registerA == 3 &&
                (instructions[index] as? NarrowLiteralInstruction)?.narrowLiteral == 0
        } ?: error("Zalo navigation tabs: Timeline zero register not found")
        check(zeroIndex < timelineStore &&
            (instructions[timelineStore] as? TwoRegisterInstruction)?.registerA == 1 &&
            (instructions[timelineStore] as? TwoRegisterInstruction)?.registerB == 10
        ) { "Zalo navigation tabs: unexpected Timeline state flow" }

        val contactsLoad = find(Opcode.SGET_OBJECT, "Lkj1/t;->PHONEBOOK:Lkj1/t;")
        val contactsInstruction = instructions.getOrNull(contactsLoad + 1)
        val contactsAdd = contactsInstruction as? FiveRegisterInstruction
        check(contactsInstruction?.opcode == Opcode.INVOKE_VIRTUAL &&
            (contactsInstruction as? ReferenceInstruction)?.reference?.toString() ==
                "Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z" &&
            contactsAdd?.registerCount == 2 && contactsAdd.registerC == 0 && contactsAdd.registerD == 4
        ) { "Zalo navigation tabs: Contacts insertion changed" }

        val mainView = ZaloMainViewCreate261002.matchAll(1..1).single().method
        val mainInstructions = mainView.implementation?.instructions?.toList()
            ?: error("Zeldris settings: main view has no implementation")
        val rebuildCalls = mainInstructions.indices.filter { index ->
            mainInstructions[index].opcode == Opcode.INVOKE_VIRTUAL &&
                (mainInstructions[index] as? ReferenceInstruction)?.reference?.toString() == "Lkj1/v;->q()V"
        }
        check(rebuildCalls.size == 1) { "Zeldris settings: expected one guarded tab rebuild" }
        val rebuild = rebuildCalls.single()
        val invoke = mainInstructions[rebuild] as? FiveRegisterInstruction
        check(invoke?.registerCount == 1 && invoke.registerC == 1 && rebuild > 0 &&
            mainInstructions[rebuild - 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
            (mainInstructions[rebuild - 1] as? OneRegisterInstruction)?.registerA == 1
        ) { "Zeldris settings: unexpected guarded tab rebuild flow" }

        val capability = mutableClassDefBy("Lapp/zeldrisho/zalo/extension/ZeldrisSettingsContent;")
            .methods.single { it.name == "hasNavigationSettings" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        capability.returnEarly(true)
        // Filtering at insertion leaves native indexOf(), tab count, icon arrays
        // and pager models consistent. PHONEBOOK's index becomes -1, as for the
        // host's other omitted tabs; MainTabView.t6() already guards that value.
        method.replaceInstruction(contactsLoad + 1,
            "invoke-static {v0, v4}, Lapp/zeldrisho/zalo/extension/ZeldrisSettings;->addContactsTab(Ljava/util/ArrayList;Ljava/lang/Object;)V")
        method.replaceInstruction(timelineStore, "invoke-static {v1}, Lapp/zeldrisho/zalo/extension/ZeldrisSettings;->showTimeline(Z)Z")
        method.addInstructions(timelineStore + 1, """
            move-result v1
            iput-boolean v1, p0, Lkj1/v;->k:Z
        """)
        method.addInstructions(discoveryLoad + 1, """
            invoke-static {v1}, Lapp/zeldrisho/zalo/extension/ZeldrisSettings;->showDiscovery(Z)Z
            move-result v1
        """)
        mainView.replaceInstruction(rebuild, "invoke-virtual {v1}, Lkj1/v;->p()V")
    }
}

private object NavigationTabBuilder261002 : Fingerprint(
    definingClass = "Lkj1/v;",
    name = "p",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(opcode = Opcode.SGET_BOOLEAN, definingClass = "Lxa1/i;", name = "b", type = "Z"),
        string("ENABLE_GROUP_TAB"),
        string("ENABLE_TIMELINE_TAB"),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = "Lkj1/t;", name = "DISCOVERY", type = "Lkj1/t;"),
    ),
)
