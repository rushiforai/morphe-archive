package app.template.patches.shared

import app.morphe.patcher.patch.PatchException

/**
 * A minimal reader for ELF64 little endian shared libraries (AArch64).
 *
 * Patches use it to work with what a library declares about itself instead of
 * hardcoded file offsets, so they keep working when a new release shuffles code
 * around:
 *
 * - [symbolOrNull] and [symbolsContaining] find a function by its mangled name,
 *   which stays the same as long as the C++ API does not change,
 * - [pltStubs] and [findPltStub] find the PLT stub of an imported function, so
 *   rewritten code can call into the runtime (for example a `QVariant`
 *   constructor) without knowing where the linker placed anything,
 * - [instructions] and [branchesTo] describe what a function does, which is what
 *   patches verify before replacing code, instead of matching exact bytes,
 * - [calledFunctions], [codeReferences] and [stringAddressOrNull] follow a patch
 *   into code that nothing exports: which functions a call reaches, and which
 *   data a function uses,
 * - [offsetOf] converts a virtual address into a file offset.
 *
 * Unsupported or malformed libraries fail with a [PatchException] instead of
 * being patched blindly. This is the [NativeLibrary] implementation for 64 bit
 * Arm; see [ElfArm] for the 32 bit one.
 */
internal class Elf64(private val bytes: ByteArray) : NativeLibrary<Elf64.Symbol> {

    /** An entry of the dynamic symbol table. */
    internal class Symbol(
        override val name: String,
        override val address: Long,
        override val size: Long,
        /** Index in `.dynsym`, which is what relocation tables refer to. */
        val index: Int,
        /** `st_info` symbol type, [TYPE_FUNCTION] for code. */
        override val type: Int,
    ) : NativeLibrary.Symbol {
        /** Whether the symbol is code, as opposed to data or a section. */
        override val isFunction: Boolean get() = type == TYPE_FUNCTION || type == TYPE_INDIRECT_FUNCTION
    }

    /** One AArch64 instruction, at the virtual address it is mapped to. */
    internal class Instruction(
        val address: Long,
        val word: Int,
    )

    private class Section(
        var name: String,
        val type: Long,
        /** Virtual address the section is mapped at. */
        val address: Long,
        /** File offset the section starts at. */
        val offset: Int,
        val size: Int,
        val entrySize: Int,
        /** Section flags, [SHF_EXECINSTR] marks code. */
        val flags: Long,
    ) {
        val endAddress get() = address + size
        val endOffset get() = offset + size
    }

    private val sections: List<Section> = readSections()
    private val sectionsByName: Map<String, Section> = sections.associateBy { it.name }
    private val symbolsByName: Map<String, Symbol> by lazy { readSymbols() }

    /** The dynamic symbol named [name], or null when the library has no such symbol. */
    override fun symbolOrNull(name: String): Symbol? = symbolsByName[name]

    /**
     * Symbols whose name contains [text], which finds an anchor again after a
     * release changed the signature around it but kept the API name.
     */
    override fun symbolsContaining(text: String): List<Symbol> =
        symbolsByName.filterKeys { it.contains(text) }.values.toList()

    /**
     * Every imported function: its name mapped to the address of the PLT stub
     * that calls it. Tail calling such a stub is how patched code reads an
     * imported function without knowing where the linker placed it.
     */
    override val pltStubs: Map<String, Long> by lazy { readPltStubsByName() }

    /**
     * Address of the PLT stub that calls [name].
     *
     * @throws PatchException If the symbol is not imported, or has no PLT entry.
     */
    fun findPltStub(name: String): Long = pltStubs[name]
        ?: throw PatchException("Native library has no PLT stub for \"$name\"")

    private fun readPltStubsByName(): Map<String, Long> {
        val slots = readGotSlots()
        val stubs = readPltStubs()
        val result = LinkedHashMap<String, Long>()
        symbolsByName.forEach { (name, symbol) ->
            val slot = slots[symbol.index] ?: return@forEach
            stubs[slot]?.let { result[name] = it }
        }
        return result
    }

