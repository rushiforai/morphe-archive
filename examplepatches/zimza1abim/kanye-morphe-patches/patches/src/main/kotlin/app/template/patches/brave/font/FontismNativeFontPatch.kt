package app.template.patches.brave.font

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.brave.BRAVE_PACKAGE_NAME
import app.template.patches.brave.braveCompatibility
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.io.File

private const val PACKAGE_NAME = BRAVE_PACKAGE_NAME
private const val BOOTSTRAP_CLASS = "Lapp/fontism/extension/brave/BraveFontBootstrap;"
private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
private const val CUSTOM_FONT_ACTIVITY = "app.fontism.extension.brave.BraveFontSettingsActivity"
private const val RESTART_ACTIVITY = "app.fontism.extension.brave.BraveRestartActivity"

private val targetCompatibility = braveCompatibility()

private val nativePayloadPatch = resourcePatch(
    name = "Brave custom font engine",
    description = "Native font engine for custom webpage fonts (ARM64).",
    default = false,
) {
    compatibleWith(targetCompatibility)

    execute {
        // Native libraries stay in the archive instead of being staged to the working directory.
        if (listApkEntries("lib/arm64-v8a/libchrome.so").isEmpty()) {
            throw PatchException("Brave custom fonts require an ARM64 APK with libchrome.so")
        }
        val nativeDirectory = get("lib").resolve("arm64-v8a").also(File::mkdirs)
        val nativeLibraries = listOf("libshadowhook.so", "libfontism_brave_233.so")
        nativeLibraries.forEach { libraryName ->
            val input = object {}.javaClass.classLoader
                .getResourceAsStream(if (libraryName == "libshadowhook.so")
                    "helium/native/arm64-v8a/$libraryName" else "brave/native/arm64-v8a/$libraryName")
                ?: throw PatchException("Missing native arm64 payload: $libraryName")
            input.use { stream ->
                nativeDirectory.resolve(libraryName).outputStream().use(stream::copyTo)
            }
        }

        // Brave declares extractNativeLibs=false, so the loader can only use
        // native libraries stored uncompressed and page-aligned in the APK.
        // Arsclib keeps this metadata beside (not inside) its raw-resource
        // root. Resolve it through that root without depending on internals.
        val uncompressedMetadata = get("../uncompressed-files.json")
        if (!uncompressedMetadata.isFile) {
            throw PatchException("uncompressed-files.json not found in target APK.")
        }
        val metadata = uncompressedMetadata.readText()
        val missingPaths = nativeLibraries
            .map { "lib/arm64-v8a/$it" }
            .filterNot { metadata.contains("\"$it\"") }
        if (missingPaths.isNotEmpty()) {
            val pathsEnd = metadata.lastIndexOf("\n  ]")
            if (pathsEnd < 0) throw PatchException("Invalid uncompressed-files.json")
            uncompressedMetadata.writeText(
                metadata.substring(0, pathsEnd) +
                    missingPaths.joinToString(separator = "", prefix = "") { ",\n    \"$it\"" } +
                    metadata.substring(pathsEnd),
            )
        }
    }
}

