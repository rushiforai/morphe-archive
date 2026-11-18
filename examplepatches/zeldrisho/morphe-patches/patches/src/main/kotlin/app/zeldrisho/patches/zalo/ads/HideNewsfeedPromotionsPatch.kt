package app.zeldrisho.patches.zalo.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.packageMetadata
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_261002_AND_EXPERIMENTAL
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

@Suppress("unused")
val hideZaloNewsfeedPromotionsPatch = bytecodePatch(
    name = "Hide Newsfeed promotions",
    description = "Hides native Zinstant ad rows and suggested Zalo Video sections in Newsfeed automatically. Ordinary video posts remain visible.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZALO_261002_AND_EXPERIMENTAL)
    extendWith("extensions/extension.mpe")
    execute {
        val version261101 = packageMetadata.versionName == "26.11.01"
        val holder = classDefBy(if (version261101) "Lyv9;" else "Ld91/v;")
        val expectedFields = if (version261101) mapOf(
            "v1" to "Lcom/zing/zalo/social/presentation/timeline/components/ads/FeedItemZInstantAds;",
            "u1" to "Lcom/zing/zalo/social/presentation/timeline/components/section_zalo_video/FeedItemVideoChannel;",
        ) else mapOf(
            "E1" to "Lcom/zing/zalo/social/presentation/timeline/components/ads/FeedItemZInstantAds;",
            "D1" to "Lcom/zing/zalo/social/presentation/timeline/components/section_zalo_video/FeedItemVideoChannel;",
        )
        val expectedSuperclass = if (version261101) "Landroidx/recyclerview/widget/o;" else "Landroidx/recyclerview/widget/l2;"
        check(holder.superclass == expectedSuperclass && expectedFields.all { (name, type) ->
                holder.fields.count { it.name == name && it.type == type && AccessFlags.PUBLIC.isSet(it.accessFlags) } == 1
            }
        ) { "Newsfeed promotion holder ABI changed" }
        val method = (if (version261101) NewsfeedBind261101 else NewsfeedBind261002).matchAll(1..1).single().method
        check(method.implementation!!.registerCount == if (version261101) 28 else 30) {
            "Newsfeed bind register layout changed"
        }
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

// Experimental target: 26.11.01 is advertised but not fully device-qualified.
private object NewsfeedBind261101 : Fingerprint(
    definingClass = "Lfaq;", name = "a0",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Lyv9;", "I"), returnType = "V",
    filters = listOf(fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "Lyv9;",
        name = "v1", type = "Lcom/zing/zalo/social/presentation/timeline/components/ads/FeedItemZInstantAds;")),
)

private object NewsfeedBind261002 : Fingerprint(
    definingClass = "Lj91/c0;", name = "a0",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ld91/v;", "I"), returnType = "V",
    filters = listOf(fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "Ld91/v;",
        name = "E1", type = "Lcom/zing/zalo/social/presentation/timeline/components/ads/FeedItemZInstantAds;")),
)
