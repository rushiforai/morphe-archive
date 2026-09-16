package com.zeldrisho.patches.zalo.media

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal object MediaExpiryStatus : Fingerprint(
    definingClass = "Lvk0/g;",
    name = "n",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Lvk0/a;",
    parameters = listOf("Lo00/q;", "Lo00/e2;"),
    filters = listOf(
        fieldAccess(definingClass = "Lvk0/a;", name = "BIG_FILE_EXPIRED", type = "Lvk0/a;"),
        fieldAccess(definingClass = "Lvk0/a;", name = "BIG_FILE_NOT_EXPIRED", type = "Lvk0/a;"),
    ),
)

internal object SelectedMediaQuality : Fingerprint(
    definingClass = "Luh1/u;",
    name = "c",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(string("LAST_SELECTION_MEDIA_QUALITY_")),
)

internal object OriginalMediaQualityAvailable : Fingerprint(
    definingClass = "Luh1/u;",
    name = "e",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = "Luh1/u;", name = "b", returnType = "Z"),
        methodCall(definingClass = "Luh1/u;", name = "f", returnType = "Z"),
    ),
)
