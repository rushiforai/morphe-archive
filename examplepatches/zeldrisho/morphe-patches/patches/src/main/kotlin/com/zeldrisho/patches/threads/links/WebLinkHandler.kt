package com.zeldrisho.patches.threads.links

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
