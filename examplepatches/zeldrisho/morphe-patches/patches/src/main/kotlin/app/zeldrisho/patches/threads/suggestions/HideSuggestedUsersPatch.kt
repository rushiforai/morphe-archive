package app.zeldrisho.patches.threads.suggestions

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_THREADS_453_APKM
import app.zeldrisho.patches.threads.ads.FeedMergeMethod
import app.zeldrisho.patches.threads.ads.feedListLoadMove
import app.zeldrisho.patches.threads.ads.feedListRegister
import app.zeldrisho.patches.threads.ads.feedListStoreMove
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/** Removes suggested-user units before the inspected spool cache processes the input list. */
@Suppress("unused")
val hideSuggestedUsersPatch = bytecodePatch(
    name = "Hide suggested accounts",
    description = "Removes suggested-account units from the Threads feed. Other suggestion surfaces are unchanged.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_THREADS_453_APKM)
    extendWith("extensions/extension.mpe")

    execute {
        val item = classDefBy("LX/HO7;")
        val metadata = classDefBy("LX/Gf6;")
        val feedItem = classDefBy("LX/9aG;")
        val feedType = classDefBy("LX/7vd;")
        check(feedItem.methods.count { it.name == "A03" && it.parameterTypes.isEmpty() && it.returnType == feedType.type && AccessFlags.PUBLIC.isSet(it.accessFlags) } == 1) {
            "Threads suggested accounts: feed type accessor changed"
        }
        check(item.fields.count { it.name == "A05" && it.type == "Ljava/lang/Object;" && AccessFlags.PUBLIC.isSet(it.accessFlags) } == 1) {
            "Threads suggested accounts: cached payload field changed"
        }
        check(feedType.fields.count { it.name == "A0R" && it.type == feedType.type && AccessFlags.STATIC.isSet(it.accessFlags) } == 1) {
            "Threads suggested accounts: kickstart enum field changed"
        }
        KickstartEnum453.matchAll(1..1).single()
        SuggestedRowDismiss453.matchAll(1..1).single()
        check(item.fields.count { it.name == "A00" && it.type == metadata.type && AccessFlags.PUBLIC.isSet(it.accessFlags) } == 1) {
            "Threads suggested accounts: item metadata field changed"
        }
        check(metadata.fields.count { it.name == "A00" && it.type == "Ljava/util/Map;" && AccessFlags.PUBLIC.isSet(it.accessFlags) } == 1) {
            "Threads suggested accounts: metadata map field changed"
        }
        val method = SuggestedUsersCache453.matchAll(1..1).single().method
        val implementation = method.implementation ?: error("Threads suggested accounts: cache method has no body")
        check(implementation.registerCount == 9) { "Threads suggested accounts: unexpected register frame" }
        val cache = SuggestedUsersCachedModels453.matchAll(1..1).single().method
        check(cache.implementation?.registerCount == 14) { "Threads suggested accounts: cached filter register frame changed" }
        val feed = FeedMergeMethod.matchAll(1..1).single().method
        val feedRegisters = feed.implementation?.registerCount ?: error("Threads suggested accounts: feed merge has no body")
        val listRegister = feedListRegister(feedRegisters)
        method.addInstructions(0, """
            invoke-static {p1}, Lapp/zeldrisho/threads/extension/SuggestedUsersFilter;->filter(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """)
        cache.addInstructions(0, """
            invoke-static {p1}, Lapp/zeldrisho/threads/extension/SuggestedUsersFilter;->filter(Ljava/util/List;)Ljava/util/List;
            move-result-object p1
        """)
        feed.addInstructions(0, """
            ${feedListLoadMove(listRegister)}
            invoke-static {v0}, Lapp/zeldrisho/threads/extension/SuggestedUsersFilter;->filter(Ljava/util/List;)Ljava/util/List;
            move-result-object v0
            ${feedListStoreMove(listRegister)}
        """)
    }
}

private object KickstartEnum453 : Fingerprint(
    definingClass = "LX/7vd;", name = "<clinit>", returnType = "V", parameters = emptyList(),
    filters = listOf(
        string("KICKSTART_FEED_UNIT"),
        fieldAccess(opcode = Opcode.SPUT_OBJECT, definingClass = "LX/7vd;", name = "A0R", type = "LX/7vd;"),
    ),
)

private object SuggestedRowDismiss453 : Fingerprint(
    definingClass = "Lcom/instagram/barcelona/feed/viewmodel/MainFeedViewModel;", name = "DxY",
    returnType = "V", parameters = listOf("LX/3aT;", "LX/8bk;", "I"),
    filters = listOf(
        methodCall(definingClass = "LX/9aG;", name = "A03", returnType = "LX/7vd;"),
        fieldAccess(opcode = Opcode.SGET_OBJECT, definingClass = "LX/7vd;", name = "A0R", type = "LX/7vd;"),
        string("threads_suggested_users_row_dismiss"),
    ),
)

private object SuggestedUsersCachedModels453 : Fingerprint(
    definingClass = "Lcom/instagram/barcelona/feed/data/spool/ForYouFeedSpoolCachedModelsFilter;",
    name = "A00", accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;", parameters = listOf("Ljava/util/List;", "LX/2bk;"),
    filters = listOf(fieldAccess(opcode = Opcode.IGET_OBJECT, definingClass = "LX/HO7;", name = "A05", type = "Ljava/lang/Object;")),
)

private object SuggestedUsersCache453 : Fingerprint(
    definingClass = "Lcom/instagram/barcelona/feed/data/cache/BarcelonaSpoolFeedCacheHandler;",
    name = "A04",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Lcom/instagram/barcelona/feed/data/cache/BarcelonaSpoolFeedCacheHandler;",
        "Ljava/util/List;",
        "LX/2bk;",
    ),
    filters = listOf(string("feedItemType"), string("SUGGESTED_USERS")),
)
