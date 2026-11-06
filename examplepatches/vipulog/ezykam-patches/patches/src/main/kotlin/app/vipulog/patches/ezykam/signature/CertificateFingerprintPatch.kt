package app.vipulog.patches.ezykam.signature

import app.morphe.patcher.patch.rawResourcePatch
import app.vipulog.patches.ezykam.shared.Constants.COMPATIBILITY_EZYKAM_4_1_4
import app.vipulog.patches.ezykam.signature.Fingerprints.AUTHENTIC_CERTIFICATE_SHA256
import app.vipulog.patches.ezykam.signature.Fingerprints.BL_INSTRUCTION_OFFSET
import app.vipulog.patches.ezykam.signature.Fingerprints.CERTIFICATE_FINGERPRINT_ASCII_LENGTH
import app.vipulog.patches.ezykam.signature.Fingerprints.DIGIT_BUFFER_REGISTER
import app.vipulog.patches.ezykam.signature.Fingerprints.CERTIFICATE_CHECK_PATTERN_HEX
import app.vipulog.patches.ezykam.signature.Fingerprints.ARM64_SECURITY_LIBRARY_PATH
import app.vipulog.patches.ezykam.signature.Fingerprints.SECURITY_LIBRARY_NAME
import java.nio.charset.StandardCharsets

// Standard ELF Identification Header constants (System V ABI)
private const val EI_MAG0 = 0x7F.toByte()
private const val EI_MAG1 = 'E'.code.toByte()
private const val EI_MAG2 = 'L'.code.toByte()
private const val EI_MAG3 = 'F'.code.toByte()
private const val EI_CLASS_OFFSET = 4
private const val ELFCLASS64 = 2
private const val EI_DATA_OFFSET = 5
private const val ELFDATA2LSB = 1
private const val E_MACHINE_OFFSET = 0x12
private const val EM_AARCH64 = 0xB7

// ELF-64 File Header (Elf64_Ehdr) field offsets
private const val E_SHOFF_OFFSET = 0x28 // Section header table file offset (Elf64_Off, 64-bit)
private const val E_SHENTSIZE_OFFSET = 0x3A // Section header entry size (Elf64_Half, 16-bit)
private const val E_SHNUM_OFFSET = 0x3C // Section header entry count (Elf64_Half, 16-bit)
private const val E_SHSTRNDX_OFFSET = 0x3E // Section name string table index (Elf64_Half, 16-bit)

// ELF-64 Section Header (Elf64_Shdr) field offsets
private const val SH_NAME_OFFSET = 0x00 // Section name string index (Elf64_Word, 32-bit)
private const val SH_ADDR_OFFSET = 0x10 // Section virtual address in memory (Elf64_Addr, 64-bit)
private const val SH_OFFSET_OFFSET = 0x18 // Section file offset (Elf64_Off, 64-bit)
private const val SH_SIZE_OFFSET = 0x20 // Section size in bytes (Elf64_Xword, 64-bit)

private fun ByteArray.readUInt16Le(offset: Int): Int {
    require(offset in 0..size - 2) {
        "Offset $offset is out of bounds for reading 16-bit integer (buffer size: $size)"
    }
    return (this[offset].toInt() and 0xFF) or
        ((this[offset + 1].toInt() and 0xFF) shl 8)
}

private fun ByteArray.readUInt32Le(offset: Int): Long {
    require(offset in 0..size - 4) {
        "Offset $offset is out of bounds for reading 32-bit integer (buffer size: $size)"
    }
    val b0 = this[offset].toLong() and 0xFFL
    val b1 = this[offset + 1].toLong() and 0xFFL
    val b2 = this[offset + 2].toLong() and 0xFFL
    val b3 = this[offset + 3].toLong() and 0xFFL
    return b0 or (b1 shl 8) or (b2 shl 16) or (b3 shl 24)
}

private fun ByteArray.readInt64Le(offset: Int): Long {
    require(offset in 0..size - 8) {
        "Offset $offset is out of bounds for reading 64-bit integer (buffer size: $size)"
    }
    val low = readUInt32Le(offset)
    val high = readUInt32Le(offset + 4)
    return low or (high shl 32)
}