    /** File offset of the data mapped at the virtual [address]. */
    fun offsetOf(address: Long): Int =
        (sectionOf(address) ?: throw PatchException("Virtual address 0x${address.toString(16)} belongs to no section"))
            .let { it.offset + (address - it.address).toInt() }

    /**
     * File offset of the code at the virtual [address].
     *
     * Patches rewrite through this instead of [offsetOf], so a symbol that no
     * longer points into executable code is never written over.
     */
    override fun codeOffsetOf(address: Long): Int {
        val section = codeSectionOf(address)
        return section.offset + (address - section.address).toInt()
    }

    /**
     * How many bytes the instruction at the code address [address] is encoded
     * in. AArch64 instructions are always 4 bytes wide.
     */
    override fun instructionSizeAt(address: Long): Int {
        codeSectionOf(address)
        return 4
    }

    /** The instruction words the function [symbol] is made of. */
    fun instructions(symbol: Symbol, maxWords: Int = 1024): IntArray {
        val offset = offsetOf(symbol.address)
        val words = if (symbol.size >= 4) {
            (symbol.size / 4).coerceAtMost(maxWords.toLong()).toInt()
        } else {
            maxWords
        }
        return IntArray(words) { u32(offset + it * 4).toInt() }
    }

    /**
     * The instructions the code starting at the address [from] is made of,
     * looking at most [byteCount] bytes ahead and never past the end of the
     * executable section.
     *
     * This is how a patch follows a function that has no symbol size, such as
     * the anonymous function that registers the extended data pack.
     */
    internal fun instructionsAt(from: Long, byteCount: Int): List<Instruction> {
        val section = codeSectionOf(from)
        val start = section.offset + (from - section.address).toInt()
        val end = minOf(start + byteCount, section.endOffset)

        val result = ArrayList<Instruction>()
        var offset = start
        while (offset + 4 <= end) {
            result += Instruction(section.address + (offset - section.offset), u32(offset).toInt())
            offset += 4
        }
        return result
    }

    /** The target of the `b` or `bl` instruction [word] placed at [at], or null when it is neither. */
    internal fun branchTarget(at: Long, word: Int): Long? {
        val opcode = word and BRANCH_MASK
        if (opcode != BRANCH && opcode != BRANCH_LINK) return null
        return at + branchDisplacement(word) * 4L
    }

    /**
     * The target of a conditional AArch64 branch, or null when [word] is not
     * one. This covers `b.<cond>`, `cbz`/`cbnz` and `tbz`/`tbnz`, including the
     * stack canary test the data pack function ends through.
     */
    internal fun conditionalBranchTarget(at: Long, word: Int): Long? {
        // `b.<cond>`: a 19 bit signed word offset, with a condition that is not
        // always (the always form is the plain `b` above).
        if (word and 0xFF000010.toInt() == 0x54000000) {
            return at + signExtend((word ushr 5) and 0x7FFFF, 19) * 4L
        }

        val opcode = word and 0x7F000000
        // `cbz`/`cbnz`: the same 19 bit signed word offset.
        if (opcode == 0x34000000 || opcode == 0x35000000) {
            return at + signExtend((word ushr 5) and 0x7FFFF, 19) * 4L
        }
        // `tbz`/`tbnz`: a 14 bit signed word offset whose top bit is bit 31.
        if (opcode == 0x36000000 || opcode == 0x37000000) {
            val immediate = ((word ushr 31) shl 14) or ((word ushr 5) and 0x3FFF)
            return at + signExtend(immediate, 15) * 4L
        }
        return null
    }

    /** Whether [word] is an unconditional `b`. */
    internal fun isUnconditionalBranch(word: Int): Boolean = word and BRANCH_MASK == BRANCH

    /** Whether [word] is a `bl`. */
    internal fun isCall(word: Int): Boolean = word and BRANCH_MASK == BRANCH_LINK

    /** Whether [word] is a `ret` (including `ret xN`). */
    internal fun isReturn(word: Int): Boolean = word and 0xFFFFFC1F.toInt() == 0xD65F0000.toInt()

    /**
     * Whether [word] is a branch that tests the 32 bit register `w0`, which is
     * how the pack function checks the status the Play call returned.
     */
    internal fun isResultCheck(word: Int): Boolean {
        val opcode = word and 0x7F000000
        if (opcode != 0x34000000 && opcode != 0x35000000 &&
            opcode != 0x36000000 && opcode != 0x37000000
        ) {
            return false
        }
        return word and REGISTER_MASK == 0
    }

