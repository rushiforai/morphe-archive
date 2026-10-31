package app.template.patches.zalo.notif

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.template.patches.shared.Constants.COMPATIBILITY_ZALO_261002
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags

/** Allows the out-of-app notification gate for messages in Stranger Box. */
@Suppress("unused")
val enableZaloStrangerNotificationsPatch = bytecodePatch(
    name = "Enable stranger notifications",
    description = "Allows notifications for Stranger Box messages. Other notification settings, " +
        "message delivery and server restrictions still apply.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO_261002)

    execute {
        val method = StrangerBoxNotificationGate261002.matchAll(1..1).single().method
        method.returnEarly(true)
    }
}

/** Config getter consumed by OutAppNotifGate's stranger-box suppression check. */
private object StrangerBoxNotificationGate261002 : Fingerprint(
    definingClass = "Lvc/md;",
    name = "d",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(string("features@notification_config@out_app_noti@show_for_stranger_box")),
)
