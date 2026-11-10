package app.template.patches.stellarium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_Stellarium
import app.template.patches.shared.Elf64
import app.template.patches.shared.ElfArm
import app.template.patches.shared.NativeLibrary
import java.security.MessageDigest
import java.util.logging.Logger

/*
 * Stellarium keeps the entire Plus feature set in a native library, which is
 * shipped unstripped, so the license gate can be found by symbol name instead
 * of a per-release address. A device loads it from the split of the ABI it runs,
 * lib/arm64-v8a or lib/armeabi-v7a, and both builds answer the same license
 * questions through the same API, so the patch rewrites whichever libraries the
 * APK holds, one or both. Four functions decide what the app believes it is
 * licensed for:
 *
 * - StelAPI::getHasFeaturePLUS() const is the gate every Plus feature (extended
 *   catalogs, deep sky surveys, ...) is checked against. It returns
 *   QVariant(false) once the Play licensing callback reports a definite
 *   failure, so it is rewritten to return QVariant(true) unconditionally.
 * - StelAPI::hasValidLicense() const answers the same question for the parts of
 *   the app that ask separately, and gets the same treatment.
 * - StelAPI::getAppVariant() const reports which variant the install runs as,
 *   "plus" or "free", read from the variant flag of the loaded bundle. The flag
 *   is forced to "plus".
 * - StelAPI::getLicenceStatus() const reports the cached license status, which a
 *   patched install never sets to "licensed", so it is rewritten to report
 *   LICENSED.
 *
 * No bytecode patch is needed: the licensing callback in Java only feeds these
 * native checks, which no longer care what it reports.
 *
 * The unlock also makes the app ask Play Asset Delivery for the "extended" data
 * pack, the deep catalogs that only a Play install can receive. A sideloaded
 * install never gets an answer, and the failure is shown in the app's data pack
 * error dialog ("Cannot get data pack state"). The patch branches over that
 * request, so the dialog stays gone; when the extended catalog patch is applied
 * and a pack has been imported locally, the Java hook answers the Play lookup
 * and the pack is registered normally.
 *
 * The patch is written to survive releases it was not built for. Instead of
 * asserting the bytes at each site, it verifies what the functions do, in the
 * instruction set of the architecture the library is built for:
 *
 * - the two checks that answer with a QVariant have to build one, by branching
 *   into a QVariant constructor. That call is also what proves that replacing
 *   their entry with a QVariant construction of the patch's own is an ABI
 *   compatible change: 64 bit Arm passes the slot for the returned object in x8
 *   and the receiver in x0, 32 bit Arm passes the slot in r0 and the receiver
 *   right after it,
 * - the variant flag and the license status are found by their shape in the
 *   function, so register allocation and instruction order may change,
 * - the request for the extended data pack is followed from the call
 *   `StelAPI::addExtendedSources()` makes, and recognized by the pack name its
 *   function uses and the Play Asset Delivery calls it reaches.
 *
 * The four license checks are patched together: the app reads all of them to
 * decide what it reports and which features it enables, so leaving one alone
 * would let a patch that reports success still run as the free version. A
 * release that reshapes one of them fails the patch, with a message naming the
 * function that changed. The request for the data pack is required too: its
 * branch is what keeps the data pack dialog from coming back, and the extended
 * catalog patch builds the local import on top of it. Nothing is ever patched
 * blindly: a library whose checks no longer match fails instead.
 */

/** A native function the patch rewrites, by mangled name and by plain C++ name. */
private class NativeFunction(val symbol: String, val name: String)

/** `StelAPI::getHasFeaturePLUS() const`, the gate every Plus feature is checked against. */
private val HAS_FEATURE_PLUS = NativeFunction("_ZNK7StelAPI17getHasFeaturePLUSEv", "getHasFeaturePLUS")

/** `StelAPI::hasValidLicense() const`. */
private val HAS_VALID_LICENSE = NativeFunction("_ZNK7StelAPI15hasValidLicenseEv", "hasValidLicense")

/** `StelAPI::getAppVariant() const`. */
private val APP_VARIANT = NativeFunction("_ZNK7StelAPI13getAppVariantEv", "getAppVariant")

/** `StelAPI::getLicenceStatus() const`. */
private val LICENCE_STATUS = NativeFunction("_ZNK7StelAPI16getLicenceStatusEv", "getLicenceStatus")

/** `StelAPI::addExtendedSources()`, which hands the extended data pack to the engine. */
private val ADD_EXTENDED_SOURCES = NativeFunction("_ZN7StelAPI18addExtendedSourcesEv", "addExtendedSources")

/** `QVariant::QVariant(bool)`, how the original code reports a successful check. */
private const val SYMBOL_QVARIANT_BOOL = "_ZN8QVariantC1Eb"

/** Every `QVariant::QVariant(...)` constructor is mangled under this prefix. */
private const val SYMBOL_QVARIANT_CONSTRUCTOR = "_ZN8QVariantC1"

/** The Play asset pack holding the extended catalogs, as the native code names it. */
private const val ASSET_PACK = "asset_pack_extended"

/** Imported functions of the Play Asset Delivery SDK, all under this prefix. */
private const val PLAY_ASSET_DELIVERY = "AssetPackManager_"

/** The Play import the pack function uses to ask for the pack's download state. */
private const val PLAY_REQUEST_INFO = "AssetPackManager_requestInfo"

/** How far into the function that registers the pack the pack name and the Play calls sit. */
private const val PACK_FUNCTION_SIZE = 0x400

/** How many instructions the epilogue search follows before it gives up. */
private const val MAX_EPILOGUE_STEPS = 24

/**
 * The library holding the license gate. It sits in the split of the ABI the
 * device runs, so it is found under whichever lib directory the APK ships,
 * whether the entry carries the name of the split or not.
 */
private val PLUS_LIBRARY = Regex("""lib/[^/]+/libstellarium-mobile-plus(_[A-Za-z0-9-]+)?\.so$""")

private val logger = Logger.getLogger("StellariumPremium")

// The library is architecture specific, and the patch rewrites machine code, so
// the instruction set the ELF header declares decides how. `e_ident[EI_CLASS]`
// is at offset 4 of the file, `e_machine` right after the ident.
private const val ELF_HEADER_SIZE = 0x40
private const val ELF_CLASS_32 = 1
private const val ELF_CLASS_64 = 2
private const val ELF_MACHINE = 0x12
private const val MACHINE_ARM = 40
private const val MACHINE_AARCH64 = 183

// How many native libraries a failed lookup lists before it stops counting.
private const val LISTED_LIBRARIES = 5

// Sizes of the sequences the patch writes, in bytes.
private const val LICENSE_RESULT_SIZE = 12
private const val VARIANT_FLAG_SIZE = 4
private const val LICENCE_STATUS_SIZE = 8
private const val ARM_LICENSE_RESULT_SIZE = 12
private const val ARM_VARIANT_FLAG_SIZE = 4
private const val ARM_LICENCE_STATUS_SIZE = 4

