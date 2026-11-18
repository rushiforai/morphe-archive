package app.zeldrisho.patches.zalo.notif

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_261101_EXPERIMENTAL
import app.zeldrisho.patches.zalo.navigation.zeldrisSettingsPatch

/** Provides a link to Android's existing per-channel sound controls. */
@Suppress("unused")
val notificationSoundSettingsPatch = bytecodePatch(
    name = "Notification sound settings",
    description = "Adds a shortcut to Android notification settings, where available channels and sounds can be configured.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO_261101_EXPERIMENTAL)
    dependsOn(zeldrisSettingsPatch)

    execute {
        mutableClassDefBy("Lapp/zeldrisho/zalo/extension/ZeldrisSettingsContent;")
            .methods.single {
                it.name == "hasNotificationSoundSettings" && it.parameterTypes.isEmpty() && it.returnType == "Z"
            }.returnEarly(true)
    }
}