private fun ByteArray.writeUInt32Le(offset: Int, value: Int) {
    require(offset in 0..size - 4) {
        "Offset $offset is out of bounds for writing 32-bit integer (buffer size: $size)"
    }
    this[offset] = value.toByte()
    this[offset + 1] = (value ushr 8).toByte()
    this[offset + 2] = (value ushr 16).toByte()
    this[offset + 3] = (value ushr 24).toByte()
}

private fun decodeHex(hex: String): ByteArray {
    require(hex.length % 2 == 0) { "Hex string length must be even: $hex" }
    val result = ByteArray(hex.length / 2)
    for (i in result.indices) {
        val index = i * 2
        result[i] = hex.substring(index, index + 2).toInt(16).toByte()
    }
    return result
}

private fun ByteArray.findAllOccurrences(pattern: ByteArray): List<Int> {
    if (pattern.isEmpty() || pattern.size > size) return emptyList()
    val matches = mutableListOf<Int>()
    val maxStart = size - pattern.size
    for (start in 0..maxStart) {
        var matchesPattern = true
        for (j in pattern.indices) {
            if (this[start + j] != pattern[j]) {
                matchesPattern = false
                break
            }
        }
        if (matchesPattern) {
            matches += start
        }
    }
    return matches
}

private data class Elf64Section(
    val name: String,
    val virtualAddress: Long,
    val fileOffset: Long,
    val size: Long,
)

private fun ByteArray.validateElf64Header() {
    check(size >= 0x40) { "File is too small (${size} bytes) to contain a valid ELF-64 header." }
    check(
        this[0] == EI_MAG0 && this[1] == EI_MAG1 && this[2] == EI_MAG2 && this[3] == EI_MAG3,
    ) { "Invalid ELF identification magic: expected 0x7F 'E' 'L' 'F'." }
    check(this[EI_CLASS_OFFSET].toInt() == ELFCLASS64) {
        "Unsupported ELF class: expected 64-bit architecture (ELFCLASS64)."
    }
    check(this[EI_DATA_OFFSET].toInt() == ELFDATA2LSB) {
        "Unsupported ELF data encoding: expected little-endian (ELFDATA2LSB)."
    }
    val machine = readUInt16Le(E_MACHINE_OFFSET)
    check(machine == EM_AARCH64) {
        "Unsupported ELF machine architecture: expected AArch64 (0x${EM_AARCH64.toString(16)}), found 0x${machine.toString(16)}."
    }
}

private fun ByteArray.findElfSection(sectionName: String): Elf64Section {
    val sectionHeaderOffset = readInt64Le(E_SHOFF_OFFSET)
    val entrySize = readUInt16Le(E_SHENTSIZE_OFFSET)
    val sectionCount = readUInt16Le(E_SHNUM_OFFSET)
    val stringTableIndex = readUInt16Le(E_SHSTRNDX_OFFSET)

    check(sectionHeaderOffset >= 0 && sectionHeaderOffset + sectionCount.toLong() * entrySize <= size) {
        "Section header table extends beyond file boundaries (offset: $sectionHeaderOffset, entries: $sectionCount, size: $size)."
    }
    check(stringTableIndex in 0 until sectionCount) {
        "Invalid section string table index $stringTableIndex (section count: $sectionCount)."
    }

    val stringTableHeaderOffset = (sectionHeaderOffset + stringTableIndex.toLong() * entrySize).toInt()
    val stringTableFileOffset = readInt64Le(stringTableHeaderOffset + SH_OFFSET_OFFSET).toInt()

    check(stringTableFileOffset in 0 until size) {
        "Section string table offset 0x${stringTableFileOffset.toString(16)} is outside file boundaries."
    }

    for (index in 0 until sectionCount) {
        val headerOffset = (sectionHeaderOffset + index.toLong() * entrySize).toInt()
        val nameOffsetWithinStringTable = readUInt32Le(headerOffset + SH_NAME_OFFSET).toInt()
        val nameStart = stringTableFileOffset + nameOffsetWithinStringTable

        check(nameStart in stringTableFileOffset until size) {
            "Section name offset 0x${nameStart.toString(16)} is outside file boundaries."
        }

        var nameEnd = nameStart
        while (nameEnd < size && this[nameEnd] != 0.toByte()) {
            nameEnd++
        }

        val currentSectionName = String(this, nameStart, nameEnd - nameStart, StandardCharsets.US_ASCII)
        if (currentSectionName == sectionName) {
            return Elf64Section(
                name = currentSectionName,
                virtualAddress = readInt64Le(headerOffset + SH_ADDR_OFFSET),
                fileOffset = readInt64Le(headerOffset + SH_OFFSET_OFFSET),
                size = readInt64Le(headerOffset + SH_SIZE_OFFSET),
            )
        }
    }

    error("Required ELF section '$sectionName' was not found in the section table.")
}