// AArch64 instructions used to rewrite the license checks. They are written as
// hex words so they read like the disassembly they came from.
private val MOV_X0_X8 = 0xAA0803E0.toInt() // mov x0, x8: the return slot the caller passed.
private val MOV_W1_1 = 0x52800021.toInt() // mov w1, #1: the bool to build a QVariant from.
private val MOV_W0_1 = 0x52800020.toInt() // mov w0, #1: LICENSED in StelAPI's status enum.
private val RET = 0xD65F03C0.toInt() // ret

// Thumb instructions used to rewrite the 32 bit license checks, written the
// same way.
private val ARM_MOVS_R1_1 = 0x2101 // movs r1, #1: the bool to build a QVariant from.
private val ARM_MOVS_R0_1 = 0x2001 // movs r0, #1: LICENSED in StelAPI's status enum.
private val ARM_BX_LR = 0x4770 // bx lr: return
private val ARM_NOP = 0xBF00 // nop
private val ARM_PUSH_R0_LR = 0xB501 // push {r0, lr}: the return slot and the return address
private val ARM_POP_R0_PC = 0xBD01 // pop {r0, pc}: restore the slot and return
private val ARM_MOVS_ONE = 0x2000 // movs r<register>, #1

// Fields of the AArch64 instructions the shape of the license code is read
// through.
private val LOAD_STORE_OPCODE_MASK = 0xFFC00000.toInt()
private val LOAD_BYTE = 0x39400000.toInt() // ldrb w?, [x?, #imm]
private val LOAD_WORD = 0xB9400000.toInt() // ldr w?, [x?, #imm]
private val LOAD_DOUBLEWORD = 0xF9400000.toInt() // ldr x?, [x?, #imm]

// `cbz` and `cbnz`, how the variant flag is tested. The mask clears the width
// bit, the immediate and the register, so the 32 and the 64 bit forms both
// match.
private val BRANCH_IF_ZERO_MASK = 0x7F000000
private val BRANCH_IF_ZERO = 0x34000000
private val BRANCH_IF_NONZERO = 0x35000000
private const val IMMEDIATE_12_SHIFT = 10
private const val IMMEDIATE_12_MASK = 0xFFF
private const val REGISTER_MASK = 0x1F

// Fields of the Thumb instructions the shape of the 32 bit license code is read
// through. The 16 bit forms carry a word offset scaled by 4 or a byte offset as
// it is; the 32 bit forms carry every offset in bytes.
private val ARM_LOAD_STORE_MASK = 0xF800
private val ARM_LOAD_WORD16 = 0x6800 // ldr r?, [r?, #imm5 * 4]
private val ARM_LOAD_BYTE16 = 0x7800 // ldrb r?, [r?, #imm5]
private val ARM_LOAD_WIDE_MASK = 0xFFF0
private val ARM_LOAD_WORD32 = 0xF8D0 // ldr.w r?, [r?, #imm12]
private val ARM_LOAD_BYTE32 = 0xF890 // ldrb.w r?, [r?, #imm12]
private val ARM_MOVS_MASK = 0xF800

// `cbz r?` and `cbnz r?`, how the variant flag is tested. The mask clears the
// sign bit of the immediate, the immediate itself and the register.
private const val ARM_BRANCH_IF_ZERO = 0xB100
private const val ARM_BRANCH_IF_NONZERO = 0xB900
private const val ARM_BRANCH_IF_ZERO_MASK = 0xFD00
private const val ARM_OFFSET_5_MASK = 0x1F
private const val ARM_REGISTER_MASK = 0xF
private const val ARM_LOW_REGISTER_MASK = 0x7

// The receiver x0 that C++ member functions are called with, and the register
// holding the return value of a function that returns an `int`.
private const val RECEIVER = 0
private const val RETURN_WORD = 0

// 32 bit Arm passes the slot for a returned object in r0 and the receiver of a
// member function right after it, so a member that answers with a QVariant
// (which needs that slot) sees its receiver in r1, while a plain getter of an
// `int` sees it in r0.
private const val ARM_RECEIVER = 1

/**
 * `[x0, #0x10]` holds the bundle `getAppVariant()` reads its variant from, and
 * the flag is the byte at `0x58` of it in every release so far. The offset is
 * stored as an immediate of 2, because 64 bit loads are scaled by 8.
 */
private const val BUNDLE_POINTER = 2
private const val VARIANT_FLAG = 0x58

/**
 * The same two offsets in the 32 bit build: `[r1, #8]` holds the bundle (the
 * receiver sits in r1) and the flag is the byte at `0x2c` of it.
 */
private const val ARM_BUNDLE_POINTER = 8
private const val ARM_VARIANT_FLAG = 0x2C

@Suppress("unused")
val premiumPatch = rawResourcePatch(
    name = "Stellarium Premium",
    description = "Unlock Stellarium Plus by patching the native license checks, and skip the " +
        "Play data pack request a sideloaded install cannot satisfy (arm64-v8a and armeabi-v7a)."
) {
    compatibleWith(COMPATIBILITY_Stellarium)
    execute {
        val libraries = listApkEntries("").filter { it.endsWith(".so") }
        val libraryEntries = libraries.filter { PLUS_LIBRARY.containsMatchIn(it) }
        if (libraryEntries.isEmpty()) {
            throw PatchException(
                "The APK has no lib/<abi>/libstellarium-mobile-plus*.so" + libraries.seen()
            )
        }

        // An APK can hold a library per ABI (and the same library again without
        // the split suffix), so every copy it holds is unlocked, not just the
        // first one the entries happen to list.
        for (libraryEntry in libraryEntries) {
            val library = get(libraryEntry)
            val bytes = library.readBytes()
            // The entry and the hash of the input go to the log, so a run that
            // did not end up unlocking the app can be told apart from one that
            // never patched the library the install uses.
            logger.info("Patching $libraryEntry (${bytes.size} bytes, sha-256 ${digestOf(bytes)})")
            val applied = patchNativeLibrary(libraryEntry, bytes)
            library.writeBytes(bytes)
            logger.info("Patched the native library: $applied")
        }
    }
}

/**
 * Applies the unlock to one native library in [bytes] and answers what was
 * applied, so the log names the functions that were rewritten.
 *
 * The library is identified by its ELF header, not by its file name: a
 * 64 bit AArch64 library is rewritten in AArch64 and a 32 bit Arm library in
 * Thumb, and a library of another machine fails the patch instead of being
 * guessed at.
 *
 * A required edit that no longer matches fails the whole patch, naming the
 * function that changed.
 */
