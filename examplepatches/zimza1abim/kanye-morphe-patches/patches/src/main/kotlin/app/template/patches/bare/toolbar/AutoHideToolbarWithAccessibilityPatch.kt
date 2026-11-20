package app.template.patches.bare.toolbar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.template.patches.bare.bareCompatibility
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ACCESSIBILITY_STATE = "Lorg/chromium/ui/accessibility/AccessibilityState;"

/** Accessibility reason bit in the hide-constraints flags (1 shl A11Y_ENABLED). */
private const val A11Y_REASON_BIT = 0x40

private val OR_INT_LITERAL_OPS = setOf(Opcode.OR_INT_LIT8, Opcode.OR_INT_LIT16)

/**
 * TabStateBrowserControlsVisibilityDelegate.enableHidingBrowserControls(): records its
 * lock decision under this histogram. Brave's R8 output folds the two accessibility
 * queries (isTouchExplorationEnabled || isPerformGesturesEnabled) into one static helper.
 */
internal object BrowserControlsConstraintFingerprint : Fingerprint(
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(string("Android.BrowserControls.LockedByTabState")),
)

@Suppress("unused")
val autoHideToolbarWithAccessibilityPatch = bytecodePatch(
    name = "Bare auto-hide toolbar with accessibility services",
    description = "Lets the address bar auto-hide while an accessibility service is on.",
    default = false,
) {
    compatibleWith(bareCompatibility())

    execute {
        val method = BrowserControlsConstraintFingerprint.match().method
        val instructions = method.implementation!!.instructions.toList()
        // Force each accessibility query result to false; the calls stay so indices are stable.
        // Accept the folded helper (one call) or Chromium's separate queries (two calls).
        val results = instructions.indices.filter { index ->
            val ref = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            instructions[index].opcode == Opcode.INVOKE_STATIC && ref?.definingClass == ACCESSIBILITY_STATE &&
                ref.returnType == "Z" && ref.parameterTypes.isEmpty()
        }.map { index ->
            val next = instructions.getOrNull(index + 1)
            if (next?.opcode != Opcode.MOVE_RESULT) throw PatchException("Accessibility query result is not consumed")
            index + 1 to (next as OneRegisterInstruction).registerA
        }
        if (results.isEmpty()) {
            // Bare 2.0.7 (802000715) removed the accessibility lock upstream: the toolbar folds
            // away with TalkBack on and "Keep toolbar visible" is the way to pin it. The query
            // and its reason bit left the method together, so there is nothing to force false.
            // Only accept that shape; a renamed query must not pass as a no-op. The bit is set
            // with a literal or, so a register-form fold is out of scope on purpose.
            val setsA11yBit = instructions.any { instruction ->
                instruction.opcode in OR_INT_LITERAL_OPS &&
                    (instruction as? NarrowLiteralInstruction)?.narrowLiteral == A11Y_REASON_BIT
            }
            if (setsA11yBit) {
                throw PatchException(
                    "No accessibility query in the method but the accessibility reason bit is still set",
                )
            }
            return@execute
        }
        if (results.size > 2) throw PatchException("Expected one or two accessibility queries: ${results.size}")
        results.forEach { (index, register) ->
            method.replaceInstruction(
                index,
                if (register < 16) "const/4 v$register, 0x0" else "const/16 v$register, 0x0",
            )
        }
    }
}
