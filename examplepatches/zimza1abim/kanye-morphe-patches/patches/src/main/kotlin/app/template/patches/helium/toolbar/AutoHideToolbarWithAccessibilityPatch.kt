package app.template.patches.helium.toolbar

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.helium.titaniumCompatibility
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Chromium keeps these class names; member names are obfuscated.
private const val TAB_IMPL = "Lorg/chromium/chrome/browser/tab/TabImpl;"
private const val WEB_CONTENTS = "Lorg/chromium/content_public/browser/WebContents;"
private const val ACCESSIBILITY_STATE = "Lorg/chromium/ui/accessibility/AccessibilityState;"

private fun Method.references() = implementation?.instructions?.toList().orEmpty().mapNotNull {
    (it as? ReferenceInstruction)?.reference
}

private fun MethodReference.isAccessibilityQuery() =
    definingClass == ACCESSIBILITY_STATE && returnType == "Z" && parameterTypes.isEmpty()

/**
 * TabStateBrowserControlsVisibilityDelegate.enableHidingBrowserControls(): an instance
 * `()I` method that reads the Tab's WebContents, bails out when it is destroyed, and ORs
 * in the A11Y_ENABLED lock from exactly two AccessibilityState queries
 * (isTouchExplorationEnabled || isPerformGesturesEnabled).
 */
private fun isBrowserControlsConstraint(method: Method): Boolean {
    if (method.returnType != "I" || method.parameterTypes.isNotEmpty() ||
        AccessFlags.STATIC.isSet(method.accessFlags)) return false
    val references = method.references()
    return references.any { it is FieldReference && it.definingClass == TAB_IMPL && it.type == WEB_CONTENTS } &&
        references.any { it is MethodReference && it.definingClass == WEB_CONTENTS && it.returnType == "Z" && it.parameterTypes.isEmpty() } &&
        references.filterIsInstance<MethodReference>().filter { it.isAccessibilityQuery() }
            .map { it.name }.toSet().size == 2
}

@Suppress("unused")
val autoHideToolbarWithAccessibilityPatch = bytecodePatch(
    name = "Auto-hide toolbar with accessibility services",
    description = "Lets the address bar auto-hide while an accessibility service is on.",
    default = false,
) {
    compatibleWith(titaniumCompatibility())

    execute {
        val candidates = mutableListOf<Pair<String, Method>>()
        classDefForEach { classDef ->
            classDef.methods.filter(::isBrowserControlsConstraint).forEach { candidates += classDef.type to it }
        }
        val (owner, target) = candidates.singleOrNull()
            ?: throw PatchException("Browser controls constraint method must be unique: ${candidates.size}")

        val method = mutableClassDefBy(owner).methods.single {
            it.name == target.name && it.parameterTypes == target.parameterTypes && it.returnType == target.returnType
        }
        val instructions = method.implementation!!.instructions.toList()
        // Force each accessibility query result to false; the calls stay so indices are stable.
        val results = instructions.indices.filter { index ->
            val ref = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            instructions[index].opcode == Opcode.INVOKE_STATIC && ref?.isAccessibilityQuery() == true
        }.map { index ->
            val next = instructions.getOrNull(index + 1)
            if (next?.opcode != Opcode.MOVE_RESULT) throw PatchException("Accessibility query result is not consumed")
            index + 1 to (next as OneRegisterInstruction).registerA
        }
        if (results.size != 2) throw PatchException("Expected two accessibility queries: ${results.size}")
        results.forEach { (index, register) ->
            method.replaceInstruction(
                index,
                if (register < 16) "const/4 v$register, 0x0" else "const/16 v$register, 0x0",
            )
        }
    }
}
