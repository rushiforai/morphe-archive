package dev.vortexnode.sbrowserx.patches.appearance

import app.morphe.patcher.patch.resourcePatch
import dev.vortexnode.sbrowserx.shared.Constants.COMPATIBILITY_SBROWSER
import java.io.RandomAccessFile

/**
 * Unique 64-byte ARM64 prologue + entry body of blink::DarkModeImageClassifier::Classify
 * in Samsung Internet's libterrace.so (arm64-v8a).
 *
 * Both paint-side (DarkModeFilter::ApplyFilterToImage) and raster-side
 * (GpuImageDecodeCache -> DarkModeFilter::GenerateImageFilter) call this single function.
 */
private val CLASSIFY_SIGNATURE_HEX =
    "3f2303d5ff8306d1ea9300fde923136d" +
        "fd7b14a9fc6f15a9fa6716a9f85f17a9" +
        "f65718a9f44f19a9fd03059148244169" +
        "4a2c406908010acb29010bcb2a0108aa"

/**
 * ARM64 replacement (8 bytes, overwriting paciasp + sub sp):
 *   mov w0, #0   (00 00 80 52) -> DarkModeResult::kDoNotApplyFilter
 *   ret          (c0 03 5f d6)
 * Preserves PAC integrity since paciasp is never executed.
 */
private val RETURN_DO_NOT_INVERT_ARM64 = byteArrayOf(
    0x00.toByte(), 0x00.toByte(), 0x80.toByte(), 0x52.toByte(),
    0xC0.toByte(), 0x03.toByte(), 0x5F.toByte(), 0xD6.toByte(),
)

private fun hexToBytes(hex: String): ByteArray {
    val len = hex.length / 2
    val out = ByteArray(len)
    for (i in 0 until len) {
        out[i] = hex.substring(i * 2, i * 2 + 2).toInt(16).toByte()
    }
    return out
}

/**
 * Streams the 180+ MB libterrace.so in 4 MB chunks (low memory footprint on Android devices)
 * and returns all byte offsets where [pattern] occurs.
 */
private fun findPatternStreaming(raf: RandomAccessFile, pattern: ByteArray): List<Long> {
    val chunkSize = 4 * 1024 * 1024
    val overlap = pattern.size - 1
    val buffer = ByteArray(chunkSize + overlap)
    val hits = mutableListOf<Long>()

    raf.seek(0L)
    var filePos = 0L
    var carried = 0

    while (true) {
        val read = raf.read(buffer, carried, chunkSize)
        if (read <= 0) break
        val total = carried + read
        val limit = total - pattern.size
        var i = 0
        while (i <= limit) {
            if (buffer[i] == pattern[0]) {
                var matched = true
                for (j in 1 until pattern.size) {
                    if (buffer[i + j] != pattern[j]) {
                        matched = false
                        break
                    }
                }
                if (matched) {
                    hits.add(filePos - carried + i)
                }
            }
            i++
        }
        filePos += read
        if (total >= overlap) {
            System.arraycopy(buffer, total - overlap, buffer, 0, overlap)
            carried = overlap
        } else {
            carried = total
        }
    }
    return hits
}

@Suppress("unused")
val nativeDarkModeIconGuardPatch = resourcePatch(
    name = "Dark Mode: Preserve Icons & Logos",
    description = "Prevents small icons, logos, badges, and avatars from being color-inverted when Dark Mode or AMOLED mode is enabled.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SBROWSER)

    execute {
        val libFile = get("lib/arm64-v8a/libterrace.so")
        if (!libFile.exists() || libFile.length() == 0L) {
            return@execute
        }

        val signature = hexToBytes(CLASSIFY_SIGNATURE_HEX)
        RandomAccessFile(libFile, "rw").use { raf ->
            val hits = findPatternStreaming(raf, signature)
            if (hits.size == 1) {
                raf.seek(hits[0])
                raf.write(RETURN_DO_NOT_INVERT_ARM64)
            } else if (hits.isEmpty()) {
                // Already patched or newer libterrace.so layout — skip safely without breaking APK build
                return@use
            } else {
                error("Ambiguous DarkModeImageClassifier::Classify signature in libterrace.so (${hits.size} matches)")
            }
        }
    }
}
