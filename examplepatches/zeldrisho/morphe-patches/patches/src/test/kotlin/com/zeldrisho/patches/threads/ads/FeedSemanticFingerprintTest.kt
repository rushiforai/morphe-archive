package com.zeldrisho.patches.threads.ads

import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction51l
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import org.junit.Rule
import org.junit.rules.TemporaryFolder
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

class FeedSemanticFingerprintTest {
    @get:Rule val temporary = TemporaryFolder()

    /** Creates an isolated Threads patch context for class-scoped fingerprint matching. */
    private fun context(): BytecodePatchContext {
        val config = PatcherConfig(apkFile = temporary.newFile("input.apk"), temporaryFilesPath = temporary.newFolder())
        val metadata = PackageMetadata::class.java.constructors.single().newInstance(
            "com.instagram.barcelona",
            "434.0.0.41.74",
            "510406926",
            null,
        )
        return BytecodePatchContext::class.java
            .getConstructor(PatcherConfig::class.java, PackageMetadata::class.java).newInstance(config, metadata)
    }

    /** Builds a public synthetic method with optional instructions and configurable parameter types. */
    private fun method(
        owner: String,
        name: String,
        result: String,
        code: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>?,
        parameters: List<String> = emptyList(),
    ) = ImmutableMethod(
        owner,
        name,
        parameters.map { ImmutableMethodParameter(it, emptySet(), null) },
        result,
        AccessFlags.PUBLIC.value,
        emptySet(),
        emptySet(),
        code?.let { ImmutableMethodImplementation(4, it, emptyList(), emptyList()) },
    )

    /** Wraps the supplied methods in a public synthetic class for fingerprint matching. */
    private fun owner(type: String, vararg methods: Method) = ImmutableClassDef(
        type,
        AccessFlags.PUBLIC.value,
        "Ljava/lang/Object;",
        emptyList(),
        null,
        emptySet(),
        emptyList(),
        methods.toList(),
    )

