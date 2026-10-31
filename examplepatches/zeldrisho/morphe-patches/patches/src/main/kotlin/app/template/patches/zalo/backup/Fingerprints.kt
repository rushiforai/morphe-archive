package app.template.patches.zalo.backup

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/** Native message-backup execution path; reads an account-specific interval. */
internal object BackupScheduler : Fingerprint(
    definingClass = "Lml/c;",
    name = "g",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("I"),
)

/** Checks whether a target backup has eligible Google Drive account metadata. */
internal object MediaBackupEligibility : Fingerprint(
    definingClass = "Lmm/k;",
    name = "m",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("Lcom/zing/zalo/data/backuprestore/model/TargetBackupInfo;"),
)

/** Native backup scheduler and media-backup eligibility in Zalo 26.10.02. */
internal object BackupScheduler261002 : Fingerprint(
    definingClass = "Lxm/c;", name = "g", accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z", parameters = listOf("I"), filters = listOf(string("SERVER_CONFIG_SYNC_MESSAGE_INTERVAL_")),
)
internal object MediaBackupEligibility261002 : Fingerprint(
    definingClass = "Lxn/j;", name = "n", accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z", parameters = listOf("Lcom/zing/zalo/data/backuprestore/model/TargetBackupInfo;"),
    filters = listOf(
        methodCall(definingClass = "Landroid/text/TextUtils;", name = "isEmpty"),
        app.morphe.patcher.fieldAccess(definingClass = "Landroid/util/Patterns;", name = "EMAIL_ADDRESS"),
        methodCall(definingClass = "Ljava/util/regex/Matcher;", name = "matches", returnType = "Z"),
    ),
)
internal object BackupConfiguration261002 : Fingerprint(
    definingClass = "Lym/c;", name = "h", accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V", parameters = listOf("Lorg/json/JSONObject;", "Lorg/json/JSONObject;", "Lorg/json/JSONObject;", "Z"),
    filters = listOf(
        string("ENABLE_BACKUP_MEDIA"),
        methodCall(definingClass = "Lp60/p0;", name = "x", returnType = "V", parameters = listOf("Ljava/lang/String;", "Z", "Z")),
    ),
)

/** Parses the server backup configuration for Zalo 26.08.01. */
internal object BackupConfiguration : Fingerprint(
    definingClass = "Lnl/c;",
    name = "h",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lorg/json/JSONObject;", "Lorg/json/JSONObject;", "Lorg/json/JSONObject;", "Z"),
    filters = listOf(
        string("ENABLE_BACKUP_MEDIA"),
        methodCall(
            definingClass = "Lu40/p0;",
            name = "i0",
            returnType = "V",
            parameters = listOf("Ljava/lang/String;", "Z", "Z"),
        ),
    ),
)
