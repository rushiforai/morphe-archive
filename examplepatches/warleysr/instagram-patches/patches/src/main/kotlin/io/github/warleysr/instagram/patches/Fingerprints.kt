package io.github.warleysr.instagram.patches

import io.github.warleysr.instagram.patches.Constants.CAROUSEL_AUTO_SCROLL_EXTENSION_CLASS
import io.github.warleysr.instagram.patches.Constants.FEED_BUTTON_EXTENSION_CLASS
import io.github.warleysr.instagram.patches.Constants.HERO_PLAYER_SETTING_CLASS
import io.github.warleysr.instagram.patches.Constants.MEDIA_OPTIONS_CLASS
import io.github.warleysr.instagram.patches.Constants.REBOUND_VIEW_PAGER_CLASS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.string
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// region Hero Player Fingerprints

internal object VideoStartPlayingFingerprint : Fingerprint(
    returnType = "V",
    filters =
        listOf(
            string("start playing"),
            fieldAccess(
                definingClass = HERO_PLAYER_SETTING_CLASS,
                type = "Z",
                opcode = Opcode.IGET_BOOLEAN,
                location = InstructionLocation.MatchAfterWithin(4),
            ),
        ),
)

internal object VideoCompletionFingerprint : Fingerprint(
    classFingerprint = VideoStartPlayingFingerprint,
    returnType = "V",
    filters = listOf(string("onCompletion")),
)

private fun Method.indexOfPlayerBooleanCall(startIndex: Int, playerClass: String? = null) =
    indexOfFirstInstruction(startIndex) {
        if (opcode != Opcode.INVOKE_STATIC) return@indexOfFirstInstruction false
        val reference = getReference<MethodReference>() ?: return@indexOfFirstInstruction false
        reference.returnType == "V" &&
            reference.parameterTypes.size == 2 &&
            reference.parameterTypes[1] == "Z" &&
            (playerClass == null || reference.parameterTypes[0] == playerClass)
    }

context(patchContext: BytecodePatchContext)
internal fun playerSetKeepScreenOnMethod(): MethodReference =
    VideoStartPlayingFingerprint.method.let { method ->
        val settingIndex = VideoStartPlayingFingerprint.instructionMatches.last().index
        val index = method.indexOfPlayerBooleanCall(settingIndex)
        if (index < 0) throw PatchException("Could not find setKeepScreenOn call")
        method.getInstruction(index).getReference<MethodReference>()
            ?: throw PatchException("Could not find setKeepScreenOn call")
    }

context(patchContext: BytecodePatchContext)
internal fun videoCompletionStopCall(playerClass: String): Pair<Int, FiveRegisterInstruction> =
    VideoCompletionFingerprint.method.let { method ->
        val stringIndex = VideoCompletionFingerprint.instructionMatches.first().index
        val index = method.indexOfPlayerBooleanCall(stringIndex, playerClass)
        if (index < 0) throw PatchException("Could not find player stop call")
        index to method.getInstruction<FiveRegisterInstruction>(index)
    }

// endregion

// region ReboundViewPager Fingerprints

internal object ReboundViewPagerSmoothScrollFingerprint : Fingerprint(
    definingClass = REBOUND_VIEW_PAGER_CLASS,
    returnType = "V",
    parameters = listOf("I"),
    filters =
        listOf(
            opcode(Opcode.INT_TO_FLOAT),
            methodCall(
                definingClass = REBOUND_VIEW_PAGER_CLASS,
                parameters = listOf(REBOUND_VIEW_PAGER_CLASS, "D", "F", "Z"),
                returnType = "V",
                location = InstructionLocation.MatchAfterWithin(4),
            ),
        ),
)

internal object SmoothScrollToPageExtensionFingerprint : Fingerprint(
    definingClass = CAROUSEL_AUTO_SCROLL_EXTENSION_CLASS,
    name = "smoothScrollToPage",
)

// endregion

// region Overflow Menu Fingerprints

internal object OverflowMenuButtonEnumInitialiser : Fingerprint(
    definingClass = MEDIA_OPTIONS_CLASS,
    name = "<clinit>",
)

internal object EnumButtonClassFingerprint : Fingerprint(
    strings = listOf("UNSET_OR_UNRECOGNIZED_ENUM_VALUE", "ACTION", "DESTRUCTIVE"),
)

internal object AddFeedButtonFingerprint : Fingerprint(
    strings = listOf("TEXT_POST_APP_INACTIVE"),
)

internal object GetEnumButtonClassExtensionFingerprint : Fingerprint(
    definingClass = FEED_BUTTON_EXTENSION_CLASS,
    name = "getEnumButtonClass",
)

internal object AddFeedButtonExtensionFingerprint : Fingerprint(
    definingClass = FEED_BUTTON_EXTENSION_CLASS,
    name = "addButton",
)

internal object MediaOptionsOverflowMenuCreatorConstructorFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("MediaOptionsOverflowMenuCreator"),
)

internal object FeedButtonOnClickFingerprint : Fingerprint(
    parameters = listOf(MEDIA_OPTIONS_CLASS),
    strings = listOf("MediaOptionsOverflowHelper"),
    returnType = "V",
)

// endregion

// region Utils

fun classNameToExtension(className: String): String =
    className.removePrefix("L").replace("/", ".").removeSuffix(";")

context(patchContext: BytecodePatchContext)
fun Fingerprint.changeFirstString(value: String) {
    method.instructions.first {
        it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO
    }.let { instruction ->
        val register = (instruction as BuilderInstruction21c).registerA
        method.replaceInstruction(instruction.location.index, "const-string v$register, \"$value\"")
    }
}

// endregion
