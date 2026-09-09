package com.zeldrisho.threads.patches.ads

import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assume.assumeTrue
import org.junit.Rule
import org.junit.rules.TemporaryFolder
import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNull
import kotlin.test.assertTrue

class FeedTargetTest {
    @get:Rule val temporary = TemporaryFolder()

    // Test-only access to JVM-public, Kotlin-internal constructors. Explicit
    // ClassDef matching needs no decoded APK or mutable DEX workspace.
    private fun context(): BytecodePatchContext {
        val config = PatcherConfig(apkFile = temporary.newFile("input.apk"), temporaryFilesPath = temporary.newFolder())
        val metadata = PackageMetadata::class.java.constructors.single().newInstance(
            "com.instagram.barcelona",
            "434.0.0.41.74",
            "510406926",
            null,
        )
        return BytecodePatchContext::class.java.getConstructor(PatcherConfig::class.java, PackageMetadata::class.java)
            .newInstance(config, metadata)
    }

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

    private fun mergeMethod(
        name: String = "renamed",
        callback: String = "Lcom/instagram/barcelona/feed/data/cache/" +
            "BarcelonaFeedCache\$addAndSaveItemsFromFeedFetchSuccess\$2\$1;",
        listType: String = "Ljava/util/List;",
    ): ImmutableMethod = ImmutableMethod(
        FeedMergeMethod.definingClass!!,
        name,
        listOf(
            "LX/Renamed;",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            listType,
            "LX/Continuation;",
            "Lkotlin/jvm/functions/Function3;",
            "Z",
        )
            .map { ImmutableMethodParameter(it, emptySet(), null) },
        "Ljava/lang/Object;",
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        emptySet(),
        emptySet(),
        // Minimal synthetic matching fixture, not executable app bytecode.
        ImmutableMethodImplementation(
            46,
            listOf(
                ImmutableInstruction3rc(
                    Opcode.INVOKE_DIRECT_RANGE,
                    0,
                    1,
                    ImmutableMethodReference(callback, "<init>", emptyList(), "V"),
                ),
            ),
            emptyList(),
            emptyList(),
        ),
    )

    @Test fun matchesRenamedMethodAndObjectParameters() {
        val method = mergeMethod()
        val cls = classDef(method.definingClass, listOf(method))
        with(context()) {
            FeedMergeMethod.clearMatch()
            assertEquals("renamed", FeedMergeMethod.matchAll(cls, 1..1).single().originalMethod.name)
        }
    }

    @Test fun rejectsMissingCallbackAndWrongListPosition() {
        with(context()) {
            for (method in listOf(mergeMethod(callback = "Lother/Callback;"), mergeMethod(listType = "Ljava/lang/String;"))) {
                FeedMergeMethod.clearMatch()
                assertNull(FeedMergeMethod.matchOrNull(method, classDef(method.definingClass, listOf(method))))
            }
        }
    }

    @Test fun rejectsAmbiguousMergeTargets() {
        val methods = listOf(mergeMethod("first"), mergeMethod("second"))
        with(context()) {
            FeedMergeMethod.clearMatch()
            assertFailsWith<app.morphe.patcher.patch.PatchException> {
                FeedMergeMethod.matchAll(classDef(methods.first().definingClass, methods), 1..1)
            }
        }
    }

    private fun reflectionClasses(transform: (FeedReflectionMember, ImmutableMethod) -> ImmutableMethod? = { _, m -> m }) = feedReflectionMembers.groupBy { it.owner }.mapValues { (owner, members) ->
        classDef(
            owner,
            members.mapNotNull { member ->
                transform(
                    member,
                    ImmutableMethod(
                        owner,
                        member.name,
                        emptyList(),
                        member.returnType,
                        AccessFlags.PUBLIC.value,
                        emptySet(),
                        emptySet(),
                        null,
                    ),
                )
            },
        )
    }

    @Test fun acceptsCompleteReflectionContract() {
        val classes = reflectionClasses()
        validateFeedReflectionContract(classes::get)
    }

    @Test fun rejectsEveryMissingMemberWithAnActionableMessage() {
        for (missing in feedReflectionMembers) {
            val classes = reflectionClasses { member, method -> method.takeUnless { member == missing } }
            val error = assertFailsWith<IllegalStateException> { validateFeedReflectionContract(classes::get) }
            assertTrue(error.message!!.contains("${missing.owner}->${missing.name}()${missing.returnType}"))
            assertTrue(error.message!!.contains("docs/qa-checklist.md"))
        }
        assertFailsWith<IllegalStateException> { validateFeedReflectionContract { null } }
    }

    @Test fun rejectsWrongReturnTypeVisibilityStaticAndParameters() {
        for (mutation in 0..3) {
            val classes = reflectionClasses { member, method ->
                if (member != feedReflectionMembers.first()) {
                    method
                } else {
                    ImmutableMethod(
                        member.owner,
                        member.name,
                        if (mutation == 3) listOf(ImmutableMethodParameter("I", emptySet(), null)) else emptyList(),
                        if (mutation == 0) "I" else member.returnType,
                        when (mutation) {
                            1 -> AccessFlags.PRIVATE.value
                            2 -> AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
                            else -> AccessFlags.PUBLIC.value
                        },
                        emptySet(),
                        emptySet(),
                        null,
                    )
                }
            }
            assertFailsWith<IllegalStateException> { validateFeedReflectionContract(classes::get) }
        }
    }

    /** Opt-in local DEX validation; never commit or download proprietary APK fixtures in CI. */
    @Test fun matchesPinnedApkWhenProvided() {
        val path = System.getenv("THREADS_TEST_APK")
        assumeTrue("Set THREADS_TEST_APK to the original pinned base APK for DEX validation", !path.isNullOrBlank())
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val wanted = feedReflectionMembers.map { it.owner }.toSet() + FeedMergeMethod.definingClass!!
        val classes = container.dexEntryNames.asSequence().flatMap {
            container.getEntry(it)!!.dexFile.classes.asSequence()
        }.filter { it.type in wanted }.associateBy { it.type }
        validateFeedReflectionContract(classes::get)
        with(context()) {
            FeedMergeMethod.clearMatch()
            val match = FeedMergeMethod.matchAll(classes.getValue(FeedMergeMethod.definingClass!!), 1..1).single()
            assertEquals("A0F", match.originalMethod.name)
            assertEquals(46, match.originalMethod.implementation!!.registerCount)
        }
    }
}
