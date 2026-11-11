package app.zeldrisho.patches.zalo.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_261002
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val hideZaloNewsfeedPromotionsPatch = bytecodePatch(
    name = "Hide Newsfeed promotions",
    description = "Hides native Zinstant ad rows and suggested Zalo Video sections in Newsfeed automatically. Ordinary video posts remain visible.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO_261002)
    extendWith("extensions/extension.mpe")
    execute {
        val holder = classDefBy("Ld91/v;")
        val expectedFields = mapOf(
            "E1" to "Lcom/zing/zalo/social/presentation/timeline/components/ads/FeedItemZInstantAds;",
            "D1" to "Lcom/zing/zalo/social/presentation/timeline/components/section_zalo_video/FeedItemVideoChannel;",
        )
        check(holder.superclass == "Landroidx/recyclerview/widget/l2;" && expectedFields.all { (name, type) ->
            holder.fields.count { it.name == name && it.type == type && AccessFlags.PUBLIC.isSet(it.accessFlags) } == 1
        }) { "Newsfeed promotion holder ABI changed" }
        val method = NewsfeedBind261002.matchAll(1..1).single().method
        check(method.implementation!!.registerCount == 30) { "Newsfeed bind register layout changed" }
        // v2 is unassigned at entry and is redefined by the original bind code.
        // Use /range because p1 is v28. Skip binding before ads load or report impressions.
        method.addInstructionsWithLabels(0, """
            invoke-static/range {p1 .. p1}, Lapp/zeldrisho/zalo/extension/NewsfeedPromotions;->hide(Ljava/lang/Object;)Z
            move-result v2
            if-eqz v2, :normal_feed_bind
            return-void
            :normal_feed_bind
            nop
        """)
    }
}

private object NewsfeedBind261002 : Fingerprint(
    definingClass = "Lj91/c0;", name = "a0",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ld91/v;", "I"), returnType = "V",
    filters = listOf(fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "Ld91/v;",
        name = "E1", type = "Lcom/zing/zalo/social/presentation/timeline/components/ads/FeedItemZInstantAds;")),
)
