package app.template.patches.openbot

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.io.ByteArrayInputStream
import java.security.MessageDigest
import java.util.Properties
import java.util.zip.ZipInputStream
import org.w3c.dom.Element

private const val NS = "http://schemas.android.com/apk/res/android"
private const val RUNTIME = "Lapp/fontism/extension/openbot/OpenBotFontInjector;"
private const val FACE = "Landroid/graphics/Typeface;"
private const val TYPEFACE_ARGS = "${FACE}IILjava/lang/String;Landroid/content/res/AssetManager;"
private const val TEXT_PAINT = "Landroid/text/TextPaint;"

// Match Android ABI types, not R8 class names (1.4.11+ flattens library packages).
internal object OpenBotTypefaceFingerprint : Fingerprint(
    returnType = FACE,
    parameters = listOf(FACE, "I", "I", "Ljava/lang/String;", "Landroid/content/res/AssetManager;"),
)

private fun resource(name: String) = object {}.javaClass.classLoader.getResourceAsStream(name)
private fun sha256(bytes: ByteArray) = MessageDigest.getInstance("SHA-256").digest(bytes)
    .joinToString("") { "%02x".format(it.toInt() and 255) }

/** Metadata of every registered adapter version, in index order. */
private fun adapters(): List<Properties> {
    val index = resource("openbot/adapters/index.properties")?.use { Properties().apply { load(it) } }
        ?: throw PatchException("OpenBot adapter index is missing")
    return index.getProperty("versions").orEmpty().split(',').filter { it.isNotBlank() }.map { version ->
        resource("openbot/adapters/$version.properties")?.use { Properties().apply { load(it) } }
            ?: throw PatchException("Missing OpenBot adapter metadata: $version")
    }
}

private val openbotResources = resourcePatch {
    execute {
        val bundle = get("assets/index.android.bundle")
        if (!bundle.isFile) throw PatchException("OpenBot embedded bundle not found")
        // Adapters are matched on the original bundle hash, never on a nearby version.
        val digest = sha256(bundle.readBytes())
        val registered = adapters()
        val metadata = registered.singleOrNull { it.getProperty("originalSha256") == digest }
            ?: throw PatchException(
                "Unsupported OpenBot bundle $digest. Verified versions: " +
                    registered.joinToString { it.getProperty("version") }
            )
        val version = metadata.getProperty("version")
        val adapter = resource("openbot/adapters/$version.bundle")?.use { it.readBytes() }
            ?: throw PatchException("OpenBot $version Appearance adapter is missing")
        if (sha256(adapter) != metadata.getProperty("patchedSha256"))
            throw PatchException("OpenBot $version adapter checksum mismatch")
        val overlay = resource("openbot/adapters/$version.assets.zip")?.use { it.readBytes() }
            ?: throw PatchException("OpenBot $version adapter assets are missing")
        if (sha256(overlay) != metadata.getProperty("assetsSha256"))
            throw PatchException("OpenBot $version adapter assets checksum mismatch")

        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement
            if (root.getAttribute("package") != "run.openbot.mobile")
                throw PatchException("This patch requires run.openbot.mobile")
            val app = manifest.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("OpenBot application not found")
            val permissions = manifest.getElementsByTagName("uses-permission")
            if ((0 until permissions.length).none {
                (permissions.item(it) as Element).getAttributeNS(NS, "name") == "android.permission.QUERY_ALL_PACKAGES"
            }) root.insertBefore(manifest.createElement("uses-permission").apply {
                setAttributeNS(NS, "android:name", "android.permission.QUERY_ALL_PACKAGES")
            }, app)

            if ((0 until app.getElementsByTagName("provider").length).any {
                (app.getElementsByTagName("provider").item(it) as Element).getAttributeNS(NS, "authorities") ==
                    "run.openbot.mobile.morphe.fonts"
            }) throw PatchException("OpenBot font provider already exists")
            app.appendChild(manifest.createElement("provider").apply {
                setAttributeNS(NS, "android:name", "app.fontism.extension.openbot.OpenBotFontProvider")
                setAttributeNS(NS, "android:authorities", "run.openbot.mobile.morphe.fonts")
                setAttributeNS(NS, "android:exported", "false")
                setAttributeNS(NS, "android:grantUriPermissions", "false")
                setAttributeNS(NS, "android:initOrder", "1000")
            })

            // Expo OTA can replace the patched settings bundle with the official one.
            // Use the embedded adapter; preserve all account and chat storage.
            val entries = app.getElementsByTagName("meta-data")
            val enabled = (0 until entries.length).map { entries.item(it) as Element }.singleOrNull {
                it.getAttributeNS(NS, "name") == "expo.modules.updates.ENABLED"
            } ?: manifest.createElement("meta-data").also {
                it.setAttributeNS(NS, "android:name", "expo.modules.updates.ENABLED")
                app.appendChild(it)
            }
            enabled.setAttributeNS(NS, "android:value", "false")
        }
        bundle.writeBytes(adapter)
        ZipInputStream(ByteArrayInputStream(overlay)).use { zip ->
            while (true) {
                val entry = zip.nextEntry ?: break
                if (!entry.isDirectory) {
                    val name = entry.name.removePrefix("./")
                    if (name.split('/').any { it == ".." } || name.startsWith('/') ||
                        !(name.startsWith("assets/www.bundle/") || name.startsWith("res/")))
                        throw PatchException("Invalid OpenBot adapter asset: $name")
                    val target = get(name)
                    target.parentFile.mkdirs()
                    target.outputStream().use { zip.copyTo(it) }
                }
                zip.closeEntry()
            }
        }
        // The DOM pages load this local intercepted stylesheet before first paint.
        val head = Regex("<head(?:\\s[^>]*)?>", RegexOption.IGNORE_CASE)
        var pages = 0
        get("assets/www.bundle").walkTopDown().filter { it.isFile && it.extension == "html" }.forEach { page ->
            val html = page.readText()
            val match = head.find(html) ?: throw PatchException("OpenBot DOM page has no head: ${page.name}")
            page.writeText(html.replaceRange(match.range,
                match.value + "<link id=\"morphe-openbot-font\" rel=\"stylesheet\" href=\"https://morphe-font.invalid/openbot.css\"/>"))
            pages++
        }
        if (pages == 0) throw PatchException("OpenBot DOM pages not found")
    }
}

