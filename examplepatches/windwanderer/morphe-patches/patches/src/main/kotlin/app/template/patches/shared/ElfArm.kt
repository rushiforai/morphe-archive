package app.template.patches.shared

import app.morphe.patcher.patch.PatchException

/**
 * A minimal reader for ELF32 little endian shared libraries whose code is 32 bit
 * Arm (the armeabi-v7a build of an app).
 *
 * It offers the same surface as [Elf64], so a patch can be written once and
 * rewrite whichever of the two libraries the APK holds, but reads what is
 * different about the 32 bit form: smaller section headers, symbols that clear
 * the bit marking Thumb code, a PLT of Arm stubs, and variable length Thumb-2
 * instructions, which [instructions] decodes into whole instructions.
 *
 * - [symbolOrNull] and [symbolsContaining] find a function by its mangled name,
 *   which stays the same as long as the C++ API does not change,
 * - [pltStubs] finds the stub of an imported function, so rewritten code can
 *   call into the runtime (for example a `QVariant` constructor) without knowing
 *   where the linker placed anything,
 * - [instructions] and [branchesTo] describe what a function does, which is what
 *   patches verify before replacing code, instead of matching exact bytes,
 * - [calledFunctions], [codeReferences] and [stringAddressOrNull] follow a patch
 *   into code that nothing exports: which functions a call reaches, and which
 *   data a function uses,
 * - [codeOffsetOf] converts a virtual address into a file offset.
 *
 * Unsupported or malformed libraries fail with a [PatchException] instead of
 * being patched blindly. This is the [NativeLibrary] implementation for 32 bit
 * Arm; see [Elf64] for the 64 bit one.
 */
internal class ElfArm(private val bytes: ByteArray) : NativeLibrary<ElfArm.Symbol> {

