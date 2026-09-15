package com.zeldrisho.patches.zalo.media

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Zalo 26.08.01's local status classifier for cloud-backed chat files.
 *
 * `Lvk0/g;.n()` returns BIG_FILE_EXPIRED after comparing the message age with
 * the configured large-file lifetime and Z Cloud state. The file may still be
 * present locally at this point; callers use this result to replace the local
 * preview with the subscription/expired UI.
 */
internal object MediaExpiryStatus : Fingerprint(
    definingClass = "Lvk0/g;",
    name = "n",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lvk0/a;",
    parameters = listOf("Lo00/q;", "Lo00/e2;"),
    filters = listOf(
        fieldAccess(
            definingClass = "Lvk0/a;",
            name = "BIG_FILE_EXPIRED",
            type = "Lvk0/a;",
        ),
        fieldAccess(
            definingClass = "Lvk0/a;",
            name = "BIG_FILE_NOT_EXPIRED",
            type = "Lvk0/a;",
        ),
    ),
)
