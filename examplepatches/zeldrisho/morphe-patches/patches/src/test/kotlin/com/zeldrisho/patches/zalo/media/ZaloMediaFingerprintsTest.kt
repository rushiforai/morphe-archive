package com.zeldrisho.patches.zalo.media

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import org.junit.Assume.assumeTrue
import org.junit.Rule
import org.junit.rules.TemporaryFolder
import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class ZaloMediaFingerprintsTest {
    @get:Rule val temporary = TemporaryFolder()

    /** Creates an isolated patch context for each fingerprint assertion. */
    private fun context(): BytecodePatchContext {
        val config = PatcherConfig(
            apkFile = temporary.newFile(),
            temporaryFilesPath = temporary.newFolder(),
        )
        val metadata = PackageMetadata::class.java.constructors.single().newInstance(
            "com.zing.zalo",
            "26.08.01",
            "260801903",
            null,
        )
        return BytecodePatchContext::class.java
            .getConstructor(PatcherConfig::class.java, PackageMetadata::class.java)
            .newInstance(config, metadata)
    }

    /** Verifies the media-expiry fingerprint against the pinned Zalo APK. */
    @Test
    fun matchesPinnedZaloApk() {
        val path = System.getenv("ZALO_TEST_APK")
        assumeTrue("Set ZALO_TEST_APK to the pinned Zalo base APK", !path.isNullOrBlank())
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val clazz = container.dexEntryNames.asSequence()
            .map { container.getEntry(it)!!.dexFile.classes }
            .flatMap { it.asSequence() }
            .first { it.type == "Lvk0/g;" }

        with(context()) {
            MediaExpiryStatus.clearMatch()
            val matches = MediaExpiryStatus.matchAll(clazz, 1..1)
            assertEquals(1, matches.size)
            val method = matches.single().originalMethod
            assertEquals("n", method.name)
            assertTrue(method.accessFlags and 0x10 != 0, "target method must remain final")
        }
    }

    /** Verifies all original-photo-quality fingerprints against the pinned Zalo APK. */
    @Test
    fun matchesPinnedOriginalPhotoQualityMethods() {
        val path = System.getenv("ZALO_TEST_APK")
        assumeTrue("Set ZALO_TEST_APK to the pinned Zalo base APK", !path.isNullOrBlank())
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val classes = container.dexEntryNames.asSequence()
            .map { container.getEntry(it)!!.dexFile.classes }
            .flatMap { it.asSequence() }
            .associateBy { it.type }

        with(context()) {
            val qualityClass = classes.getValue("Luh1/u;")
            listOf(
                SelectedMediaQuality to "c",
                OriginalMediaQualityEnabled to "b",
                OriginalMediaQualityEntitled to "f",
                OriginalMediaQualityAvailable to "e",
            ).forEach { (fingerprint, expectedName) ->
                assertMethod(fingerprint, qualityClass, expectedName)
            }
            assertMethod(QualityPickerArguments, classes.getValue("Luh1/b;"), "a")
            assertMethod(
                PickerQualityInitialization,
                classes.getValue("Lcom/zing/zalo/ui/picker/mediapicker/MediaPickerView;"),
                "b7",
            )
            assertMethod(
                PhotoQualityChipUpdate,
                classes.getValue("Lcom/zing/zalo/ui/picker/mediapicker/MediaPickerView;"),
                "y6",
            )
            assertMethod(
                LandingPageQualityChipUpdate,
                classes.getValue("Lcom/zing/zalo/ui/picker/landingpage/LandingPageView;"),
                "B6",
            )
            assertMethod(
                LandingPageQualityChipInitialization,
                classes.getValue("Lcom/zing/zalo/ui/picker/landingpage/LandingPageView;"),
                "W4",
            )
            assertMethod(
                ChatInputBarQualityChipUpdate,
                classes.getValue("Lcom/zing/zalo/ui/chat/widget/inputbar/ChatInputBar;"),
                "r",
            )
            assertMethod(
                QualityChipLabel,
                classes.getValue("Lcom/zing/zalo/ui/picker/mediapicker/MediaPickerQualityChip;"),
                "setText",
            )
        }
    }

    /** Asserts that a fingerprint resolves to one method with the expected name. */
    private fun assertMethod(fingerprint: Fingerprint, clazz: ClassDef, expectedName: String) {
        with(context()) {
            fingerprint.clearMatch()
            val matches = fingerprint.matchAll(clazz, 1..1)
            assertEquals(1, matches.size, "${fingerprint::class.simpleName} must match once")
            assertEquals(expectedName, matches.single().originalMethod.name)
        }
    }
}