    /** [value] read as a signed [bits] bit number. */
    private fun signExtend(value: Int, bits: Int): Int {
        val sign = 1 shl (bits - 1)
        return if (value and sign != 0) value - (sign shl 1) else value
    }

    /**
     * Whether the body of [symbol] branches (`b` or `bl`) to an address in
     * [targets].
     *
     * Patches use this to prove what a function does before rewriting it. A
     * function that answers with a `QVariant`, for example, has to call one of
     * its constructors, and that call is what makes replacing its entry with a
     * `QVariant` construction of the patch's own an ABI compatible change.
     */
    override fun branchesTo(symbol: Symbol, targets: Set<Long>): Boolean {
        val words = instructions(symbol)
        for (index in words.indices) {
            val word = words[index]
            val opcode = word and BRANCH_MASK
            if (opcode != BRANCH && opcode != BRANCH_LINK) continue
            if (symbol.address + index * 4L + branchDisplacement(word) * 4L in targets) return true
        }
        return false
    }

    /**
     * The addresses the `bl` instructions of the function [symbol] call.
     *
     * Patches use this to follow the work a function hands to another one, which
     * is how code that nothing exports is found: the function that registers the
     * extended data pack, for example, is only ever reached as a call made by a
     * function the library does export.
     */
    override fun calledFunctions(symbol: Symbol): List<Long> {
        val words = instructions(symbol)
        val result = ArrayList<Long>()
        for (index in words.indices) {
            val word = words[index]
            if (word and BRANCH_MASK != BRANCH_LINK) continue
            result += symbol.address + index * 4L + branchDisplacement(word) * 4L
        }
        return result
    }

    /**
     * The addresses the `bl` instructions in the code starting at the address
     * [from] call, looking at most [byteCount] bytes ahead.
     */
    override fun calledFunctions(from: Long, byteCount: Int): List<Long> {
        val result = ArrayList<Long>()
        forEachInstruction(from, byteCount) { address, word ->
            if (word and BRANCH_MASK == BRANCH_LINK) {
                result += address + branchDisplacement(word) * 4L
            }
        }
        return result
    }

    /**
     * Whether the code starting at the address [from] builds [address] with an
     * `adrp`/`add` pair, within at most [byteCount] bytes.
     *
     * That pair is how AArch64 code names a piece of data, so this is how a
     * patch sees which data a function uses without depending on where the
     * linker placed anything.
     */
    override fun codeReferences(from: Long, address: Long, byteCount: Int): Boolean {
        val words = ArrayList<Int>()
        forEachInstruction(from, byteCount) { _, word -> words += word }

        for (index in words.indices) {
            val word = words[index]
            if (word and ADRP_MASK != ADRP_PATTERN) continue

            // The two instructions do not have to be adjacent: the data address
            // is often built a few instructions before it is used.
            val page = pageOfAdrp(from + index * 4L, word)
            val register = word and REGISTER_MASK
            for (ahead in 1..3) {
                val next = words.getOrNull(index + ahead) ?: break
                if (addedAddress(page, register, next) == address) return true
            }
        }
        return false
    }

    /**
     * The address of the NUL terminated string [text] in the library's loaded
     * data, or null when the library does not hold that exact string.
     */
    override fun stringAddressOrNull(text: String): Long? {
        val needle = "\u0000$text\u0000".toByteArray(Charsets.ISO_8859_1)
        var from = 0
        while (from <= bytes.size - needle.size) {
            val found = indexOf(needle, from) ?: return null
            // The string starts after the NUL that terminates the one before it.
            addressOfDataOffset(found + 1)?.let { return it }
            from = found + 1
        }
        return null
    }

    /** Whether [address] is executable code the patch may read or rewrite. */
    override fun isCode(address: Long): Boolean =
        sectionOf(address)?.let { it.flags and SHF_EXECINSTR != 0L } == true

    /** The section named [name], or null when the library has no such section. */
    private fun section(name: String): Section? = sectionsByName[name]

