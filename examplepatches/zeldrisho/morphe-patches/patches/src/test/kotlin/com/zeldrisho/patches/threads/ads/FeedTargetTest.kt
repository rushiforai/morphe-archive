package com.zeldrisho.patches.threads.ads

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

    /** Builds class fixtures for a reflection member set, optionally transforming methods. */
    private fun reflectionClasses(
        members: List<FeedReflectionMember> = feedReflectionMembers,
        transform: (FeedReflectionMember, ImmutableMethod) -> ImmutableMethod? = { _, m -> m },
    ) = members.groupBy { it.owner }.mapValues { (owner, owned) ->
        classDef(
            owner,
            owned.mapNotNull { member ->
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

    /** Verifies that each complete supported reflection contract is accepted. */
    @Test fun acceptsCompleteReflectionContract() {
        for (members in feedReflectionMemberSets) {
            validateFeedReflectionContract(reflectionClasses(members)::get)
        }
    }

    /** Verifies that either supported version contract can be validated in isolation. */
    @Test fun acceptsEachVersionSetIndependently() {
        // 434 classes alone must pass even when no 445 class exists, and vice versa.
        validateFeedReflectionContract(reflectionClasses(feedReflectionMembers434)::get)
        validateFeedReflectionContract(reflectionClasses(feedReflectionMembers445)::get)
    }

    /** Verifies that incomplete members combined across versions are rejected. */
    @Test fun rejectsMixedVersionSets() {
        // Half of each set (e.g. 434 Media.DED + 445 wrapper) must NOT validate:
        // a half-drifted app fails loudly instead of filtering with the wrong predicate.
        val mixed = (feedReflectionMembers434.take(3) + feedReflectionMembers445.takeLast(3))
            .groupBy { it.owner }.mapValues { (owner, owned) ->
                classDef(
                    owner,
                    owned.map {
                        ImmutableMethod(
                            owner,
                            it.name,
                            emptyList(),
                            it.returnType,
                            AccessFlags.PUBLIC.value,
                            emptySet(),
                            emptySet(),
                            null,
                        )
                    },
                )
            }
        assertFailsWith<IllegalStateException> { validateFeedReflectionContract(mixed::get) }
        // Both complete sets at once must also fail: exactly one version may match.
        val bothComplete = reflectionClasses(feedReflectionMemberSets.flatten())
        assertFailsWith<IllegalStateException> { validateFeedReflectionContract(bothComplete::get) }
    }

    /** Verifies that every missing member produces an actionable validation failure. */
    @Test fun rejectsEveryMissingMemberWithAnActionableMessage() {
        for (members in feedReflectionMemberSets) {
            for (missing in members) {
                val classes = reflectionClasses(members) { member, method ->
                    method.takeUnless { member == missing }
                }
                val error = assertFailsWith<IllegalStateException> {
                    validateFeedReflectionContract(classes::get)
                }
                assertTrue(error.message!!.contains("${missing.owner}->${missing.name}()${missing.returnType}"))
                assertTrue(error.message!!.contains("docs/qa-checklist.md"))
            }
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
        val wanted = feedReflectionMemberSets.flatten().map { it.owner }.toSet() + FeedMergeMethod.definingClass!!
        val classes = container.dexEntryNames.asSequence().flatMap {
            container.getEntry(it)!!.dexFile.classes.asSequence()
        }.filter { it.type in wanted }.associateBy { it.type }
        validateFeedReflectionContract(classes::get)
        with(context()) {
            FeedMergeMethod.clearMatch()
            val match = FeedMergeMethod.matchAll(classes.getValue(FeedMergeMethod.definingClass!!), 1..1).single()
            // Merge entry is A0F on 434, A0G on 445 (same param shape, .locals 37).
            assertTrue(
                match.originalMethod.name in setOf("A0F", "A0G"),
                "unexpected merge method: ${match.originalMethod.name}",
            )
            assertEquals(46, match.originalMethod.implementation!!.registerCount)
        }
    }
}
