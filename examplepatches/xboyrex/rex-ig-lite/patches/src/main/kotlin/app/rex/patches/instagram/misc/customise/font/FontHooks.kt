/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.customise.font

import app.rex.patches.instagram.utils.Constants.CUSTOM_FONT_DESCRIPTOR
import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.toInstruction
import app.morphe.util.findInstructionIndicesReversed
import app.morphe.util.findInstructionIndicesReversedOrThrow
import app.morphe.patcher.util.getReference
import app.morphe.util.indexOfFirstInstruction
import app.morphe.patcher.util.p0Register
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MethodImplementationBuilder
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal const val TYPEFACE_CLASS = "Landroid/graphics/Typeface;"
private const val CHAR_SEQUENCE_CLASS = "Ljava/lang/CharSequence;"
private const val BUFFER_TYPE_CLASS = "Landroid/widget/TextView\$BufferType;"

internal const val LOAD_CUSTOM_FONT = "$CUSTOM_FONT_DESCRIPTOR->load()V"

private const val APPLY_CUSTOM_FONT =
    "$CUSTOM_FONT_DESCRIPTOR->apply($TYPEFACE_CLASS)$TYPEFACE_CLASS"

private const val APPLY_CUSTOM_FONT_FOR_DESCRIPTOR =
    "$CUSTOM_FONT_DESCRIPTOR->apply(Ljava/lang/Object;$TYPEFACE_CLASS)$TYPEFACE_CLASS"

private const val BEGIN_CONTENT_FONT_REQUEST =
    "$CUSTOM_FONT_DESCRIPTOR->beginContentFontRequest()V"

private const val END_CONTENT_FONT_REQUEST =
    "$CUSTOM_FONT_DESCRIPTOR->endContentFontRequest($TYPEFACE_CLASS)$TYPEFACE_CLASS"

private const val END_CONTENT_FONT_REQUEST_WITH_SOURCE =
    "$CUSTOM_FONT_DESCRIPTOR->endContentFontRequest(Ljava/lang/Object;$TYPEFACE_CLASS)$TYPEFACE_CLASS"

private const val ASSIGN_CUSTOM_FONT =
    "$CUSTOM_FONT_DESCRIPTOR->assign($TYPEFACE_CLASS)$TYPEFACE_CLASS"

private const val APPLY_EMOJI_SPANS =
    "$CUSTOM_FONT_DESCRIPTOR->applyEmojiSpans($CHAR_SEQUENCE_CLASS)$CHAR_SEQUENCE_CLASS"

/** The platform text widgets whose direct subclasses get [overrideTypefaceAssignment]. */
internal val PLATFORM_TEXT_WIDGETS =
    listOf(
        "TextView", "EditText", "Button", "RadioButton", "CheckBox", "CheckedTextView",
        "AutoCompleteTextView", "MultiAutoCompleteTextView", "Switch", "ToggleButton",
    ).map { "Landroid/widget/$it;" }.toSet()

internal fun MutableMethod.hookResolvedTypefaces() {
    val descriptorRegister = p0Register + if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    if (isOverwritten(descriptorRegister)) {
        throw PatchException(
            "$definingClass->$name writes over the font descriptor it was passed",
        )
    }

    findInstructionIndicesReversedOrThrow(Opcode.RETURN_OBJECT).forEach { index ->
        val register = getInstruction<OneRegisterInstruction>(index).registerA
        replaceInstruction(
            index,
            "invoke-static {v$descriptorRegister, v$register}, $APPLY_CUSTOM_FONT_FOR_DESCRIPTOR",
        )
        addInstructions(
            index + 1,
            """
            move-result-object v$register
            return-object v$register
            """.trimIndent(),
        )
    }
}

internal fun MutableMethod.hookWrappedTypeface() {
    findInstructionIndicesReversedOrThrow(
        {
            val reference = getReference<MethodReference>()
            opcode == Opcode.INVOKE_DIRECT && reference?.name == "<init>" &&
                reference.parameterTypes.firstOrNull()?.toString() in listOf(TYPEFACE_CLASS, "Ljava/lang/Object;") &&
                (reference.definingClass == returnType ||
                    returnType in classDefBy(reference.definingClass).interfaces)
        },
    ).forEach { wrapIndex ->
        val constructor = getInstruction(wrapIndex)
        val typefaceRegister = constructor.registersUsed[1]
        val apply = if (constructor.getReference<MethodReference>()!!.parameterTypes.first().toString() == TYPEFACE_CLASS) {
            APPLY_CUSTOM_FONT
        } else {
            "$CUSTOM_FONT_DESCRIPTOR->applyWrappedTypeface(Ljava/lang/Object;)Ljava/lang/Object;"
        }

        addInstructions(
            wrapIndex,
            """
            invoke-static/range {v$typefaceRegister .. v$typefaceRegister}, $apply
            move-result-object v$typefaceRegister
            """.trimIndent(),
        )
    }
}

