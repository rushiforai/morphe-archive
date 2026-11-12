package app.template.patches.bare.font

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Chromium's Linker.takeSharedRelrosFromAidl (inlined into LibraryLoader by R8).
 * It remaps libchrome's RELRO onto a read-only shared memfd that the hook can
 * no longer make writable (mprotect -> EACCES). Chromium 155 fixed the RELRO
 * fd marshalling bug that previously kept children on private RELRO pages.
 */
internal object SharedRelroConsumerFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lorg/chromium/base/library_loader/IRelroLibInfo;"),
    filters = listOf(string("Failed to create LibInfo from aidl.")),
)
