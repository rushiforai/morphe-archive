package com.zeldrisho.threads.patches.ads

/*
 * Pure, unit-testable register math for hideAdsPatch.
 *
 * A0F(this, LX/9aR, Integer, String, String, List, LX/2uI, Function3, Z):
 * 9 params including `this`; the feed list is param index 5 (p5).
 * Dalvik param registers sit at the top of the frame, so
 * `listReg = registerCount - (paramsIncludingThis) + listParamIndex`.
 *
 * Register limits come from instruction encodings, not snippet injection:
 * move-object has 4-bit operands; /from16 has an 8-bit destination and
 * 16-bit source; /16 has two 16-bit operands. v0 keeps the invoke operand low.
 */
private const val MAX_SHORT_MOVE_REGISTER = 15
private const val MAX_FROM16_DESTINATION_REGISTER = 255

/**
 * Calculates the Dalvik register number for the feed list parameter in A0F.
 * @param registerCount Total number of registers in the method implementation.
 * @param paramsIncludingThis Total parameter count including the implicit `this` (default 9).
 * @param listParamIndex Zero-based index of the List parameter (default 5).
 * @return The register number holding the feed list.
 */
fun feedListRegister(registerCount: Int, paramsIncludingThis: Int = 9, listParamIndex: Int = 5): Int {
    require(registerCount > paramsIncludingThis) {
        "Feed merge requires a local scratch register: v0 must not alias a parameter"
    }
    return registerCount - paramsIncludingThis + listParamIndex
}

/**
 * Generates the smali move instruction to load the feed list from its register into v0.
 * Uses `move-object` through v15; above that `move-object/from16` (8-bit destination
 * v0, 16-bit source) covers every realistic frame.
 * @param listReg The register number holding the feed list.
 * @return The smali instruction string.
 */
fun feedListLoadMove(listReg: Int): String = if (listReg <= MAX_SHORT_MOVE_REGISTER) "move-object v0, v$listReg" else "move-object/from16 v0, v$listReg"

/**
 * Generates the smali move instruction to store v0 back into the feed list register.
 * Uses `move-object` through v15, `/from16` through v255, and `/16` above v255.
 * @param listReg The register number holding the feed list.
 * @return The smali instruction string.
 */
fun feedListStoreMove(listReg: Int): String = when {
    listReg <= MAX_SHORT_MOVE_REGISTER -> "move-object v$listReg, v0"
    listReg <= MAX_FROM16_DESTINATION_REGISTER -> "move-object/from16 v$listReg, v0"
    else -> "move-object/16 v$listReg, v0"
}
