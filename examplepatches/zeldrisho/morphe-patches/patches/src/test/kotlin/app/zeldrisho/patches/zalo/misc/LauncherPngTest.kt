package app.zeldrisho.patches.zalo.misc

import java.io.ByteArrayOutputStream
import java.io.DataOutputStream
import java.io.File
import java.util.zip.CRC32
import java.util.zip.DeflaterOutputStream
import kotlin.test.Test
import kotlin.test.assertFailsWith

class LauncherPngTest {
    private fun png(width: Int = 48, height: Int = width, filter: Int = 0,
        interlaced: Boolean = false, badImageData: Boolean = false): ByteArray {
        val output = ByteArrayOutputStream()
        val writer = DataOutputStream(output)
        writer.write(byteArrayOf(-119, 80, 78, 71, 13, 10, 26, 10))
        fun chunk(type: String, data: ByteArray) {
            val name = type.toByteArray(Charsets.US_ASCII)
            writer.writeInt(data.size)
            writer.write(name)
            writer.write(data)
            val crc = CRC32().apply { update(name); update(data) }
            writer.writeInt(crc.value.toInt())
        }
        val header = ByteArrayOutputStream()
        DataOutputStream(header).apply {
            writeInt(width); writeInt(height)
            write(byteArrayOf(8, 6, 0, 0, if (interlaced) 1 else 0))
        }
        chunk("IHDR", header.toByteArray())
        val compressed = ByteArrayOutputStream()
        DeflaterOutputStream(compressed).use { data ->
            val row = ByteArray(width * 4 + 1).apply { this[0] = filter.toByte() }
            repeat(height) { data.write(row) }
        }
        chunk("IDAT", if (badImageData) byteArrayOf(1, 2, 3, 4) else compressed.toByteArray())
        chunk("IEND", ByteArray(0))
        return output.toByteArray()
    }

    @Test fun acceptsCompleteSupportedSquarePngs() {
        for (size in listOf(48, 512)) validateLauncherPng(png(size))
    }

    @Test fun acceptsDocumentedExampleIcon() {
        validateLauncherPng(File("../docs/images/example-launcher-icon.png").readBytes())
    }

    @Test fun rejectsInvalidDimensions() {
        assertFailsWith<IllegalArgumentException> { validateLauncherPng(png(47)) }
        assertFailsWith<IllegalArgumentException> { validateLauncherPng(png(48, 49)) }
        assertFailsWith<IllegalArgumentException> { validateLauncherPng(png(513)) }
    }

    @Test fun rejectsHeaderOnlyTruncationAndExcessBytes() {
        val valid = png()
        for (bytes in listOf(ByteArray(0), valid.copyOf(33), valid.copyOf(valid.size - 1),
            valid + byteArrayOf(1), ByteArray(1024 * 1024 + 1))) {
            assertFailsWith<IllegalArgumentException> { validateLauncherPng(bytes) }
        }
    }

    @Test fun rejectsWrongSignatureAndCorruptChunk() {
        assertFailsWith<IllegalArgumentException> { validateLauncherPng(png().apply { this[0] = 0 }) }
        assertFailsWith<IllegalArgumentException> { validateLauncherPng(png().apply { this[16] = 0x7f }) }
        assertFailsWith<IllegalArgumentException> { validateLauncherPng(png().apply { this[15] = 0 }) }
    }

    @Test fun rejectsInvalidFilterAndInterlacedPngs() {
        assertFailsWith<IllegalArgumentException> { validateLauncherPng(png(filter = 5)) }
        assertFailsWith<IllegalArgumentException> { validateLauncherPng(png(interlaced = true)) }
        assertFailsWith<IllegalArgumentException> { validateLauncherPng(png(badImageData = true)) }
    }
}
