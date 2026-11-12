package app.template.patches.brave.font

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * The renderer always passes through this method after its command line and
 * inherited file descriptors are installed.  Sandboxed renderers may inherit
 * libchrome from the app zygote and therefore never call System.loadLibrary.
 */
internal object ChildNativeStartupFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/content/app/ContentChildProcessServiceDelegate;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)
