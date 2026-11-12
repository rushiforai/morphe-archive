package app.template.patches.notesnook.fontswap

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val FACE = "Landroid/graphics/Typeface;"
private const val WEB = "Landroid/webkit/WebView;"
private const val REQUEST = "Landroid/webkit/WebResourceRequest;"
private const val RESPONSE = "Landroid/webkit/WebResourceResponse;"

private const val RUNTIME = "Lapp/fontism/extension/notesnook"

/**
 * Structural React Native hooks. Discovery uses Android ABI types and superclass
 * ancestry only: the release APK is R8-renamed (ReactTypefaceUtils is
 * `com/facebook/react/views/text/s`, RNCWebViewClient is `.../webview/h`).
 */
internal val notesnookNativeFontHooks = bytecodePatch {
    extendWith("extensions/extension.mpe")
    execute {
        val method = NotesnookReactTypefaceFingerprint.match().method
        if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.implementation == null)
            throw PatchException("Unsupported typeface ABI implementation")
        val owner = mutableClassDefBy(method.definingClass)
        val originalName = "morpheOriginalTypeface"
        if (owner.methods.any { it.name == originalName }) throw PatchException("Notesnook native font already patched")
        val original = MutableMethod(method).apply { name = originalName }
        val wrapper = MutableMethod(ImmutableMethod(
            owner.type, method.name, method.parameters, FACE, method.accessFlags,
            method.annotations, method.hiddenApiRestrictions,
            ImmutableMethodImplementation(6, emptyList(), emptyList(), emptyList()),
        ))
        // Fresh wrapper has one local. No assumptions about old locals/returns,
        // no overwriting original parameter registers or original branch targets.
        wrapper.addInstructions(0, """
            invoke-static/range {p0 .. p4}, ${owner.type}->$originalName(${FACE}IILjava/lang/String;Landroid/content/res/AssetManager;)$FACE
            move-result-object v0
            invoke-static {v0, p1, p2, p3}, $RUNTIME/NotesnookFontInjector;->nativeTypeface(${FACE}IILjava/lang/String;)$FACE
            move-result-object v0
            return-object v0
        """)
        owner.methods.remove(method)
        owner.methods.add(original)
        owner.methods.add(wrapper)

        fun isWebClient(type: String?): Boolean {
            var next = type
            val seen = mutableSetOf<String>()
            while (next != null && seen.add(next)) {
                if (next == "Landroid/webkit/WebViewClient;") return true
                next = classDefByOrNull(next)?.superclass
            }
            return false
        }
        val candidates = mutableListOf<String>()
        classDefForEach { cls ->
            // Keep the library namespace as a scope boundary, not a fixed class.
            if (cls.type.startsWith("Lcom/reactnativecommunity/webview/") && isWebClient(cls.superclass)
                && cls.methods.any { it.name == "onPageFinished" && it.parameterTypes == listOf(WEB, "Ljava/lang/String;") }
                && cls.methods.any { it.name == "shouldOverrideUrlLoading" }) candidates.add(cls.type)
        }
        if (candidates.size != 1) throw PatchException("Expected one RN WebView client structure, found ${candidates.size}")
        val client = mutableClassDefBy(candidates.single())
        val existing = client.methods.singleOrNull {
            it.name == "shouldInterceptRequest" && it.parameterTypes == listOf(WEB, REQUEST)
        }
        val oldIntercept = "morpheOriginalIntercept"
        if (client.methods.any { it.name == oldIntercept }) throw PatchException("WebView font interceptor already patched")
        if (existing != null && (existing.implementation == null || AccessFlags.STATIC.isSet(existing.accessFlags)))
            throw PatchException("Unsupported existing WebView interceptor")
        val fallback = if (existing == null)
            "invoke-super {p0, p1, p2}, ${client.superclass}->shouldInterceptRequest($WEB$REQUEST)$RESPONSE"
        else "invoke-virtual {p0, p1, p2}, ${client.type}->$oldIntercept($WEB$REQUEST)$RESPONSE"
        if (existing != null) {
            val preserved = MutableMethod(existing).apply { name = oldIntercept }
            client.methods.remove(existing)
            client.methods.add(preserved)
        }
        val intercept = MutableMethod(ImmutableMethod(
            client.type, "shouldInterceptRequest", listOf(
                ImmutableMethodParameter(WEB, emptySet(), null),
                ImmutableMethodParameter(REQUEST, emptySet(), null),
            ), RESPONSE, AccessFlags.PUBLIC.value, emptySet(), emptySet(),
            ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList()),
        ))
        intercept.addInstructions(0, """
            invoke-static {p2}, $RUNTIME/NotesnookFontRequests;->intercept($REQUEST)$RESPONSE
            move-result-object v0
            if-eqz v0, :original
            return-object v0
            :original
            $fallback
            move-result-object v0
            return-object v0
        """)
        client.methods.add(intercept)

        // Document-wide WebView font rule after each commit/finish; the original
        // callback (or the WebViewClient default) always runs first.
        val pageHook = "invoke-static {p1}, $RUNTIME/NotesnookFontWebView;->inject($WEB)V"
        listOf("onPageCommitVisible" to "morpheOriginalPageCommitVisible",
            "onPageFinished" to "morpheOriginalPageFinished").forEach { (name, preservedName) ->
            val current = client.methods.singleOrNull {
                it.name == name && it.parameterTypes == listOf(WEB, "Ljava/lang/String;") && it.returnType == "V"
            }
            if (client.methods.any { it.name == preservedName }) throw PatchException("WebView $name already patched")
            if (current != null && (current.implementation == null || AccessFlags.STATIC.isSet(current.accessFlags)))
                throw PatchException("Unsupported existing WebView $name")
            val call = if (current == null)
                "invoke-super {p0, p1, p2}, ${client.superclass}->$name(${WEB}Ljava/lang/String;)V"
            else "invoke-virtual {p0, p1, p2}, ${client.type}->$preservedName(${WEB}Ljava/lang/String;)V"
            if (current != null) {
                client.methods.remove(current)
                client.methods.add(MutableMethod(current).apply { this.name = preservedName })
            }
            val wrapper = MutableMethod(ImmutableMethod(
                client.type, name, listOf(
                    ImmutableMethodParameter(WEB, emptySet(), null),
                    ImmutableMethodParameter("Ljava/lang/String;", emptySet(), null),
                ), "V", AccessFlags.PUBLIC.value, emptySet(), emptySet(),
                ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList()),
            ))
            wrapper.addInstructions(0, """
                $call
                $pageHook
                return-void
            """)
            client.methods.add(wrapper)
        }
    }
}
