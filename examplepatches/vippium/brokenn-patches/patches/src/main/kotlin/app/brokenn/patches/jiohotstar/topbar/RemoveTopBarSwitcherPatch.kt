package app.brokenn.patches.jiohotstar.topbar

import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR
import app.brokenn.patches.jiohotstar.shared.Constants.TWEEN_FACTORY_CLASS
import app.brokenn.patches.jiohotstar.shared.Constants.TWEEN_FACTORY_METHOD
import app.brokenn.patches.shared.firstInstructionIndex
import app.brokenn.patches.shared.instrs
import app.brokenn.patches.shared.instructionIndices
import app.brokenn.patches.shared.nextInstructionIndex
import app.brokenn.patches.shared.zeroTweenDurations
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

@Suppress("unused")
val removeTopBarSwitcherPatch = bytecodePatch(
    name = "Remove top bar switcher",
    description = "Removes the JioHotstar/Tadka switcher from the top of Home and snaps the header expand/collapse on tab switches."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        val contentMethod = TopBarContentFingerprint.method

        // The TopBar class is only reachable through its shared j()F height accessor.
        var topBarClass: String? = null
        val contentCallIndices = contentMethod.instructionIndices { instr ->
            val ref = (instr as? ReferenceInstruction)?.reference as? MethodReference
            if (ref != null && instr.opcode == Opcode.INVOKE_STATIC &&
                ref.name == "j" && ref.returnType == "F"
            ) {
                require(topBarClass == null || topBarClass == ref.definingClass) {
                    "TopBar content: multiple distinct j()F calls in e() — ambiguous"
                }
                topBarClass = ref.definingClass
            }
            ref != null && ref.definingClass.startsWith("Lr0/")
        }
        require(topBarClass != null) {
            "TopBar content: no TopBar;->j() call found in e() (fingerprint matched the wrong method?)"
        }
        require(contentCallIndices.size == 1) {
            "TopBar content: expected one Lr0/ pills call in e() — ambiguous, refusing to guess"
        }
        val contentCallIndex = contentCallIndices.first()
        val afterContent = contentMethod.getInstruction<Instruction>(contentCallIndex + 1)
        require(afterContent.opcode != Opcode.MOVE_RESULT &&
            afterContent.opcode != Opcode.MOVE_RESULT_OBJECT &&
            afterContent.opcode != Opcode.MOVE_RESULT_WIDE
        ) {
            "TopBar content: pills call result is used — removing it is not safe"
        }
        contentMethod.removeInstruction(contentCallIndex)

        val containerMethod = TopBarContainerFingerprint.method
        val containerImpl = containerMethod.instrs()

        val containerHeightCallIndex = containerMethod.firstInstructionIndex { instr ->
            instr.opcode == Opcode.INVOKE_STATIC &&
                ((instr as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                    it.name == "j" && it.returnType == "F" && it.definingClass == topBarClass
                } == true
        }
        require(containerHeightCallIndex >= 0) {
            "TopBar container: no TopBar;->j() call found in b() (fingerprint matched the wrong method?)"
        }

        val addFloatIndex = containerMethod.nextInstructionIndex(containerHeightCallIndex, limit = 20) { instr ->
            instr.opcode == Opcode.ADD_FLOAT || instr.opcode == Opcode.ADD_FLOAT_2ADDR
        }
        require(addFloatIndex >= 0) {
            "TopBar container: no ADD_FLOAT after j() call (fingerprint matched the wrong method?)"
        }
        val addFloatInstruction = containerImpl[addFloatIndex]
        val containerHeightRegister = when (addFloatInstruction) {
            is ThreeRegisterInstruction -> addFloatInstruction.registerA
            is TwoRegisterInstruction -> addFloatInstruction.registerA
            else -> throw IllegalStateException(
                "TopBar container: float add is neither 3-register nor 2addr form"
            )
        }
        containerMethod.addInstructions(
            addFloatIndex + 1,
            "const v$containerHeightRegister, 0x41C80000" // 25.0f
        )

        // [Constraint] The 25f insert above shifts every instruction after addFloatIndex by
        // +1 in the live method, so indices from here on must come from a post-insert snapshot:
        // a pre-insert index replaces the branch guard one slot early instead of the 1.0f target.
        val containerImplAfterInsert = containerMethod.instrs()
        val expandedTargetBits = 0x3EA41A42 // 25f / 78f: animated branch lands exactly on the 25f static height
        val topBarHeightIndex = TopBarContainerFingerprint.stringMatches.first().index + 1
        val oneFloatIndices = containerImplAfterInsert.withIndex()
            .filter { (i, ins) ->
                i in (addFloatIndex + 2) until topBarHeightIndex &&
                    ins.opcode == Opcode.CONST_HIGH16 &&
                    (ins as NarrowLiteralInstruction).narrowLiteral == 0x3f800000
            }
            .map { it.index }
        require(oneFloatIndices.size >= 2) {
            "TopBar container: expected the expanded/collapsed target branch after ADD_FLOAT"
        }
        val expandedBranchIndex = oneFloatIndices.last()
        val expandedRegister = containerMethod
            .getInstruction<OneRegisterInstruction>(expandedBranchIndex).registerA
        containerMethod.replaceInstruction(
            expandedBranchIndex,
            "const v$expandedRegister, $expandedTargetBits"
        )

        // Scoped to the animateFloatAsState window: only the TopBarHeight tweens get zeroed.
        containerMethod.zeroTweenDurations(
            TWEEN_FACTORY_CLASS, TWEEN_FACTORY_METHOD,
            "TopBar container: no animation duration calls found (LA/n renamed?)",
            fromIndex = addFloatIndex + 2,
            toIndexExclusive = topBarHeightIndex,
        )

        val sgetDIndices = containerMethod.instructionIndices { instr ->
            instr.opcode == Opcode.SGET &&
                ((instr as? ReferenceInstruction)?.reference as? FieldReference)?.let {
                    it.name == "d" && it.type == "F"
                } == true
        }
        require(sgetDIndices.isNotEmpty()) {
            "TopBar container: sget of d:F not found in b()"
        }
        require(sgetDIndices.size == 1) {
            "TopBar container: more than one sget of d:F in b() — ambiguous, refusing to guess"
        }
        val sgetDRegister = containerMethod
            .getInstruction<OneRegisterInstruction>(sgetDIndices.first()).registerA
        containerMethod.addInstructions(sgetDIndices.first() + 1, "const v$sgetDRegister, 0x00000000")

        // The scroll listener's (true,false) show pair drives the first-item re-hide;
        // the neg-int/if-le site is its gate.
        val scrollMethod = TopBarScrollFingerprint.method

        data class BoolCall(val index: Int, val receiver: Int, val arg: Int, val value: Int)
        val constBool = mutableMapOf<Int, Int>()
        val calls = mutableListOf<BoolCall>()
        scrollMethod.instrs().forEachIndexed { index, instr ->
            when (instr.opcode) {
                Opcode.CONST_4 -> {
                    val lit = (instr as NarrowLiteralInstruction).narrowLiteral.toInt()
                    if (lit == 0 || lit == 1) {
                        constBool[(instr as OneRegisterInstruction).registerA] = lit
                    }
                }
                Opcode.INVOKE_VIRTUAL -> {
                    val ref = (instr as? ReferenceInstruction)?.reference as? MethodReference
                    if (ref != null && ref.parameterTypes == listOf("Z") &&
                        ref.returnType == "V"
                    ) {
                        val regs = instr as FiveRegisterInstruction
                        constBool[regs.registerD]?.let { value ->
                            calls.add(BoolCall(index, regs.registerC, regs.registerD, value))
                        }
                    }
                }
                else -> {}
            }
        }
        val showCall = calls.asSequence()
            .zipWithNext { a, b -> a to b }
            .firstOrNull { (a, b) ->
                a.value == 1 && b.value == 0 && b.index == a.index + 1 &&
                    a.receiver == b.receiver && a.arg != b.arg
            }?.first
        require(showCall != null) {
            "TopBar scroll: (true,false) show pair not found — scroll listener " +
                "structure changed in this app version"
        }
        scrollMethod.addInstructions(showCall.index, "const/4 v${showCall.arg}, 0x0")

        val scrollImpl = scrollMethod.instrs()
        val firstItemShowBranchIndex = scrollImpl.withIndex()
            .firstOrNull { (i, ins) ->
                ins.opcode == Opcode.NEG_INT &&
                    i + 1 < scrollImpl.size &&
                    scrollImpl[i + 1].opcode == Opcode.IF_LE
            }?.index?.plus(1)
        require(firstItemShowBranchIndex != null) {
            "TopBar scroll: no neg-int + if-le first-item show branch found (fingerprint matched the wrong method?)"
        }
        scrollMethod.replaceInstruction(firstItemShowBranchIndex, "nop")

        // Snaps the header expand/collapse so tab switches do not push page content.
        HeaderTransitionFingerprint.method.zeroTweenDurations(
            TWEEN_FACTORY_CLASS, TWEEN_FACTORY_METHOD,
            "TopBar header: no tween factory calls found (LA/n renamed?)"
        )
    }
}
