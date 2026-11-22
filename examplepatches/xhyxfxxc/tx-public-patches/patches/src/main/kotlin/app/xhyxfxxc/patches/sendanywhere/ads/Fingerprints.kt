package app.xhyxfxxc.patches.sendanywhere.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * Reads the "isAdFree" preference. Not patched, only used to find
 * the preferences class and the method below.
 */
internal object IsAdFreePreferenceFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("isAdFree"),
        methodCall(
            definingClass = "Landroid/content/SharedPreferences;",
            name = "getBoolean",
            location = MatchAfterWithin(3)
        )
    )
)

/**
 * The app's "ads are disabled" check (isAdFree preference or subscription flag).
 * Every ad placement calls it before showing an ad.
 */
internal object AdsDisabledFingerprint : Fingerprint(
    classFingerprint = IsAdFreePreferenceFingerprint,
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(reference = { IsAdFreePreferenceFingerprint.originalMethod }),
        fieldAccess(
            opcode = Opcode.IGET_BOOLEAN,
            definingClass = "this",
            type = "Z",
            location = MatchAfterWithin(4)
        )
    )
)
