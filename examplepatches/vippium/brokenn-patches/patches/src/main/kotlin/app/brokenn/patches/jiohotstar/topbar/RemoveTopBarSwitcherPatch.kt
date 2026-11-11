package app.brokenn.patches.jiohotstar.topbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

@Suppress("unused")
val removeTopBarSwitcherPatch = bytecodePatch(
    name = "Remove top bar switcher",
    description = "Removes the JioHotstar/Tadka switcher from the top of Home."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        val contentMethod = TopBarContentFingerprint.method
        var topBarClass: String? = null
        var contentCallIndex = -1
        var scanContent = 0
        while (scanContent < 200) {
            val instr = try {
                contentMethod.getInstruction<Instruction>(scanContent)
            } catch (e: Exception) {
                break
            }
            val ref = (instr as? ReferenceInstruction)?.reference as? MethodReference
            if (ref != null) {
                if (instr.opcode == Opcode.INVOKE_STATIC &&
                    ref.name == "j" && ref.returnType == "F"
                ) {
                    require(topBarClass == null || topBarClass == ref.definingClass) {
                        "TopBar content: multiple distinct j()F calls in e() — ambiguous"
                    }
                    topBarClass = ref.definingClass
                }
                if (ref.definingClass.startsWith("Lr0/")) {
                    require(contentCallIndex < 0) {
                        "TopBar content: more than one Lr0/ call in e() — ambiguous, refusing to guess"
                    }
                    contentCallIndex = scanContent
                }
            }
            scanContent++
        }
        require(topBarClass != null) {
            "TopBar content: no TopBar;->j() call found in e() (fingerprint matched the wrong method?)"
        }
        require(contentCallIndex >= 0) {
            "TopBar content: no Lr0/ pills call found in e() (fingerprint matched the wrong method?)"
        }
        val afterContent = contentMethod.getInstruction<Instruction>(contentCallIndex + 1)
        require(afterContent.opcode != Opcode.MOVE_RESULT &&
            afterContent.opcode != Opcode.MOVE_RESULT_OBJECT &&
            afterContent.opcode != Opcode.MOVE_RESULT_WIDE
        ) {
            "TopBar content: pills call result is used — removing it is not safe"
        }
        contentMethod.removeInstruction(contentCallIndex)

        val containerMethod = TopBarContainerFingerprint.method
        var containerHeightCallIndex = -1
        var scanContainer = 0
        while (scanContainer < 200) {
            val instr = try {
                containerMethod.getInstruction<Instruction>(scanContainer)
            } catch (e: Exception) {
                break
            }
            val ref = (instr as? ReferenceInstruction)?.reference as? MethodReference
            if (ref != null && instr.opcode == Opcode.INVOKE_STATIC &&
                ref.name == "j" && ref.returnType == "F" &&
                ref.definingClass == topBarClass
            ) {
                containerHeightCallIndex = scanContainer
                break
            }
            scanContainer++
        }
        require(containerHeightCallIndex >= 0) {
            "TopBar container: no TopBar;->j() call found in b() (fingerprint matched the wrong method?)"
        }

        var addFloatIndex = containerHeightCallIndex
        var scanned = 0
        while (scanned <= 20) {
            val opcode = containerMethod.getInstruction<Instruction>(addFloatIndex).opcode
            if (opcode == Opcode.ADD_FLOAT || opcode == Opcode.ADD_FLOAT_2ADDR) {
                break
            }
            addFloatIndex++
            scanned++
        }
        require(scanned <= 20) {
            "TopBar container: no ADD_FLOAT after j() call (fingerprint matched the wrong method?)"
        }
        val addFloatInstruction = containerMethod.getInstruction<Instruction>(addFloatIndex)
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

        val expandedTargetBits = 0x3EEB851F // 0.46f
        var topBarHeightIndex = addFloatIndex + 1
        var scannedHeight = 0
        while (scannedHeight <= 60) {
            val instr = containerMethod.getInstruction<Instruction>(topBarHeightIndex)
            if (instr.opcode == Opcode.CONST_STRING &&
                (instr as ReferenceInstruction).reference is StringReference &&
                ((instr as ReferenceInstruction).reference as StringReference).string ==
                "TopBarHeight"
            ) {
                break
            }
            topBarHeightIndex++
            scannedHeight++
        }
        require(scannedHeight <= 60) {
            "TopBar container: TopBarHeight animation call not found after ADD_FLOAT"
        }
        val oneFloatIndices = buildList {
            var i = addFloatIndex + 1
            while (i < topBarHeightIndex) {
                val instr = containerMethod.getInstruction<Instruction>(i)
                if (instr.opcode == Opcode.CONST_HIGH16 &&
                    (instr as NarrowLiteralInstruction).narrowLiteral == 0x3f800000
                ) {
                    add(i)
                }
                i++
            }
        }
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

        val durationCallIndices = buildList {
            var i = addFloatIndex + 1
            while (i < topBarHeightIndex) {
                val instr = containerMethod.getInstruction<Instruction>(i)
                if (instr.opcode == Opcode.INVOKE_STATIC) {
                    val ref = (instr as ReferenceInstruction).reference as? MethodReference
                    if (ref != null && ref.definingClass == "LA/n;" && ref.name == "c") {
                        add(i)
                    }
                }
                i++
            }
        }
        require(durationCallIndices.isNotEmpty()) {
            "TopBar container: no animation duration calls found (LA/n renamed?)"
        }
        durationCallIndices.sortedDescending().forEach { index ->
            containerMethod.addInstructions(index, "const/4 v5, 0x0")
        }

        var sgetDIndex = -1
        var scannedSget = 0
        while (scannedSget < 200) {
            val instr = try {
                containerMethod.getInstruction<Instruction>(scannedSget)
            } catch (e: Exception) {
                break
            }
            if (instr.opcode == Opcode.SGET) {
                val fieldRef = (instr as ReferenceInstruction).reference as? FieldReference
                if (fieldRef != null && fieldRef.name == "d" && fieldRef.type == "F") {
                    require(sgetDIndex < 0) {
                        "TopBar container: more than one sget of d:F in b() — ambiguous, refusing to guess"
                    }
                    sgetDIndex = scannedSget
                }
            }
            scannedSget++
        }
        require(sgetDIndex >= 0) {
            "TopBar container: sget of d:F not found in b()"
        }
        val sgetDRegister = containerMethod
            .getInstruction<OneRegisterInstruction>(sgetDIndex).registerA
        containerMethod.addInstructions(sgetDIndex + 1, "const v$sgetDRegister, 0x00000000")

        val scrollMethod = TopBarScrollFingerprint.method

        data class BoolCall(val index: Int, val receiver: Int, val arg: Int, val value: Int)
        val constBool = mutableMapOf<Int, Int>()
        val calls = mutableListOf<BoolCall>()
        var scanScroll = 0
        while (scanScroll < 200) {
            val instr = try {
                scrollMethod.getInstruction<Instruction>(scanScroll)
            } catch (e: Exception) {
                break
            }
            when (instr.opcode) {
                Opcode.CONST_4 -> {
                    val lit = (instr as NarrowLiteralInstruction).narrowLiteral.toInt()
                    if (lit == 0 || lit == 1) {
                        constBool[(instr as OneRegisterInstruction).registerA] = lit
                    }
                }
                Opcode.INVOKE_VIRTUAL -> {
                    val ref = (instr as ReferenceInstruction).reference as? MethodReference
                    if (ref != null && ref.parameterTypes == listOf("Z") &&
                        ref.returnType == "V"
                    ) {
                        val regs = instr as FiveRegisterInstruction
                        val arg = regs.registerD
                        constBool[arg]?.let { value ->
                            calls.add(BoolCall(scanScroll, regs.registerC, arg, value))
                        }
                    }
                }
                else -> {}
            }
            scanScroll++
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

        var firstItemShowBranchIndex = -1
        var scanIndex = 0
        while (scanIndex < 100) {
            val opcode = try {
                scrollMethod.getInstruction<Instruction>(scanIndex).opcode
            } catch (e: Exception) {
                break
            }
            if (opcode == Opcode.NEG_INT) {
                val nextOpcode = try {
                    scrollMethod.getInstruction<Instruction>(scanIndex + 1).opcode
                } catch (e: Exception) {
                    null
                }
                if (nextOpcode == Opcode.IF_LE) {
                    firstItemShowBranchIndex = scanIndex + 1
                    break
                }
            }
            scanIndex++
        }
        require(firstItemShowBranchIndex >= 0) {
            "TopBar scroll: no neg-int + if-le first-item show branch found (fingerprint matched the wrong method?)"
        }
        scrollMethod.replaceInstruction(firstItemShowBranchIndex, "nop")
    }
}
