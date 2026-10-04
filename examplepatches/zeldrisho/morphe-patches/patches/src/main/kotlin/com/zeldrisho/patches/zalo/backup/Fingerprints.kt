package com.zeldrisho.patches.zalo.backup

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
