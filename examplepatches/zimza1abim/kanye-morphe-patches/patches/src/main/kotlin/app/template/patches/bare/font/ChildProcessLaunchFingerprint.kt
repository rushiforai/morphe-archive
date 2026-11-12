package app.template.patches.bare.font

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object ChildProcessLaunchFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;",
    name = "createAndStart",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;",
    parameters = listOf(
        "J",
        "[Ljava/lang/String;",
        "[Lorg/chromium/base/process_launcher/IFileDescriptorInfo;",
        "Z",
        "Z",
        "Z",
    ),
)