internal fun MutableMethod.markAsContentFontResolver() {
    val isInstanceMethod = !AccessFlags.STATIC.isSet(accessFlags)
    val thisReg = p0Register
    val canPassThis = isInstanceMethod && !isOverwritten(thisReg)
    findInstructionIndicesReversedOrThrow(Opcode.RETURN_OBJECT).forEach { index ->
        val register = getInstruction<OneRegisterInstruction>(index).registerA

        if (canPassThis && thisReg <= 15 && register <= 15) {
            replaceInstruction(index, "invoke-static {v$thisReg, v$register}, $END_CONTENT_FONT_REQUEST_WITH_SOURCE")
        } else {
            replaceInstruction(index, "invoke-static/range {v$register .. v$register}, $END_CONTENT_FONT_REQUEST")
        }
        addInstructions(
            index + 1,
            """
            move-result-object v$register
            return-object v$register
            """.trimIndent(),
        )
    }
    addInstruction(0, "invoke-static {}, $BEGIN_CONTENT_FONT_REQUEST")
}

internal fun MutableClass.overrideTypefaceAssignment() {
    // 1. Override/hook setTypeface(Typeface)
    val existingTypeface = methods.firstOrNull {
        it.name == "setTypeface" && it.returnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) == listOf(TYPEFACE_CLASS)
    }
    if (existingTypeface != null) {
        if (existingTypeface.implementation != null) {
            existingTypeface.addInstructions(
                0,
                """
                invoke-static/range {p1 .. p1}, $ASSIGN_CUSTOM_FONT
                move-result-object p1
                """.trimIndent(),
            )
        }
    } else {
        val implementation = MethodImplementationBuilder(2).apply {
            addInstruction("invoke-static {v1}, $ASSIGN_CUSTOM_FONT".toInstruction())
            addInstruction("move-result-object v1".toInstruction())
            addInstruction("invoke-super {v0, v1}, $superclass->setTypeface($TYPEFACE_CLASS)V".toInstruction())
            addInstruction("return-void".toInstruction())
        }.methodImplementation
        methods.add(
            MutableMethod(
                ImmutableMethod(
                    type, "setTypeface", listOf(ImmutableMethodParameter(TYPEFACE_CLASS, null, null)),
                    "V", AccessFlags.PUBLIC.value, emptySet(), emptySet(), implementation,
                ),
            ),
        )
    }

    // 2. Override/hook setText(CharSequence, TextView$BufferType) so custom Emoji packs render in all TextViews & EditTexts
    val existingSetText = methods.firstOrNull {
        it.name == "setText" && it.returnType == "V" &&
            it.parameterTypes.map(CharSequence::toString) == listOf(CHAR_SEQUENCE_CLASS, BUFFER_TYPE_CLASS)
    }
    if (existingSetText != null) {
        if (existingSetText.implementation != null) {
            existingSetText.addInstructions(
                0,
                """
                invoke-static/range {p1 .. p1}, $APPLY_EMOJI_SPANS
                move-result-object p1
                """.trimIndent(),
            )
        }
    } else {
        val setTextImpl = MethodImplementationBuilder(3).apply {
            addInstruction("invoke-static {v1}, $APPLY_EMOJI_SPANS".toInstruction())
            addInstruction("move-result-object v1".toInstruction())
            addInstruction("invoke-super {v0, v1, v2}, $superclass->setText($CHAR_SEQUENCE_CLASS$BUFFER_TYPE_CLASS)V".toInstruction())
            addInstruction("return-void".toInstruction())
        }.methodImplementation
        methods.add(
            MutableMethod(
                ImmutableMethod(
                    type,
                    "setText",
                    listOf(
                        ImmutableMethodParameter(CHAR_SEQUENCE_CLASS, null, null),
                        ImmutableMethodParameter(BUFFER_TYPE_CLASS, null, null),
                    ),
                    "V",
                    AccessFlags.PUBLIC.value,
                    emptySet(),
                    emptySet(),
                    setTextImpl,
                ),
            ),
        )
    }
}