/**
 * Encodes an ARM64 `ADRP` (Form PC-relative address to 4KB page) instruction.
 *
 * ARMv8-A opcode specification:
 *   31    30:29    28:24    23:5      4:0
 *  [ 1 ] [immlo]  [10000]  [immhi]   [Rd ]
 *
 * Addressing range is +/- 4GB (+/- 1,048,576 4KB pages relative to PC).
 */
private fun encodeArm64Adrp(destinationRegister: Int, pcAddress: Long, targetAddress: Long): Int {
    require(destinationRegister in 0..31) {
        "Destination register X$destinationRegister is outside valid ARM64 register range (0..31)."
    }

    val pcPage = pcAddress and 0xFFF.inv().toLong()
    val targetPage = targetAddress and 0xFFF.inv().toLong()
    val pageDelta = targetPage - pcPage
    val pageCount = pageDelta shr 12

    require(pageCount in -1048576L..1048575L) {
        "ADRP target address 0x${targetAddress.toString(16)} is outside the +/- 4GB reach of PC 0x${pcAddress.toString(16)}."
    }

    val imm21 = (pageCount and 0x1FFFFF).toInt()
    val immlo = (imm21 and 0x3) shl 29
    val immhi = ((imm21 ushr 2) and 0x7FFFF) shl 5

    return 0x90000000.toInt() or immlo or immhi or destinationRegister
}

/**
 * Encodes an ARM64 64-bit `ADD` immediate instruction: `ADD Xd, Xn, #imm12`
 *
 * ARMv8-A opcode specification:
 *   31   30   29   28:24    23:22    21:10    9:5     4:0
 *  [sf] [ 0] [ 0] [10001]  [shift]  [imm12]  [ Rn]   [ Rd]
 *
 * For 64-bit register addition without shift: sf = 1, shift = 00 -> base opcode 0x91000000.
 */
private fun encodeArm64AddImmediate(destinationRegister: Int, sourceRegister: Int, immediate: Int): Int {
    require(destinationRegister in 0..31) {
        "Destination register X$destinationRegister is outside valid ARM64 register range (0..31)."
    }
    require(sourceRegister in 0..31) {
        "Source register X$sourceRegister is outside valid ARM64 register range (0..31)."
    }
    require(immediate in 0..4095) {
        "Immediate value $immediate exceeds 12-bit unsigned range (0..4095) for ADD immediate instruction."
    }
    return 0x91000000.toInt() or (immediate shl 10) or (sourceRegister shl 5) or destinationRegister
}

/**
 * Locates contiguous zero-byte padding within the `.rodata` section suitable for storing
 * static data.
 *
 * Compilers typically leave null padding at the end of `.rodata` runs or section boundaries
 * to maintain segment and structure alignment. Using this padding avoids creating new ELF
 * sections or modifying segment headers, ensuring full compatibility with Android dynamic linkers.
 */
private fun ByteArray.findRodataPaddingCave(rodata: Elf64Section, requiredBytes: Int, alignment: Int): Int {
    require(requiredBytes > 0) { "Required cave size must be positive: $requiredBytes" }
    require(alignment > 0 && (alignment and (alignment - 1)) == 0) {
        "Alignment must be a positive power of two: $alignment"
    }

    check(rodata.virtualAddress == rodata.fileOffset) {
        ".rodata virtual address (0x${rodata.virtualAddress.toString(16)}) does not match file offset " +
            "(0x${rodata.fileOffset.toString(16)}); 1:1 segment mapping is required for direct file patching."
    }

    val startOffset = rodata.fileOffset.toInt()
    val endOffset = (rodata.fileOffset + rodata.size).toInt()
    var candidateCaveOffset = -1

    var index = startOffset
    while (index < endOffset) {
        if (this[index] != 0.toByte()) {
            index++
            continue
        }

        val runStart = index
        while (index < endOffset && this[index] == 0.toByte()) {
            index++
        }

        val alignedStart = (runStart + (alignment - 1)) and (alignment - 1).inv()
        if (alignedStart + requiredBytes <= index) {
            candidateCaveOffset = alignedStart
        }
    }

    check(candidateCaveOffset >= 0) {
        "Insufficient contiguous zero padding found in .rodata for $requiredBytes bytes with $alignment-byte alignment."
    }

    return candidateCaveOffset
}