private fun patchNativeLibrary(entry: String, bytes: ByteArray): String {
    if (bytes.size < ELF_HEADER_SIZE || !startsWithElfMagic(bytes)) {
        throw PatchException("The native library \"$entry\" is not an ELF library")
    }
    val elfClass = bytes[4].toInt() and 0xFF
    val machine = (bytes[ELF_MACHINE].toInt() and 0xFF) or
        ((bytes[ELF_MACHINE + 1].toInt() and 0xFF) shl 8)

    // Both builds of the app answer the same license questions, so both get
    // the same unlock, written in their own instruction set.
    val edits = when {
        elfClass == ELF_CLASS_64 && machine == MACHINE_AARCH64 -> aarch64Edits(Elf64(bytes))
        elfClass == ELF_CLASS_32 && machine == MACHINE_ARM -> armEdits(ElfArm(bytes))
        else -> throw PatchException(
            "The native library \"$entry\" is not a 32 or 64 bit Arm library " +
                "(ELF class $elfClass, machine $machine), so the patch does not know how to " +
                "rewrite it"
        )
    }

    val applied = ArrayList<String>()
    val skipped = ArrayList<String>()

    // All four license checks are patched: the app reads the gate, the
    // answer it reports for the license, and the variant, so one of them
    // left alone would let a "successful" patch still run as the free
    // version. A release that reshapes one of them fails here instead,
    // naming it.
    for (plan in edits) {
        try {
            val done = plan.build()
            val where = "${plan.label} @0x${done.offset.toString(16)}"
            applied += if (done.applyTo(bytes)) where else "$where (already patched)"
        } catch (error: PatchException) {
            if (plan.required) throw error
            logger.warning("$entry: ${plan.label} was left alone: ${error.message}")
            skipped += plan.label
        }
    }

    if (skipped.isNotEmpty()) {
        logger.warning("$entry: these were not patched: ${skipped.joinToString(", ")}")
    }

    return applied.joinToString(", ")
}

/**
 * One edit the patch is about to make: what it is called, whether a run that
 * cannot make it has to fail, and the code that finds the site and builds the
 * replacement.
 */
private class EditPlan(val label: String, val required: Boolean, val build: () -> NativeEdit)

/** The edits that unlock a 64 bit Arm library. */
private fun aarch64Edits(elf: Elf64): List<EditPlan> {
    val constructors = variantConstructors(elf)
    val constructor = variantConstructor(elf)

    return listOf(
        EditPlan("getHasFeaturePLUS()", required = true) {
            aarch64LicenseResultEdit("getHasFeaturePLUS()", elf, HAS_FEATURE_PLUS, constructors, constructor)
        },
        EditPlan("hasValidLicense()", required = true) {
            aarch64LicenseResultEdit("hasValidLicense()", elf, HAS_VALID_LICENSE, constructors, constructor)
        },
        EditPlan("getAppVariant()", required = true) { aarch64AppVariantEdit(elf) },
        EditPlan("getLicenceStatus()", required = true) { aarch64LicenceStatusEdit(elf) },
        EditPlan("extended data pack", required = true) { extendedDataPackEdit(elf) },
    )
}

/** The same unlock for a 32 bit Arm library, which answers the same questions. */
private fun armEdits(elf: ElfArm): List<EditPlan> {
    val constructors = variantConstructors(elf)
    val constructor = variantConstructor(elf)

    return listOf(
        EditPlan("getHasFeaturePLUS()", required = true) {
            armLicenseResultEdit("getHasFeaturePLUS()", elf, HAS_FEATURE_PLUS, constructors, constructor)
        },
        EditPlan("hasValidLicense()", required = true) {
            armLicenseResultEdit("hasValidLicense()", elf, HAS_VALID_LICENSE, constructors, constructor)
        },
        EditPlan("getAppVariant()", required = true) { armAppVariantEdit(elf) },
        EditPlan("getLicenceStatus()", required = true) { armLicenceStatusEdit(elf) },
        EditPlan("extended data pack", required = true) { extendedDataPackEdit(elf) },
    )
}

/**
 * The PLT stubs of every `QVariant` constructor the library imports, which is
 * what the two checks that answer with a `QVariant` are recognized by.
 */
private fun <S : NativeLibrary.Symbol> variantConstructors(elf: NativeLibrary<S>): Set<Long> =
    elf.pltStubs.filterKeys { it.startsWith(SYMBOL_QVARIANT_CONSTRUCTOR) }.values.toSet()

/** The PLT stub of `QVariant::QVariant(bool)`, which every architecture imports. */
private fun <S : NativeLibrary.Symbol> variantConstructor(elf: NativeLibrary<S>): Long =
    elf.pltStubs[SYMBOL_QVARIANT_BOOL]
        ?: throw PatchException(
            "The native library does not import QVariant(bool) (\"$SYMBOL_QVARIANT_BOOL\"), " +
                "so the license checks cannot be answered with QVariant(true)"
        )

/**
 * Rewrites a 64 bit function that answers with a `QVariant(bool)` so that it
 * always answers `true`, by constructing the `QVariant` itself:
 *
 * ```asm
 * mov x0, x8          ; the return slot the caller passed in x8
 * mov w1, #1          ; true
 * b   QVariant(bool)  ; construct and return to the caller
 * ```
 *
 * @throws PatchException If the function no longer builds a `QVariant`, which
 *   means the release moved or changed the license check.
 */
private fun aarch64LicenseResultEdit(
    label: String,
    elf: Elf64,
    function: NativeFunction,
    variantConstructors: Set<Long>,
    variantConstructor: Long,
): NativeEdit {
    val symbol = elf.function(function)
    requireFunction(symbol, label, LICENSE_RESULT_SIZE)

    if (!elf.branchesTo(symbol, variantConstructors)) {
        throw PatchException(
            "$label does not build a QVariant anymore, so it is no longer the license check " +
                "this patch replaces"
        )
    }

    return NativeEdit(
        label = label,
        offset = elf.codeOffsetOf(symbol.address),
        replacement = instruction(MOV_X0_X8) +
            instruction(MOV_W1_1) +
            branch(symbol.address + 8, variantConstructor),
    )
}

/**
 * The same rewrite for a 32 bit Arm function:
 *
 * ```asm
 * push {r0, lr}         ; the return slot the caller passed in r0, and the return address
 * movs r1, #1           ; true
 * blx  QVariant(bool)   ; r0 still holds the return slot
 * pop  {r0, pc}         ; restore the slot and return to the caller
 * ```
 *
 * The construction needs nothing but the value, because the caller passed the
 * slot for the returned object in r0 and the receiver, which the function does
 * not use, in r1. The imported constructor is Arm code, so the call has to be
 * the `blx` that switches instruction set. A `blx` overwrites `lr` with the
 * address of the instruction after itself, so the caller's return address is
 * saved on the stack first, and the slot is saved with it to be handed back in
 * r0 without relying on what the constructor leaves there. Saving two registers
 * keeps the stack eight byte aligned at the call, as the ABI requires.
 *
 * @throws PatchException If the function no longer builds a `QVariant`, which
 *   means the release moved or changed the license check.
 */
