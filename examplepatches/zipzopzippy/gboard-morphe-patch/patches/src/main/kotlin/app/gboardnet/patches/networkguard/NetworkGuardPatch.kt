package app.gboardnet.patches.networkguard

import app.gboardnet.patches.shared.Constants.COMPATIBILITY_GBOARD
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.stringsOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import java.util.logging.Logger

internal const val EXTENSION_PACKAGE = "Lapp/gboardnet/extension/"
internal const val GUARD_CLASS = "Lapp/gboardnet/extension/NetworkGuard;"
internal const val HOOKS_CLASS = "Lapp/gboardnet/extension/NetworkGuardHooks;"

/** Default allowlist: what Emoji Kitchen needs. Verify / extend with the in-app request log. */
internal val DEFAULT_RULES = listOf(
    // Google's static CDN: Emoji Kitchen images, dictionary / language model packs, emoji data.
    "*.gstatic.com",
    // Emoji Kitchen combination lookup (Tenor "featured" collection API).
    "tenor.googleapis.com",
    // Gboard Translate.
    "translation.googleapis.com",
    // Offline voice typing speech packs.
    "dl.google.com/android/voice/gboard/",
)

/** Play services actions allowed by default. */
internal val DEFAULT_GMS_RULES = listOf(
    // ML Kit module install, needed by Scan text (text recognition runs on device).
    "com.google.android.gms.chimera.container.moduleinstall.ModuleInstallService.START",
    // Play services' generic service broker; Scan text's availability check goes through it.
    // Logging (clearcut) and remote flags (phenotype) use their own actions and stay blocked.
    "com.google.android.chimera.BoundService.START",
)

@Suppress("unused")
val networkGuardPatch = patch(
    name = "Network guard",
    description = "Blocks all network requests from Gboard except for hosts in an allowlist. " +
        "Adds a 'Network access' screen to Gboard settings to edit the allowlist and view a request log. " +
        "Emoji Kitchen, language packs, translation and offline voice packs are allowed by default.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    extendWith("extensions/extension.mpe")

    val allowedRules by stringsOption(
        key = "allowedRules",
        default = DEFAULT_RULES,
        title = "Default allowlist",
        description = "Rules allowed out of the box (editable later inside Gboard settings). " +
            "Each rule is a host ('example.com'), a wildcard host ('*.example.com'), " +
            "or a host with a path prefix ('example.com/some/path/').",
    )

    val allowedPlayServicesActions by stringsOption(
        key = "allowedPlayServicesActions",
        default = DEFAULT_GMS_RULES,
        title = "Default Play services allowlist",
        description = "Play services actions Gboard may still connect to when Play services hand-offs are blocked. " +
            "A trailing * matches a prefix.",
    )

    val blockPlayServices by booleanOption(
        key = "blockPlayServices",
        default = true,
        title = "Block Play services hand-offs",
        description = "Also refuse Gboard's connections to Google Play services (logging, config sync, ...), " +
            "except for actions allowed in Gboard settings. Play services' own traffic is not affected.",
    )

    val blockByDefault by booleanOption(
        key = "blockByDefault",
        default = true,
        title = "Enable blocking by default",
        description = "If disabled, the guard starts switched off until enabled in Gboard settings.",
    )

    execute {
        injectDefaults(
            allowedRules ?: emptyList(),
            blockByDefault ?: true,
            blockPlayServices ?: true,
            allowedPlayServicesActions ?: emptyList(),
        )
        rewriteNetworkCallSites()
        addSettingsEntry()
    }
}

// region Defaults

