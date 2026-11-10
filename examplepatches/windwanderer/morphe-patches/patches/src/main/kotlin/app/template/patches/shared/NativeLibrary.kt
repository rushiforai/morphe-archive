package app.template.patches.shared

/**
 * A native library a patch can rewrite, whichever architecture it was built
 * for: [Elf64] reads 64 bit Arm (AArch64) libraries, [ElfArm] reads 32 bit Arm
 * (Thumb-2) ones. Patches work through this surface so the same patch covers
 * both, with only the instructions it writes differing.
 *
 * What it offers is what a patch needs to find code without hardcoded offsets:
 *
 * - [symbolOrNull] and [symbolsContaining] find a function by its mangled name,
 * - [pltStubs] finds the stub of an imported function, so rewritten code can
 *   call into the runtime without knowing where the linker placed anything,
 * - [branchesTo], [calledFunctions] and [codeReferences] describe what a
 *   function does, which is what patches verify before replacing code,
 * - [stringAddressOrNull] finds a piece of data, and [isCode] checks an address
 *   before anything is written to it,
 * - [codeOffsetOf] converts a virtual address into a file offset.
 *
 * Unsupported or malformed libraries fail with a `PatchException` instead of
 * being patched blindly.
 */
internal interface NativeLibrary<S : NativeLibrary.Symbol> {

    /** An entry of the dynamic symbol table. */
    interface Symbol {
        /** The mangled name, as C++ exports it. */
        val name: String

        /** The address the symbol is mapped at, without the instruction set flag. */
        val address: Long

        /** Size of the symbol in bytes, or 0 when the library does not say. */
        val size: Long

        /** `st_info` symbol type, [isFunction] for code. */
        val type: Int

        /** Whether the symbol is code, as opposed to data or a section. */
        val isFunction: Boolean
    }

    /** The dynamic symbol named [name], or null when the library has no such symbol. */
    fun symbolOrNull(name: String): S?

    /**
     * Symbols whose name contains [text], which finds an anchor again after a
     * release changed the signature around it but kept the API name.
     */
    fun symbolsContaining(text: String): List<S>

    /**
     * Every imported function: its name mapped to the address of the stub that
     * calls it. Calling such a stub is how patched code reaches an imported
     * function without knowing where the linker placed it.
     */
    val pltStubs: Map<String, Long>

    /**
     * File offset of the code at the virtual [address].
     *
     * Patches rewrite through this instead of a plain address lookup, so a
     * symbol that no longer points into executable code is never written over.
     */
    fun codeOffsetOf(address: Long): Int

    /**
     * How many bytes the instruction at the code address [address] is encoded
     * in.
     *
     * A patch that writes an instruction of its own over one has to match its
     * width, or the instructions after it would no longer be decoded as they
     * were. 64 bit Arm instructions are all 4 bytes wide, the 32 bit ones 2 or
     * 4.
     */
    fun instructionSizeAt(address: Long): Int

    /**
     * Whether the body of [symbol] branches to an address in [targets].
     *
     * Patches use this to prove what a function does before rewriting it. A
     * function that answers with a `QVariant`, for example, has to call one of
     * its constructors, and that call is what makes replacing its entry with a
     * `QVariant` construction of the patch's own an ABI compatible change.
     */
    fun branchesTo(symbol: S, targets: Set<Long>): Boolean

    /**
     * The addresses the calls of the function [symbol] reach.
     *
     * Patches use this to follow the work a function hands to another one,
     * which is how code that nothing exports is found: the function that
     * registers the extended data pack, for example, is only ever reached as a
     * call made by a function the library does export.
     */
    fun calledFunctions(symbol: S): List<Long>

    /**
     * The addresses the calls in the code starting at the address [from] reach,
     * looking at most [byteCount] bytes ahead.
     */
    fun calledFunctions(from: Long, byteCount: Int): List<Long>

    /**
     * Whether the code starting at the address [from] names the data at
     * [address], within at most [byteCount] bytes.
     *
     * Naming data is architecture specific, but every architecture has a
     * PC-relative form for it, so this is how a patch sees which data a
     * function uses without depending on where the linker placed anything.
     */
    fun codeReferences(from: Long, address: Long, byteCount: Int): Boolean

    /**
     * The address of the NUL terminated string [text] in the library's loaded
     * data, or null when the library does not hold that exact string.
     */
    fun stringAddressOrNull(text: String): Long?

    /** Whether [address] is executable code the patch may read or rewrite. */
    fun isCode(address: Long): Boolean
}