    /** The section holding the virtual [address], or null when none does. */
    private fun sectionOf(address: Long): Section? = sections.firstOrNull {
        it.type != SHT_NOBITS && it.size > 0 && address >= it.address && address < it.endAddress
    }

    /**
     * The section holding the code at the virtual [address].
     *
     * @throws PatchException If the address is not inside executable code, so a
     *   symbol that no longer points at code is never read or written as one.
     */
    private fun codeSectionOf(address: Long): Section {
        val section = sectionOf(address)
            ?: throw PatchException("Virtual address 0x${address.toString(16)} belongs to no section")
        if (section.flags and SHF_EXECINSTR == 0L) {
            throw PatchException(
                "Virtual address 0x${address.toString(16)} is not executable code " +
                    "(section ${section.name})"
            )
        }

        return section
    }

    /** Calls [action] with the address and word of every code instruction starting at [from]. */
    private inline fun forEachInstruction(from: Long, byteCount: Int, action: (Long, Int) -> Unit) {
        val section = codeSectionOf(from)
        val start = section.offset + (from - section.address).toInt()
        val end = minOf(start + byteCount, section.endOffset)

        var offset = start
        while (offset + 4 <= end) {
            action(from + (offset - start), u32(offset).toInt())
            offset += 4
        }
    }

    /** The first offset [needle] appears at or after [from], or null when it is absent. */
    private fun indexOf(needle: ByteArray, from: Int): Int? {
        var start = from
        while (start <= bytes.size - needle.size) {
            var index = 0
            while (index < needle.size && bytes[start + index] == needle[index]) index++
            if (index == needle.size) return start
            start++
        }
        return null
    }

    /** The address the file [offset] holds, when it is mapped, allocated data. */
    private fun addressOfDataOffset(offset: Int): Long? {
        val section = sections.firstOrNull {
            it.type != SHT_NOBITS && it.flags and SHF_ALLOC != 0L &&
                offset >= it.offset && offset < it.endOffset
        } ?: return null
        return section.address + (offset - section.offset)
    }

    private fun readSections(): List<Section> {
        checkFileHeader()

        val tableOffset = u64(0x28)
        if (tableOffset == 0L) throw PatchException("Native library has no section headers")

        val entrySize = u16(0x3A).takeIf { it >= SECTION_HEADER_SIZE } ?: SECTION_HEADER_SIZE
        var count = u16(0x3C)
        // Extended numbering stores the real count in the size field of section 0.
        if (count == 0) count = u64(tableOffset.toInt() + 0x20).toInt()
        if (count <= 0) throw PatchException("Native library has no section headers")

        val nameTableIndex = u16(0x3E)
        val nameOffsets = IntArray(count)
        val parsed = ArrayList<Section>(count)
        for (index in 0 until count) {
            val header = (tableOffset + index.toLong() * entrySize).toInt()
            ensure(header, SECTION_HEADER_SIZE)
            nameOffsets[index] = u32(header).toInt()
            parsed += Section(
                name = "",
                type = u32(header + 4),
                address = u64(header + 0x10),
                offset = u64(header + 0x18).toInt(),
                size = u64(header + 0x20).toInt(),
                entrySize = u64(header + 0x38).toInt(),
                flags = u64(header + 8),
            )
        }

        val nameTable = parsed.getOrNull(nameTableIndex)
            ?: throw PatchException("Native library has no section name table")
        parsed.forEachIndexed { index, section ->
            section.name = cString(nameTable.offset + nameOffsets[index])
        }

        return parsed
    }

    private fun readSymbols(): Map<String, Symbol> {
        val symbols = section(".dynsym") ?: throw PatchException("Native library has no .dynsym section")
        val names = section(".dynstr") ?: throw PatchException("Native library has no .dynstr section")
        val entrySize = symbols.entrySize.takeIf { it > 0 } ?: SYMBOL_SIZE

        val result = LinkedHashMap<String, Symbol>()
        var index = 0
        var entry = symbols.offset
        while (entry + entrySize <= symbols.endOffset) {
            val nameOffset = u32(entry).toInt()
            if (nameOffset != 0) {
                val name = cString(names.offset + nameOffset)
                result[name] = Symbol(
                    name = name,
                    address = u64(entry + 8),
                    size = u64(entry + 16),
                    index = index,
                    type = u8(entry + 4) and 0xF,
                )
            }
            index++
            entry += entrySize
        }

        return result
    }