private fun injectDefaults(rules: List<String>, enabled: Boolean, blockGms: Boolean, gmsRules: List<String>) {
    val guard = mutableClassDefBy(GUARD_CLASS)
    val enabledLiteral = if (enabled) 1 else 0

    fun returnString(methodName: String, lines: List<String>) {
        val joined = lines.map { it.trim() }.filter { it.isNotEmpty() }.joinToString("\n")
        guard.methods.first { it.name == methodName }.addInstructions(
            0,
            """
                const-string v0, "${joined.toSmaliString()}"
                return-object v0
            """,
        )
    }
    returnString("patchDefaultRules", rules)
    returnString("patchDefaultGmsRules", gmsRules)
    guard.methods.first { it.name == "patchDefaultBlockGms" }.addInstructions(
        0,
        """
            const/4 v0, ${if (blockGms) 1 else 0}
            return v0
        """,
    )
    guard.methods.first { it.name == "patchDefaultEnabled" }.addInstructions(
        0,
        """
            const/4 v0, $enabledLiteral
            return v0
        """,
    )
}

private fun String.toSmaliString(): String = buildString {
    for (c in this@toSmaliString) {
        when {
            c == '\\' -> append("\\\\")
            c == '"' -> append("\\\"")
            c == '\n' -> append("\\n")
            c.code < 0x20 || c.code > 0x7E -> append("\\u%04x".format(c.code))
            else -> append(c)
        }
    }
}

// endregion

// region Call site rewriting

/** A kind of network entry point that is intercepted. */
private enum class Hook(val label: String) {
    URL_OPEN("URL.openConnection/openStream"),
    NETWORK_OPEN("Network.openConnection"),
    NETWORK_DNS("Network.getByName"),
    CRONET("Cronet / HttpEngine request builder"),
    DNS("InetAddress lookup"),
    SOCKET_CONNECT("Socket.connect"),
    SOCKET_FACTORY("SocketFactory.createSocket"),
    GMS_BIND("bindService (Play services)"),
    GMS_UNBIND("unbindService"),
}

/** Framework types whose bindService/unbindService calls are intercepted. */
private val CONTEXT_CLASSES = setOf(
    "Landroid/content/Context;",
    "Landroid/content/ContextWrapper;",
    "Landroid/app/Application;",
    "Landroid/app/Service;",
    "Landroid/app/Activity;",
    "Landroid/inputmethodservice/InputMethodService;",
    "Landroid/inputmethodservice/AbstractInputMethodService;",
)

private const val SERVICE_CONNECTION = "Landroid/content/ServiceConnection;"

private val SOCKET_CLASSES = setOf(
    "Ljava/net/Socket;",
    "Ljavax/net/ssl/SSLSocket;",
    "Ljava/nio/channels/SocketChannel;",
)

private val SOCKET_FACTORY_CLASSES = setOf(
    "Ljavax/net/SocketFactory;",
    "Ljavax/net/ssl/SSLSocketFactory;",
)

private fun isStaticInvoke(opcode: Opcode) =
    opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE

private fun classify(ref: MethodReference, opcode: Opcode): Hook? {
    val owner = ref.definingClass
    val name = ref.name
    val params = ref.parameterTypes.map { it.toString() }
    val isStatic = isStaticInvoke(opcode)

    return when {
        owner == "Ljava/net/URL;" && !isStatic &&
            (name == "openConnection" || name == "openStream") -> Hook.URL_OPEN

        (owner == "Landroid/net/Network;" || owner.startsWith("Lorg/chromium/net/") ||
            owner.startsWith("Landroid/net/http/")) && !isStatic &&
            name == "openConnection" && params.firstOrNull() == "Ljava/net/URL;" -> Hook.NETWORK_OPEN

        owner == "Landroid/net/Network;" && !isStatic &&
            (name == "getByName" || name == "getAllByName") &&
            params == listOf("Ljava/lang/String;") -> Hook.NETWORK_DNS

        // Cronet API, and Android 14+'s platform Cronet (android.net.http.HttpEngine) which Gboard uses.
        (owner.startsWith("Lorg/chromium/net/") || owner.startsWith("Landroid/net/http/")) && !isStatic &&
            (name == "newUrlRequestBuilder" || name == "newBidirectionalStreamBuilder") &&
            params.firstOrNull() == "Ljava/lang/String;" -> Hook.CRONET

        owner == "Ljava/net/InetAddress;" && isStatic &&
            (name == "getByName" || name == "getAllByName") &&
            params == listOf("Ljava/lang/String;") -> Hook.DNS

        owner in SOCKET_CLASSES && !isStatic && name == "connect" &&
            params.firstOrNull() == "Ljava/net/SocketAddress;" -> Hook.SOCKET_CONNECT

        owner in SOCKET_FACTORY_CLASSES && !isStatic && name == "createSocket" &&
            params.size >= 2 && params[1] == "I" &&
            (params[0] == "Ljava/lang/String;" || params[0] == "Ljava/net/InetAddress;") -> Hook.SOCKET_FACTORY

        owner in CONTEXT_CLASSES && !isStatic &&
            (name == "bindService" || name == "bindIsolatedService" || name == "bindServiceAsUser") &&
            ref.returnType == "Z" && params.firstOrNull() == "Landroid/content/Intent;" &&
            SERVICE_CONNECTION in params -> Hook.GMS_BIND

        owner in CONTEXT_CLASSES && !isStatic && name == "unbindService" &&
            params == listOf(SERVICE_CONNECTION) && ref.returnType == "V" -> Hook.GMS_UNBIND

        else -> null
    }
}

