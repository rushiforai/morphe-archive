package app.zeldrisho.patches.zalo.notif

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_261101_EXPERIMENTAL
import app.zeldrisho.patches.zalo.navigation.zeldrisSettingsPatch

/** Provides a link to Android's existing per-channel sound controls. */
@Suppress("unused")
val notificationSoundSettingsPatch = bytecodePatch(
    name = "Notification sound settings",
    description = "Kept for compatibility with existing patch selections; the notification settings shortcut is hidden.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO_261101_EXPERIMENTAL)
    dependsOn(zeldrisSettingsPatch)

    // Kept for compatibility with existing patch selections; the settings shortcut is hidden.
}
