package app.template.patches.bare.font

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/** ChildProcessMain immediately after Java descriptors move into native ownership. */
internal object ChildDescriptorRegistrationFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(string("Android.ChildProcess.JavalessStarted")),
)
