package com.zeldrisho.patches.threads.misc.analytics

import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.resource.ResourceMode
import org.junit.Assume.assumeTrue
import org.junit.Rule
import org.junit.rules.TemporaryFolder
import java.io.File
import kotlin.test.Test
import kotlin.test.assertFalse

/** Opt-in execution test for Threads' AD_ID manifest callback on the pinned APK. */
class RemoveAdIdPatchCallbackApkTest {
    @get:Rule val temporary = TemporaryFolder()

    /**
     * Runs the manifest callback and checks that both advertising-ID permissions are absent.
     *
     * Skips unless THREADS_TEST_APK supplies the pinned Threads APK.
     */
    @Test
    fun adIdResourceCallbackRemovesOnlyTargetPermissionsFromPinnedApk() {
        val path = System.getenv("THREADS_TEST_APK")
        assumeTrue("Set THREADS_TEST_APK to the pinned Threads base APK", !path.isNullOrBlank())
        val config = PatcherConfig(
            apkFile = File(path!!),
            temporaryFilesPath = temporary.newFolder(),
        )
        PatcherConfig::class.java
            .getMethod("setResourceMode\$morphe_patcher", ResourceMode::class.java)
            .invoke(config, ResourceMode.FULL)
        val context = ResourcePatchContext::class.java
            .getConstructor(PatcherConfig::class.java)
            .newInstance(config)
        try {
            val mode = PatcherConfig::class.java
                .getMethod("getResourceMode\$morphe_patcher")
                .invoke(config) as ResourceMode
            ResourcePatchContext::class.java
                .getMethod("decodeResources\$morphe_patcher", ResourceMode::class.java)
                .invoke(context, mode)
            removeAdIdPatch.execute(context)
            context.document("AndroidManifest.xml").use { manifest ->
                val permissions = manifest.getElementsByTagName("uses-permission")
                assertFalse(
                    (0 until permissions.length).any { index ->
                        val element = permissions.item(index) as org.w3c.dom.Element
                        element.getAttribute("android:name") in setOf(
                            "com.google.android.gms.permission.AD_ID",
                            "android.permission.ACCESS_ADSERVICES_AD_ID",
                        )
                    },
                )
            }
        } finally {
            context.close()
        }
    }
}
