package com.zeldrisho.patches.threads.links

import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.zeldrisho.patches.testing.syntheticMutableMethod
import org.junit.Rule
import org.junit.rules.TemporaryFolder
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class OpenLinksExternallyTest {
    @get:Rule val temporary = TemporaryFolder()

    /** Creates an isolated Threads patch context for class-scoped fingerprint matching. */
    private fun context(): BytecodePatchContext {
        val config = PatcherConfig(apkFile = temporary.newFile("input.apk"), temporaryFilesPath = temporary.newFolder())
        val metadata = PackageMetadata::class.java.constructors.single().newInstance(
            "com.instagram.barcelona",
            "449.0.0.54.82",
            "511908382",
            null,
        )
        return BytecodePatchContext::class.java.getConstructor(PatcherConfig::class.java, PackageMetadata::class.java)
            .newInstance(config, metadata)
    }

    /** Verifies that the web-link handler matches its signature and ACTION_VIEW literal after renaming. */
    @Test fun fingerprintMatchesUrlHandlerSemanticAnchor() {
        val parameters = listOf(
            "Landroid/content/Context;",
            "LX/27Z;",
            "Ljava/lang/Long;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "LX/2ay;",
        )
        val method = ImmutableMethod(
            "Lcom/instagram/barcelona/weblink/WebLinkUseCase;",
            "renamed",
            parameters.map { ImmutableMethodParameter(it, emptySet(), null) },
            "Ljava/lang/Object;",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            emptySet(),
            emptySet(),
            ImmutableMethodImplementation(
                18,
                listOf(ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference("android.intent.action.VIEW"))),
                emptyList(),
                emptyList(),
            ),
        )
        with(context()) {
            WebLinkHandler.clearMatch()
            val owner = ImmutableClassDef(
                method.definingClass,
                AccessFlags.PUBLIC.value,
                "Ljava/lang/Object;",
                emptyList(),
                null,
                emptySet(),
                emptyList(),
                listOf(method),
            )
            assertEquals("renamed", WebLinkHandler.matchAll(owner, 1..1).single().originalMethod.name)
        }
    }

    /** Verifies the extension call and fallback branch while retaining the original NOP body. */
    @Test fun injectionUsesSafeScratchRegistersAndPreservesNormalHandler() {
        val method = syntheticMutableMethod(
            definingClass = "Lcom/instagram/barcelona/weblink/WebLinkUseCase;",
            parameters = listOf(
                "Landroid/content/Context;",
                "LX/27Z;",
                "Ljava/lang/Long;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "LX/2ay;",
            ),
            returnType = "Ljava/lang/Object;",
            registerCount = 20,
            instructions = listOf(com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x(Opcode.NOP)),
            accessFlags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        )
        injectOpenLinksExternally(method)
        val instructions = method.implementation!!.instructions
        val invoke = instructions[2] as com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
        val target = invoke.reference as com.android.tools.smali.dexlib2.iface.reference.MethodReference
        assertEquals("Lcom/zeldrisho/threads/extension/OpenLinksExternally;", target.definingClass)
        assertEquals("open", target.name)
        assertEquals(Opcode.NOP, instructions.last().opcode)
        assertEquals(9, instructions.size)
        assertTrue(instructions.any { it.opcode == Opcode.IF_EQZ })
    }
}