private fun patchCertificateFingerprint(libraryEntryPath: String, libraryBytes: ByteArray) {
    libraryBytes.validateElf64Header()

    val textSection = libraryBytes.findElfSection(".text")
    val rodataSection = libraryBytes.findElfSection(".rodata")

    check(textSection.virtualAddress == textSection.fileOffset) {
        ".text virtual address does not match file offset; cannot compute PC-relative relocations."
    }

    val patternBytes = decodeHex(CERTIFICATE_CHECK_PATTERN_HEX)
    val setupMatches = libraryBytes.findAllOccurrences(patternBytes)

    check(setupMatches.size == 1) {
        "Expected exactly one certificate check sequence in $libraryEntryPath, found ${setupMatches.size}. " +
            "Aborting patch to prevent incorrect or ambiguous binary modification."
    }

    val setupOffset = setupMatches.single()
    val textStart = textSection.fileOffset.toInt()
    val textEnd = (textSection.fileOffset + textSection.size).toInt()

    check(setupOffset in textStart until textEnd) {
        "Certificate check sequence at offset 0x${setupOffset.toString(16)} is not located within .text section."
    }

    val caveOffset = libraryBytes.findRodataPaddingCave(
        rodata = rodataSection,
        requiredBytes = CERTIFICATE_FINGERPRINT_ASCII_LENGTH,
        alignment = 8,
    )

    // 1. Replace the first instruction with ADRP pointing X24 to the 4KB page containing the cave
    val adrpInstruction = encodeArm64Adrp(
        destinationRegister = DIGIT_BUFFER_REGISTER,
        pcAddress = setupOffset.toLong(),
        targetAddress = caveOffset.toLong(),
    )
    libraryBytes.writeUInt32Le(setupOffset, adrpInstruction)

    // 2. Replace the BL instruction (at offset +0x0C) with ADD immediate to add the page offset (low 12 bits)
    val pageOffset = caveOffset and 0xFFF
    val addInstruction = encodeArm64AddImmediate(
        destinationRegister = DIGIT_BUFFER_REGISTER,
        sourceRegister = DIGIT_BUFFER_REGISTER,
        immediate = pageOffset,
    )
    libraryBytes.writeUInt32Le(setupOffset + BL_INSTRUCTION_OFFSET, addInstruction)

    // 3. Populate the cave in .rodata with the authentic certificate SHA-256 ASCII characters
    val certificateAsciiBytes = AUTHENTIC_CERTIFICATE_SHA256.toByteArray(StandardCharsets.US_ASCII)
    certificateAsciiBytes.copyInto(
        destination = libraryBytes,
        destinationOffset = caveOffset,
    )
}

@Suppress("unused")
val certificateFingerprintPatch = rawResourcePatch {
    compatibleWith(COMPATIBILITY_EZYKAM_4_1_4)

    execute {
        val matchingLibraries = listApkEntries("lib/")
            .filter { it.substringAfterLast('/') == SECURITY_LIBRARY_NAME }

        check(matchingLibraries == listOf(ARM64_SECURITY_LIBRARY_PATH)) {
            "Expected only $ARM64_SECURITY_LIBRARY_PATH, but found $matchingLibraries. " +
                "This native patch is specifically implemented for the ARM64-v8a build of $SECURITY_LIBRARY_NAME."
        }

        val libraryEntryPath = matchingLibraries.single()
        val libraryFile = get(libraryEntryPath)
        val libraryBytes = libraryFile.readBytes()

        patchCertificateFingerprint(libraryEntryPath, libraryBytes)

        libraryFile.writeBytes(libraryBytes)
    }
}
