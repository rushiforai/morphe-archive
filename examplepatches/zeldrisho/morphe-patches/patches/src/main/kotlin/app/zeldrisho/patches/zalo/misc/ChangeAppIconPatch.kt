package app.zeldrisho.patches.zalo.misc

import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_261002
import java.io.File
import java.nio.ByteBuffer
import java.io.ByteArrayOutputStream
import java.util.zip.CRC32
import java.util.zip.Inflater
import org.w3c.dom.Element

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/**
 * Validates a complete, non-interlaced square PNG of 48–512 pixels per side, at most 1 MiB.
 * Checks chunk CRCs, chunk order, and decompressed scanline lengths and filter bytes.
 *
 * @throws IllegalArgumentException if the PNG is malformed, unsupported, or exceeds these limits.
 */
internal fun validateLauncherPng(bytes: ByteArray) {
    require(bytes.size in 33..1024 * 1024) { "Icon must be a PNG at most 1 MiB" }
    require(bytes.copyOfRange(0, 8).contentEquals(byteArrayOf(-119, 80, 78, 71, 13, 10, 26, 10))) {
        "Icon must be a PNG"
    }
    fun number(offset: Int): Int = ByteBuffer.wrap(bytes, offset, 4).int
    val compressed = ByteArrayOutputStream()
    var offset = 8
    var width = 0
    var height = 0
    var bitsPerPixel = 0
    var indexed = false
    var colorType = -1
    var bitDepth = 0
    var palette = false
    var dataStarted = false
    var dataEnded = false
    var ended = false
    while (offset < bytes.size) {
        require(bytes.size - offset >= 12) { "Truncated PNG chunk" }
        val length = number(offset)
        require(length >= 0 && length <= bytes.size - offset - 12) { "Invalid PNG chunk length" }
        val type = String(bytes, offset + 4, 4, Charsets.US_ASCII)
        require(type.all { it in 'A'..'Z' || it in 'a'..'z' } && type[2] in 'A'..'Z') { "Invalid PNG chunk type" }
        val start = offset + 8
        val crc = CRC32().apply { update(bytes, offset + 4, length + 4) }.value
        require(crc == (number(start + length).toLong() and 0xffffffffL)) { "PNG chunk checksum mismatch" }
        if (offset == 8) require(type == "IHDR") { "PNG IHDR must be first" }
        if (dataStarted && type != "IDAT") dataEnded = true
        when (type) {
            "IHDR" -> {
                require(offset == 8 && length == 13) { "Invalid PNG IHDR" }
                width = number(start)
                height = number(start + 4)
                require(width == height && width in 48..512) { "Icon must be square, 48–512 pixels" }
                val depth = bytes[start + 8].toInt() and 0xff
                val color = bytes[start + 9].toInt() and 0xff
                colorType = color
                bitDepth = depth
                val channels = when (color) {
                    0 -> { require(depth in listOf(1, 2, 4, 8, 16)); 1 }
                    2 -> { require(depth == 8 || depth == 16); 3 }
                    3 -> { require(depth in listOf(1, 2, 4, 8)); indexed = true; 1 }
                    4 -> { require(depth == 8 || depth == 16); 2 }
                    6 -> { require(depth == 8 || depth == 16); 4 }
                    else -> throw IllegalArgumentException("Unsupported PNG color type")
                }
                require(bytes[start + 10].toInt() == 0 && bytes[start + 11].toInt() == 0 &&
                    bytes[start + 12].toInt() == 0) { "PNG must use standard compression and non-interlaced scanlines" }
                bitsPerPixel = channels * depth
            }
            "PLTE" -> {
                require(!palette && !dataStarted && colorType != 0 && colorType != 4 &&
                    length in 3..768 && length % 3 == 0 && (!indexed || length / 3 <= (1 shl bitDepth))
                ) { "Invalid PNG palette" }
                palette = true
            }
            "IDAT" -> {
                require(!dataEnded && (!indexed || palette)) { "Invalid PNG image data order" }
                dataStarted = true
                compressed.write(bytes, start, length)
            }
            "IEND" -> {
                require(length == 0 && dataStarted && start + 4 == bytes.size) { "Invalid PNG end" }
                ended = true
            }
            else -> require(type[0] in 'a'..'z') { "Unsupported PNG critical chunk: $type" }
        }
        offset = start + length + 4
        if (ended) break
    }
    require(ended && bitsPerPixel > 0) { "Incomplete PNG" }
    val rowBytes = ((width.toLong() * bitsPerPixel + 7) / 8).toInt()
    val expected = (rowBytes + 1) * height
    val inflater = Inflater()
    try {
        inflater.setInput(compressed.toByteArray())
        val buffer = ByteArray(8192)
        var count = 0
        while (!inflater.finished()) {
            val read = inflater.inflate(buffer)
            if (read == 0 && inflater.finished()) break
            require(read > 0) { "Incomplete PNG image data" }
            require(count.toLong() + read <= expected) { "PNG image data exceeds dimensions" }
            for (i in 0 until read) {
                if ((count + i) % (rowBytes + 1) == 0) {
                    require((buffer[i].toInt() and 0xff) <= 4) { "Invalid PNG scanline filter" }
                }
            }
            count += read
        }
        require(count == expected && inflater.remaining == 0) { "Invalid PNG image data length" }
    } catch (exception: java.util.zip.DataFormatException) {
        throw IllegalArgumentException("Invalid PNG image data", exception)
    } finally {
        inflater.end()
    }
}

