package app.template.patches.zalo.notif

import app.morphe.patcher.FieldAccessFilter
import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import app.template.patches.shared.Constants.COMPATIBILITY_ZALO

/**
 * Skips Zalo Timeline/Stories and Zalo Video push notifications in the push
 * dispatcher (`Lpy/i;.j0()`).
 *
 * Each promo arm loads its channel enum and jumps to the shared post path
 * (`sget …; goto :goto_4`). The patch replaces that single jump with
 * `return-void`, so the notification is never built or posted. The edit is
 * one instruction for one instruction, so offsets and any try ranges are
 * preserved.
 *
 * Suppressed (verified type map, see batch2-evidence.md §1): like/comment and
 * story-reaction digests, new feeds/stories, missed-feed digests, story
 * archive pushes, profile-music and dating ("zinder") pushes, Zalo Video
 * reminders — all of which the dispatcher routes to SOCIAL_STORY/ZALO_VIDEO.
 *
 * Limits: message, call, friend-request/accept, birthday and other channels
 * are untouched. Engagement pushes routed elsewhere (chat/group reactions via
 * ACTIVITY_UPDATES, phone-number friend suggestions via ALERT) still show;
 * the server can also introduce new push types at any time.
 */
@Suppress("unused")
val filterZaloPromoNotificationsPatch = bytecodePatch(
    name = "Filter promo notifications",
    description = "Filters Timeline, Stories and Zalo Video notifications. Message, call, " +
        "friend-request and birthday notifications are unaffected.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO)

    execute {
        val story = StoryChannelArm.matchAll(0..1) + StoryChannelArm261002.matchAll(0..1)
        val video = VideoChannelArm.matchAll(0..1) + VideoChannelArm261002.matchAll(0..1)
        check(story.size == 1 && video.size == 1) { "Expected one Story and one Video notification arm" }
        dropChannelArm(story.single())
        dropChannelArm(video.single())
    }
}

/**
 * Replaces the `goto :goto_4` immediately following the arm's channel `sget`
 * with `return-void`, dropping the notification before it is built.
 */
internal fun dropChannelArm(match: Match, method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod = match.method) {
    val (_, gotoIndex) = armJumpIndexes(match)
    method.replaceInstruction(gotoIndex, "return-void")
}

/**
 * Locates the arm's `(channel sget, post-path goto)` pair and verifies they
 * are adjacent. Pure over the immutable match — safe in tests without a
 * registered patch-context class table.
 */
internal fun armJumpIndexes(match: Match): Pair<Int, Int> {
    val fieldIndex = match.instructionMatches.firstOrNull { it.filter is FieldAccessFilter }
        ?.index ?: error("Promo arm: channel sget not found")
    val gotoIndex = match.instructionMatches.firstOrNull {
        it.instruction.opcode == Opcode.GOTO || it.instruction.opcode == Opcode.GOTO_16
    }
        ?.index ?: error("Promo arm: post-path jump not found")
    check(gotoIndex == fieldIndex + 1) {
        "Promo arm moved: expected goto right after the channel sget " +
            "(sget@$fieldIndex goto@$gotoIndex) — re-hunt Lpy/i;.j0() before patching."
    }
    return fieldIndex to gotoIndex
}
