package app.zeldrisho.patches.zalo.backup

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_261002
import app.zeldrisho.patches.zalo.navigation.zeldrisSettingsPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction

/** Installs a runtime interval choice while preserving the native account-specific value by default. */
@Suppress("unused")
val runtimeZaloBackupIntervalPatch = bytecodePatch(
    name = "Native backup interval settings",
    description = "Adds a backup interval choice in Zeldris Patches. Native is the default; existing backup requirements apply.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO_261002)
    dependsOn(zeldrisSettingsPatch)

    execute {
        val scheduler = BackupScheduler261002.matchAll(1..1).single().method
        val (resultIndex, register) = locateBackupInterval(scheduler, version261002 = true)
        val instructions = scheduler.implementation?.instructions?.toList()
            ?: error("Zalo backup interval: scheduler has no implementation")
        val comparison = instructions.getOrNull(resultIndex + 1)
        check(register == 6 && comparison?.opcode == Opcode.CMP_LONG &&
            (comparison as? ThreeRegisterInstruction)?.registerC == register
        ) { "Zalo backup interval: unexpected native interval consumer" }
        val capability = mutableClassDefBy("Lapp/zeldrisho/zalo/extension/ZeldrisSettingsContent;")
            .methods.single { it.name == "hasBackupIntervalSettings" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        capability.returnEarly(true)
        scheduler.addInstructions(resultIndex + 1, """
            invoke-static {v6, v7}, Lapp/zeldrisho/zalo/extension/ZeldrisSettings;->backupIntervalMillis(J)J
            move-result-wide v6
        """)
    }
}