    /** Verifies that feed-content and item-media accessors resolve despite renamed methods. */
    @Test fun feedContentAndThreadItemMediaAccessorsResolveByStableShape() {
        val feedOwner = "LFeedWrapper;"
        val content = method(
            feedOwner,
            "renamedContent",
            "L",
            listOf(ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference("feedContent"))),
        )
        val itemOwner = "Lcom/instagram/api/schemas/ThreadItemIntf;"
        val itemMedia = ImmutableMethod(
            itemOwner,
            "renamedMedia",
            emptyList(),
            "Lcom/instagram/feed/media/Media;",
            AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value,
            emptySet(),
            emptySet(),
            null,
        )
        with(context()) {
            FeedContentAccessor.clearMatch()
            assertEquals("renamedContent", FeedContentAccessor.matchAll(owner(feedOwner, content), 1..1).single().originalMethod.name)
            assertEquals("renamedMedia", threadItemMediaAccessor().matchAll(owner(itemOwner, itemMedia), 1..1).single().originalMethod.name)
        }
    }

    /** Verifies that the ad helper is selected by its pair of GraphQL literals. */
    @Test fun selectsMediaHelperByBothGraphQlLiterals() {
        val good = method(
            "LHelper;",
            "good",
            "Z",
            listOf(
                ImmutableInstruction51l(Opcode.CONST_WIDE, 0, -0x79965650L),
                ImmutableInstruction51l(Opcode.CONST_WIDE, 1, 0x10e895f0L),
            ),
            listOf("LObject;"),
        )
        val bad = method("LHelper;", "bad", "Z", listOf(ImmutableInstruction51l(Opcode.CONST_WIDE, 0, 7L)), listOf("LObject;"))
        with(context()) {
            assertEquals("good", MediaAdPredicateHelper.matchAll(owner("LHelper;", good, bad), 1..1).single().originalMethod.name)
        }
    }

    /** Verifies that a renamed media predicate matches the helper construction and return sequence. */
    @Test fun mediaPredicateMustConstructAndReturnTheResolvedHelper() {
        val helper = ImmutableMethodReference("LHelper;", "test", listOf("LObject;"), "Z")
        val code = listOf(
            ImmutableInstruction21c(Opcode.NEW_INSTANCE, 0, ImmutableTypeReference("LObject;")),
            ImmutableInstruction35c(Opcode.INVOKE_STATIC, 1, 0, 0, 0, 0, 0, helper),
            ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
            ImmutableInstruction11x(Opcode.RETURN, 0),
        )
        val candidate = method("Lcom/instagram/feed/media/Media;", "renamed", "Z", code)
        with(context()) {
            assertEquals("renamed", mediaAdPredicate(helper).matchAll(owner(candidate.definingClass, candidate), 1..1).single().originalMethod.name)
        }
    }

    /** Verifies that empty implementations fail the required feed semantic fingerprints. */
    @Test fun semanticFingerprintsRejectMissingSignals() {
        val feedClass = "LFeed;"
        val anchor = ImmutableMethodReference(feedClass, "anchor", emptyList(), "V")
        val empty = method(feedClass, "empty", "L", emptyList())
        val mediaType = "Lcom/instagram/feed/media/Media;"
        with(context()) {
            assertFailsWith<app.morphe.patcher.patch.PatchException> {
                mediaAdPredicate(ImmutableMethodReference("LHelper;", "test", emptyList(), "Z"))
                    .matchOrNull(method("Lcom/instagram/feed/media/Media;", "predicate", "Z", emptyList()))
            }
            assertFailsWith<app.morphe.patcher.patch.PatchException> { feedThreadAccessor(anchor).matchOrNull(empty) }
            assertFailsWith<app.morphe.patcher.patch.PatchException> {
                feedWrapperAccessor(anchor, "Lcom/instagram/api/schemas/ThreadIntf;").matchOrNull(empty)
            }
            assertFailsWith<app.morphe.patcher.patch.PatchException> {
                feedWrapperAccessor(anchor, mediaType).matchOrNull(empty)
            }
            val noLiterals = method("LHelper;", "noLiterals", "Z", emptyList(), listOf("LObject;"))
            assertFailsWith<app.morphe.patcher.patch.PatchException> { MediaAdPredicateHelper.matchOrNull(noLiterals) }
        }
    }

    /** Verifies thread and media accessor matches using their anchor calls and type operations. */
    @Test fun threadAndWrapperAccessorsRequireTheirSemanticShape() {
        val feedClass = "LFeed;"
        val anchor = ImmutableMethodReference(feedClass, "anchor", emptyList(), "V")
        val threadType = "Lcom/instagram/api/schemas/ThreadIntf;"
        val field = ImmutableFieldReference(feedClass, "thread", threadType)
        val threadGetter = method(
            feedClass,
            "thread",
            "L",
            listOf(
                ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 0, 0, 0, 0, 0, anchor),
                ImmutableInstruction21c(Opcode.CHECK_CAST, 0, ImmutableTypeReference(threadType)),
                ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 1, field),
            ),
        )
        val threadWrapper = method(
            feedClass,
            "threadWrapper",
            threadType,
            listOf(
                ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 0, 0, 0, 0, 0, anchor),
                ImmutableInstruction21c(Opcode.CHECK_CAST, 0, ImmutableTypeReference(threadType)),
                ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 1, field),
            ),
        )
        val mediaType = "Lcom/instagram/feed/media/Media;"
        val mediaTest = method(
            feedClass,
            "media",
            mediaType,
            listOf(
                ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 0, 0, 0, 0, 0, anchor),
                ImmutableInstruction22c(Opcode.INSTANCE_OF, 0, 1, ImmutableTypeReference(mediaType)),
                ImmutableInstruction35c(
                    Opcode.INVOKE_INTERFACE,
                    1,
                    0,
                    0,
                    0,
                    0,
                    0,
                    ImmutableMethodReference("LFeed;", "readMedia", emptyList(), mediaType),
                ),
            ),
        )
        with(context()) {
            assertEquals("thread", feedThreadAccessor(anchor).matchAll(owner(feedClass, threadGetter), 1..1).single().originalMethod.name)
            assertEquals("threadWrapper", feedWrapperAccessor(anchor, threadType).matchAll(owner(feedClass, threadWrapper), 1..1).single().originalMethod.name)
            assertEquals(
                "media",
                feedWrapperAccessor(anchor, "Lcom/instagram/feed/media/Media;")
                    .matchAll(owner(feedClass, mediaTest), 1..1).single().originalMethod.name,
            )
        }
    }
}
