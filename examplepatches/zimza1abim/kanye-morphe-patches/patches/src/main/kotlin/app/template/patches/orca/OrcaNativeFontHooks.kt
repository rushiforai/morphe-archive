package app.template.patches.orca

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val FACE = "Landroid/graphics/Typeface;"
private const val ASSET_MANAGER = "Landroid/content/res/AssetManager;"
private const val TEXT_PAINT = "Landroid/text/TextPaint;"
private const val WEB = "Landroid/webkit/WebView;"
private const val REQUEST = "Landroid/webkit/WebResourceRequest;"
private const val RESPONSE = "Landroid/webkit/WebResourceResponse;"
private const val STRING = "Ljava/lang/String;"
private const val CONTEXT = "Landroid/content/Context;"
private const val INJECTOR = "Lapp/fontism/extension/orca/OrcaFonts;"
private const val WEB_FONTS = "Lapp/fontism/extension/orca/OrcaWebFonts;"
private const val FABRIC = "Lcom/facebook/react/fabric/FabricUIManager;"
private const val RESOLVER_ARGS = "$FACE" + "II" + STRING + ASSET_MANAGER

// Emoji paints keep the emoji font; the runtime itself is never rewritten.
private val EXCLUDED = listOf("Landroidx/emoji2/", "Lapp/fontism/")

/** Indexes of `new TextPaint()` / `new TextPaint(int flags)` calls, with the instance register. */
private fun Method.textPaintConstructions(): List<Pair<Int, Int>> =
    implementation?.instructions?.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode != Opcode.INVOKE_DIRECT && instruction.opcode != Opcode.INVOKE_DIRECT_RANGE)
            return@mapIndexedNotNull null
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapIndexedNotNull null
        if (call.definingClass != TEXT_PAINT || call.name != "<init>" || call.parameterTypes.any { it != "I" })
            return@mapIndexedNotNull null
        val instance = when (instruction) {
            is FiveRegisterInstruction -> instruction.registerC
            is RegisterRangeInstruction -> instruction.startRegister
            else -> return@mapIndexedNotNull null
        }
        index to instance
    }.orEmpty()

/**
 * A fresh wrapper keeps the original's flags and types. Annotations and hidden-API
 * restrictions stay on the renamed original, which is what the platform and R8 read.
 */
private fun newMethod(
    owner: String,
    name: String,
    types: List<String>,
    result: String,
    registers: Int,
    flags: Int,
) = MutableMethod(ImmutableMethod(
    owner, name, types.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
    flags, emptySet(), emptySet(),
    ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList()),
))

/**
 * Native typeface, paint and web-shell hooks. This patch does not write the
 * Hermes bundle. orcaFontResources replaces assets/index.android.bundle with
 * the versioned adapter after the official bytes match. Do not put the
 * official bundle back. A new Orca release fails here instead of inheriting
 * a stale hook.
 */
