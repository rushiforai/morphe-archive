package app.template.patches.bare.font

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * Chromium's Linker.loadLibraryImplLocked. Its PRODUCE branch calls
 * LinkerJni.nativeLoadLibrary(path, info, spawnRelroRegion = true), which
 * moves the producer's own RELRO onto read-only shared ashmem. Chromium's App
 * Zygote is the producer, so every renderer forked from it inherits that
 * read-only mapping and the native hook cannot patch libchrome imports.
 */
internal object SharedRelroProducerFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(string("Unable to load with Linker, using the system linker instead")),
)

internal const val LINKER_JNI_CLASS = "Lorg/chromium/base/library_loader/LinkerJni;"