private fun armLicenseResultEdit(
    label: String,
    elf: ElfArm,
    function: NativeFunction,
    variantConstructors: Set<Long>,
    variantConstructor: Long,
): NativeEdit {
    val symbol = elf.function(function)
    requireFunction(symbol, label, ARM_LICENSE_RESULT_SIZE)

    if (!elf.branchesTo(symbol, variantConstructors)) {
        throw PatchException(
            "$label does not build a QVariant anymore, so it is no longer the license check " +
                "this patch replaces"
        )
    }

    return NativeEdit(
        label = label,
        offset = elf.codeOffsetOf(symbol.address),
        replacement = halfWord(ARM_PUSH_R0_LR) +
            halfWord(ARM_MOVS_R1_1) +
            armBranchLinkExchange(symbol.address + 4, variantConstructor) +
            halfWord(ARM_POP_R0_PC) +
            halfWord(ARM_NOP),
    )
}

/**
 * Forces the variant flag of `getAppVariant()` to "plus":
 *
 * ```asm
 * ldr  x9, [x0, #0x10]   ; the loaded bundle
 * ldrb w9, [x9, #0x58]   ; its variant flag, replaced by `mov w9, #1`
 * cbz  w9, ...           ; the test the flag is read for
 * ```
 *
 * The loads are found by their shape, so a release may move the prologue
 * around them or allocate other registers. The flag sits at 0x58 of the bundle
 * in every release seen so far; a release that moves it inside the bundle is
 * still found, because the flag is the byte the function reads from the bundle
 * and tests for zero, so a second pass accepts any offset it finds that shape
 * at. The function reads no other byte from the bundle, and the zero test keeps
 * the patch from rewriting a different load.
 *
 * The only register whose contents change is the one the flag was read into, so
 * the rest of the function keeps working as it is.
 *
 * @throws PatchException If the function no longer reads a variant flag.
 */
private fun aarch64AppVariantEdit(elf: Elf64): NativeEdit {
    val label = "getAppVariant()"
    val symbol = elf.function(APP_VARIANT)
    requireFunction(symbol, label, VARIANT_FLAG_SIZE)

    val words = elf.instructions(symbol)
    for (exact in listOf(true, false)) {
        for (index in 0 until words.size - 2) {
            val bundle = loadBundle(words[index]) ?: continue

            // The flag load, or the patch's own work from an earlier run.
            val flag = loadVariantFlag(words[index + 1], bundle, exact)
                ?: if (isForcedFlag(words[index + 1])) words[index + 1] and REGISTER_MASK
                else continue

            if (!testsZero(words[index + 2], flag)) continue

            return NativeEdit(
                label = label,
                offset = elf.codeOffsetOf(symbol.address + (index + 1) * 4L),
                replacement = instruction(moveOne(flag)),
            )
        }
    }

    throw PatchException(
        "$label no longer reads a variant flag from the loaded bundle, and the app reads that " +
            "flag to decide whether it reports the free or the plus variant. If this APK was " +
            "already patched by an older version of this patch, patch its original copy again."
    )
}

/**
 * The same rewrite for a 32 bit Arm function:
 *
 * ```asm
 * ldr  r4, [r1, #8]      ; the loaded bundle
 * ldrb r0, [r4, #0x2c]   ; its variant flag, replaced by `movs r0, #1`
 * cbz  r0, ...           ; the test the flag is read for
 * ```
 *
 * The flag is found the same way as on 64 bit Arm: at 0x2c in every release
 * seen so far, or wherever the function reads a byte from the bundle and tests
 * it for zero. The load is replaced by a `movs` of the same width, with a `nop`
 * when it was 4 bytes wide, so the instructions around it keep their alignment.
 *
 * @throws PatchException If the function no longer reads a variant flag.
 */
private fun armAppVariantEdit(elf: ElfArm): NativeEdit {
    val label = "getAppVariant()"
    val symbol = elf.function(APP_VARIANT)
    requireFunction(symbol, label, ARM_VARIANT_FLAG_SIZE)

    val instructions = elf.instructions(symbol)
    for (exact in listOf(true, false)) {
        for (index in 0 until instructions.size - 2) {
            val bundle = armLoadBundle(instructions[index]) ?: continue
            val load = instructions[index + 1]

            // The flag load, or the patch's own work from an earlier run.
            val forced = armForcedFlagRegister(load)
            val flag = armLoadVariantFlag(load, bundle, exact) ?: forced ?: continue

            // A 4 byte load is replaced by a `movs` and a `nop`, so on a second
            // run the test sits one half word further than it did before.
            val after = instructions.getOrNull(index + 2)
            val tested = armTestsZero(after, flag) ||
                (forced != null && isNop(after) &&
                    armTestsZero(instructions.getOrNull(index + 3), flag))
            if (!tested) continue

            return NativeEdit(
                label = label,
                offset = elf.codeOffsetOf(load.address),
                replacement = armForcedFlag(flag, load.size),
            )
        }
    }

    throw PatchException(
        "$label no longer reads a variant flag from the loaded bundle, and the app reads that " +
            "flag to decide whether it reports the free or the plus variant. If this APK was " +
            "already patched by an older version of this patch, patch its original copy again."
    )
}

/**
 * Rewrites `getLicenceStatus()` from `ldr w0, [x0, #0x18] ; ret` to
 * `mov w0, #1 ; ret`, so the status reads as LICENSED instead of FAILED.
 *
 * @throws PatchException If the function is not a plain getter of a 32 bit
 *   status anymore, because a computed status may hide a failure the app
 *   handles, which the patch should not force away.
 */
private fun aarch64LicenceStatusEdit(elf: Elf64): NativeEdit {
    val label = "getLicenceStatus()"
    val symbol = elf.function(LICENCE_STATUS)
    requireFunction(symbol, label, LICENCE_STATUS_SIZE)

    val words = elf.instructions(symbol, maxWords = 4)
    val loadsStatus = words.size >= 2 && words[1] == RET &&
        // The patch's own work from an earlier run reads as the same getter.
        (words[0] == MOV_W0_1 || loadStatusWord(words[0]) == RETURN_WORD)

    if (!loadsStatus) {
        throw PatchException("$label is not a plain getter of a 32 bit status anymore")
    }

    return NativeEdit(
        label = label,
        offset = elf.codeOffsetOf(symbol.address),
        replacement = instruction(MOV_W0_1) + instruction(RET),
    )
}

/**
 * Rewrites `getLicenceStatus()` from `ldr r0, [r0, #0xc] ; bx lr` to
 * `movs r0, #1 ; bx lr`, so the status reads as LICENSED instead of FAILED.
 *
 * @throws PatchException If the function is not a plain getter of a 32 bit
 *   status anymore, because a computed status may hide a failure the app
 *   handles, which the patch should not force away.
 */
