package app.template.patches.zalo.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import app.template.patches.shared.bytecode.clearBody
import app.template.patches.shared.Constants.COMPATIBILITY_ZALO

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
    description = "Blocks selected offline and Google-served ads. Story and community " +
        "sponsored placements require a separate patch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        val windows = OfflineAdsWindow.matchAll(0..1) + OfflineAdsWindow261002.matchAll(0..1)
        val gates = OfflineAdsGate.matchAll(0..1) + OfflineAdsGate261002.matchAll(0..1)
        val networks = GoogleAdsNetworkGate.matchAll(0..1) + GoogleAdsNetworkGate261002.matchAll(0..1)
        val latReads = AdtimaLatRead.matchAll(0..1) + AdtimaLatRead261002.matchAll(0..1)
        check(listOf(windows.size, gates.size, networks.size, latReads.size).all { it == 1 }) {
            "Expected one offline window, tracker gate, network gate and advertising-ID worker"
        }
        val network = networks.single()
        val skip = network.instructionMatches.firstOrNull {
            it.instruction.opcode == Opcode.IF_NEZ
        } ?: error("GoogleAdsNetworkGate: IF_NEZ skip-branch not found")
        forceReturnFalse(windows.single().method)
        forceReturnFalse(gates.single().method)
        neutralizeNetworkSkipBranch(network.method, skip.index)
        forceLimitAdTracking(latReads.single().method)
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
    description = "Disables Story and community sponsored placements. Server-delivered and " +
        "Official Account promotions may remain.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        val story = StoryAdsConfig.matchAll(0..2) + StoryAdsConfig261002.matchAll(0..2)
        val community = CommunityAdsConfig.matchAll(0..2) + CommunityAdsConfig261002.matchAll(0..2)
        check(story.size == 2 && community.size == 2) {
            "Expected two Story and two Community ad config reads; found ${story.size} and ${community.size}"
        }
        for (match in story + community) {
            zeroConfigResult(match.method, match.instructionMatches.map { it.index })
        }
    }
}

/** Replaces the selected network skip branch with a NOP, leaving neighboring instructions intact. */
internal fun neutralizeNetworkSkipBranch(method: MutableMethod, instructionIndex: Int) {
    method.replaceInstruction(instructionIndex, "nop")
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