internal val orcaNativeFontHooks = bytecodePatch {
    extendWith("extensions/orca.mpe")
    execute {
        // Discovery precedes mutation: every structural target must be unique.
        val resolver = OrcaReactTypefaceFingerprint.match().method
        if (!AccessFlags.STATIC.isSet(resolver.accessFlags) || resolver.implementation == null)
            throw PatchException("Unsupported Orca typeface resolver")
        if (mutableClassDefBy(resolver.definingClass).methods.any { it.name == "morpheOriginal_" + resolver.name })
            throw PatchException("Orca fonts already patched")

        val applicationType = orcaApplicationType
        if (applicationType.isEmpty()) throw PatchException("Orca application class was not resolved")
        val application = mutableClassDefBy(applicationType)
        if (application.superclass != "Landroid/app/Application;")
            throw PatchException("Unsupported Orca Application inheritance")
        if (application.methods.any { it.name == "attachBaseContext" })
            throw PatchException("Orca has its own attachBaseContext; explicit integration required")

        val paintOwners = mutableListOf<String>()
        classDefForEach { cls ->
            if (EXCLUDED.none { cls.type.startsWith(it) } &&
                cls.methods.any { it.textPaintConstructions().isNotEmpty() }
            ) paintOwners += cls.type
        }
        if (FABRIC !in paintOwners) throw PatchException("Orca Fabric text paint construction not found")

        fun isWebViewClient(type: String?): Boolean {
            var next = type
            val seen = mutableSetOf<String>()
            while (next != null && seen.add(next)) {
                if (next == "Landroid/webkit/WebViewClient;") return true
                next = classDefByOrNull(next)?.superclass
            }
            return false
        }
        val clients = mutableListOf<String>()
        classDefForEach { cls ->
            if (cls.superclass != null && isWebViewClient(cls.superclass) &&
                cls.methods.any { it.name == "onPageFinished" && it.parameterTypes == listOf(WEB, STRING) } &&
                cls.methods.any { it.name == "shouldInterceptRequest" && it.parameterTypes == listOf(WEB, REQUEST) }
            ) clients += cls.type
        }
        if (clients.size != 1) throw PatchException("Expected one Orca WebView client, found ${clients.size}")

        fun wrap(original: Method, locals: Int, body: (String) -> String) {
            val owner = mutableClassDefBy(original.definingClass)
            val preserved = "morpheOriginal_" + original.name
            if (owner.methods.any { it.name == preserved })
                throw PatchException("Already patched: ${original.name}")
            val saved = MutableMethod(original).apply { name = preserved }
            val params = original.parameterTypes.map { it.toString() }
            val count = params.sumOf { if (it == "J" || it == "D") 2 else 1 } +
                if (AccessFlags.STATIC.isSet(original.accessFlags)) 0 else 1
            val wrapper = newMethod(owner.type, original.name, params, original.returnType, locals + count,
                original.accessFlags)
            val savedDescriptor = "${owner.type}->$preserved(${params.joinToString("")})${original.returnType}"
            wrapper.addInstructions(0, body(savedDescriptor))
            owner.methods.remove(original)
            owner.methods.add(saved)
            owner.methods.add(wrapper)
        }

        // Before React Native starts: the injected faces are already loaded, so the
        // first frame uses them instead of the system font.
        application.methods.add(newMethod(application.type, "attachBaseContext", listOf(CONTEXT), "V", 2,
            AccessFlags.PROTECTED.value).apply {
            addInstructions(0, """
                invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext($CONTEXT)V
                invoke-static {p1}, $INJECTOR->initialize($CONTEXT)V
                return-void
            """)
        })

        wrap(resolver, 1) { saved -> """
            invoke-static/range {p0 .. p4}, $saved
            move-result-object v0
            invoke-static {v0, p1, p2, p3, p4}, $INJECTOR->nativeTypeface($RESOLVER_ARGS)$FACE
            move-result-object v0
            return-object v0
        """ }

        // Android refuses to replace the process default typeface, so every paint
        // created without one is primed; a later explicit family still overrides it.
        paintOwners.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                method.textPaintConstructions().asReversed().forEach { (index, register) ->
                    method.addInstruction(index + 1,
                        "invoke-static/range {v$register .. v$register}, $INJECTOR->prime(Landroid/graphics/Paint;)V")
                }
            }
        }

        // Local and agent-authored pages render in a WebView; the stylesheet is
        // injected after commit so it never races the page's own first paint.
        val client = mutableClassDefBy(clients.single())
        // The web shell (home, bot and worktree chats) fetches every resource through this
        // client. Font requests are answered first; shell documents get the stylesheet link
        // before their first paint.
        val intercept = client.methods.singleOrNull {
            it.name == "shouldInterceptRequest" && it.parameterTypes == listOf(WEB, REQUEST) &&
                it.returnType == RESPONSE
        } ?: throw PatchException("Orca web shell request handler not found")
        wrap(intercept, 1) { saved -> """
            invoke-static {p2}, $WEB_FONTS->serve($REQUEST)$RESPONSE
            move-result-object v0
            if-eqz v0, :morphe_original
            return-object v0
            :morphe_original
            invoke-virtual {p0, p1, p2}, $saved
            move-result-object v0
            invoke-static {p2, v0}, $WEB_FONTS->rewrite($REQUEST$RESPONSE)$RESPONSE
            move-result-object v0
            return-object v0
        """ }

        val pageInject = "invoke-static {p1}, $WEB_FONTS->inject($WEB)V"
        val finished = client.methods.singleOrNull {
            it.name == "onPageFinished" && it.parameterTypes == listOf(WEB, STRING) && it.returnType == "V"
        } ?: throw PatchException("Orca WebView onPageFinished not found")
        wrap(finished, 0) { saved -> """
            invoke-virtual {p0, p1, p2}, $saved
            $pageInject
            return-void
        """ }
        val commit = client.methods.singleOrNull {
            it.name == "onPageCommitVisible" && it.parameterTypes == listOf(WEB, STRING)
        }
        if (commit != null) {
            if (commit.returnType != "V") throw PatchException("Unsupported Orca onPageCommitVisible")
            wrap(commit, 0) { saved -> """
                invoke-virtual {p0, p1, p2}, $saved
                $pageInject
                return-void
            """ }
        } else {
            // Keep the framework default reachable: a future Orca release may add its own
            // override on an intermediate WebViewClient.
            client.methods.add(newMethod(client.type, "onPageCommitVisible", listOf(WEB, STRING), "V", 3,
                AccessFlags.PUBLIC.value).apply {
                addInstructions(0, """
                    invoke-super {p0, p1, p2}, ${client.superclass}->onPageCommitVisible($WEB$STRING)V
                    $pageInject
                    return-void
                """)
            })
        }
    }
}