    /** An entry of the dynamic symbol table. */
    internal class Symbol(
        override val name: String,
        /** The address the symbol is mapped at, with the Thumb bit cleared. */
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

    /**
     * One instruction of the library's code, with the half words it is encoded
     * in: a single one for a 16 bit instruction, two for a 32 bit one.
     */
    internal class Instruction(
        val address: Long,
        val size: Int,
        val first: Int,
        val second: Int,
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
     * that calls it. The stubs themselves are Arm code, which returns to Thumb
     * code when it is called with `blx`.
     *
     * A stub whose symbol the library does not name is still an import, and
     * patches have to recognize calls to it as imported calls, so it is keyed by
     * its GOT slot address instead.
     */
    override val pltStubs: Map<String, Long> by lazy { readPltStubsByName() }

    private fun readPltStubsByName(): Map<String, Long> {
        val slots = readGotSlots()
        val stubs = readPltStubs()
        val result = LinkedHashMap<String, Long>()
        val named = HashSet<Long>()
        symbolsByName.forEach { (name, symbol) ->
            val slot = slots[symbol.index] ?: return@forEach
            val stub = stubs[slot] ?: return@forEach
            result[name] = stub
            named += stub
        }
        stubs.forEach { (slot, stub) ->
            if (stub !in named) result["GOT@0x${slot.toString(16)}"] = stub
        }
        return result
    }

    /** File offset of the code at the virtual [address]. */
    override fun codeOffsetOf(address: Long): Int {
        val section = codeSectionOf(address)
        return section.offset + (address - section.address).toInt()
    }

    /**
     * How many bytes the instruction at the code address [address] is encoded
     * in: Thumb instructions are 16 or 32 bits wide.
     */
    override fun instructionSizeAt(address: Long): Int {
        val section = codeSectionOf(address)
        val offset = section.offset + (address - section.address).toInt()
        return if (startsWide(u16(offset))) 4 else 2
    }

    /** The instructions the function [symbol] is made of. */
    fun instructions(symbol: Symbol, maxBytes: Int = DEFAULT_FUNCTION_SIZE): List<Instruction> {
        val budget = if (symbol.size > 0) minOf(symbol.size, maxBytes.toLong()).toInt() else maxBytes
        return instructionsAt(symbol.address, budget)
    }

    /**
     * The instructions in the code starting at the address [from], looking at
     * most [byteCount] bytes ahead.
     *
     * Thumb instructions are 16 or 32 bits wide, so this always decodes whole
     * instructions: a half word is only read as the first one of a 32 bit
     * instruction when its own encoding says so.
     */
    internal fun instructionsAt(from: Long, byteCount: Int): List<Instruction> {
        val section = codeSectionOf(from)
        val start = section.offset + (from - section.address).toInt()
        val end = minOf(start + byteCount, section.endOffset)

        val result = ArrayList<Instruction>()
        var offset = start
        while (offset + 2 <= end) {
            val first = u16(offset)
            val size = if (startsWide(first)) 4 else 2
            if (offset + size > end) break
            result += Instruction(
                address = from + (offset - start),
                size = size,
                first = first,
                second = if (size == 4) u16(offset + 2) else 0,
            )
            offset += size
        }
        return result
    }

    /**
     * Whether the body of [symbol] branches (`b`, `bl` or `blx`) to an address
     * in [targets].
     *
     * Patches use this to prove what a function does before rewriting it. A
     * function that answers with a `QVariant`, for example, has to call one of
     * its constructors, and that call is what makes replacing its entry with a
     * `QVariant` construction of the patch's own an ABI compatible change.
     */
    override fun branchesTo(symbol: Symbol, targets: Set<Long>): Boolean {
        for (instruction in instructions(symbol)) {
            val target = branchTarget(instruction) ?: continue
            if (target in targets) return true
        }
        return false
    }

    /**
     * The addresses the calls of the function [symbol] reach.
     *
     * Patches use this to follow the work a function hands to another one, which
     * is how code that nothing exports is found: the function that registers the
     * extended data pack, for example, is only ever reached as a call made by a
     * function the library does export.
     */
    override fun calledFunctions(symbol: Symbol): List<Long> = callTargets(instructions(symbol))

    /**
     * The addresses the calls in the code starting at the address [from] reach,
     * looking at most [byteCount] bytes ahead.
     */
    override fun calledFunctions(from: Long, byteCount: Int): List<Long> =
        callTargets(instructionsAt(from, byteCount))

    private fun callTargets(instructions: List<Instruction>): List<Long> {
        val result = ArrayList<Long>()
        for (instruction in instructions) {
            val target = callTarget(instruction) ?: continue
            result += target
        }
        return result
    }

    /**
     * Whether the code starting at the address [from] names the data at
     * [address], within at most [byteCount] bytes.
     *
     * Thumb-2 code names data in three shapes, all handled here: `add r?, pc,
     * #imm` for nearby data, `movw`/`movt` pairs for far data, and `ldr r?, [pc,
     * #imm]` reading the literal pool, usually followed by an `add r?, pc` that
     * turns the loaded word into the data's address. A patch uses this to see
     * which data a function uses without depending on where the linker placed
     * anything.
     */
    override fun codeReferences(from: Long, address: Long, byteCount: Int): Boolean {
        val instructions = instructionsAt(from, byteCount)
        for (index in instructions.indices) {
            if (addressesData(instructions, index, address)) return true
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

    /** Whether the instruction at [index] (or the pair it starts) names [address]. */
    private fun addressesData(instructions: List<Instruction>, index: Int, address: Long): Boolean {
        val instruction = instructions[index]

        // `add r?, pc, #imm` builds the address of nearby data directly.
        if (addedToPc(instruction) == address) return true

        // `movw r?, #lo` with its `movt r?, #hi`: far data, either as the
        // address itself or as an offset a following `add r?, pc` applies.
        movedValue(instructions, index)?.let { (value, base) ->
            if (base == null) {
                if (value == address) return true
            } else {
                if ((base + value) and ADDRESS_MASK == address) return true
            }
        }

        // `ldr r?, [pc, #imm]` reads the literal pool, and a following
        // `add r?, pc` turns the word it loaded into the data's address.
        literalLoad(instruction)?.let { (register, value) ->
            for (ahead in 1..3) {
                val add = instructions.getOrNull(index + ahead) ?: break
                if (addsPc(add, register) && ((add.address + 4 + value) and ADDRESS_MASK) == address) {
                    return true
                }
            }
        }

        return false
    }

    /**
     * The address an `add r?, pc, #imm` in [instruction] builds, or null when
     * the instruction is something else.
     */
    private fun addedToPc(instruction: Instruction): Long? {
        if (instruction.size != 4) return null
        if (instruction.first and ADR_MASK != ADR_PATTERN) return null

        val immediate = (instruction.first shr 10 and 1 shl 11) or
            (instruction.second shr 12 and 0x7 shl 8) or (instruction.second and 0xFF)
        return ((instruction.address + 4) and -4L) + immediate
    }

    /**
     * The value a `movw`/`movt` pair starting at [index] builds, with the
     * address of the `add r?, pc` that turns it into an offset from the code,
     * when the pair is followed by one.
     *
     * The value is the full 32 bits the pair sets, which a following `add r?,
     * pc` treats as a wrapping offset, so callers do the arithmetic 32 bits
     * wide.
     */
    private fun movedValue(instructions: List<Instruction>, index: Int): Pair<Long, Long?>? {
        val low = instructions[index]
        if (!isMove(low, MOVW_PATTERN)) return null
        val register = registerOf(low)

        for (ahead in 1..3) {
            val high = instructions.getOrNull(index + ahead) ?: break
            if (!isMove(high, MOVT_PATTERN) || registerOf(high) != register) continue

            val value = (movedImmediate(high) shl 16 or movedImmediate(low)).toLong() and 0xFFFFFFFFL
            for (after in ahead + 1..minOf(ahead + 3, instructions.size - 1)) {
                val add = instructions[after]
                if (addsPc(add, register)) return value to (add.address + 4)
            }
            return value to null
        }
        return null
    }

    /** Whether [instruction] is a `movw`/`movt` (`mov` with [pattern]) of a register. */
    private fun isMove(instruction: Instruction, pattern: Int): Boolean {
        if (instruction.size != 4) return false
        if (instruction.first and MOVE_MASK != pattern) return false
        // The second half word leads with `0` and the register of the move.
        return instruction.second and 0x8000 == 0
    }

    /** The 16 bit immediate a `movw`/`movt` instruction carries. */
    private fun movedImmediate(instruction: Instruction): Int =
        (instruction.first and 0xF shl 12) or (instruction.second shr 12 and 0x7 shl 8) or
            (instruction.second and 0xFF)

    /** The destination register field of a `movw`/`movt`/wide load instruction. */
    private fun registerOf(instruction: Instruction): Int = instruction.second shr 12 and 0xF

    /**
     * The register and the word `ldr r?, [pc, #imm]` in [instruction] loads, or
     * null when the instruction is something else.
     *
     * The word is the full 32 bits at the pool, which a following `add r?, pc`
     * treats as a wrapping offset, so callers do the arithmetic 32 bits wide.
     */
    private fun literalLoad(instruction: Instruction): Pair<Int, Long>? {
        val first = instruction.first
        val pool = (instruction.address + 4) and -4L

        // `ldr r?, [pc, #imm8 * 4]`, the 16 bit encoding.
        if (instruction.size == 2 && first and LITERAL16_MASK == LITERAL16_PATTERN) {
            val offset = (first and 0xFF) * 4
            return (first shr 8 and 0x7) to u32((pool + offset).toInt())
        }

        // `ldr.w r?, [pc, #imm12]`, whose immediate is a byte offset.
        if (instruction.size == 4 && first == LITERAL32_PATTERN) {
            val offset = instruction.second and 0xFFF
            return registerOf(instruction) to u32((pool + offset).toInt())
        }

        return null
    }

    /** Whether [instruction] is `add r<register>, pc`, the high register form. */
    private fun addsPc(instruction: Instruction, register: Int): Boolean {
        if (instruction.size != 2) return false
        if (instruction.first and ADD_REGISTER_MASK != ADD_REGISTER) return false
        if (instruction.first shr 3 and 0xF != ADD_PC) return false

        val destination = (instruction.first and 0x7) or (instruction.first shr 7 and 1 shl 3)
        return destination == register
    }

    /** The address the call in [instruction] reaches, or null when it is not a `bl` or `blx`. */
    internal fun callTarget(instruction: Instruction): Long? {
        if (instruction.size != 4) return null
        if (instruction.first and BRANCH32_MASK != BRANCH32_PATTERN) return null

        // A 16 bit `blx <register>` is indirect, so it cannot be followed to an
        // address and is left out.
        val kind = instruction.second and BL_KIND_MASK
        if (kind != BL_KIND && kind != BLX_KIND) return null
        return branchTarget(instruction)
    }

    /**
     * The address an unconditional `b`, `bl` or `blx` in [instruction] reaches,
     * or null when the instruction is something else.
     */
    internal fun branchTarget(instruction: Instruction): Long? {
        if (instruction.size == 2) {
            if (instruction.first and BRANCH16_MASK != BRANCH16_PATTERN) return null
            // The 11 bit immediate is a halfword offset, so it is shifted left
            // before it is added to the program counter.
            return instruction.address + 4 +
                (signExtend(instruction.first and 0x7FF, 11) shl 1)
        }

        if (instruction.first and BRANCH32_MASK != BRANCH32_PATTERN) return null

        val second = instruction.second
        // `b<c>.w` keeps its condition in the first half word, and only the
        // "always" encoding branches unconditionally. `bl`, `blx` and the other
        // `b.w` encoding carry no condition.
        if (second and 0xC000 == 0x8000 && second and 0x1000 == 0 &&
            instruction.first shr 6 and 0xF != 0xE
        ) {
            return null
        }

        val s = instruction.first shr 10 and 1
        val i1 = (second shr 13 and 1) xor s xor 1
        val i2 = (second shr 11 and 1) xor s xor 1
        var immediate = (s shl 24) or (i1 shl 23) or (i2 shl 22) or
            (instruction.first and 0x3FF shl 12) or (second and 0x7FF shl 1)
        if (immediate and (1 shl 24) != 0) immediate -= 1 shl 25

        // The immediate is measured from the program counter, aligned down for
        // these 32 bit instructions.
        return ((instruction.address + 4) and -4L) + immediate
    }

    /**
     * Whether [instruction] returns from the function: `bx lr`, `pop {..., pc}`
     * or `pop.w {..., pc}`. The conditional `popeq` in an `IT` block is the same
     * 16 bit encoding as an unconditional pop, and is a return on the path the
     * condition takes.
     */
    internal fun isReturn(instruction: Instruction): Boolean {
        if (instruction.size == 2) {
            if (instruction.first == 0x4770) return true
            if (instruction.first and 0xFF00 == 0xBD00) return true
        } else if (instruction.size == 4) {
            if (instruction.first == 0xE8BD && instruction.second and 0x8000 != 0) return true
        }
        return false
    }

    /** [value] read as a signed [bits] bit number. */
    private fun signExtend(value: Int, bits: Int): Int {
        val sign = 1 shl (bits - 1)
        return if (value and sign != 0) value - (sign shl 1) else value
    }

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

        val tableOffset = u32(0x20)
        if (tableOffset == 0L) throw PatchException("Native library has no section headers")

        val entrySize = u16(0x2E).takeIf { it >= SECTION_HEADER_SIZE } ?: SECTION_HEADER_SIZE
        var count = u16(0x30)
        // Extended numbering stores the real count in the size field of section 0.
        if (count == 0) count = u32(tableOffset.toInt() + 0x14).toInt()
        if (count <= 0) throw PatchException("Native library has no section headers")

        val nameTableIndex = u16(0x32)
        val nameOffsets = IntArray(count)
        val parsed = ArrayList<Section>(count)
        for (index in 0 until count) {
            val header = (tableOffset + index.toLong() * entrySize).toInt()
            ensure(header, SECTION_HEADER_SIZE)
            nameOffsets[index] = u32(header).toInt()
            parsed += Section(
                name = "",
                type = u32(header + 4),
                address = u32(header + 0xC),
                offset = u32(header + 0x10).toInt(),
                size = u32(header + 0x14).toInt(),
                entrySize = u32(header + 0x24).toInt(),
                flags = u32(header + 8),
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
                    // The lowest bit of a Thumb function's address marks the
                    // instruction set and is not part of the address.
                    address = u32(entry + 4) and 0xFFFFFFFEL,
                    size = u32(entry + 8),
                    index = index,
                    type = u8(entry + 0xC) and 0xF,
                )
            }
            index++
            entry += entrySize
        }

        return result
    }

    /**
     * GOT slot backing each symbol, from the `R_ARM_JUMP_SLOT` (PLT) and
     * `R_ARM_GLOB_DAT` (data pointer) entries of `.rel.plt` and `.rel.dyn`.
     */
    private fun readGotSlots(): Map<Int, Long> {
        val result = HashMap<Int, Long>()
        for (name in listOf(".rel.plt", ".rel.dyn")) {
            val relocations = section(name) ?: continue
            val entrySize = relocations.entrySize.takeIf { it > 0 } ?: RELOCATION_SIZE

            var entry = relocations.offset
            while (entry + entrySize <= relocations.endOffset) {
                val offset = u32(entry)
                val info = u32(entry + 4)
                val type = (info and 0xFF).toInt()
                if (type == R_ARM_JUMP_SLOT || type == R_ARM_GLOB_DAT) {
                    result.putIfAbsent((info ushr 8).toInt(), offset)
                }
                entry += entrySize
            }
        }

        return result
    }

    /**
     * The GOT slot each Arm PLT stub loads, as slot to stub.
     *
     * The linker lays `.plt` out as a header followed by 12 byte Arm stubs of
     * the shape `add r12, pc, #a; add r12, r12, #b; ldr pc, [r12, #c]`, where
     * the two additions build the slot and the load calls through it. Anything
     * that does not decode is stepped over, so a different header or padding
     * cannot shift the stubs out of view.
     */
    private fun readPltStubs(): Map<Long, Long> {
        val plt = section(".plt") ?: return emptyMap()

        val result = HashMap<Long, Long>()
        var offset = plt.offset + PLT_HEADER_SIZE
        while (offset + PLT_ENTRY_SIZE <= plt.endOffset) {
            val first = u32(offset).toInt()
            val second = u32(offset + 4).toInt()
            val third = u32(offset + 8).toInt()
            if (first and PLT_MASK == PLT_ADD_SLOT && second and PLT_MASK == PLT_ADD_OFFSET &&
                third and PLT_MASK == PLT_LOAD_PC
            ) {
                val stub = plt.address + (offset - plt.offset)
                // In Arm code the program counter of an instruction is 8 bytes
                // ahead of it, which is what the two additions start from.
                val slot = stub + ARM_PC_OFFSET + armImmediate(first and 0xFFF) +
                    armImmediate(second and 0xFFF) + (third and 0xFFF)
                result[slot] = stub
                offset += PLT_ENTRY_SIZE
            } else {
                offset += 4
            }
        }

        return result
    }

    /** The value an Arm data processing immediate encodes: `ror(imm8, rotation * 2)`. */
    private fun armImmediate(encoded: Int): Int {
        val value = encoded and 0xFF
        val rotation = encoded shr 8 and 0xF
        if (rotation == 0) return value
        return (value ushr (rotation * 2)) or (value shl (32 - rotation * 2))
    }

    /** Whether a half word starts a 32 bit Thumb instruction. */
    private fun startsWide(halfWord: Int): Boolean = halfWord and 0xF800 >= 0xE800

    private fun checkFileHeader() {
        if (bytes.size < ELF_HEADER_SIZE) {
            throw PatchException("Native library is too small to be an ELF file (${bytes.size} bytes)")
        }
        if (bytes[0] != 0x7F.toByte() || bytes[1] != 'E'.code.toByte() ||
            bytes[2] != 'L'.code.toByte() || bytes[3] != 'F'.code.toByte()
        ) {
            throw PatchException("File is not an ELF library")
        }
        if (bytes[4].toInt() != ELF_CLASS_32) {
            throw PatchException("Native library is not 32 bit (ELF class ${bytes[4].toInt()})")
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
        const val ELF_HEADER_SIZE = 0x34
        const val SECTION_HEADER_SIZE = 0x28
        const val SYMBOL_SIZE = 16
        const val RELOCATION_SIZE = 8

        const val ELF_CLASS_32 = 1
        const val ELF_DATA_LSB = 1

        /** How long a function is read when the library does not say how long it is. */
        const val DEFAULT_FUNCTION_SIZE = 4096

        /**
         * 32 bit Arm addresses are 32 bits wide and wrap, which the offsets code
         * adds to a program counter rely on.
         */
        const val ADDRESS_MASK = 0xFFFFFFFFL

        /** Section type of a section that occupies no bytes in the file. */
        const val SHT_NOBITS = 8L

        /** Section flag of a section holding code. */
        const val SHF_EXECINSTR = 0x4L

        /** Section flag of a section loaded into the process. */
        const val SHF_ALLOC = 0x2L

        /** Arm relocation types: a PLT entry's slot, and a data pointer's slot. */
        const val R_ARM_JUMP_SLOT = 22
        const val R_ARM_GLOB_DAT = 21

        /** `st_info` symbol types that mean "code". */
        const val TYPE_FUNCTION = 2
        const val TYPE_INDIRECT_FUNCTION = 10

        /** `.plt` of the Arm linker: a 20 byte header, then 12 byte stubs. */
        const val PLT_HEADER_SIZE = 20
        const val PLT_ENTRY_SIZE = 12

        /** In Arm code the program counter is 8 bytes ahead of the instruction. */
        const val ARM_PC_OFFSET = 8

        val PLT_MASK = 0xFFFFF000.toInt()
        val PLT_ADD_SLOT = 0xE28FC000.toInt() // add r12, pc, #imm
        val PLT_ADD_OFFSET = 0xE28CC000.toInt() // add r12, r12, #imm
        val PLT_LOAD_PC = 0xE5BCF000.toInt() // ldr pc, [r12, #imm]

        /** How a 32 bit `b`, `bl` or `blx` is recognized by its half words. */
        val BRANCH16_MASK = 0xF800
        const val BRANCH16_PATTERN = 0xE000
        val BRANCH32_MASK = 0xF800
        const val BRANCH32_PATTERN = 0xF000
        val BL_KIND_MASK = 0xD000
        const val BL_KIND = 0xD000
        const val BLX_KIND = 0xC000

        /** `add r?, pc, #imm`, how code names nearby data. */
        val ADR_MASK = 0xFBFF
        const val ADR_PATTERN = 0xF20F

        /** `movw` and `movt`, how code names far data. */
        val MOVE_MASK = 0xFBFF
        const val MOVW_PATTERN = 0xF240
        const val MOVT_PATTERN = 0xF2C0

        /** `ldr r?, [pc, #imm]`, the literal pool loads, in both widths. */
        val LITERAL16_MASK = 0xF800
        const val LITERAL16_PATTERN = 0x4800
        const val LITERAL32_PATTERN = 0xF8DF

        /** `add r<d>, r<m>`, the high register form. */
        val ADD_REGISTER_MASK = 0xFF00
        const val ADD_REGISTER = 0x4400
        const val ADD_PC = 0xF
    }
}
