package app.template.patches.drtv.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patcher.util.findInstructionIndicesReversed
import app.morphe.patcher.util.findInstructionIndicesReversedOrThrow
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_DRTV
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val DARK_CARD_BG_COLOR = -0xdbdbdc // #FF242424
private const val WHITE_TEXT_COLOR = -0x1 // #FFFFFFFF
private const val COMPOSE_COLOR_KT_CLASS = "Laxis/android/sdk/dr/composables/theme/ColorKt;"
private const val COMPOSE_COLOR_COMPANION_CLASS = "Landroidx/compose/ui/graphics/Color\$Companion;"

private fun MutableMethod.replaceSgetColorField(
    rColorClass: String,
    oldFieldName: String,
    newFieldName: String,
) {
    findInstructionIndicesReversed(
        fieldAccess(
            opcode = Opcode.SGET,
            definingClass = rColorClass,
            name = oldFieldName,
        ),
    ).forEach { index ->
        val register = getInstruction<OneRegisterInstruction>(index).registerA
        replaceInstruction(index, "sget v$register, $rColorClass->$newFieldName:I")
    }
}

@Suppress("unused")
val darkThemePatch = bytecodePatch(
    name = "Dark theme",
    description = "Applies a permanent dark theme across all views, cards, carousels, and dialogs in DRTV.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DRTV)

    dependsOn(darkThemeResourcePatch)

    execute {
        fun Fingerprint.replaceMatchedLiteralWithColor(colorResId: Int) {
            val index = instructionMatches.first().index
            val register = method.getInstruction<OneRegisterInstruction>(index).registerA
            method.replaceInstruction(index, "const v$register, $colorResId")
        }

        fun Fingerprint.overrideParseColorMoveResult(colorInt: Int) {
            val moveResultIndex = instructionMatches.last().index
            val register = method.getInstruction<OneRegisterInstruction>(moveResultIndex).registerA
            method.replaceInstruction(moveResultIndex, "const v$register, $colorInt")
        }

        val whiteOneId = resourceId(ResourceType.COLOR, "white_one").toInt()
        val colorPrimaryId = resourceId(ResourceType.COLOR, "colorPrimary").toInt()

        // 1. Force AppCompatDelegate.MODE_NIGHT_YES (2) in MainApplication and MainActivity
        MainApplicationOnCreateFingerprint.method.apply {
            val superIndex = findInstructionIndicesReversedOrThrow(
                methodCall(name = "onCreate"),
            ).first()
            addInstructions(
                superIndex + 1,
                """
                    const/4 v0, 0x2
                    invoke-static {v0}, Landroidx/appcompat/app/AppCompatDelegate;->setDefaultNightMode(I)V
                """,
            )
        }

        MainActivityOnCreateFingerprint.method.apply {
            val superIndex = findInstructionIndicesReversedOrThrow(
                methodCall(name = "onCreate"),
            ).first()
            addInstructions(
                superIndex,
                """
                    const/4 v0, 0x2
                    invoke-static {v0}, Landroidx/appcompat/app/AppCompatDelegate;->setDefaultNightMode(I)V
                """,
            )
        }

        // 2. Replace hardcoded resource literals in ViewHolders and Fragments
        ItemSummarySetupDefaultAssetTitleFingerprint.replaceMatchedLiteralWithColor(whiteOneId)
        TvStandardSetupAssetTitleBelowFingerprint.replaceMatchedLiteralWithColor(whiteOneId)
        SearchFragmentSetupAutoCompleteViewFingerprint.replaceMatchedLiteralWithColor(whiteOneId)
        SplashFragmentHideCoverViewFingerprint.replaceMatchedLiteralWithColor(colorPrimaryId)
        EpisodesVhSetupLayoutFingerprint.replaceMatchedLiteralWithColor(whiteOneId)

        // 3. Replace R$color.black_six with R$color.white_one in ListItemViewHolderConfiguration.setupAssetTitleBelow
        ListItemSetupAssetTitleBelowFingerprint.method.replaceSgetColorField(
            CLIENT_R_COLOR_CLASS,
            "black_six",
            "white_one",
        )

        // 4. Force default page entry text color getters to return R.color.white_one
        BasePageEntryViewModelGetTextColorFingerprint.method.returnEarly(whiteOneId)
        ListEntryViewModelGetTextColorFingerprint.method.returnEarly(whiteOneId)
        PageUiUtilsGetTextColorFingerprint.method.returnEarly(whiteOneId)

        // 5. Clamp server-sent dynamic ThemeColor / ColorProperty overrides to dark mode surfaces & white text
        PageUiUtilsSetBackgroundThemeColorFingerprint.overrideParseColorMoveResult(DARK_CARD_BG_COLOR)
        PageUiUtilsSetGradientDrawableFingerprint.overrideParseColorMoveResult(DARK_CARD_BG_COLOR)
        PageUiUtilsSetStrokeColorPropertyFingerprint.overrideParseColorMoveResult(DARK_CARD_BG_COLOR)
        PageUiUtilsSetThemeColorWithBackgroundAlphaFingerprint.overrideParseColorMoveResult(DARK_CARD_BG_COLOR)
        PageUiUtilsSetBackgroundColorPropertyFingerprint.overrideParseColorMoveResult(DARK_CARD_BG_COLOR)
        PageUiUtilsSetTextThemeColorFingerprint.overrideParseColorMoveResult(WHITE_TEXT_COLOR)
        PageUiUtilsSetTextColorPropertyFingerprint.overrideParseColorMoveResult(WHITE_TEXT_COLOR)

        // 6. Darken overlay / dialog selection lists and Chromecast menu items
        SelectableViewHolderApplySelectedItemColorsFingerprint.method.replaceSgetColorField(
            UICOMPONENTS_R_COLOR_CLASS,
            "black",
            "black_three",
        )
        SelectableViewHolderApplySelectionFingerprint.method.apply {
            replaceSgetColorField(UICOMPONENTS_R_COLOR_CLASS, "white_one", "black_three")
            replaceSgetColorField(UICOMPONENTS_R_COLOR_CLASS, "neutral_grey_70", "neutral_grey_10")
            replaceSgetColorField(UICOMPONENTS_R_COLOR_CLASS, "black", "white_one")
        }
        MenuOptionsItemViewHolderBindDataFingerprint.method.replaceSgetColorField(
            CHROMECAST_R_COLOR_CLASS,
            "black",
            "white_one",
        )
        DRSynDialogGetBtnOnOffBackgroundFingerprint.method.apply {
            replaceSgetColorField(UICOMPONENTS_R_COLOR_CLASS, "white_one", "black_three")
            replaceSgetColorField(UICOMPONENTS_R_COLOR_CLASS, "neutral_grey_70", "neutral_grey_10")
        }

        // 7. Jetpack Compose EPG / FullScreenDialog dark theme overrides
        ComposeColorKtClinitFingerprint.let { fp ->
            val index = fp.instructionMatches.first().index
            val register = fp.method.getInstruction<OneRegisterInstruction>(index).registerA
            fp.method.replaceInstruction(index, "const-wide v$register, -0x4c4c4dL")
        }

        ComposeFontKtClinitFingerprint.method.apply {
            listOf("getBlack", "getNeutralGrey10").forEach { getter ->
                findInstructionIndicesReversed(
                    methodCall(definingClass = COMPOSE_COLOR_KT_CLASS, name = getter),
                ).forEach { index ->
                    replaceInstruction(
                        index,
                        "invoke-static {}, $COMPOSE_COLOR_KT_CLASS->getWhiteOne()J",
                    )
                }
            }
        }

        FullScreenDialogInvokeFingerprint.method.apply {
            findInstructionIndicesReversed(
                methodCall(definingClass = COMPOSE_COLOR_COMPANION_CLASS, name = "getWhite-0d7_KjU"),
            ).forEach { index ->
                replaceInstruction(
                    index,
                    "invoke-static {}, $COMPOSE_COLOR_KT_CLASS->getNeutralGrey10()J",
                )
            }
            findInstructionIndicesReversed(
                methodCall(definingClass = COMPOSE_COLOR_COMPANION_CLASS, name = "getBlack-0d7_KjU"),
            ).forEach { index ->
                val register = getInstruction<FiveRegisterInstruction>(index).registerC
                replaceInstruction(
                    index,
                    "invoke-virtual {v$register}, $COMPOSE_COLOR_COMPANION_CLASS->getWhite-0d7_KjU()J",
                )
            }
        }
    }
}
