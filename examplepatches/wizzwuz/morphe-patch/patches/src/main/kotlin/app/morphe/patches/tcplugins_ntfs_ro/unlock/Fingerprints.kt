package app.morphe.patches.tcplugins_ntfs_ro.unlock

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * p3.i.j()Z
 * Purchase status validity check.
 * Original logic (decompiled): returns true for FREE or PURCHASED.
 * Patch makes it always return true so any status is treated as valid/owned.
 */
internal object PurchaseStatusValidFingerprint : Fingerprint(
    definingClass = "Lp3/i;",
    name = "j",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        // enum comparison / sget-object for enum constants is typical; keep loose
        // to survive minor obfuscation differences across versions.
        opcode(Opcode.SGET_OBJECT),
        opcode(Opcode.IF_EQ),
    )
)

/**
 * q3.h.a(Landroid/content/Context;)I
 * App signature/fingerprint integrity check.
 * Original returns 0 on valid signature, 1 on mismatch, -1 on error.
 * Patch returns 0 to avoid patched-APK integrity rejection.
 */
internal object SignatureIntegrityFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("SHA")
    )
)
