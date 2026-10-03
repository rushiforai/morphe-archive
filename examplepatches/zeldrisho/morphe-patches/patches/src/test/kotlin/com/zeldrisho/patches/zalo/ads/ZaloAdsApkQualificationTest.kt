package com.zeldrisho.patches.zalo.ads

import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import org.junit.Assume.assumeTrue
import org.junit.Rule
import org.junit.rules.TemporaryFolder
import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/** Opt-in DEX qualification against the pinned Zalo APK; skipped in CI without the private input. */
class ZaloAdsApkQualificationTest {
    @get:Rule val temporary = TemporaryFolder()

    /** Creates an isolated Zalo patch context for class-scoped fingerprint matching. */
    private fun context(): BytecodePatchContext {
        val config = PatcherConfig(apkFile = temporary.newFile("input.apk"), temporaryFilesPath = temporary.newFolder())
        val metadata = PackageMetadata::class.java.constructors.single().newInstance(
            "com.zing.zalo",
            "26.08.01",
            "260801903",
            null,
        )
        return BytecodePatchContext::class.java.getConstructor(PatcherConfig::class.java, PackageMetadata::class.java)
            .newInstance(config, metadata)
    }

    /** Opt-in local DEX validation against the pinned Zalo base APK; skipped in CI. */
    @Test fun matchesPinnedZaloApkWhenProvided() {
        val path = System.getenv("ZALO_TEST_APK")
        assumeTrue("Set ZALO_TEST_APK to the pinned Zalo base APK for DEX validation", !path.isNullOrBlank())
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val classes = container.dexEntryNames.asSequence().flatMap {
            container.getEntry(it)!!.dexFile.classes.asSequence()
        }.associateBy { it.type }
        with(context()) {
            OfflineAdsWindow.clearMatch()
            assertEquals(
                "h",
                OfflineAdsWindow.matchAll(classes.getValue("Lvx/s2;"), 1..1).single().originalMethod.name,
            )
            OfflineAdsGate.clearMatch()
            assertEquals(
                "g",
                OfflineAdsGate.matchAll(classes.getValue("Lvx/s2;"), 1..1).single().originalMethod.name,
            )
            GoogleAdsNetworkGate.clearMatch()
            val network = GoogleAdsNetworkGate.matchAll(
                classes.getValue("Lcom/adtima/Adtima;"),
                1..1,
            ).single()
            assertTrue(network.instructionMatches.any { it.instruction.opcode == Opcode.IF_NEZ })
            StoryAdsConfig.clearMatch()
            // Test-context matching is scoped per ClassDef (the empty input APK has no
            // global class table); production matchAll(2..2) scans the full patch context.
            StoryAdsConfig.matchAll(
                classes.getValue("Lcom/zing/zalo/social/features/story/main/ui/StoryDetailsView;"),
                1..1,
            ).single()
            StoryAdsConfig.matchAll(classes.getValue("Lkz0/u;"), 1..1).single()
            CommunityAdsConfig.clearMatch()
            CommunityAdsConfig.matchAll(classes.getValue("Ljt/m;"), 1..1).single()
            CommunityAdsConfig.matchAll(classes.getValue("Ljt/e;"), 1..1).single()
            AdtimaLatRead.clearMatch()
            val lat = AdtimaLatRead.matchAll(classes.getValue("Lcom/adtima/d;"), 1..1).single()
            assertEquals("doInBackground", lat.originalMethod.name)
            assertTrue(
                lat.originalMethod.implementation!!.tryBlocks.isNotEmpty(),
                "expected the Play lookup's catch handlers (clearBody justification)",
            )
        }
    }
}
