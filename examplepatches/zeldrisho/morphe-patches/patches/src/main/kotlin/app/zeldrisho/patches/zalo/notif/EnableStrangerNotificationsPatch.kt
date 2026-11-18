package app.zeldrisho.patches.zalo.notif

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.util.smali.ExternalLabel
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_261002_AND_EXPERIMENTAL
import app.zeldrisho.patches.zalo.navigation.zeldrisSettingsPatch
import com.android.tools.smali.dexlib2.AccessFlags

/** Adds an opt-in runtime control for the Stranger Box out-of-app notification gate. */
@Suppress("unused")
val enableZaloStrangerNotificationsPatch = bytecodePatch(
    name = "Enable stranger notifications",
    description = "Adds an initially off in-app switch to allow Stranger Box notifications. " +
        "Off uses Zalo's native gate; other settings and delivery restrictions still apply.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO_261002_AND_EXPERIMENTAL)
    dependsOn(zeldrisSettingsPatch)

    execute {
        val method = (StrangerBoxNotificationGate261002.matchAll(0..1) +
            StrangerBoxNotificationGate261101.matchAll(0..1)).single().method
        val implementation = method.implementation ?: error("Stranger notifications: getter has no implementation")
        check(implementation.registerCount == 3) { "Stranger notifications: unexpected getter registers" }
        val original = implementation.instructions.first()
        val capability = mutableClassDefBy("Lapp/zeldrisho/zalo/extension/ZeldrisSettingsContent;")
            .methods.single { it.name == "hasStrangerNotificationSettings" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        capability.returnEarly(true)
        method.addInstructionsWithLabels(0, """
            invoke-static {}, Lapp/zeldrisho/zalo/extension/ZeldrisSettings;->strangerNotificationsEnabled()Z
            move-result v0
            if-eqz v0, :original
            const/4 v0, 0x1
            return v0
        """, ExternalLabel("original", original))
    }
}

// Experimental target: 26.11.01 is advertised but not fully device-qualified.
private object StrangerBoxNotificationGate261101 : Fingerprint(
    definingClass = "Lz710;", name = "d",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC), returnType = "Z", parameters = emptyList(),
    filters = listOf(string("features@notification_config@out_app_noti@show_for_stranger_box")),
)

/** Config getter consumed by OutAppNotifGate's stranger-box suppression check. */
private object StrangerBoxNotificationGate261002 : Fingerprint(
    definingClass = "Lvc/md;",
    name = "d",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(string("features@notification_config@out_app_noti@show_for_stranger_box")),
)
