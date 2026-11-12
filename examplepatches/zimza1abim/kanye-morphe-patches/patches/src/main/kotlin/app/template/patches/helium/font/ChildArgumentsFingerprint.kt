package app.template.patches.helium.font

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/** Receives Chromium's child argument object before the child-main thread wakes. */
internal object ChildArgumentsFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/content/app/ContentChildProcessServiceDelegate;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Lorg/chromium/base/process_launcher/IChildProcessArgs;",
        "Ljava/util/List;",
    ),
)