internal fun Instruction.isPaintTypefaceCall() =
    (opcode == Opcode.INVOKE_VIRTUAL || opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
        getReference<MethodReference>()?.let { reference ->
            reference.name == "setTypeface" &&
                reference.definingClass in PAINT_CLASSES &&
                reference.parameterTypes.map(CharSequence::toString) == listOf(TYPEFACE_CLASS)
        } == true

private val PAINT_CLASSES = setOf("Landroid/graphics/Paint;", "Landroid/text/TextPaint;")

internal fun MutableMethod.hookPaintTypefaceCalls() {
    findInstructionIndicesReversedOrThrow { isPaintTypefaceCall() }
        .forEach { callIndex ->
            val register = getInstruction(callIndex).registersUsed[1]
            addInstructions(
                callIndex,
                """
                invoke-static/range {v$register .. v$register}, $ASSIGN_CUSTOM_FONT
                move-result-object v$register
                """.trimIndent(),
            )
        }
}

internal val FONT_EXTENSION_PACKAGE = CUSTOM_FONT_DESCRIPTOR.removeSuffix("CustomFont;")

internal typealias Replacements = Map<String, Pair<String, Set<List<String>>>>

internal val PLATFORM_TYPEFACE_SPANS: Replacements =
    mapOf(
        "Landroid/text/style/TypefaceSpan;" to
            ("${FONT_EXTENSION_PACKAGE}CustomFontTypefaceSpan;" to
                setOf(listOf("Ljava/lang/String;"), listOf(TYPEFACE_CLASS))),
        "Landroid/text/style/TextAppearanceSpan;" to
            ("${FONT_EXTENSION_PACKAGE}CustomFontTextAppearanceSpan;" to
                setOf(
                    listOf("Landroid/content/Context;", "I"),
                    listOf("Landroid/content/Context;", "I", "I"),
                    listOf(
                        "Ljava/lang/String;", "I", "I",
                        "Landroid/content/res/ColorStateList;", "Landroid/content/res/ColorStateList;",
                    ),
                )),
    )

internal val REX_TEXT_WIDGETS: Replacements =
    listOf("TextView", "Button", "CheckBox", "EditText").associate {
        "Landroid/widget/$it;" to
            ("${FONT_EXTENSION_PACKAGE}CustomFont$it;" to
                setOf(
                    listOf("Landroid/content/Context;"),
                    listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;", "I"),
                ))
    }

internal fun Instruction.createsOneOf(replacements: Replacements) =
    opcode == Opcode.NEW_INSTANCE &&
        getReference<TypeReference>()?.type in replacements

internal fun MutableMethod.replaceCreations(replacements: Replacements) {
    val creations = findInstructionIndicesReversed { createsOneOf(replacements) }
    val created = creations.map { getInstruction<OneRegisterInstruction>(it).registerA }.toSet()
    val constructions =
        findInstructionIndicesReversed {
            (opcode == Opcode.INVOKE_DIRECT || opcode == Opcode.INVOKE_DIRECT_RANGE) &&
                getReference<MethodReference>()?.let {
                    it.name == "<init>" && it.definingClass in replacements
                } == true &&
                registersUsed[0] in created
        }
    val supported =
        constructions.all {
            val reference = getInstruction(it).getReference<MethodReference>()!!
            reference.parameterTypes.map(CharSequence::toString) in
                replacements.getValue(reference.definingClass).second
        }
    if (constructions.isEmpty() || !supported) return

    (creations + constructions).sortedDescending().forEach { index ->
        val instruction = getInstruction(index)
        val registers = instruction.registersUsed
        if (instruction.opcode == Opcode.NEW_INSTANCE) {
            val replacement = replacements.getValue(instruction.getReference<TypeReference>()!!.type).first
            replaceInstruction(index, "new-instance v${registers[0]}, $replacement")
        } else {
            val reference = instruction.getReference<MethodReference>()!!
            val replacement = replacements.getValue(reference.definingClass).first
            val constructor = "$replacement-><init>(${reference.parameterTypes.joinToString("")})V"
            replaceInstruction(
                index,
                if (instruction.opcode == Opcode.INVOKE_DIRECT_RANGE) {
                    "invoke-direct/range {v${registers.first()} .. v${registers.last()}}, $constructor"
                } else {
                    "invoke-direct {${registers.joinToString { "v$it" }}}, $constructor"
                },
            )
        }
    }
}

internal fun MutableMethod.hookReactNativeFontRegistration(result: Match.InstructionMatch) {
    val register = result.getInstruction<OneRegisterInstruction>().registerA

    addInstructions(
        result.index + 1,
        """
        invoke-static/range {v$register .. v$register}, $APPLY_CUSTOM_FONT
        move-result-object v$register
        """.trimIndent(),
    )
}

private fun MutableMethod.isOverwritten(register: Int) =
    indexOfFirstInstruction {
        opcode.setsRegister() && opcode != Opcode.CHECK_CAST && registersUsed.firstOrNull() == register
    } >= 0
