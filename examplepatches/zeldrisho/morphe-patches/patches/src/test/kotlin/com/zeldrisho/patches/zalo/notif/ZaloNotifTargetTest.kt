package com.zeldrisho.patches.zalo.notif

import app.morphe.patcher.FieldAccessFilter
import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.junit.Assume.assumeTrue
import org.junit.Rule
import org.junit.rules.TemporaryFolder
import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class ZaloNotifTargetTest {
    @get:Rule val temporary = TemporaryFolder()

    /** Creates a patch context with the pinned Zalo package metadata. */
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

    /** Builds a synthetic public class containing the supplied methods. */
    private fun classDef(type: String, methods: List<Method>) = ImmutableClassDef(
        type,
        AccessFlags.PUBLIC.value,
        "Ljava/lang/Object;",
        emptyList(),
        null,
        emptySet(),
        emptyList(),
        methods,
    )

    /** Minimal dispatcher arm: type string, channel sget, jump to the post path. */
    private fun armMethod(channel: String) = ImmutableMethod(
        "Lpy/i;",
        "j0",
        emptyList(),
        "V",
        AccessFlags.PUBLIC.value,
        emptySet(),
        emptySet(),
        ImmutableMethodImplementation(
            3,
            listOf(
                ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference("EXTRA_KEY_TYPE")),
                ImmutableInstruction21c(
                    Opcode.SGET_OBJECT,
                    1,
                    ImmutableFieldReference("Lpy/m;", channel, "Lpy/m;"),
                ),
                ImmutableInstruction10t(Opcode.GOTO, 0),
            ),
            emptyList(),
            emptyList(),
        ),
    )

    @Test fun armsMatchSyntheticDispatcher() {
        with(context()) {
            StoryChannelArm.clearMatch()
            assertEquals(
                "j0",
                StoryChannelArm.matchAll(classDef("Lpy/i;", listOf(armMethod("SOCIAL_STORY"))), 1..1)
                    .single().originalMethod.name,
            )
            VideoChannelArm.clearMatch()
            assertEquals(
                "j0",
                VideoChannelArm.matchAll(classDef("Lpy/i;", listOf(armMethod("ZALO_VIDEO"))), 1..1)
                    .single().originalMethod.name,
            )
        }
    }

    @Test fun armFingerprintsRejectWrongChannel() {
        with(context()) {
            StoryChannelArm.clearMatch()
            assertTrue(
                StoryChannelArm.matchOrNull(
                    armMethod("CHAT"),
                    classDef("Lpy/i;", listOf(armMethod("CHAT"))),
                ) == null,
            )
            VideoChannelArm.clearMatch()
            assertTrue(
                VideoChannelArm.matchOrNull(
                    armMethod("DEFAULT"),
                    classDef("Lpy/i;", listOf(armMethod("DEFAULT"))),
                ) == null,
            )
        }
    }

    @Test fun dropReplacesOnlyTheArmJump() {
        val cls = classDef("Lpy/i;", listOf(armMethod("SOCIAL_STORY")))
        with(context()) {
            StoryChannelArm.clearMatch()
            val match = StoryChannelArm.matchAll(cls, 1..1).single()
            // Pure index contract first (no mutable class table needed).
            assertEquals(1 to 2, armJumpIndexes(match))
            // Then the one-for-one edit mechanics on a detached mutable copy.
            val mutable = match.originalMethod.toMutable()
            val (_, gotoIndex) = armJumpIndexes(match)
            val before = mutable.implementation!!.instructions.toList()
            mutable.replaceInstruction(gotoIndex, "return-void")
            val after = mutable.implementation!!.instructions.toList()
            assertEquals(before.size, after.size, "one-for-one replace preserves offsets")
            assertEquals(Opcode.RETURN_VOID, after[gotoIndex].opcode)
            assertEquals(Opcode.SGET_OBJECT, after[gotoIndex - 1].opcode, "channel sget is preserved")
        }
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
            // armJumpIndexes is pure over the immutable match, so the production
            // adjacency contract is asserted directly against the real DEX here.
            for ((fingerprint, channel) in listOf(StoryChannelArm to "SOCIAL_STORY", VideoChannelArm to "ZALO_VIDEO")) {
                fingerprint.clearMatch()
                val match = fingerprint.matchAll(classes.getValue("Lpy/i;"), 1..1).single()
                assertEquals("j0", match.originalMethod.name)
                val insns = match.originalMethod.implementation!!.instructions.toList()
                assertTrue(insns.size > 500, "expected the full j0 dispatcher, found ${insns.size} insns")
                armJumpIndexes(match)
            }
        }
    }
}