/**
 * Smali run inside the generated wrapper before the original call.
 * p0 is the receiver for instance calls, else the first argument.
 */
private fun guardSmali(hook: Hook, ref: MethodReference): String = when (hook) {
    Hook.URL_OPEN ->
        "invoke-static { p0 }, $GUARD_CLASS->checkUrl(Ljava/net/URL;)V"

    Hook.NETWORK_OPEN ->
        "invoke-static { p1 }, $GUARD_CLASS->checkUrl(Ljava/net/URL;)V"

    Hook.NETWORK_DNS ->
        "invoke-static { p1 }, $GUARD_CLASS->checkHost(Ljava/lang/String;)V"

    // Never throw on the Cronet path: swap the URL for a dead local one so the
    // request fails through the normal onFailed() callback.
    Hook.CRONET ->
        """
            invoke-static { p1 }, $GUARD_CLASS->filterCronetUrl(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p1
        """

    Hook.DNS ->
        "invoke-static { p0 }, $GUARD_CLASS->checkHost(Ljava/lang/String;)V"

    Hook.SOCKET_CONNECT ->
        "invoke-static { p1 }, $GUARD_CLASS->checkSocketAddress(Ljava/net/SocketAddress;)V"

    Hook.SOCKET_FACTORY ->
        if (ref.parameterTypes[0].toString() == "Ljava/lang/String;") {
            "invoke-static { p1 }, $GUARD_CLASS->checkHost(Ljava/lang/String;)V"
        } else {
            "invoke-static { p1 }, $GUARD_CLASS->checkInetAddress(Ljava/net/InetAddress;)V"
        }

    // These two skip the original call instead, see wrapperBody().
    Hook.GMS_BIND, Hook.GMS_UNBIND -> ""
}

/** Full wrapper body. [call] is the original invoke, [returnSmali] moves and returns its result. */
private fun wrapperBody(hook: Hook, ref: MethodReference, call: String, returnSmali: String): String =
    when (hook) {
        // Refuse binds to Play services: return false like a missing service would.
        // The connection is remembered so the matching unbindService() is skipped, not crashed.
        Hook.GMS_BIND -> {
            val connectionRegister = 1 + ref.parameterTypes.map { it.toString() }.indexOf(SERVICE_CONNECTION)
            """
                invoke-static { p1, p${connectionRegister} }, $GUARD_CLASS->allowServiceBind(Landroid/content/Intent;Ljava/lang/Object;)Z
                move-result v0
                if-nez v0, :allow
                const/4 v0, 0x0
                return v0
                :allow
                $call
                $returnSmali
            """
        }

        Hook.GMS_UNBIND ->
            """
                invoke-static { p1 }, $GUARD_CLASS->allowUnbind(Ljava/lang/Object;)Z
                move-result v0
                if-nez v0, :allow
                return-void
                :allow
                $call
                $returnSmali
            """

        else ->
            """
                ${guardSmali(hook, ref)}
                $call
                $returnSmali
            """
    }