/** Constructor indices and receiver registers; constructors that copy a paint keep its font. */
private fun Method.defaultTextPaints(): List<Pair<Int, Int>> =
    implementation?.instructions?.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode != Opcode.INVOKE_DIRECT && instruction.opcode != Opcode.INVOKE_DIRECT_RANGE)
            return@mapIndexedNotNull null
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapIndexedNotNull null
        if (call.definingClass != TEXT_PAINT || call.name != "<init>" || call.parameterTypes.any { it != "I" })
            return@mapIndexedNotNull null
        val receiver = when (instruction) {
            is FiveRegisterInstruction -> instruction.registerC
            is RegisterRangeInstruction -> instruction.startRegister
            else -> return@mapIndexedNotNull null
        }
        index to receiver
    }.orEmpty()

@Suppress("unused")
val openbotCustomFontPatch = bytecodePatch(
    name = "OpenBot custom font",
    description = "Follow the system font or choose an installed device font in Settings > Appearance > Font.",
    default = true,
) {
    compatibleWith(OPENBOT_COMPATIBILITY)
    dependsOn(openbotResources)
    extendWith("extensions/openbot.mpe")
    execute {
        val method = OpenBotTypefaceFingerprint.match().method
        if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.implementation == null)
            throw PatchException("Unsupported OpenBot React Native typeface implementation")
        val owner = mutableClassDefBy(method.definingClass)
        val preservedName = "morpheOriginalTypeface"
        if (owner.methods.any { it.name == preservedName }) throw PatchException("OpenBot fonts already patched")
        val original = MutableMethod(method).apply { name = preservedName }
        val wrapper = MutableMethod(ImmutableMethod(
            owner.type, method.name, method.parameters, FACE, method.accessFlags,
            method.annotations, method.hiddenApiRestrictions,
            ImmutableMethodImplementation(6, emptyList(), emptyList(), emptyList()),
        ))
        wrapper.addInstructions(0, """
            invoke-static {p0, p1, p2, p3}, $RUNTIME->resolveTypeface(${FACE}IILjava/lang/String;)$FACE
            move-result-object v0
            if-eqz v0, :original
            return-object v0
            :original
            invoke-static/range {p0 .. p4}, ${owner.type}->$preservedName($TYPEFACE_ARGS)$FACE
            move-result-object v0
            invoke-static {v0, p1, p2, p3}, $RUNTIME->nativeTypeface(${FACE}IILjava/lang/String;)$FACE
            move-result-object v0
            return-object v0
        """)
        owner.methods.remove(method)
        owner.methods.add(original)
        owner.methods.add(wrapper)

        val paintOwners = mutableListOf<String>()
        classDefForEach { cls ->
            if (!cls.type.startsWith("Lapp/fontism/") && cls.methods.any { it.defaultTextPaints().isNotEmpty() })
                paintOwners.add(cls.type)
        }
        var sites = 0
        var fabricSites = 0
        paintOwners.forEach { type ->
            mutableClassDefBy(type).methods.forEach { candidate ->
                candidate.defaultTextPaints().asReversed().forEach { (index, receiver) ->
                    candidate.addInstruction(index + 1,
                        "invoke-static/range {v$receiver .. v$receiver}, $RUNTIME->prime(Landroid/graphics/Paint;)V")
                    sites++
                    if (type == "Lcom/facebook/react/fabric/FabricUIManager;" && candidate.name == "prepareTextLayout")
                        fabricSites++
                }
            }
        }
        if (sites == 0) throw PatchException("OpenBot default text paint construction not found")
        if (fabricSites != 1) throw PatchException("OpenBot Fabric text measurement structure changed")

        // R8 flattens the WebView package too. Its retained logging tag and Android
        // superclass/callback ABI identify the one client without a renamed class.
        val rnClients = mutableListOf<String>()
        val domClients = mutableListOf<String>()
        classDefForEach { cls ->
            if (cls.superclass == "Landroid/webkit/WebViewClient;" && cls.methods.any { candidate ->
                    candidate.name == "onPageFinished" && candidate.parameterTypes ==
                        listOf("Landroid/webkit/WebView;", "Ljava/lang/String;")
                } && cls.methods.any { candidate -> candidate.implementation?.instructions?.any { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == "RNCWebViewClient"
                } == true }) rnClients.add(cls.type)
            if (cls.superclass == "Landroid/webkit/WebViewClient;" && cls.fields.any {
                    it.type == "Lexpo/modules/webview/DomWebView;"
                } && cls.methods.any { it.name == "onPageStarted" }) domClients.add(cls.type)
        }
        if (rnClients.size != 1 || domClients.size != 1)
            throw PatchException("OpenBot WebView structure changed: RN=${rnClients.size}, Expo DOM=${domClients.size}")
        (rnClients + domClients).distinct().forEach { clientType ->
        val client = mutableClassDefBy(clientType)
        val startArgs = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;", "Landroid/graphics/Bitmap;")
        val started = client.methods.singleOrNull { it.name == "onPageStarted" && it.parameterTypes == startArgs }
            ?: throw PatchException("OpenBot WebView page lifecycle not found")
        val oldStarted = "morpheOriginalPageStarted"
        if (started.implementation == null || AccessFlags.STATIC.isSet(started.accessFlags) ||
            client.methods.any { it.name == oldStarted }) throw PatchException("Unsupported OpenBot WebView lifecycle")
        client.methods.remove(started)
        client.methods.add(MutableMethod(started).apply { name = oldStarted })
        val startWrapper = MutableMethod(ImmutableMethod(
            client.type, "onPageStarted", started.parameters, "V", started.accessFlags,
            started.annotations, started.hiddenApiRestrictions,
            ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList()),
        ))
        startWrapper.addInstructions(0, """
            invoke-static {p1, p2}, Lapp/fontism/extension/openbot/OpenBotWebFonts;->started(Landroid/webkit/WebView;Ljava/lang/String;)V
            invoke-virtual {p0, p1, p2, p3}, ${client.type}->$oldStarted(${startArgs.joinToString("")})V
            return-void
        """)
        client.methods.add(startWrapper)
        val args = listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;")
        val existing = client.methods.singleOrNull { it.name == "shouldInterceptRequest" && it.parameterTypes == args }
        val preserved = "morpheOriginalIntercept"
        if (client.methods.any { it.name == preserved }) throw PatchException("OpenBot WebView already patched")
        if (existing != null) {
            if (existing.implementation == null || AccessFlags.STATIC.isSet(existing.accessFlags))
                throw PatchException("Unsupported OpenBot WebView interceptor")
            client.methods.remove(existing)
            client.methods.add(MutableMethod(existing).apply { name = preserved })
        }
        val response = "Landroid/webkit/WebResourceResponse;"
        val fallback = if (existing == null)
            "invoke-super {p0, p1, p2}, ${client.superclass}->shouldInterceptRequest(${args.joinToString("")})$response"
        else "invoke-virtual {p0, p1, p2}, ${client.type}->$preserved(${args.joinToString("")})$response"
        val intercept = MutableMethod(ImmutableMethod(
            client.type, "shouldInterceptRequest", args.map { ImmutableMethodParameter(it, emptySet(), null) },
            response, AccessFlags.PUBLIC.value, emptySet(), emptySet(),
            ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList()),
        ))
        intercept.addInstructions(0, """
            invoke-static {p1, p2}, Lapp/fontism/extension/openbot/OpenBotWebFonts;->intercept(Landroid/webkit/WebView;Landroid/webkit/WebResourceRequest;)$response
            move-result-object v0
            if-eqz v0, :original
            return-object v0
            :original
            $fallback
            move-result-object v0
            return-object v0
        """)
        client.methods.add(intercept)
        }
    }
}
