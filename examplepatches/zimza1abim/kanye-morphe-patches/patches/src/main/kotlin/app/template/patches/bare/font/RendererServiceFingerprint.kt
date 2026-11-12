package app.template.patches.bare.font

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val NATIVE_RENDERER_SERVICE = "org.chromium.content.app.NativeOnlySandboxedProcessService"
internal const val JAVA_RENDERER_SERVICE = "org.chromium.content.app.SandboxedProcessService"

internal fun rendererStrings(method: Method): List<String> =
    method.implementation?.instructions?.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    } ?: emptyList()

internal object RendererServiceFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;",
    custom = { method, _ ->
        val strings = rendererStrings(method)
        NATIVE_RENDERER_SERVICE in strings && JAVA_RENDERER_SERVICE in strings &&
            "javaless-renderers" in strings
    },
)

internal fun isRendererServiceSelector(method: Method): Boolean {
    val strings = rendererStrings(method)
    return method.definingClass == "Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;" &&
        NATIVE_RENDERER_SERVICE in strings && JAVA_RENDERER_SERVICE in strings &&
        "javaless-renderers" in strings
}