private class CallSite(
    val classDef: ClassDef,
    val method: Method,
    val index: Int,
    val hook: Hook,
    val ref: MethodReference,
    val opcode: Opcode,
)

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE,
    Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE,
)

private fun rewriteNetworkCallSites() {
    val logger = Logger.getLogger("NetworkGuardPatch")

    // 1. Find call sites using only the immutable classes (cheap, no class is copied).
    val sites = mutableListOf<CallSite>()
    var cronetPresent = false
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
        if (classDef.type.startsWith("Lorg/chromium/net/")) cronetPresent = true
        for (method in classDef.methods) {
            val impl = method.implementation ?: continue
            impl.instructions.forEachIndexed { index, instruction ->
                val opcode = instruction.opcode
                if (opcode !in INVOKE_OPCODES) return@forEachIndexed
                val ref = (instruction as ReferenceInstruction).reference as? MethodReference
                    ?: return@forEachIndexed
                if (ref.definingClass.startsWith("Lorg/chromium/net/")) cronetPresent = true
                val hook = classify(ref, opcode) ?: return@forEachIndexed
                sites += CallSite(classDef, method, index, hook, ref, opcode)
            }
        }
    }


    // 2. One static wrapper per distinct (invoke kind, method reference).
    val hooksClass = mutableClassDefBy(HOOKS_CLASS)
    val wrappers = HashMap<String, ImmutableMethodReference>()

    fun wrapperFor(site: CallSite): ImmutableMethodReference {
        val kind = invokeKind(site.opcode)
        return wrappers.getOrPut(kind + " " + site.ref) {
            createWrapper(hooksClass, "w" + wrappers.size, kind, site.hook, site.ref)
        }
    }

    // 3. Replace every call site with invoke-static of its wrapper, keeping the same registers
    //    (the receiver simply becomes the wrapper's first parameter).
    sites.groupBy { it.classDef.type }.values.forEach { classSites ->
        val mutableClass = mutableClassDefBy(classSites.first().classDef)
        classSites.groupBy { it.method }.forEach { (method, methodSites) ->
            val params = method.parameterTypes.map(CharSequence::toString)
            val mutableMethod = mutableClass.methods.first {
                it.name == method.name &&
                    it.returnType == method.returnType &&
                    it.parameterTypes.map(CharSequence::toString) == params
            }
            methodSites.forEach { site ->
                val original = mutableMethod.implementation!!.instructions[site.index]
                val originalRef = (original as ReferenceInstruction).reference as MethodReference
                check(originalRef == site.ref) {
                    "Instruction mismatch in ${site.classDef.type}->${method.name}"
                }
                mutableMethod.replaceInstruction(site.index, staticInvokeOf(original, wrapperFor(site)))
            }
        }
    }

    // 4. Cronet implementation classes have JNI natives, so their names survive obfuscation even
    // if the public API is renamed. Filter the URL in their constructors as a second line.
    val cronetImplHooks = hookCronetImplConstructors()
    if (cronetImplHooks > 0) cronetPresent = true

    val cronetApiHooks = sites.count { it.hook == Hook.CRONET }
    if (cronetPresent && cronetApiHooks == 0 && cronetImplHooks == 0) {
        throw PatchException(
            "Network guard: this Gboard version contains Cronet but no Cronet request call site " +
                "could be hooked (renamed API?). Patching would leave Gboard's main network stack unguarded.",
        )
    }
    if (sites.none { it.hook == Hook.URL_OPEN || it.hook == Hook.NETWORK_OPEN } && cronetApiHooks == 0 &&
        cronetImplHooks == 0
    ) {
        throw PatchException(
            "Network guard found no URL or Cronet request call sites. " +
                "This Gboard version is not supported (patching would silently do nothing).",
        )
    }
    logger.info("Network guard: hooked $cronetImplHooks Cronet implementation constructors")

    Hook.entries.forEach { hook ->
        logger.info("Network guard: hooked ${sites.count { it.hook == hook }} ${hook.label} call sites")
    }
    logger.info("Network guard: ${sites.size} call sites rewritten using ${wrappers.size} wrappers")
}

