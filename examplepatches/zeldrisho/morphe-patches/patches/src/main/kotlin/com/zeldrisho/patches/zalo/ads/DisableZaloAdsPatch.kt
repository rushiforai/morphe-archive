package com.zeldrisho.patches.zalo.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.zeldrisho.patches.shared.bytecode.clearBody
import com.zeldrisho.patches.zalo.shared.Constants.COMPATIBILITY_ZALO

/**
 * Disables Zalo's first-party/offline and Google ad networks.
 *
 * - Forces `Lvx/s2.h()` / `g()` to false so the offline-ads time window and
 *   tracker gate never open (client-side Adtima logging/rendering checks).
 * - NOPs the skip-branch in `Adtima.updateSupportNetwork()` so admob/dfp/ima
 *   are always removed from the supported-network map, regardless of the
 *   server `ads_google_enable` value.
 * - Reports limit-ad-tracking opted-out from `com/adtima/d.doInBackground()`
 *   (`Adtima.mIsLat = 1`, no Play API call), so the ad-roll renderers treat
 *   the user as opted out.
 *
 * Limits: server-driven sponsored content (Story/community/OA placements) is
 * handled by the companion "Disable Zalo sponsored placements" patch;
 * the AD_ID manifest entries go with "Remove Zalo AD_ID permission";
 * message/call functionality is untouched.
 */
@Suppress("unused")
val disableZaloAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables Zalo offline/Google ad networks (forces the Adtima offline gates " +
        "closed, always drops admob/dfp/ima, and reports limit-ad-tracking opted-out). " +
        "Sponsored Story/community placements need the companion patch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        val window = OfflineAdsWindow.matchAll(1..1).single().method
        forceReturnFalse(window)
        val gate = OfflineAdsGate.matchAll(1..1).single().method
        forceReturnFalse(gate)

        val network = GoogleAdsNetworkGate.matchAll(1..1).single()
        val skip = network.instructionMatches.firstOrNull {
            it.instruction.opcode == Opcode.IF_NEZ
        } ?: error("GoogleAdsNetworkGate: IF_NEZ skip-branch not found")
        network.method.replaceInstruction(skip.index, "nop")

        val latRead = AdtimaLatRead.matchAll(1..1).single().method
        forceLimitAdTracking(latRead)
    }
}

/**
 * Disables Zalo sponsored Story/community placements at their config gates.
 *
 * Each call site reads `..._ads...enable` via `Lvj0/m.f()` and branches on
 * `IF_NE result, 1`. The patch writes 0 into the MOVE_RESULT register so every
 * site takes the non-sponsored path. Other config flags sharing `Lvj0/m.f`
 * are untouched; only methods containing the exact ad-enable strings match.
 */
@Suppress("unused")
val disableZaloSponsoredPatch = bytecodePatch(
    name = "Disable sponsored placements",
    description = "Forces Zalo Story/community ad-enable flags to off at their config " +
        "reads (normal content path kept). Server-stitched or OA-message promos may remain.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        for (match in StoryAdsConfig.matchAll(2..2)) {
            zeroConfigResult(match.method, match.instructionMatches.map { it.index })
        }
        for (match in CommunityAdsConfig.matchAll(2..2)) {
            zeroConfigResult(match.method, match.instructionMatches.map { it.index })
        }
    }
}

/** Wipes a boolean gate and returns false; clears try-blocks to keep ART verification happy. */
internal fun forceReturnFalse(method: MutableMethod) {
    method.clearBody()
    method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
}

/**
 * Reports limit-ad-tracking opted-out without calling Play: sets
 * `Adtima.mIsLat = 1` and returns null. Clears the original try-blocks (the
 * Play call has three catch handlers) so ART verification stays happy.
 */
internal fun forceLimitAdTracking(method: MutableMethod) {
    method.clearBody()
    method.addInstructions(
        0,
        "const/4 v0, 0x1\n" +
            "sput v0, Lcom/adtima/Adtima;->mIsLat:I\n" +
            "const/4 v0, 0x0\n" +
            "return-object v0",
    )
}

/**
 * Writes 0 into the MOVE_RESULT register of a config read so the following
 * `IF_NE …, 1` always takes the disabled path.
 */
internal fun zeroConfigResult(method: MutableMethod, matchIndexes: List<Int>) {
    val impl = method.implementation ?: error("Matched config gate has no implementation")
    val instructions = impl.instructions.toList()
    val moveIndex = matchIndexes.firstOrNull { idx -> instructions[idx].opcode == Opcode.MOVE_RESULT }
        ?: error("Config gate: MOVE_RESULT not found")
    val reg = (instructions[moveIndex] as OneRegisterInstruction).registerA
    method.addInstructions(moveIndex + 1, "const/4 v$reg, 0x0")
}
