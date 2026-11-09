package app.brokenn.patches.jiohotstar.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object IsSubscribedFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ui/model/pagedata/MyPageData;",
    name = "getIsSubscribed",
    returnType = "Z"
)

object IsPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ui/model/feature/download/DownloadInfo;",
    name = "getIsPremium",
    returnType = "Z"
)

object SubscriptionNudgeFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        string("interventionWidget"),
        string("null cannot be cast to non-null type com.hotstar.bff.models.widget.BffWidgetVisibilityIntervention"),
        string("SubscriptionNudgeWidget")
    )
)
