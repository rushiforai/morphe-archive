package app.brokenn.patches.jiohotstar.playback

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object IsDolbyVisionSupportedFingerprint : Fingerprint(
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf("Landroid/content/Context;", "Z", "I", "Z"),
    filters = listOf(
        string("dv"),
        string("bklst"),
    )
)
