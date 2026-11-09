package app.brokenn.patches.jiohotstar.integrity

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object SignatureCheckFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    filters = listOf(
        string("MD5"),
        methodCall(definingClass = "Landroid/util/Base64;", name = "encodeToString"),
        methodCall(definingClass = "Lcom/hotstar/secrets/Secrets;", name = "getSignFromJNI")
    )
)