@Suppress("unused")
val fontismNativeFontPatch = bytecodePatch(
    name = "Brave custom webpage fonts",
    description = "Renders webpages in your chosen font. Icons and emoji keep theirs. Restart the browser after changing.",
    default = true,
) {
    compatibleWith(targetCompatibility)
    dependsOn(nativePayloadPatch)
    extendWith("extensions/extension.mpe")

    execute {
        // Android 17's Java-less service never executes the Java FD/config and
        // startup hooks below. Route both feature branches to Chromium's existing
        // Java service before the allocator is created (including spare renderers).
        // Do not change sandbox flags, native font logic, or user flag preferences.
        val nativeSelectors = mutableListOf<com.android.tools.smali.dexlib2.iface.Method>()
        classDefForEach { classDef ->
            classDef.methods.filterTo(nativeSelectors) {
                NATIVE_RENDERER_SERVICE in rendererStrings(it)
            }
        }
        if (nativeSelectors.isNotEmpty()) {
            val selectors = nativeSelectors.filter(::isRendererServiceSelector)
            if (selectors.size != 1) {
                throw PatchException("Native renderer service selector must be unique: ${selectors.size}")
            }
            val selector = RendererServiceFingerprint.match(selectors.single()).method
            val sites = selector.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
                val value = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                if (value == NATIVE_RENDERER_SERVICE) index to instruction else null
            }
            if (sites.size != 1) throw PatchException("Native renderer service selection must be unique")
            val (index, instruction) = sites.single()
            val register = (instruction as? OneRegisterInstruction)?.registerA
                ?: throw PatchException("Unsupported renderer service instruction")
            selector.replaceInstruction(index, """const-string v$register, "$JAVA_RENDERER_SERVICE"""")
        }

        // Keep libchrome's RELRO private so the native hook can patch imports.
        // Costs a few MB per child process; behavior is otherwise unchanged.
        SharedRelroConsumerFingerprint.match().method.addInstructions(0, "return-void")

        // The App Zygote produces the shared RELRO and remaps its own copy
        // read-only before forking renderers. Load without spawning it.
        val producer = SharedRelroProducerFingerprint.match().method
        val producerInstructions = producer.implementation!!.instructions.toList()
        // Only the PRODUCE call passes a literal true; the CONSUME call passes false.
        fun literalBefore(index: Int, register: Int): Int? {
            for (i in index - 1 downTo 0) {
                val previous = producerInstructions[i]
                if (previous is OneRegisterInstruction && previous.registerA == register) {
                    return if (previous.opcode == Opcode.CONST_4)
                        (previous as NarrowLiteralInstruction).narrowLiteral else null
                }
            }
            return null
        }
        val spawnCalls = producerInstructions.mapIndexedNotNull { index, instruction ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            if (instruction.opcode == Opcode.INVOKE_STATIC &&
                call?.definingClass == LINKER_JNI_CLASS && call.name == "nativeLoadLibrary" &&
                call.parameterTypes.lastOrNull()?.toString() == "Z" &&
                literalBefore(index, (instruction as FiveRegisterInstruction).registerE) == 1
            ) index to instruction else null
        }
        if (spawnCalls.size != 1) {
            throw PatchException("Chromium RELRO producer load must be unique: ${spawnCalls.size}")
        }
        val (spawnIndex, spawnCall) = spawnCalls.single()
        val spawnRegister = (spawnCall as FiveRegisterInstruction).registerE
        if (spawnRegister > 15 || producerInstructions[spawnIndex + 1]
                .opcode != Opcode.MOVE_RESULT) {
            throw PatchException("Unsupported Chromium RELRO producer call shape")
        }
        // spawnRelroRegion is the literal true in the producer branch; restore it after the call.
        producer.addInstructions(spawnIndex + 2, "const/4 v$spawnRegister, 0x1")
        producer.addInstructions(spawnIndex, "const/4 v$spawnRegister, 0x0")

        val childLaunch = ChildProcessLaunchFingerprint.match().method
        childLaunch.addInstructions(
            0,
            """
                move-object/from16 v0, p3
                invoke-static {v0}, $BOOTSTRAP_CLASS->augmentChildDescriptors(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v0
                check-cast v0, [Lorg/chromium/base/process_launcher/IFileDescriptorInfo;
                move-object/16 p3, v0
                move-object/from16 v0, p2
                invoke-static {v0}, $BOOTSTRAP_CLASS->augmentChildArgs([Ljava/lang/String;)[Ljava/lang/String;
                move-result-object v0
                move-object/16 p2, v0
            """,
        )

        val loaders = mutableListOf<com.android.tools.smali.dexlib2.iface.Method>()
        classDefForEach { classDef ->
            classDef.methods.filterTo(loaders, ::isChromiumLibraryLoader)
        }
        if (loaders.size != 1) {
            throw PatchException("Chromium library loader must be unique: ${loaders.size} candidates")
        }
        val match = LibraryLoaderFingerprint.match(loaders.single())
        val method = match.method
        val loadLibraryCalls = method.implementation!!.instructions
            .mapIndexedNotNull { index, instruction ->
                val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                if (call?.definingClass == "Ljava/lang/System;" && call.name == "loadLibrary" &&
                    call.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;"))
                    index else null
            }
        if (loadLibraryCalls.size != 1) {
            throw PatchException("Ambiguous Chromium library load boundary: ${loadLibraryCalls.size} calls")
        }
        val loadLibraryIndex = loadLibraryCalls.single()

        // Activate immediately after Chromium's load. Prepare at method entry,
        // while p1 still contains ApplicationInfo; Chromium later reuses that
        // parameter register for the native library name.
        method.addInstructions(
            loadLibraryIndex + 1,
            """
                invoke-static {}, $BOOTSTRAP_CLASS->afterChromiumLoad()V
            """,
        )
        method.addInstructions(
            0,
            """
                invoke-static {p1}, $BOOTSTRAP_CLASS->beforeChromiumLoad(Landroid/content/pm/ApplicationInfo;)V
            """,
        )

        // Sandboxed renderers usually inherit libchrome from Chromium's app
        // zygote, so the System.loadLibrary call above is skipped in exactly
        // the processes that paint web pages.  This delegate is the stable
        // child-process boundary: command-line arguments and inherited FDs are
        // already present, while native renderer startup has not happened yet.
        val childStartup = ChildNativeStartupFingerprint.match().method
        childStartup.addInstructions(
            0,
            """
                invoke-static {p1}, $BOOTSTRAP_CLASS->beforeChildNativeStartup(Landroid/content/Context;)V
            """,
        )
        childStartup.implementation!!.instructions
            .mapIndexedNotNull { index, instruction ->
                if (instruction.opcode == Opcode.RETURN_VOID) index else null
            }
            .asReversed()
            .forEach { returnIndex ->
                childStartup.addInstructions(
                    returnIndex,
                    """
                        invoke-static {}, $BOOTSTRAP_CLASS->afterChromiumLoad()V
                    """,
                )
            }

        // Both files must be present in Chromium's official payload or its
        // child cleanup closes them. Their numeric FDs may change during native
        // registration, so the second hook rebinds and rewrites both paths.
        ChildArgumentsFingerprint.match().method.addInstructions(
            0,
            """
                invoke-static {p1}, $BOOTSTRAP_CLASS->attachChildConfigDescriptor(Ljava/lang/Object;)V
            """,
        )

        val descriptorRegistration = ChildDescriptorRegistrationFingerprint.match()
        val nativeRegistrationCalls = descriptorRegistration.method
            .implementation!!.instructions.mapIndexedNotNull { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)
                    ?.reference as? MethodReference ?: return@mapIndexedNotNull null
                if (reference.definingClass == "LJ/N;" &&
                    reference.returnType == "V" &&
                    reference.parameterTypes.map(CharSequence::toString) ==
                    listOf(
                        "I",
                        "Ljava/lang/Object;", "Ljava/lang/Object;",
                        "Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;",
                    )) index else null
            }
        if (nativeRegistrationCalls.size != 1) {
            val nativeCalls = descriptorRegistration.method.implementation!!.instructions
                .mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference) }
                .filter { it.definingClass == "LJ/N;" }
                .joinToString(" | ") { reference ->
                    "${reference.name}(${reference.parameterTypes.joinToString()})${reference.returnType}"
                }
            throw PatchException(
                "Chromium child descriptor registration must be unique " +
                    "(found ${nativeRegistrationCalls.size}): $nativeCalls",
            )
        }
        descriptorRegistration.method.addInstructions(
            nativeRegistrationCalls.single() + 1,
            """
                invoke-static {}, $BOOTSTRAP_CLASS->afterChildDescriptorsRegistered()V
            """,
        )
    }
}

