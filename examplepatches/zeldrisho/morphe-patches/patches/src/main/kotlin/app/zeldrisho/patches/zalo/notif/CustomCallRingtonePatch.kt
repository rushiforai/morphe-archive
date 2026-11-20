package app.zeldrisho.patches.zalo.notif

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.returnEarly
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_261002_AND_EXPERIMENTAL
import app.zeldrisho.patches.zalo.navigation.zeldrisSettingsPatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val PICKER = "app.zeldrisho.zalo.extension.RingtonePickerActivity"

private val ringtonePickerManifest = resourcePatch {
    compatibleWith(COMPATIBILITY_ZALO_261002_AND_EXPERIMENTAL)
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val activities = application.getElementsByTagName("activity")
            check((0 until activities.length).none {
                (activities.item(it) as Element).getAttributeNS(ANDROID_NS, "name") == PICKER
            }) { "Ringtone picker activity already exists" }
            val activity = document.createElement("activity")
            activity.setAttributeNS(ANDROID_NS, "android:name", PICKER)
            activity.setAttributeNS(ANDROID_NS, "android:exported", "false")
            application.appendChild(activity)
        }
    }
}

/** Optional global call ringtone; notification channel and per-friend sounds are separate. */
@Suppress("unused")
val customZaloCallRingtonePatch = bytecodePatch(
    name = "Custom Zalo call ringtone",
    description = "Adds a global incoming-call audio file choice; the setting is unavailable in the current Zeldris settings screen, so the native ringtone is used by default.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO_261002_AND_EXPERIMENTAL)
    dependsOn(zeldrisSettingsPatch, ringtonePickerManifest)
    execute {
        val version261101 = packageMetadata.versionName == "26.11.01"
        val method = (if (version261101) IncomingRingtone261101 else IncomingRingtone).matchAll(1..1).single().method
        check(method.implementation?.registerCount == 9) { "Incoming ringtone registers changed" }
        // v0 is immediately overwritten by the original entry; p1 is the ringtone URI.
        val injection = if (version261101) """
            iget-object v0, p0, Ljyl;->d:Ljava/lang/Object;
            invoke-static {v0, p1}, Lapp/zeldrisho/zalo/extension/CustomRingtone;->resolveObject(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
            move-result-object p1
        """ else """
            iget-object v0, p0, Lwd2/i;->b:Landroid/content/Context;
            invoke-static {v0, p1}, Lapp/zeldrisho/zalo/extension/CustomRingtone;->resolve(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
            move-result-object p1
        """
        method.addInstructions(0, injection.trimIndent())
    }
}

private object IncomingRingtone261101 : Fingerprint(
    definingClass = "Ljyl;", name = "l", accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Ljava/lang/String;"), returnType = "V",
    filters = listOf(string("ring: ringerMode "),
        fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "Ljyl;", name = "d", type = "Ljava/lang/Object;"),
        methodCall(definingClass = "Landroid/media/AudioManager;", name = "getRingerMode", returnType = "I")),
)

private object IncomingRingtone : Fingerprint(
    definingClass = "Lwd2/i;", name = "c",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/String;"), returnType = "V",
    filters = listOf(string("ring: ringerMode "),
        methodCall(definingClass = "Landroid/media/AudioManager;", name = "getRingerMode", returnType = "I")),
)
