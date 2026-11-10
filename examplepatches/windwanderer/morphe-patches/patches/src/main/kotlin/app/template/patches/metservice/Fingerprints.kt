package app.template.patches.metservice

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Premium check → always return true.
 *
 * Search: getBoolean("premium_ad_free_enabled", true)
 *
 * No definingClass/name (obfuscated, changes every release): located by the
 * stable string plus the SharedPreferences call structure.
 */
object AppStateAdFreeFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        string("premium_ad_free_enabled"),
        methodCall(smali = "Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
        opcode(Opcode.IF_EQZ, MatchAfterImmediately())
    )
)

/**
 * Splash delay → zero the 2 second constant.
 *
 * Search: 2L, timeUnit
 *
 * No definingClass/name: matched by the wide literal 2 and the
 * (long, TimeUnit, obfuscated) -> obfuscated call signature.
 * The literal is restricted to CONST_WIDE* opcodes, so int constants
 * like `const/4 v2, 0x2` are never matched.
 */
object SplashPresenterTimerFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        literal(
            2,
            opcodes = listOf(Opcode.CONST_WIDE_16, Opcode.CONST_WIDE)
        ),
        methodCall(
            parameters = listOf("J", "Ljava/util/concurrent/TimeUnit;", "L"),
            returnType = "L",
            location = MatchAfterWithin(3)
        )
    )
)