private fun armLicenceStatusEdit(elf: ElfArm): NativeEdit {
    val label = "getLicenceStatus()"
    val symbol = elf.function(LICENCE_STATUS)
    requireFunction(symbol, label, ARM_LICENCE_STATUS_SIZE)

    val instructions = elf.instructions(symbol, maxBytes = 8)
    val loadsStatus = instructions.size >= 2 && instructions[1].first == ARM_BX_LR &&
        // The patch's own work from an earlier run reads as the same getter.
        (instructions[0].first == ARM_MOVS_R0_1 || armLoadStatusWord(instructions[0]) != null)

    if (!loadsStatus) {
        throw PatchException("$label is not a plain getter of a 32 bit status anymore")
    }

    return NativeEdit(
        label = label,
        offset = elf.codeOffsetOf(symbol.address),
        replacement = halfWord(ARM_MOVS_R0_1) + halfWord(ARM_BX_LR),
    )
}

/**
 * Stops the app from asking Play Asset Delivery for the extended data pack,
 * while still letting a pack the Java hook answers with be registered.
 *
 * With the Plus unlock in place, `StelAPI::addExtendedSources()` registers the
 * `asset_pack_extended` pack with the engine, which then asks Play for a
 * download state that a sideloaded install can never reach. Every request
 * fails, and the app shows the failure in its data pack error dialog. The
 * patch makes the function that registers the pack skip the `requestInfo` call
 * and return through its normal epilogue:
 *
 * ```asm
 * bl   AssetPackManager_requestInfo   ; replaced by a branch to the epilogue
 * cbz  w0, ...                        ; the status check, now skipped
 * ```
 *
 * Nothing exports the registration function, so it is found by following the
 * call `addExtendedSources()` makes: it is the only one of its calls that both
 * names the pack and reaches Play Asset Delivery. The branch target is the
 * first branch after the call, once the immediate status check is skipped,
 * whose target leads to a return. That is the function's epilogue, so the
 * stack frame the prologue set up is restored and the caller sees a normal
 * return. When the Java hook does answer with a local pack, the native code
 * takes the success path and never reaches the patched call.
 *
 * @throws PatchException If the library no longer calls `requestInfo`, or if the
 *   function already starts with a return, which is what an older version of
 *   this patch wrote and cannot be repaired without the original APK.
 */
private fun <S : NativeLibrary.Symbol> extendedDataPackEdit(elf: NativeLibrary<S>): NativeEdit {
    val label = "extended data pack"
    val sources = elf.function(ADD_EXTENDED_SOURCES)
    requireFunction(sources, label, 4)

    val pack = elf.stringAddressOrNull(ASSET_PACK)
        ?: throw PatchException("$label: the library does not name its \"$ASSET_PACK\" pack anymore")

    val playCalls = elf.pltStubs
        .filterKeys { it.startsWith(PLAY_ASSET_DELIVERY) }
        .values.toSet()
    if (playCalls.isEmpty()) {
        throw PatchException("$label: the library does not import Play Asset Delivery anymore")
    }

    // A call to an imported function goes through its PLT stub, which is not
    // what the pack registration is being searched for.
    val imports = elf.pltStubs.values.toSet()
    val registrations = elf.calledFunctions(sources)
        .filter { it !in imports && elf.isCode(it) }
        .filter { target ->
            elf.codeReferences(target, pack, PACK_FUNCTION_SIZE) &&
                elf.calledFunctions(target, PACK_FUNCTION_SIZE).any { it in playCalls }
        }
        .distinct()

    if (registrations.size != 1) {
        throw PatchException(
            "$label: expected one call that registers the pack with Play Asset Delivery, " +
                "found ${registrations.size}"
        )
    }

    val registration = registrations.single()
    return when (elf) {
        is Elf64 -> aarch64ExtendedDataPackEdit(elf, registration)
        is ElfArm -> armExtendedDataPackEdit(elf, registration)
        else -> throw PatchException("$label: the library is not 32 or 64 bit Arm")
    }
}

/**
 * The AArch64 form of [extendedDataPackEdit]: skip the `bl` to
 * `AssetPackManager_requestInfo` and branch to the epilogue the function
 * already uses after its error logging.
 */
private fun aarch64ExtendedDataPackEdit(elf: Elf64, registration: Long): NativeEdit {
    val label = "extended data pack"
    val instructions = elf.instructionsAt(registration, PACK_FUNCTION_SIZE)
    if (instructions.isEmpty()) {
        throw PatchException("$label: the pack registration function is empty")
    }
    if (elf.isReturn(instructions[0].word)) throw oldPackPatchException()

    val requestInfo = elf.pltStubs[PLAY_REQUEST_INFO]
        ?: throw PatchException("$label: the library does not import \"$PLAY_REQUEST_INFO\"")

    val callIndex = instructions.indexOfFirst { site ->
        elf.isCall(site.word) && elf.branchTarget(site.address, site.word) == requestInfo
    }
    if (callIndex >= 0) {
        val site = instructions[callIndex]
        val epilogue = findEpilogueAarch64(elf, instructions, callIndex)
        return NativeEdit(
            label = label,
            offset = elf.codeOffsetOf(site.address),
            replacement = branch(site.address, epilogue),
        )
    }

    // The patch's own work from an earlier run: the branch replaced the call
    // and is followed by the status check the original code did.
    for (index in 0 until instructions.size - 1) {
        val site = instructions[index]
        if (!elf.isUnconditionalBranch(site.word)) continue
        val target = elf.branchTarget(site.address, site.word) ?: continue
        if (!leadsToReturnAarch64(elf, instructions, target)) continue
        if (!elf.isResultCheck(instructions[index + 1].word)) continue
        return NativeEdit(
            label = label,
            offset = elf.codeOffsetOf(site.address),
            replacement = instruction(site.word),
        )
    }

    throw PatchException(
        "$label: the pack registration function no longer calls \"$PLAY_REQUEST_INFO\", " +
            "and it does not contain this patch's earlier branch either"
    )
}

/**
 * The epilogue [aarch64ExtendedDataPackEdit] branches to: the first branch
 * after the Play call, once the immediate status check is skipped, whose target
 * walks to a `ret`.
 */
private fun findEpilogueAarch64(
    elf: Elf64,
    instructions: List<Elf64.Instruction>,
    callIndex: Int,
): Long {
    var skippedStatusCheck = false
    for (index in callIndex + 1 until instructions.size) {
        val site = instructions[index]
        if (!skippedStatusCheck && elf.conditionalBranchTarget(site.address, site.word) != null) {
            skippedStatusCheck = true
            continue
        }

        val target = if (elf.isUnconditionalBranch(site.word)) {
            elf.branchTarget(site.address, site.word)
        } else {
            elf.conditionalBranchTarget(site.address, site.word)
        } ?: continue

        if (leadsToReturnAarch64(elf, instructions, target)) return target
    }

    throw PatchException(
        "extended data pack: the pack registration function no longer branches to its " +
            "epilogue after \"$PLAY_REQUEST_INFO\""
    )
}

