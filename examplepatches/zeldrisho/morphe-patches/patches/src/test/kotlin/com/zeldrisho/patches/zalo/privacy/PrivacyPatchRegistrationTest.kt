package com.zeldrisho.patches.zalo.privacy

import kotlin.test.Test
import kotlin.test.assertEquals

class PrivacyPatchRegistrationTest {
    @Test
    fun registersPrivacyPatchesWithExpectedNames() {
        assertEquals("Enable avatar saving", enableZaloAvatarSavingPatch.name)
        assertEquals("Enable profile cover saving", enableZaloProfileCoverSavingPatch.name)
        assertEquals("Suppress outbound seen status", suppressZaloSeenStatusPatch.name)
        assertEquals("Suppress outbound typing status", suppressZaloTypingStatusPatch.name)
    }
}
