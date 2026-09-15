package com.zeldrisho.patches.zalo.native

import java.io.File
import java.io.RandomAccessFile
import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNotEquals
import kotlin.test.assertTrue

class BypassNativeStartupTamperPatchTest {
    @Test
    fun patchesOnlyTheValidatedNativeSites() {
        val file = File.createTempFile("zalo-native", ".so")
        try {
            RandomAccessFile(file, "rw").use { it.setLength(0x2c4f0) }
            RandomAccessFile(file, "rw").use { handle ->
                handle.seek(0x2812c)
                handle.write(byteArrayOf(0x00, 0x01, 0x00, 0x36))
                handle.seek(0x28160)
                handle.write(byteArrayOf(0xa9.toByte(), 0x10, 0x00, 0x94.toByte()))
                handle.seek(0x2c4ec)
                handle.write(byteArrayOf(0x00, 0x01, 0x3f, 0xd6.toByte()))
            }

            patchNativeLibrary(file)

            RandomAccessFile(file, "r").use { handle ->
                val init = ByteArray(4)
                handle.seek(0x2812c)
                handle.readFully(init)
                assertContentEquals(byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte()), init)
                val exit = ByteArray(4)
                handle.seek(0x2c4ec)
                handle.readFully(exit)
                assertContentEquals(byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte()), exit)
                val config = ByteArray(4)
                handle.seek(0x28160)
                handle.readFully(config)
                assertContentEquals(byteArrayOf(0xa9.toByte(), 0x10, 0x00, 0x94.toByte()), config)
            }
        } finally {
            assertTrue(file.delete())
        }
    }

    @Test
    fun rejectsChangedInputBeforeWritingEitherPatch() {
        val file = File.createTempFile("zalo-native", ".so")
        try {
            RandomAccessFile(file, "rw").use { it.setLength(0x2c4f0) }
            assertFailsWith<IllegalStateException> { patchNativeLibrary(file) }
            RandomAccessFile(file, "r").use { handle ->
                handle.seek(0x2812c)
                assertNotEquals(-1, handle.read())
            }
        } finally {
            assertTrue(file.delete())
        }
    }
}
