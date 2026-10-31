package app.template.patches.threads.links

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/** Stable semantic anchor for the Threads URL click handler. */
internal object WebLinkHandler : Fingerprint(
    definingClass = "Lcom/instagram/barcelona/weblink/WebLinkUseCase;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Landroid/content/Context;",
        "LX/27Z;",
        "Ljava/lang/Long;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "L",
    ),
    filters = listOf(string("android.intent.action.VIEW")),
)

/** Threads 453.0.0.56.79: the obfuscated second parameter changed; URL remains p4. */
internal object WebLinkHandler453 : Fingerprint(
    definingClass = "Lcom/instagram/barcelona/weblink/WebLinkUseCase;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Landroid/content/Context;",
        "LX/1Ld;",
        "Ljava/lang/Long;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "L",
    ),
    filters = listOf(string("android.intent.action.VIEW")),
)
