package app.zeldrisho.patches.zalo.native

import app.morphe.patcher.patch.deleteResource
import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO
import java.io.RandomAccessFile

private const val LIBRARY_PATH = "lib/arm64-v8a/libnative_utils.so"
private const val INIT_BRANCH_OFFSET = 0x2812cL
private val ORIGINAL_INIT_BRANCH = byteArrayOf(0x00, 0x01, 0x00, 0x36)

private const val CONFIG_CALL_OFFSET = 0x28160L
private val ORIGINAL_CONFIG_CALL = byteArrayOf(0xa9.toByte(), 0x10, 0x00, 0x94.toByte())

// CallStaticVoidMethodV through JNIEnv, inside the helper reached by 0x2c404.
private const val EXIT_CALL_OFFSET = 0x2c4ecL
private val ORIGINAL_EXIT_CALL = byteArrayOf(0x00, 0x01, 0x3f, 0xd6.toByte())

// Experimental target: 26.11.01 is advertised but not fully device-qualified.
private const val INIT_BRANCH_OFFSET_261101 = 0x26964L
private const val CONFIG_CALL_OFFSET_261101 = 0x26998L
private val ORIGINAL_CONFIG_CALL_261101 = byteArrayOf(0x72, 0x10, 0x00, 0x94.toByte())
private const val EXIT_CALL_OFFSET_261101 = 0x2ac48L
private val NOP = byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte())
private const val HEX_RADIX = 16

/** Returns entries under `lib/` outside `lib/arm64-v8a/`, including directories but excluding `lib/` itself. */
internal fun nonArm64NativeEntries(entries: Iterable<String>): List<String> =
    entries.filter { it.startsWith("lib/") && it != "lib/" && !it.startsWith("lib/arm64-v8a/") }

private val keepArm64NativeLibraries = resourcePatch {
    compatibleWith(COMPATIBILITY_ZALO)
    execute {
        val libraries = listApkEntries("lib/")
        check(LIBRARY_PATH in libraries) { "Validated arm64 native library is missing" }
        nonArm64NativeEntries(libraries).forEach { deleteResource(it) }
    }
}

/**
 * Forces the successful native cryptographic initialization path while
 * suppressing the JNI CallStaticVoidMethodV that dispatches
 * java/lang/System.exit(I)V.
 *
 * The byte signatures are pinned to the arm64 native library shipped by the advertised targets
 * (26.08.01 and 26.10.02). Every instruction site is checked before mutation, so a changed native
 * binary fails closed; re-verify a new target before adding it to the compatibility list.
 */
@Suppress("unused")
val bypassZaloNativeStartupTamperPatch = rawResourcePatch(
    name = "Bypass native startup tamper check",
    description = "Allows the re-signed app to start on the supported arm64 Zalo build; removes other native ABIs.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)
    dependsOn(keepArm64NativeLibraries)

    execute {
        patchNativeLibrary(get(LIBRARY_PATH, true), packageMetadata.versionName == "26.11.01")
    }
}

/** Validates every pinned site before mutating the native library. */
internal fun patchNativeLibrary(library: java.io.File, version261101: Boolean = false) {
    val initOffset = if (version261101) INIT_BRANCH_OFFSET_261101 else INIT_BRANCH_OFFSET
    val configOffset = if (version261101) CONFIG_CALL_OFFSET_261101 else CONFIG_CALL_OFFSET
    val configBytes = if (version261101) ORIGINAL_CONFIG_CALL_261101 else ORIGINAL_CONFIG_CALL
    val exitOffset = if (version261101) EXIT_CALL_OFFSET_261101 else EXIT_CALL_OFFSET
    RandomAccessFile(library, "rw").use { file ->
        fun readAt(offset: Long, expected: ByteArray, label: String) {
            file.seek(offset)
            val actual = ByteArray(expected.size)
            file.readFully(actual)
            check(actual.contentEquals(expected)) {
                "Unexpected $label bytes at 0x${offset.toString(HEX_RADIX)}"
            }
        }

        readAt(initOffset, ORIGINAL_INIT_BRANCH, "initialization-branch")
        readAt(configOffset, configBytes, "config-call")
        readAt(exitOffset, ORIGINAL_EXIT_CALL, "JNI exit-call")

        file.seek(initOffset)
        file.write(NOP)
        file.seek(exitOffset)
        file.write(NOP)
    }
}