    /** GOT slot backing each symbol, from the `R_AARCH64_JUMP_SLOT` entries of `.rela.plt`. */
    private fun readGotSlots(): Map<Int, Long> {
        val relocations = section(".rela.plt") ?: return emptyMap()
        val entrySize = relocations.entrySize.takeIf { it > 0 } ?: RELOCATION_SIZE

        val result = HashMap<Int, Long>()
        var entry = relocations.offset
        while (entry + entrySize <= relocations.endOffset) {
            val info = u64(entry + 8)
            if ((info and 0xFFFFFFFFL).toInt() == R_AARCH64_JUMP_SLOT) {
                result[(info ushr 32).toInt()] = u64(entry)
            }
            entry += entrySize
        }

        return result
    }

    private fun readPltStubs(): Map<Long, Long> {
        val plt = section(".plt") ?: section(".plt.sec") ?: return emptyMap()

        val result = HashMap<Long, Long>()
        var entry = plt.offset
        while (entry + PLT_ENTRY_SIZE <= plt.endOffset) {
            val stub = plt.address + (entry - plt.offset)
            decodePltStub(entry, stub)?.let { result[it] = stub }
            entry += PLT_ENTRY_SIZE
        }

        return result
    }

    /**
     * Decodes `adrp x16, <page>; ldr x17, [x16, <offset>]; br x17` and returns the
     * GOT slot it loads, or null for anything else in `.plt` (the header entry,
     * or a stub that was not emitted in this shape).
     *
     * The `add x16, x16, <offset>` that often sits between the first two
     * instructions only feeds the lazy resolver: the `ldr` already carries the
     * complete address, so it is deliberately ignored.
     */
    private fun decodePltStub(offset: Int, stub: Long): Long? {
        val adrp = u32(offset).toInt()
        val load = u32(offset + 4).toInt()
        val branch = u32(offset + 12).toInt()

        if ((adrp and ADRP_MASK) != ADRP_PATTERN || (adrp and REGISTER_MASK) != REGISTER_X16) return null
        if ((load and LOAD_MASK) != LOAD_PATTERN || (load and REGISTER_MASK) != REGISTER_X17) return null
        if (((load ushr 5) and REGISTER_MASK) != REGISTER_X16) return null
        if (branch != BRANCH_X17) return null

        // adrp addresses its page, the load adds the byte offset within it.
        val page = pageOfAdrp(stub, adrp)
        val displacement = ((load ushr 10) and 0xFFF).toLong() * 8L

        return page + displacement
    }

    /** The signed instruction offset a `b` or `bl` word branches by. */
    private fun branchDisplacement(word: Int): Int {
        var immediate = word and BRANCH_IMMEDIATE_MASK
        if (immediate and BRANCH_IMMEDIATE_SIGN != 0) immediate -= BRANCH_IMMEDIATE_RANGE
        return immediate
    }

    /**
     * The page an `adrp` [word] at the instruction address [at] addresses.
     *
     * adrp immediates are a signed 21 bit page number split into two fields.
     */
    private fun pageOfAdrp(at: Long, word: Int): Long {
        val low = (word ushr 29) and 0x3
        var immediate = (((word ushr 5) and 0x7FFFF) shl 2) or low
        if ((immediate and (1 shl 20)) != 0) immediate -= 1 shl 21

        return ((at ushr 12) shl 12) + (immediate.toLong() shl 12)
    }

    /**
     * The address an `add <register>, <register>, #imm` in [word] builds on
     * [page], or null when [word] is something else.
     */
    private fun addedAddress(page: Long, register: Int, word: Int): Long? {
        if (word and ADD_MASK != ADD_PATTERN) return null
        if (word and REGISTER_MASK != register) return null
        if ((word ushr 5) and REGISTER_MASK != register) return null
        // A set `sh` shifts the immediate by 12 bits, which loaded data is never
        // named with.
        if ((word ushr 22) and 0x3 != 0) return null

        return page + ((word ushr 10) and 0xFFF)
    }

