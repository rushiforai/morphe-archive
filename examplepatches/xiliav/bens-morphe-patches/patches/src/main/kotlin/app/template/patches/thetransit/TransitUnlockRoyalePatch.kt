package app.template.patches.thetransit

import app.morphe.patcher.apk.ApkSignatureScheme
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.template.patches.shared.Constants.TRANSIT_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.util.logging.Logger

@Suppress("unused")
val transitUnlockRoyalePatch = bytecodePatch(
    name = "Unlock Royale",
    description = "Enables Transit's local Royale membership checks.",
    default = true
) {
    compatibleWith(TRANSIT_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    val mapsApiKey by stringOption(
        key = "mapsApiKey",
        default = "",
        title = "Google Maps API key (optional)",
        description = "Leave blank to keep Transit's original Maps key. Supply your own compatible key only if needed.",
        validator = { it.isNullOrBlank() || it.matches(Regex("AIza[A-Za-z0-9_-]{35}")) }
    )

    execute {
        // Read the input APK's signer before Morphe re-signs the patched output.
        val certificate = runCatching {
            selectTransitCertificate(packageMetadata.signingCertificates.mapValues { (_, certificates) ->
                certificates.map { it.encoded }
            })
        }.getOrNull()
        if (certificate != null) {
            val getter = mutableClassDefBy(TRANSIT_HELPER_CLASS).methods.single {
                it.name == "originalCertificateHex" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
            }
            setTransitCertificate(getter, certificate)
            Logger.getLogger("Transit").info("Using the original APK signing certificate for Maps compatibility.")
        } else {
            Logger.getLogger("Transit").warning("Original APK certificate unavailable; using the upstream Transit certificate fallback.")
        }

        RoyaleIsActiveFingerprint.method.apply {
            removeInstructions(0, instructions.count())
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }

        FetchSubscriptionStatusFingerprint.let { fp ->
            // Match the literal, native call, and its result together. Never assume v2.
            forceRoyaleFeatureFlag(fp.method, fp.instructionMatches.last().index)
        }

        // attachBaseContext runs before ContentProviders can cache Maps credentials.
        // Revisit context caches at onCreate as a fallback after Application attachment.
        val key = mapsApiKey.orEmpty().trim()
        initializeTransitBeforeProviders(TransitAppOnCreateFingerprint.classDef, key)
        initializeTransitHelper(TransitAppOnCreateFingerprint.method, key)
    }
}

internal fun selectTransitCertificate(certificates: Map<ApkSignatureScheme, List<ByteArray>>): ByteArray? =
    listOf(ApkSignatureScheme.V31, ApkSignatureScheme.V3, ApkSignatureScheme.V2)
        .firstNotNullOfOrNull { scheme -> certificates[scheme]?.firstOrNull() }

internal fun setTransitCertificate(method: MutableMethod, certificate: ByteArray) {
    if (certificate.isEmpty() || method.returnType != "Ljava/lang/String;" || method.parameterTypes.isNotEmpty()) {
        throw PatchException("Transit certificate getter has an unexpected signature or empty certificate.")
    }
    val hex = certificate.joinToString("") { "%02x".format(it.toInt() and 0xff) }
    method.removeInstructions(0, method.instructions.count())
    method.addInstructions(0, "const-string v0, \"$hex\"\nreturn-object v0")
}

internal fun forceRoyaleFeatureFlag(method: MutableMethod, resultIndex: Int) {
    val result = method.getInstruction(resultIndex)
    if (result.opcode != Opcode.MOVE_RESULT) {
        throw PatchException("Transit Royale feature check does not return a primitive result.")
    }
    val register = (result as OneRegisterInstruction).registerA
    // const/16 encodes any 8-bit result register, including v16 and above.
    method.replaceInstruction(resultIndex, "const/16 v$register, 0x1")
}

internal fun initializeTransitHelper(method: MutableMethod, mapsApiKey: String, index: Int = 0) {
    val implementation = method.implementation
        ?: throw PatchException("Transit application initializer has no implementation.")
    val parameterRegisters = 1 + method.parameterTypes.sumOf {
        if (it.toString() == "J" || it.toString() == "D") 2 else 1
    }
    if (AccessFlags.STATIC.isSet(method.accessFlags) || implementation.registerCount - parameterRegisters < 2) {
        throw PatchException("Transit application initializer needs two local registers.")
    }
    val key = mapsApiKey.replace("\\", "\\\\").replace("\"", "\\\"")
        .replace("\n", "\\n").replace("\r", "\\r")
    method.addInstructions(
        index,
        "move-object/from16 v0, p0\n" +
            "const-string v1, \"$key\"\n" +
            "invoke-static {v0, v1}, $TRANSIT_HELPER_CLASS->init(Landroid/content/Context;Ljava/lang/String;)V"
    )
}

internal fun initializeTransitBeforeProviders(app: MutableClass, mapsApiKey: String) {
    if (app.superclass != "Landroid/app/Application;" || app.methods.any { it.name == "attachBaseContext" }) {
        throw PatchException("Transit Application attachment differs from the verified 6.3.7 layout.")
    }
    val method = ImmutableMethod(
        app.type,
        "attachBaseContext",
        listOf(ImmutableMethodParameter("Landroid/content/Context;", null, null)),
        "V",
        AccessFlags.PROTECTED.value,
        null,
        null,
        MutableMethodImplementation(4)
    ).toMutable()
    method.addInstructions(
        0,
        "invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V\n" +
            "return-void"
    )
    // Only access Context after the superclass has attached it.
    initializeTransitHelper(method, mapsApiKey, index = 1)
    app.methods.add(method)
}