@Suppress("unused")
val customFontSettingsPatch = resourcePatch(
    name = "Brave font picker in settings",
    description = "Adds Settings > Appearance > Custom font. Use a font APK or a TTF, OTF or TTC file.",
    default = false,
) {
    compatibleWith(targetCompatibility)
    dependsOn(fontismNativeFontPatch)

    execute {
        // Patcher 2 decodes resources on request; a directory only lists decoded files.
        decode("res/xml")
        val appearanceCandidates = get("res/xml").listFiles { file ->
            if (!file.isFile || file.extension != "xml") return@listFiles false
            val content = file.readText()
            content.contains("android:key=\"ui_theme\"") &&
                content.contains("android:key=\"toolbar_shortcut\"") &&
                content.contains("android:key=\"bookmark_bar\"")
        }.orEmpty()
        if (appearanceCandidates.size != 1) {
            throw PatchException(
                "Brave Appearance settings resource fingerprint mismatch: " +
                    "candidates=${appearanceCandidates.map(File::getName)}",
            )
        }

        val appearance = appearanceCandidates.single()
        val appearancePath = "res/xml/${appearance.name}"
        document(appearancePath).use { preferences ->
            val alreadyAdded = preferences.getElementsByTagName("Preference").let { nodes ->
                (0 until nodes.length).any { index ->
                    val attributes = nodes.item(index).attributes
                    attributes?.getNamedItemNS(ANDROID_NAMESPACE, "key")?.nodeValue ==
                        "brave_custom_font" ||
                        attributes?.getNamedItem("android:key")?.nodeValue ==
                        "brave_custom_font"
                }
            }
            if (!alreadyAdded) {
                val preference = preferences.createElement("Preference").apply {
                    setAttributeNS(ANDROID_NAMESPACE, "android:key", "brave_custom_font")
                    setAttributeNS(ANDROID_NAMESPACE, "android:title", "Custom font")
                    setAttributeNS(
                        ANDROID_NAMESPACE,
                        "android:summary",
                        "Font for webpages",
                    )
                    setAttributeNS(ANDROID_NAMESPACE, "android:order", "16")
                }
                preference.appendChild(preferences.createElement("intent").apply {
                    setAttributeNS(
                        ANDROID_NAMESPACE,
                        "android:action",
                        "android.intent.action.VIEW",
                    )
                    setAttributeNS(
                        ANDROID_NAMESPACE,
                        "android:targetPackage",
                        PACKAGE_NAME,
                    )
                    setAttributeNS(
                        ANDROID_NAMESPACE,
                        "android:targetClass",
                        CUSTOM_FONT_ACTIVITY,
                    )
                })
                preferences.documentElement.appendChild(preference)
            }
        }

        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement
            val permissionName = "android.permission.QUERY_ALL_PACKAGES"
            val hasPermission = manifest.getElementsByTagName("uses-permission").let { nodes ->
                (0 until nodes.length).any { index ->
                    val attributes = nodes.item(index).attributes
                    attributes?.getNamedItemNS(ANDROID_NAMESPACE, "name")?.nodeValue ==
                        permissionName ||
                        attributes?.getNamedItem("android:name")?.nodeValue == permissionName
                }
            }
            if (!hasPermission) {
                manifest.createElement("uses-permission").also { permission ->
                    permission.setAttributeNS(
                        ANDROID_NAMESPACE,
                        "android:name",
                        permissionName,
                    )
                    root.insertBefore(permission, root.firstChild)
                }
            }

            val application = manifest.getElementsByTagName("application").item(0)
                ?: throw PatchException("Brave application element not found")
            fun ensureActivity(
                className: String,
                theme: String,
                process: String? = null,
            ) {
                val exists = manifest.getElementsByTagName("activity").let { nodes ->
                    (0 until nodes.length).any { index ->
                        val attributes = nodes.item(index).attributes
                        attributes?.getNamedItemNS(ANDROID_NAMESPACE, "name")?.nodeValue ==
                            className ||
                            attributes?.getNamedItem("android:name")?.nodeValue == className
                    }
                }
                if (exists) return
                manifest.createElement("activity").also { activity ->
                    activity.setAttributeNS(
                        ANDROID_NAMESPACE,
                        "android:name",
                        className,
                    )
                    activity.setAttributeNS(
                        ANDROID_NAMESPACE,
                        "android:exported",
                        "false",
                    )
                    activity.setAttributeNS(
                        ANDROID_NAMESPACE,
                        "android:theme",
                        theme,
                    )
                    activity.setAttributeNS(
                        ANDROID_NAMESPACE,
                        "android:excludeFromRecents",
                        "true",
                    )
                    process?.let {
                        activity.setAttributeNS(
                            ANDROID_NAMESPACE,
                            "android:process",
                            it,
                        )
                    }
                    application.appendChild(activity)
                }
            }

            ensureActivity(
                CUSTOM_FONT_ACTIVITY,
                "@android:style/Theme.Material.Light.NoActionBar",
            )
            ensureActivity(
                RESTART_ACTIVITY,
                "@android:style/Theme.Translucent.NoTitleBar",
                ":font_restart",
            )
        }
    }
}