/** Whether the code at [target] walks to a `ret`, following only plain `b` instructions. */
private fun leadsToReturnAarch64(
    elf: Elf64,
    instructions: List<Elf64.Instruction>,
    target: Long,
): Boolean {
    var index = indexOfAarch64(instructions, target)
    if (index < 0) return false

    val seen = HashSet<Int>()
    var steps = 0
    while (index in instructions.indices && steps < MAX_EPILOGUE_STEPS) {
        if (!seen.add(index)) return false
        val site = instructions[index]
        if (elf.isReturn(site.word)) return true
        if (elf.isUnconditionalBranch(site.word)) {
            val next = elf.branchTarget(site.address, site.word) ?: return false
            index = indexOfAarch64(instructions, next)
            if (index < 0) return false
            steps++
            continue
        }
        index++
        steps++
    }
    return false
}

/** The index of the 4 byte instruction at [address] in [instructions], or -1. */
private fun indexOfAarch64(instructions: List<Elf64.Instruction>, address: Long): Int {
    if (instructions.isEmpty()) return -1
    val index = ((address - instructions.first().address) / 4).toInt()
    if (index !in instructions.indices) return -1
    return if (instructions[index].address == address) index else -1
}

/**
 * The 32 bit form of [extendedDataPackEdit]. The pack function calls the Arm
 * PLT stub with `blx`, and its epilogue is the `popeq {..., pc}` the stack
 * canary check falls into, so the branch is written in the range that reaches
 * it, with a `nop` filling the call's second half word.
 */
private fun armExtendedDataPackEdit(elf: ElfArm, registration: Long): NativeEdit {
    val label = "extended data pack"
    val instructions = elf.instructionsAt(registration, PACK_FUNCTION_SIZE)
    if (instructions.isEmpty()) {
        throw PatchException("$label: the pack registration function is empty")
    }
    if (instructions[0].size == 2 && instructions[0].first == ARM_BX_LR) {
        throw oldPackPatchException()
    }

    val requestInfo = elf.pltStubs[PLAY_REQUEST_INFO]
        ?: throw PatchException("$label: the library does not import \"$PLAY_REQUEST_INFO\"")

    val callIndex = instructions.indexOfFirst { elf.callTarget(it) == requestInfo }
    if (callIndex >= 0) {
        val site = instructions[callIndex]
        val epilogue = findEpilogueArm(elf, instructions, callIndex)
        return NativeEdit(
            label = label,
            offset = elf.codeOffsetOf(site.address),
            replacement = armBranch(site.address, epilogue),
        )
    }

    // The patch's own work from an earlier run: the branch replaced the call
    // and is followed, after the `nop`, by the status check the original code did.
    for (index in instructions.indices) {
        val site = instructions[index]
        if (elf.callTarget(site) != null) continue
        val target = elf.branchTarget(site) ?: continue
        if (!leadsToReturnArm(elf, instructions, target)) continue

        var nextIndex = index + 1
        if (site.size == 2 && isNop(instructions.getOrNull(nextIndex))) nextIndex++
        val next = instructions.getOrNull(nextIndex) ?: continue
        if (!armTestsZero(next, 0)) continue

        val replacement = if (site.size == 2) {
            val nop = instructions.getOrNull(index + 1)
            if (!isNop(nop)) continue
            halfWord(site.first) + halfWord(nop!!.first)
        } else {
            halfWord(site.first) + halfWord(site.second)
        }
        return NativeEdit(
            label = label,
            offset = elf.codeOffsetOf(site.address),
            replacement = replacement,
        )
    }

    throw PatchException(
        "$label: the pack registration function no longer calls \"$PLAY_REQUEST_INFO\", " +
            "and it does not contain this patch's earlier branch either"
    )
}

/** The epilogue [armExtendedDataPackEdit] branches to, found the same way as on AArch64. */
private fun findEpilogueArm(
    elf: ElfArm,
    instructions: List<ElfArm.Instruction>,
    callIndex: Int,
): Long {
    var skippedStatusCheck = false
    for (index in callIndex + 1 until instructions.size) {
        val site = instructions[index]
        if (!skippedStatusCheck && isArmConditionalBranch(site)) {
            skippedStatusCheck = true
            continue
        }
        if (elf.callTarget(site) != null) continue

        val target = elf.branchTarget(site) ?: continue
        if (leadsToReturnArm(elf, instructions, target)) return target
    }

    throw PatchException(
        "extended data pack: the pack registration function no longer branches to its " +
            "epilogue after \"$PLAY_REQUEST_INFO\""
    )
}

/** Whether the code at [target] walks to a return, following only plain `b` instructions. */
private fun leadsToReturnArm(
    elf: ElfArm,
    instructions: List<ElfArm.Instruction>,
    target: Long,
): Boolean {
    var index = instructions.indexOfFirst { it.address == target }
    if (index < 0) return false

    val seen = HashSet<Int>()
    var steps = 0
    while (index in instructions.indices && steps < MAX_EPILOGUE_STEPS) {
        if (!seen.add(index)) return false
        val site = instructions[index]
        if (elf.isReturn(site)) return true
        if (elf.callTarget(site) == null) {
            val next = elf.branchTarget(site)
            if (next != null) {
                index = instructions.indexOfFirst { it.address == next }
                if (index < 0) return false
                steps++
                continue
            }
        }
        index++
        steps++
    }
    return false
}

/** Whether [site] is a conditional Thumb branch, which is how the Play status is checked. */
private fun isArmConditionalBranch(site: ElfArm.Instruction): Boolean {
    if (site.size == 2) {
        val first = site.first
        // `b<c>`, but not the `udf`/`svc` encodings that share the 0xD prefix.
        if (first and 0xF000 == 0xD000 && first and 0x0F00 != 0x0F00) return true
        if (first and ARM_BRANCH_IF_ZERO_MASK == ARM_BRANCH_IF_ZERO) return true
        if (first and ARM_BRANCH_IF_ZERO_MASK == ARM_BRANCH_IF_NONZERO) return true
        return false
    }

    // `b<c>.w`, which keeps an "always" encoding that is the plain `b.w`.
    val first = site.first
    val second = site.second
    return first and 0xF800 == 0xF000 &&
        second and 0xC000 == 0x8000 &&
        second and 0x1000 == 0 &&
        first shr 6 and 0xF != 0xE
}

/**
 * Encodes a branch from [from] to [to] in Thumb. A 16 bit `b` is used when it
 * reaches, with a `nop` filling the rest of the 32 bit call it replaces;
 * otherwise a `b.w` is written.
 */