    private fun checkFileHeader() {
        if (bytes.size < ELF_HEADER_SIZE) {
            throw PatchException("Native library is too small to be an ELF file (${bytes.size} bytes)")
        }
        if (bytes[0] != 0x7F.toByte() || bytes[1] != 'E'.code.toByte() ||
            bytes[2] != 'L'.code.toByte() || bytes[3] != 'F'.code.toByte()
        ) {
            throw PatchException("File is not an ELF library")
        }
        if (bytes[4].toInt() != ELF_CLASS_64) {
            throw PatchException("Native library is not 64 bit (ELF class ${bytes[4].toInt()})")
        }
        if (bytes[5].toInt() != ELF_DATA_LSB) {
            throw PatchException("Native library is not little endian")
        }
    }

    private fun ensure(offset: Int, length: Int) {
        if (offset < 0 || length < 0 || offset > bytes.size - length) {
            throw PatchException("Native library is truncated: read $length bytes at $offset of ${bytes.size}")
        }
    }

    private fun u8(offset: Int): Int {
        ensure(offset, 1)
        return bytes[offset].toInt() and 0xFF
    }

    private fun u16(offset: Int): Int {
        ensure(offset, 2)
        return (bytes[offset].toInt() and 0xFF) or ((bytes[offset + 1].toInt() and 0xFF) shl 8)
    }

    private fun u32(offset: Int): Long {
        ensure(offset, 4)
        return u16(offset).toLong() or (u16(offset + 2).toLong() shl 16)
    }

    private fun u64(offset: Int): Long {
        ensure(offset, 8)
        var value = 0L
        for (byte in 7 downTo 0) value = (value shl 8) or (bytes[offset + byte].toLong() and 0xFFL)
        return value
    }

    private fun cString(offset: Int): String {
        var end = offset
        while (true) {
            ensure(end, 1)
            if (bytes[end] == 0.toByte()) break
            end++
        }
        return String(bytes, offset, end - offset, Charsets.UTF_8)
    }

    private companion object {
        const val ELF_HEADER_SIZE = 0x40
        const val SECTION_HEADER_SIZE = 0x40
        const val SYMBOL_SIZE = 24
        const val RELOCATION_SIZE = 24
        const val PLT_ENTRY_SIZE = 16

        const val ELF_CLASS_64 = 2
        const val ELF_DATA_LSB = 1

        /** Section type of a section that occupies no bytes in the file. */
        const val SHT_NOBITS = 8L

        /** Section flag of a section holding code. */
        const val SHF_EXECINSTR = 0x4L

        /** Section flag of a section loaded into the process. */
        const val SHF_ALLOC = 0x2L

        const val R_AARCH64_JUMP_SLOT = 1026

        /** `st_info` symbol types that mean "code". */
        const val TYPE_FUNCTION = 2
        const val TYPE_INDIRECT_FUNCTION = 10

        val REGISTER_MASK = 0x1F
        const val REGISTER_X16 = 0x10
        const val REGISTER_X17 = 0x11

        val ADRP_MASK = 0x9F000000.toInt()
        val ADRP_PATTERN = 0x90000000.toInt()

        /** `add <Xd>, <Xn>, #imm`, 64 bit, whose immediate is not shifted. */
        val ADD_MASK = 0xFF000000.toInt()
        val ADD_PATTERN = 0x91000000.toInt()

        /** `ldr x17, [x16, #imm]`, 64 bit, unsigned offset. */
        val LOAD_MASK = 0xFFC00000.toInt()
        val LOAD_PATTERN = 0xF9400000.toInt()

        val BRANCH_X17 = 0xD61F0220.toInt()

        /** `b` and `bl`, whose target is a signed 26 bit word offset. */
        val BRANCH_MASK = 0xFC000000.toInt()
        const val BRANCH = 0x14000000
        val BRANCH_LINK = 0x94000000.toInt()
        const val BRANCH_IMMEDIATE_MASK = 0x03FFFFFF
        const val BRANCH_IMMEDIATE_SIGN = 0x02000000
        const val BRANCH_IMMEDIATE_RANGE = 0x04000000
    }
}
