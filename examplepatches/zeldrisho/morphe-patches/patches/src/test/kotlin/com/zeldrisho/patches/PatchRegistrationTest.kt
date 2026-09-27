package com.zeldrisho.patches

import app.morphe.patcher.patch.Option
import com.zeldrisho.patches.threads.misc.analytics.removeAdIdPatch
import com.zeldrisho.patches.zalo.ads.removeZaloAdIdPatch
import com.zeldrisho.patches.zalo.misc.changeZaloAppNamePatch
import com.zeldrisho.patches.zalo.misc.changeZaloPackageNamePatch
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertTrue
import com.zeldrisho.patches.threads.misc.branding.changeAppNamePatch as threadsAppNamePatch
import com.zeldrisho.patches.threads.misc.packagename.changePackageNamePatch as threadsPackageNamePatch

/** Checks the registered metadata and defaults without requiring an APK patch run. */
class PatchRegistrationTest {
    /** Checks Threads and Zalo branding defaults and package-name option validators. */
    @Test
    fun packageAndBrandingPatchDefaultsAreRegistered() {
        assertFalse(threadsPackageNamePatch.default)
        assertEquals("Change package name", threadsPackageNamePatch.name)
        val threadsPackageOption = threadsPackageNamePatch.options.values.single { it.name == "packageName" } as Option<String>
        assertEquals("com.instagram.barcelona.morphe", threadsPackageOption.default)
        assertTrue(threadsPackageOption.validator.invoke(threadsPackageOption, "com.example.clone"))
        assertFalse(threadsPackageOption.validator.invoke(threadsPackageOption, "invalid"))

        assertFalse(changeZaloPackageNamePatch.default)
        assertEquals("Change Zalo package name", changeZaloPackageNamePatch.name)
        val zaloPackageOption = changeZaloPackageNamePatch.options.values.single { it.name == "packageName" } as Option<String>
        assertEquals("com.zing.zalo.morphe", zaloPackageOption.default)
        assertTrue(zaloPackageOption.validator.invoke(zaloPackageOption, "org.example.clone"))
        assertFalse(zaloPackageOption.validator.invoke(zaloPackageOption, "not-valid"))

        assertTrue(threadsAppNamePatch.default)
        assertEquals("Threads Morphe", threadsAppNamePatch.options.values.single { it.name == "appName" }.default)
        assertFalse(changeZaloAppNamePatch.default)
        assertEquals("Zalo Morphe", changeZaloAppNamePatch.options.values.single { it.name == "appName" }.default)
    }

    /** Verifies that both apps register ad-ID removal as enabled by default. */
    @Test
    fun adIdRemovalPatchesAreEnabledByDefault() {
        assertTrue(removeAdIdPatch.default)
        assertTrue(removeZaloAdIdPatch.default)
    }
}