private val CRONET_IMPL_CLASSES = listOf(
    "Lorg/chromium/net/impl/CronetUrlRequest;",
    "Lorg/chromium/net/impl/CronetBidirectionalStream;",
)

private fun hookCronetImplConstructors(): Int {
    var count = 0
    CRONET_IMPL_CLASSES.forEach { type ->
        val mutableClass = mutableClassDefByOrNull(type) ?: return@forEach
        mutableClass.methods.filter { it.name == "<init>" && it.implementation != null }.forEach { ctor ->
            val types = ctor.parameterTypes.map(CharSequence::toString)
            val index = types.indexOf("Ljava/lang/String;")
            if (index < 0) return@forEach
            val register = 1 + types.take(index).sumOf(::wordsOf)
            // /range form: the p register may map above v15 in large constructors.
            ctor.addInstructions(
                0,
                """
                    invoke-static/range { p$register .. p$register }, $GUARD_CLASS->filterCronetUrl(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object p$register
                """,
            )
            count++
        }
    }
    return count
}

private fun invokeKind(opcode: Opcode) = when (opcode) {
    Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE -> "invoke-virtual/range"
    Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE -> "invoke-interface/range"
    Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE -> "invoke-static/range"
    else -> error("Unexpected opcode $opcode")
}

private fun staticInvokeOf(original: Instruction, target: ImmutableMethodReference): BuilderInstruction = when (original) {
    is Instruction35c -> BuilderInstruction35c(
        Opcode.INVOKE_STATIC,
        original.registerCount,
        original.registerC,
        original.registerD,
        original.registerE,
        original.registerF,
        original.registerG,
        target,
    )

    is Instruction3rc -> BuilderInstruction3rc(
        Opcode.INVOKE_STATIC_RANGE,
        original.startRegister,
        original.registerCount,
        target,
    )

    else -> error("Unexpected instruction format ${original.opcode}")
}

private fun wordsOf(type: String) = if (type == "J" || type == "D") 2 else 1

private fun createWrapper(
    hooksClass: MutableClass,
    name: String,
    kind: String,
    hook: Hook,
    ref: MethodReference,
): ImmutableMethodReference {
    val isStatic = kind == "invoke-static/range"
    val paramTypes = buildList {
        if (!isStatic) add(ref.definingClass)
        ref.parameterTypes.forEach { add(it.toString()) }
    }
    val paramWords = paramTypes.sumOf(::wordsOf)
    val returnType = ref.returnType

    val target = "${ref.definingClass}->${ref.name}(${ref.parameterTypes.joinToString("")})$returnType"
    val returnSmali = when {
        returnType == "V" -> "return-void"
        returnType == "J" || returnType == "D" -> "move-result-wide v0\nreturn-wide v0"
        returnType.startsWith("L") || returnType.startsWith("[") -> "move-result-object v0\nreturn-object v0"
        else -> "move-result v0\nreturn v0"
    }

    val method = ImmutableMethod(
        HOOKS_CLASS,
        name,
        paramTypes.map { ImmutableMethodParameter(it, null, null) },
        returnType,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        null,
        null,
        // 2 locals (enough for a wide result) + the parameters.
        MutableMethodImplementation(2 + paramWords),
    ).toMutable()

    method.addInstructions(
        0,
        wrapperBody(hook, ref, "$kind { p0 .. p${paramWords - 1} }, $target", returnSmali),
    )
    hooksClass.methods.add(method)

    return ImmutableMethodReference(HOOKS_CLASS, name, paramTypes, returnType)
}

// endregion
