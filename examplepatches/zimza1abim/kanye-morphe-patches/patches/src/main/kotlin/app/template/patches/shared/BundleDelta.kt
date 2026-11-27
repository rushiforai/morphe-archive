package app.template.patches.shared

import app.morphe.patcher.patch.PatchException
import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.security.MessageDigest
import java.util.Properties
import java.util.zip.Inflater

/*
 * WDLT v1 reader. scripts/delta/BundleDelta.java writes the format:
 *   "WDLT" | u8 1 | u64 oldSize | u64 newSize | 32B oldSha256 | 32B newSha256
 *   then three blocks, each u32 length + deflate data: control, diff, extra.
 * control holds bsdiff 4.x triples (addLen, copyLen, seek), 8 bytes each,
 * little-endian magnitude with the sign in the top bit.
 */
private val MAGIC = byteArrayOf('W'.code.toByte(), 'D'.code.toByte(), 'L'.code.toByte(), 'T'.code.toByte())
private const val HEADER = 4 + 1 + 8 + 8 + 32 + 32
private const val MAX_FILE = 256 * 1024 * 1024

internal fun sha256Hex(bytes: ByteArray): String = MessageDigest.getInstance("SHA-256").digest(bytes)
    .joinToString("") { "%02x".format(it.toInt() and 255) }

private fun resource(name: String) = object {}.javaClass.classLoader.getResourceAsStream(name)

/** Rebuilds the adapter from the APK's own bundle. Fails on any other original. */
internal fun applyBundleDelta(original: ByteArray, delta: ByteArray): ByteArray {
    fun fail(reason: String): Nothing = throw PatchException("Adapter delta: $reason")
    if (delta.size < HEADER + 12) fail("truncated")
    if (!delta.copyOfRange(0, 4).contentEquals(MAGIC)) fail("not a WDLT file")
    if (delta[4].toInt() != 1) fail("unsupported version ${delta[4]}")
    val header = ByteBuffer.wrap(delta, 5, 16).order(ByteOrder.LITTLE_ENDIAN)
    val oldSize = header.long
    val newSize = header.long
    if (oldSize != original.size.toLong() || newSize < 0 || newSize > MAX_FILE) fail("size does not match this bundle")
    val digest = MessageDigest.getInstance("SHA-256")
    if (!digest.digest(original).contentEquals(delta.copyOfRange(21, 53))) fail("made for a different bundle")
    val newHash = delta.copyOfRange(53, 85)

    var cursor = HEADER
    fun block(cap: Long): ByteArray {
        if (cursor + 4 > delta.size) fail("truncated")
        val length = ByteBuffer.wrap(delta, cursor, 4).order(ByteOrder.LITTLE_ENDIAN).int
        if (length < 0 || cursor + 4 + length > delta.size) fail("corrupt block length")
        val inflater = Inflater()
        try {
            inflater.setInput(delta, cursor + 4, length)
            val out = ByteArrayOutputStream()
            val buf = ByteArray(65536)
            while (!inflater.finished()) {
                if (inflater.needsInput()) fail("truncated block")
                val n = inflater.inflate(buf)
                if (n == 0 && !inflater.finished()) fail("corrupt block")
                if (out.size().toLong() + n > cap) fail("block too large")
                out.write(buf, 0, n)
            }
            if (inflater.remaining != 0) fail("trailing block data")
            cursor += 4 + length
            return out.toByteArray()
        } catch (e: java.util.zip.DataFormatException) {
            fail("corrupt block")
        } finally {
            inflater.end()
        }
    }
    val control = block(minOf(newSize * 24 + 24, MAX_FILE.toLong()))
    val diff = block(newSize)
    val extra = block(newSize)
    if (cursor != delta.size) fail("trailing bytes")
    if (control.size % 24 != 0) fail("corrupt control block")

    fun offtin(at: Int): Long {
        var value = (control[at + 7].toLong() and 0x7f)
        for (i in 6 downTo 0) value = value * 256 + (control[at + i].toLong() and 0xff)
        return if (control[at + 7].toInt() and 0x80 != 0) -value else value
    }

    val out = ByteArray(newSize.toInt())
    var ctrl = 0
    var diffAt = 0
    var extraAt = 0
    var newPos = 0
    var oldPos = 0L
    while (newPos < out.size) {
        if (ctrl + 24 > control.size) fail("control block ended early")
        val add = offtin(ctrl)
        val copy = offtin(ctrl + 8)
        val seek = offtin(ctrl + 16)
        ctrl += 24
        if (add < 0 || copy < 0 || add > out.size - newPos || copy > out.size - newPos - add) fail("corrupt control block")
        if (diffAt + add > diff.size || extraAt + copy > extra.size) fail("data block ended early")
        for (i in 0 until add.toInt()) {
            val at = oldPos + i
            var value = diff[diffAt + i].toInt() and 0xff
            if (at >= 0 && at < original.size) value += original[at.toInt()].toInt() and 0xff
            out[newPos + i] = value.toByte()
        }
        newPos += add.toInt()
        diffAt += add.toInt()
        oldPos += add
        System.arraycopy(extra, extraAt, out, newPos, copy.toInt())
        newPos += copy.toInt()
        extraAt += copy.toInt()
        oldPos += seek
    }
    if (ctrl != control.size || diffAt != diff.size || extraAt != extra.size) fail("unused block data")
    if (!digest.digest(out).contentEquals(newHash)) fail("result hash mismatch")
    return out
}

/**
 * The rebuilt JavaScript adapter for [version] under [prefix] (for example
 * "joplin/adapters"). A `<version>.bdelta` is applied to [original], the APK's own
 * bundle; a full `<version>.bundle` is read as is. Either result must match the
 * adapter's `patchedSha256`.
 */
internal fun loadAdapter(prefix: String, version: String, metadata: Properties, original: ByteArray): ByteArray {
    val delta = resource("$prefix/$version.bdelta")?.use { it.readBytes() }
    val adapter = if (delta != null) {
        if (sha256Hex(delta) != metadata.getProperty("deltaSha256"))
            throw PatchException("Adapter delta checksum mismatch: $prefix/$version")
        applyBundleDelta(original, delta)
    } else {
        resource("$prefix/$version.bundle")?.use { it.readBytes() }
            ?: throw PatchException("Missing adapter $prefix/$version")
    }
    if (sha256Hex(adapter) != metadata.getProperty("patchedSha256"))
        throw PatchException("Adapter checksum mismatch: $prefix/$version")
    return adapter
}