private fun armBranch(from: Long, to: Long): ByteArray {
    val delta = to - (from + 4)
    if (delta % 2 != 0L) {
        throw PatchException(
            "Cannot branch from 0x${from.toString(16)} to 0x${to.toString(16)}: the target is not half word aligned"
        )
    }
    if (delta >= -2048 && delta <= 2046) {
        return halfWord(0xE000 or ((delta shr 1).toInt() and 0x7FF)) + halfWord(ARM_NOP)
    }

    // `b.w` measures from the aligned program counter, and its 25 bit immediate
    // is split into a sign, two inversion bits and two halves, as the `blx`
    // encoder above does for a call.
    val value = to - ((from + 4) and -4L)
    if (value < -(1L shl 24) || value >= (1L shl 24) || value % 2 != 0L) {
        throw PatchException(
            "Cannot branch from 0x${from.toString(16)} to 0x${to.toString(16)}, it is too far away"
        )
    }

    val bits = value.toInt() and 0x01FFFFFF
    val sign = bits shr 24 and 1
    val first = 0xF000 or (sign shl 10) or (bits shr 12 and 0x3FF)
    val second = 0x9000 or
        ((sign xor (bits shr 23 and 1) xor 1) shl 13) or
        ((sign xor (bits shr 22 and 1) xor 1) shl 11) or
        (bits shr 1 and 0x7FF)

    return halfWord(first) + halfWord(second)
}

/** The message for an APK that the previous, entry-return form of this edit was applied to. */
private fun oldPackPatchException(): PatchException = PatchException(
    "extended data pack: the pack registration function already returns at its first " +
        "instruction. That is what an older version of this patch wrote; patch the original " +
        "APK again."
)

/**
 * The function [function] names: the exact mangled symbol, or the only symbol
 * whose name contains it, which finds it again when a release changed a
 * signature around it but kept the API name.
 */
private fun <S : NativeLibrary.Symbol> NativeLibrary<S>.function(function: NativeFunction): S {
    symbolOrNull(function.symbol)?.let { return it }

    val candidates = symbolsContaining(function.name)
    if (candidates.size == 1) return candidates.single()
    throw PatchException(
        if (candidates.isEmpty()) "The native library has no \"${function.name}\" function"
        else "The native library has ${candidates.size} functions matching \"${function.name}\""
    )
}

/** Rejects a symbol that is not code, or too small to hold [size] bytes of replacement. */
private fun requireFunction(symbol: NativeLibrary.Symbol, label: String, size: Int) {
    if (!symbol.isFunction) {
        throw PatchException("$label is not a function (ELF symbol type ${symbol.type})")
    }
    if (symbol.size != 0L && symbol.size < size) {
        throw PatchException("$label is only ${symbol.size} bytes long, too small to hold the patch")
    }
}

/** `ldr x?, [x0, #0x10]`, the loaded bundle, or null when [word] is something else. */
private fun loadBundle(word: Int): Int? {
    if ((word and LOAD_STORE_OPCODE_MASK) != LOAD_DOUBLEWORD) return null
    if (((word ushr 5) and REGISTER_MASK) != RECEIVER) return null
    if (((word ushr IMMEDIATE_12_SHIFT) and IMMEDIATE_12_MASK) != BUNDLE_POINTER) return null
    return word and REGISTER_MASK
}

/**
 * `ldrb w?, [<bundle>, #?]`, a byte of the bundle, or null when [word] is
 * something else. With [exact], only the byte at the variant flag offset counts;
 * without it, any byte does, and the caller checks that it is the one the
 * function tests for zero.
 */
private fun loadVariantFlag(word: Int, bundle: Int, exact: Boolean): Int? {
    if ((word and LOAD_STORE_OPCODE_MASK) != LOAD_BYTE) return null
    if (((word ushr 5) and REGISTER_MASK) != bundle) return null
    if (exact && ((word ushr IMMEDIATE_12_SHIFT) and IMMEDIATE_12_MASK) != VARIANT_FLAG) return null
    return word and REGISTER_MASK
}

/** `cbz w?, ...` or `cbnz w?, ...`, a test of [register] against zero. */
private fun testsZero(word: Int, register: Int): Boolean {
    val opcode = word and BRANCH_IF_ZERO_MASK
    if (opcode != BRANCH_IF_ZERO && opcode != BRANCH_IF_NONZERO) return false
    return word and REGISTER_MASK == register
}

/** `ldr w?, [x0, #?]`, the status word of the receiver, or null when [word] is something else. */
private fun loadStatusWord(word: Int): Int? {
    if ((word and LOAD_STORE_OPCODE_MASK) != LOAD_WORD) return null
    if (((word ushr 5) and REGISTER_MASK) != RECEIVER) return null
    return word and REGISTER_MASK
}

/** `mov w?, #1`, the variant flag forced to "plus", with the register left out. */
private fun isForcedFlag(word: Int) = (word and 0xFFFFFFE0.toInt()) == MOV_W0_1

/** `mov w<register>, #1`. */
private fun moveOne(register: Int): Int = MOV_W0_1 or register

/** `ldr r?, [r1, #8]`, the loaded bundle, or null when [instruction] is something else. */
private fun armLoadBundle(instruction: ElfArm.Instruction): Int? {
    val first = instruction.first

    // `ldr r?, [r1, #imm5 * 4]`, the 16 bit encoding, whose offset is scaled.
    if (instruction.size == 2 && first and ARM_LOAD_STORE_MASK == ARM_LOAD_WORD16) {
        if (first shr 3 and ARM_LOW_REGISTER_MASK != ARM_RECEIVER) return null
        if (first shr 6 and ARM_OFFSET_5_MASK shl 2 != ARM_BUNDLE_POINTER) return null
        return first and ARM_LOW_REGISTER_MASK
    }

    // `ldr.w r?, [r1, #imm12]`, the 32 bit encoding, whose offset is in bytes.
    if (instruction.size == 4 && first and ARM_LOAD_WIDE_MASK == ARM_LOAD_WORD32) {
        if (first and ARM_REGISTER_MASK != ARM_RECEIVER) return null
        if (instruction.second and 0xFFF != ARM_BUNDLE_POINTER) return null
        return instruction.second shr 12 and ARM_REGISTER_MASK
    }

    return null
}

/**
 * `ldrb r?, [<bundle>, #?]`, a byte of the bundle, or null when [instruction]
 * is something else. With [exact], only the byte at the variant flag offset
 * counts; without it, any byte does, and the caller checks that it is the one
 * the function tests for zero.
 */
private fun armLoadVariantFlag(instruction: ElfArm.Instruction, bundle: Int, exact: Boolean): Int? {
    val first = instruction.first

    // `ldrb r?, [r?, #imm5]`, the 16 bit encoding, whose offset is in bytes.
    if (instruction.size == 2 && first and ARM_LOAD_STORE_MASK == ARM_LOAD_BYTE16) {
        if (first shr 3 and ARM_LOW_REGISTER_MASK != bundle) return null
        if (exact && first shr 6 and ARM_OFFSET_5_MASK != ARM_VARIANT_FLAG) return null
        return first and ARM_LOW_REGISTER_MASK
    }

    // `ldrb.w r?, [r?, #imm12]`, the 32 bit encoding, whose offset is in bytes too.
    if (instruction.size == 4 && first and ARM_LOAD_WIDE_MASK == ARM_LOAD_BYTE32) {
        if (first and ARM_REGISTER_MASK != bundle) return null
        if (exact && instruction.second and 0xFFF != ARM_VARIANT_FLAG) return null
        return instruction.second shr 12 and ARM_REGISTER_MASK
    }

    return null
}

