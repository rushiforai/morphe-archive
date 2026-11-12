package app.template.patches.notesnook.fontswap

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val TEXT_PAINT = "Landroid/text/TextPaint;"
private const val PRIME = "Lapp/fontism/extension/notesnook/NotesnookFontInjector;->prime(Landroid/graphics/Paint;)V"
private const val RN_TEXT = "Lcom/facebook/react/views/text/"

// Emoji paints keep the emoji font; the runtime itself is not rewritten.
private val EXCLUDED = listOf("Landroidx/emoji2/", "Lapp/fontism/")

/** Indexes of `new TextPaint()` / `new TextPaint(int flags)` constructor calls, with the instance register. */
private fun Method.textPaintConstructions(): List<Pair<Int, Int>> =
    implementation?.instructions?.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode != Opcode.INVOKE_DIRECT && instruction.opcode != Opcode.INVOKE_DIRECT_RANGE) return@mapIndexedNotNull null
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapIndexedNotNull null
        if (call.definingClass != TEXT_PAINT || call.name != "<init>" || call.parameterTypes.any { it != "I" }) return@mapIndexedNotNull null
        val instance = when (instruction) {
            is FiveRegisterInstruction -> instruction.registerC
            is RegisterRangeInstruction -> instruction.startRegister
            else -> return@mapIndexedNotNull null
        }
        index to instance
    }.orEmpty()

/**
 * Android 10+ refuses to replace the native default typeface (hidden API), so
 * every paint the app creates without a typeface would still draw the system
 * font. Each app-side TextPaint construction gets the selected face right away
 * (only while a custom font is on, and only if no typeface was set).
 */
internal val notesnookPaintDefaultHooks = bytecodePatch {
    extendWith("extensions/extension.mpe")
    execute {
        val owners = mutableListOf<String>()
        classDefForEach { cls ->
            if (EXCLUDED.none { cls.type.startsWith(it) } && cls.methods.any { it.textPaintConstructions().isNotEmpty() })
                owners.add(cls.type)
        }
        var patched = 0
        var reactNative = 0
        owners.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                // Insert from the end so earlier indexes stay valid.
                method.textPaintConstructions().asReversed().forEach { (index, register) ->
                    method.addInstruction(index + 1, "invoke-static/range {v$register .. v$register}, $PRIME")
                    patched++
                    if (type.startsWith(RN_TEXT)) reactNative++
                }
            }
        }
        if (reactNative == 0) throw PatchException("React Native text paint construction not found; text layout changed")
        if (patched == 0) throw PatchException("No TextPaint construction sites found")
    }
}
