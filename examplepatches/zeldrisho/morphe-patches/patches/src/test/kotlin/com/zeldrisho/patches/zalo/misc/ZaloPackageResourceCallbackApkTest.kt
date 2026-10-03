package com.zeldrisho.patches.zalo.misc

import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.ResourcePatch
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.resource.ResourceMode
import org.junit.Assume.assumeTrue
import org.junit.Rule
import org.junit.rules.TemporaryFolder
import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals

/** Opt-in exercise of package-name option application and resource finalization. */
class ZaloPackageResourceCallbackApkTest {
    @get:Rule val temporary = TemporaryFolder()

    /**
     * Verifies that resource finalization writes the selected package name to the manifest.
     *
     * Requires ZALO_TEST_APK; skips when the pinned base APK is not supplied.
     */
    @Test
    fun packageNameOptionIsAppliedByResourceFinalizer() {
        val path = System.getenv("ZALO_TEST_APK")
        assumeTrue("Set ZALO_TEST_APK to the pinned Zalo base APK", !path.isNullOrBlank())
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
            val resourcePatch = changeZaloPackageNamePatch.dependencies.single() as ResourcePatch
            resourcePatch.options.set("packageName", "com.zing.zalo.clone")
            val mode = PatcherConfig::class.java
                .getMethod("getResourceMode\$morphe_patcher")
                .invoke(config) as ResourceMode
            ResourcePatchContext::class.java
                .getMethod("decodeResources\$morphe_patcher", ResourceMode::class.java)
                .invoke(context, mode)
            resourcePatch.finalize(context)
            context.document("AndroidManifest.xml").use { manifest ->
                assertEquals("com.zing.zalo.clone", manifest.documentElement.getAttribute("package"))
            }
        } finally {
            context.close()
        }
    }
}
