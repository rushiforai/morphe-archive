package com.zeldrisho.patches.bundle

import kotlin.test.Test
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

/** Negative archive-shape fixtures for the embedded extension contract. */
class EmbeddedDexContractVerifierTest {
    @Test
    fun expectedExtensionSetIsAccepted() {
        verifyEmbeddedExtensionEntries(expectedEmbeddedExtensionPaths)
    }

    @Test
    fun missingExtensionIsRejected() {
        val entries = expectedEmbeddedExtensionPaths - "extensions/zalo.mpe"
        val failure = assertFailsWith<IllegalStateException> {
            verifyEmbeddedExtensionEntries(entries)
        }
        assertTrue(failure.message.orEmpty().contains("expected"))
    }

    @Test
    fun crossAppExtensionIsRejected() {
        val entries = expectedEmbeddedExtensionPaths + "extensions/threads.mpe"
        val failure = assertFailsWith<IllegalStateException> {
            verifyEmbeddedExtensionEntries(entries)
        }
        assertTrue(failure.message.orEmpty().contains("cross-app"))
    }

    @Test
    fun unrelatedZipEntriesDoNotBecomeExtensionArtifacts() {
        verifyEmbeddedExtensionEntries(expectedEmbeddedExtensionPaths + "META-INF/MANIFEST.MF")
    }
}