/** `cbz r?, ...` or `cbnz r?, ...`, a test of [register] against zero. */
private fun armTestsZero(instruction: ElfArm.Instruction?, register: Int): Boolean {
    if (instruction == null || instruction.size != 2) return false
    val opcode = instruction.first and ARM_BRANCH_IF_ZERO_MASK
    if (opcode != ARM_BRANCH_IF_ZERO && opcode != ARM_BRANCH_IF_NONZERO) return false
    return instruction.first and ARM_LOW_REGISTER_MASK == register
}

/** `nop`, the padding the patch writes after a `movs` that replaces a wider load. */
private fun isNop(instruction: ElfArm.Instruction?): Boolean =
    instruction != null && instruction.size == 2 && instruction.first == ARM_NOP

/** `ldr r0, [r0, #?]`, the status word of the receiver, or null when [instruction] is something else. */
private fun armLoadStatusWord(instruction: ElfArm.Instruction): Int? {
    val first = instruction.first

    // `ldr r0, [r0, #imm5 * 4]`, the 16 bit encoding.
    if (instruction.size == 2 && first and ARM_LOAD_STORE_MASK == ARM_LOAD_WORD16) {
        if (first shr 3 and ARM_LOW_REGISTER_MASK != RETURN_WORD) return null
        if (first and ARM_LOW_REGISTER_MASK != RETURN_WORD) return null
        return RETURN_WORD
    }

    // `ldr.w r0, [r0, #imm12]`, the 32 bit encoding.
    if (instruction.size == 4 && first and ARM_LOAD_WIDE_MASK == ARM_LOAD_WORD32) {
        if (first and ARM_REGISTER_MASK != RETURN_WORD) return null
        if (instruction.second shr 12 and ARM_REGISTER_MASK != RETURN_WORD) return null
        return RETURN_WORD
    }

    return null
}

/** `movs r?, #1`, the variant flag forced to "plus", with the register left out. */
private fun armForcedFlagRegister(instruction: ElfArm.Instruction): Int? {
    if (instruction.size != 2) return null
    if (instruction.first and ARM_MOVS_MASK != ARM_MOVS_ONE) return null
    if (instruction.first and 0xFF != 1) return null
    return instruction.first shr 8 and ARM_LOW_REGISTER_MASK
}

/** `movs r<register>, #1`, with a `nop` when the load it replaces was 4 bytes wide. */
private fun armForcedFlag(register: Int, size: Int): ByteArray =
    halfWord(ARM_MOVS_ONE or (register shl 8) or 1) +
        if (size == 4) halfWord(ARM_NOP) else ByteArray(0)

/** Whether [bytes] start with the ELF magic number. */
private fun startsWithElfMagic(bytes: ByteArray): Boolean =
    bytes[0] == 0x7F.toByte() && bytes[1] == 'E'.code.toByte() &&
        bytes[2] == 'L'.code.toByte() && bytes[3] == 'F'.code.toByte()

/** The native libraries a failed lookup saw, so the failure explains itself. */
private fun List<String>.seen(): String = when {
    isEmpty() -> ". The APK holds no native libraries at all"
    size <= LISTED_LIBRARIES -> ". The APK holds ${joinToString(", ")}"
    else -> {
        val listed = take(LISTED_LIBRARIES).joinToString(", ")
        ". The APK holds $listed and ${size - LISTED_LIBRARIES} more"
    }
}

/**
 * One in place edit of a native library.
 *
 * A library that already holds the replacement is left as it is, which makes the
 * patch idempotent.
 */
private class NativeEdit(
    val label: String,
    val offset: Int,
    private val replacement: ByteArray,
) {
    /** Writes the replacement, and answers whether anything was written. */
    fun applyTo(library: ByteArray): Boolean {
        if (offset < 0 || offset > library.size - replacement.size) {
            throw PatchException(
                "$label is outside the native library (offset 0x${offset.toString(16)}, " +
                    "library size ${library.size} bytes)"
            )
        }

        // Already patched, which happens when the patch runs twice.
        if (library.copyOfRange(offset, offset + replacement.size).contentEquals(replacement)) return false

        replacement.copyInto(library, offset)
        return true
    }
}

/** The first bytes of the SHA-256 of [bytes], to identify a library in a log. */
private fun digestOf(bytes: ByteArray): String =
    MessageDigest.getInstance("SHA-256").digest(bytes)
        .take(8)
        .joinToString("") { "%02x".format(it) }

/** Encodes one AArch64 instruction as 4 little endian bytes. */
private fun instruction(value: Int): ByteArray = byteArrayOf(
    (value and 0xFF).toByte(),
    ((value ushr 8) and 0xFF).toByte(),
    ((value ushr 16) and 0xFF).toByte(),
    ((value ushr 24) and 0xFF).toByte(),
)

/** Encodes one Thumb half word as 2 little endian bytes. */
private fun halfWord(value: Int): ByteArray = byteArrayOf(
    (value and 0xFF).toByte(),
    ((value ushr 8) and 0xFF).toByte(),
)

/** Encodes `b <to>` for an instruction placed at address [from]. */
private fun branch(from: Long, to: Long): ByteArray {
    val immediate = (to - from) shr 2
    if (immediate < -(1L shl 25) || immediate >= (1L shl 25)) {
        throw PatchException("Cannot branch from 0x${from.toString(16)} to 0x${to.toString(16)}, it is too far away")
    }

    return instruction(0x14000000 or (immediate.toInt() and 0x03FFFFFF))
}

/**
 * Encodes `blx <to>` for an instruction placed at the address [from].
 *
 * The imported constructor is Arm code, so the call has to be the `blx` that
 * switches instruction set. `blx` also overwrites `lr` with the address of the
 * instruction after itself, so the caller has to save its own return address
 * before the call.
 */
private fun armBranchLinkExchange(from: Long, to: Long): ByteArray {
    val next = (from + 4) and -4L
    val immediate = to - next
    if (to and 0x3L != 0L || immediate < -(1L shl 24) || immediate >= 1L shl 24) {
        throw PatchException(
            "Cannot call 0x${to.toString(16)} from 0x${from.toString(16)}, it is too far away"
        )
    }

    // A 25 bit offset split into a sign, two halves of the two halves and two
    // inversion bits, which the processor undoes when it branches.
    val value = immediate.toInt() and 0x01FFFFFF
    val sign = value shr 24 and 1
    val first = 0xF000 or (sign shl 10) or (value shr 12 and 0x3FF)
    val second = 0xC000 or
        ((sign xor (value shr 23 and 1) xor 1) shl 13) or
        ((sign xor (value shr 22 and 1) xor 1) shl 11) or
        (value shr 2 and 0x3FF shl 1)

    return halfWord(first) + halfWord(second)
}
