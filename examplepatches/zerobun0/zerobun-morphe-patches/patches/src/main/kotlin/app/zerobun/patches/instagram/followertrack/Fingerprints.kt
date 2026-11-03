/*
 * Fingerprints adapted from Piko (https://github.com/crimera/piko, GPLv3), which
 * maintains them per Instagram release. Kept in sync by hand when Instagram updates.
 */

package app.zerobun.patches.instagram.followertrack

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import app.zerobun.patches.instagram.Constants.EXTENSION_PACKAGE
import app.zerobun.patches.instagram.Constants.USER_MODEL_CLASS
import com.android.tools.smali.dexlib2.Opcode

internal const val HOOK_CLASS = "$EXTENSION_PACKAGE/FollowerTrackHook;"
internal const val CONFIG_CLASS = "$EXTENSION_PACKAGE/Config;"

/**
 * The follow-list row binder's bindView(int, View, Object model, Object). Anchored on
 * the cast message naming the row-state type, which survives renames between releases.
 */
internal object FollowListBindViewFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I", "Landroid/view/View;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    strings = listOf(
        "null cannot be cast to non-null type com.instagram.user.userlist.adapter.FollowRowState",
    ),
)

internal object OnRowBoundHookFingerprint : Fingerprint(
    definingClass = HOOK_CLASS,
    name = "onRowBound",
)

// --- User model getters (obfuscated names, resolved per build) ---

/** Username: its JSON key is decoded at runtime, so it is matched by field id. */
internal object UserNameGetterFingerprint : Fingerprint(
    definingClass = USER_MODEL_CLASS,
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        literal(-265713450),
        methodCall(name = "getOptionalStringValueNative", location = MatchAfterWithin(1)),
    ),
)

/** The numeric id getter is the String getter called right after the "strong_id__" key. */
internal object UserIdGetterFingerprint : Fingerprint(
    definingClass = USER_MODEL_CLASS,
    returnType = "Lcom/facebook/pando/TreeUpdaterJNI;",
    filters = listOf(
        string("strong_id__"),
        methodCall(
            definingClass = "this",
            parameters = listOf(),
            returnType = "Ljava/lang/String;",
            opcode = Opcode.INVOKE_VIRTUAL,
            location = MatchAfterImmediately(),
        ),
    ),
)

internal object FullNameGetterFingerprint : Fingerprint(
    definingClass = USER_MODEL_CLASS,
    returnType = "Ljava/lang/String;",
    filters = listOf(string("full_name")),
)

internal object ProfilePicInfoGetterFingerprint : Fingerprint(
    definingClass = USER_MODEL_CLASS,
    returnType = "ProfilePicUrlInfo",
    filters = listOf(string("hd_profile_pic_url_info")),
)
