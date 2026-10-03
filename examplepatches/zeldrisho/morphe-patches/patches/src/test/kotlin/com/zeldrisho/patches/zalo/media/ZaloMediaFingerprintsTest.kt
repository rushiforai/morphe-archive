package com.zeldrisho.patches.zalo.media

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21s
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
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

    /** Builds a media-age candidate with a configurable preference literal and return shape. */
    private fun ageFingerprintMethod(
        owner: String,
        name: String,
        result: String,
        parameters: List<String>,
        flags: Int,
        literal: String,
    ) = ImmutableMethod(
        owner,
        name,
        parameters.map { ImmutableMethodParameter(it, emptySet(), null) },
        result,
        flags,
        emptySet(),
        emptySet(),
        ImmutableMethodImplementation(
            if (result == "J") 2 else 1,
            listOfNotNull(
                ImmutableInstruction21c(
                    com.android.tools.smali.dexlib2.Opcode.CONST_STRING,
                    0,
                    ImmutableStringReference(literal),
                ),
                if (result == "J") {
                    ImmutableInstruction21s(com.android.tools.smali.dexlib2.Opcode.CONST_WIDE_16, 0, 0)
                } else {
                    null
                },
                if (result == "J") {
                    ImmutableInstruction11x(com.android.tools.smali.dexlib2.Opcode.RETURN_WIDE, 0)
                } else {
                    ImmutableInstruction10x(com.android.tools.smali.dexlib2.Opcode.RETURN_VOID)
                },
            ),
            emptyList(),
            emptyList(),
        ),
    )

    /** Verifies backup and restore age targets reject candidates with unrelated preference keys. */
    @Test
    @Suppress("LongMethod")
    fun ageFingerprintsMatchExactPreferenceKeys() {
        val backupClass = ImmutableClassDef(
            "Lvl/c;",
            AccessFlags.PUBLIC.value,
            "Ljava/lang/Object;",
            emptyList(),
            null,
            emptySet(),
            emptyList(),
            listOf(
                ageFingerprintMethod(
                    "Lvl/c;",
                    "i",
                    "V",
                    listOf("Ljava/util/ArrayList;"),
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                    "BACKUP_MEDIA_LIMIT_TIME_DAY",
                ),
                ageFingerprintMethod(
                    "Lvl/c;",
                    "nearMiss",
                    "V",
                    listOf("Ljava/util/ArrayList;"),
                    AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                    "UNRELATED_LIMIT_TIME_DAY",
                ),
            ),
        )
        val restoreMethod = ageFingerprintMethod(
            "Ldm/d;",
            "n",
            "J",
            emptyList(),
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            "BACKUP_MEDIA_LIMIT_TIME_DAY",
        )
        val restoreClass = ImmutableClassDef(
            "Ldm/d;",
            AccessFlags.PUBLIC.value,
            "Ljava/lang/Object;",
            emptyList(),
            null,
            emptySet(),
            emptyList(),
            listOf(
                restoreMethod,
                ageFingerprintMethod(
                    "Ldm/d;",
                    "nearMiss",
                    "J",
                    emptyList(),
                    AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                    "UNRELATED_LIMIT_TIME_DAY",
                ),
            ),
        )

        with(context()) {
            MediaBackupAgeFilter.clearMatch()
            assertEquals("i", MediaBackupAgeFilter.matchAll(backupClass, 1..1).single().originalMethod.name)
            MediaRestoreAgeCutoff.clearMatch()
            assertEquals("n", MediaRestoreAgeCutoff.matchAll(restoreClass, 1..1).single().originalMethod.name)
        }
    }

    /** Wraps a mutated method in its declaring class for isolated fingerprint matching. */
    private fun classWithMethod(method: ImmutableMethod) = ImmutableClassDef(
        method.definingClass,
        AccessFlags.PUBLIC.value,
        "Ljava/lang/Object;",
        emptyList(),
        null,
        emptySet(),
        emptyList(),
        listOf(method),
    )

    /**
     * Checks that each media target rejects an instruction or method-name mutation.
     *
     * Uses the pinned ZALO_TEST_APK as the positive fixture and skips when it is unset.
     */
    @Test
    fun everyMediaFingerprintRejectsOneConstraintMutation() {
        val path = System.getenv("ZALO_TEST_APK")
        assumeTrue("Set ZALO_TEST_APK to the pinned Zalo base APK", !path.isNullOrBlank())
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val classes = dex.dexEntryNames.asSequence()
            .map { dex.getEntry(it)!!.dexFile.classes }
            .flatMap { it.asSequence() }
            .associateBy { it.type }

        with(context()) {
            mediaFingerprints.forEach { fingerprint ->
                fingerprint.clearMatch()
                val owner = classes.getValue(fingerprint.definingClass!!)
                val match = fingerprint.matchAll(owner, 1..1).single().originalMethod
                val implementation = match.implementation
                if (!fingerprint.filters.isNullOrEmpty() && implementation != null) {
                    val instructions = implementation.instructions.toList()
                    val rejectsNearMiss = instructions.indices.any { mutatedIndex ->
                        val mutatedInstructions = instructions.toMutableList().apply {
                            this[mutatedIndex] = ImmutableInstruction10x(Opcode.NOP)
                        }
                        val mutatedMethod = ImmutableMethod(
                            match.definingClass,
                            match.name,
                            match.parameters,
                            match.returnType,
                            match.accessFlags,
                            match.annotations,
                            match.hiddenApiRestrictions,
                            ImmutableMethodImplementation(
                                implementation.registerCount,
                                mutatedInstructions,
                                implementation.tryBlocks,
                                implementation.debugItems,
                            ),
                        )
                        fingerprint.clearMatch()
                        fingerprint.matchAll(classWithMethod(mutatedMethod), 0..1).isEmpty()
                    }
                    assertTrue(rejectsNearMiss, "${fingerprint.name} must reject a one-instruction near-miss")
                } else {
                    val renamed = ImmutableMethod(
                        match.definingClass,
                        "${match.name}_near_miss",
                        match.parameters,
                        match.returnType,
                        match.accessFlags,
                        match.annotations,
                        match.hiddenApiRestrictions,
                        implementation,
                    )
                    assertTrue(
                        fingerprint.matchAll(classWithMethod(renamed), 0..1).isEmpty(),
                        "${fingerprint.name} must reject a method-name near-miss",
                    )
                }
            }
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
