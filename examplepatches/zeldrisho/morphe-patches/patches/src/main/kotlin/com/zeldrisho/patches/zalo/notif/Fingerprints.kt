package com.zeldrisho.patches.zalo.notif

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/*
 * Zalo 26.08.01 promo-notification gates (versionCode 260801903, APKMirror arm64-v8a).
 *
 * Lpy/i;.j0() is the push dispatcher: it hashes EXTRA_KEY_TYPE, maps each type
 * string to an int key, then packed-switches the key to an Lpy/m channel enum
 * (verified type map in analysis/zalo-26.08.01/notes/batch2-evidence.md §1).
 * The Lpy/i + Lpy/m + Lpy/p holder classes are non-obfuscated; the j0 name is
 * pinned to this exact version via COMPATIBILITY_ZALO — re-verify per update.
 */

/** Timeline/Stories arm: `sget SOCIAL_STORY` immediately followed by `goto :goto_4`. */
internal object StoryChannelArm : Fingerprint(
    definingClass = "Lpy/i;",
    name = "j0",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("EXTRA_KEY_TYPE"),
        fieldAccess(definingClass = "Lpy/m;", name = "SOCIAL_STORY", type = "Lpy/m;"),
        opcode(Opcode.GOTO),
    ),
)

/** Zalo Video arm: `sget ZALO_VIDEO` immediately followed by `goto :goto_4`. */
internal object VideoChannelArm : Fingerprint(
    definingClass = "Lpy/i;",
    name = "j0",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("EXTRA_KEY_TYPE"),
        fieldAccess(definingClass = "Lpy/m;", name = "ZALO_VIDEO", type = "Lpy/m;"),
        opcode(Opcode.GOTO),
    ),
)
