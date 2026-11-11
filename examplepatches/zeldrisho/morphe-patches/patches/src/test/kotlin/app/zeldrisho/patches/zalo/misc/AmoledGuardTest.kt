package app.zeldrisho.patches.zalo.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.toInstructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import kotlin.test.Test
import kotlin.test.assertEquals

class AmoledGuardTest {
    @Test fun enabledBranchReturnsOpaqueBlackAndDisabledFallsThrough() {
        val params = listOf("Landroid/content/Context;", "I").map {
            ImmutableMethodParameter(it, emptySet(), null)
        }
        val method = MutableMethod(ImmutableMethod("Lef1/c;", "g", params, "I",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
            ImmutableMethodImplementation(5, "const/4 v0, 0x0\nreturn v0".toInstructions(), emptyList(), emptyList())))
        method.addInstructionsWithLabels(0, AMOLED_GUARD)
        val instructions = method.implementation!!.instructions.toList()
        assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
            Opcode.CONST, Opcode.RETURN, Opcode.NOP, Opcode.CONST_4, Opcode.RETURN),
            instructions.map { it.opcode })
        assertEquals(-0x1000000, (instructions[3] as NarrowLiteralInstruction).narrowLiteral)
    }
}