@Suppress("unused")
val changeZaloAppIconPatch = resourcePatch(
    name = "Change Zalo app icon",
    description = "Replaces the launcher icon with a user-supplied PNG.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO_261002)
    val iconPath by stringOption(
        key = "iconPath", title = "PNG icon path",
        description = "Path accessible to the patcher. Use a square, non-interlaced 48–512 px PNG, at most 1 MiB, with padding for adaptive masking.",
        required = true,
    )
    execute {
        val input = File(requireNotNull(iconPath) { "Choose a PNG icon path" })
        require(input.isFile && input.length() <= 1024 * 1024) { "Icon is missing or exceeds 1 MiB" }
        val bytes = input.readBytes()
        validateLauncherPng(bytes)
        resourceFile("res/drawable-nodpi/zeldris_launcher_image.png", false).apply {
            parentFile.mkdirs()
            writeBytes(bytes)
        }
        resourceFile("res/mipmap-nodpi/zeldris_launcher.xml", false).apply {
            parentFile.mkdirs()
            writeText("""
                <bitmap xmlns:android="$ANDROID_NS" android:src="@drawable/zeldris_launcher_image" />
            """.trimIndent())
        }
        resourceFile("res/mipmap-anydpi-v26/zeldris_launcher.xml", false).apply {
            parentFile.mkdirs()
            writeText("""
                <adaptive-icon xmlns:android="$ANDROID_NS">
                    <background android:drawable="#FFFFFFFF" />
                    <foreground android:drawable="@drawable/zeldris_launcher_image" />
                </adaptive-icon>
            """.trimIndent())
        }
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val aliases = application.getElementsByTagName("activity-alias")
            val original = (0 until aliases.length).map { aliases.item(it) as Element }.singleOrNull {
                it.getAttributeNS(ANDROID_NS, "name") == "com.zing.zalo.ui.SplashActivity"
            } ?: error("Zalo launcher alias changed")
            check(original.getAttributeNS(ANDROID_NS, "targetActivity") == "com.zing.zalo.ui.ZaloLauncherActivity") {
                "Zalo launcher target changed"
            }
            val filters = original.getElementsByTagName("intent-filter")
            check(filters.length == 1) { "Zalo launcher intent filters changed" }
            val categories = (filters.item(0) as Element).getElementsByTagName("category")
            check((0 until categories.length).any {
                (categories.item(it) as Element).getAttributeNS(ANDROID_NS, "name") == "android.intent.category.LAUNCHER"
            }) { "Zalo launcher category changed" }
            original.setAttributeNS(ANDROID_NS, "android:icon", "@mipmap/zeldris_launcher")
            original.setAttributeNS(ANDROID_NS, "android:roundIcon", "@mipmap/zeldris_launcher")
            // Keep the old alias for updates where Android persisted it as enabled and the original as disabled.
            val alternate = original.cloneNode(true) as Element
            alternate.setAttributeNS(ANDROID_NS, "android:name", "com.zing.zalo.ui.ZeldrisCustomIcon")
            alternate.setAttributeNS(ANDROID_NS, "android:enabled", "false")
            alternate.setAttributeNS(ANDROID_NS, "android:icon", "@mipmap/zeldris_launcher")
            alternate.setAttributeNS(ANDROID_NS, "android:roundIcon", "@mipmap/zeldris_launcher")
            application.appendChild(alternate)
        }
    }
}
