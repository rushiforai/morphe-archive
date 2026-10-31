package app.template.patches.drtv.layout.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import com.android.tools.smali.dexlib2.Opcode

internal const val CLIENT_R_COLOR_CLASS = "Laxis/android/sdk/client/R\$color;"
internal const val UICOMPONENTS_R_COLOR_CLASS = "Laxis/android/sdk/uicomponents/R\$color;"
internal const val CHROMECAST_R_COLOR_CLASS = "Laxis/android/sdk/chromecast/R\$color;"

object MainApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Laxis/androidtv/sdk/app/MainApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Laxis/androidtv/sdk/app/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

object ItemSummarySetupDefaultAssetTitleFingerprint : Fingerprint(
    definingClass = "Laxis/androidtv/sdk/app/template/pageentry/standard/viewholder/ItemSummaryViewHolder;",
    name = "setupDefaultAssetTitle",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        resourceLiteral(ResourceType.COLOR, "black_one"),
    ),
)

object TvStandardSetupAssetTitleBelowFingerprint : Fingerprint(
    definingClass = "Laxis/androidtv/sdk/app/template/pageentry/standard/TvStandardListItemViewHolderConfiguration;",
    name = "setupAssetTitleBelow",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        resourceLiteral(ResourceType.COLOR, "black_six"),
    ),
)

object ListItemSetupAssetTitleBelowFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/client/templates/pageentry/ListItemViewHolderConfiguration;",
    name = "setupAssetTitleBelow",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SGET,
            definingClass = CLIENT_R_COLOR_CLASS,
            name = "black_six",
        ),
    ),
)

object BasePageEntryViewModelGetTextColorFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/client/ui/pageentry/base/viewmodel/BasePageEntryViewModel;",
    name = "getTextColor",
    returnType = "I",
    parameters = emptyList(),
)

object ListEntryViewModelGetTextColorFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/client/templates/pageentry/base/viewmodel/ListEntryViewModel;",
    name = "getTextColor",
    returnType = "I",
    parameters = emptyList(),
)

object PageUiUtilsGetTextColorFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/client/util/PageUiUtils;",
    name = "getTextColor",
    returnType = "I",
    parameters = listOf(
        "Laxis/android/sdk/service/model/Page;",
        "Laxis/android/sdk/service/model/PageEntry;",
    ),
)

object PageUiUtilsSetBackgroundThemeColorFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/client/util/PageUiUtils;",
    name = "setBackgroundThemeColor",
    returnType = "V",
    parameters = listOf(
        "Landroid/view/View;",
        "Laxis/android/sdk/service/model/ThemeColor;",
        "Z",
    ),
    filters = listOf(
        methodCall(definingClass = "Landroid/graphics/Color;", name = "parseColor"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)

object PageUiUtilsSetGradientDrawableFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/client/util/PageUiUtils;",
    name = "setGradientDrawable",
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = "Landroid/graphics/Color;", name = "parseColor"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)

object PageUiUtilsSetStrokeColorPropertyFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/client/util/PageUiUtils;",
    name = "setStrokeColorProperty",
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = "Landroid/graphics/Color;", name = "parseColor"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)

object PageUiUtilsSetTextThemeColorFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/client/util/PageUiUtils;",
    name = "setTextThemeColor",
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = "Landroid/graphics/Color;", name = "parseColor"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)

object PageUiUtilsSetThemeColorWithBackgroundAlphaFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/client/util/PageUiUtils;",
    name = "setThemeColorWithBackgroundAlpha",
    returnType = "V",
    filters = listOf(
        methodCall(definingClass = "Landroid/graphics/Color;", name = "parseColor"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)

object PageUiUtilsSetBackgroundColorPropertyFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/client/util/PageUiUtils;",
    name = "setBackgroundColorProperty",
    returnType = "V",
    parameters = listOf(
        "Landroid/view/View;",
        "Laxis/android/sdk/client/ui/pageentry/ColorProperty;",
    ),
    filters = listOf(
        methodCall(definingClass = "Landroid/graphics/Color;", name = "parseColor"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)

object PageUiUtilsSetTextColorPropertyFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/client/util/PageUiUtils;",
    name = "setTextColorProperty",
    returnType = "V",
    parameters = listOf(
        "Landroid/widget/TextView;",
        "Laxis/android/sdk/client/ui/pageentry/ColorProperty;",
    ),
    filters = listOf(
        methodCall(definingClass = "Landroid/graphics/Color;", name = "parseColor"),
        opcode(Opcode.MOVE_RESULT, MatchAfterImmediately()),
    ),
)

object SearchFragmentSetupAutoCompleteViewFingerprint : Fingerprint(
    definingClass = "Laxis/androidtv/sdk/app/template/page/search/SearchFragment;",
    name = "setupAutoCompleteView",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        resourceLiteral(ResourceType.COLOR, "black"),
    ),
)

object SplashFragmentHideCoverViewFingerprint : Fingerprint(
    definingClass = "Laxis/androidtv/sdk/dr/ui/SplashFragment;",
    name = "hideCoverView\$lambda\$2\$lambda\$1",
    returnType = "V",
    filters = listOf(
        resourceLiteral(ResourceType.COLOR, "white_one"),
    ),
)

object EpisodesVhSetupLayoutFingerprint : Fingerprint(
    definingClass = "Laxis/androidtv/sdk/app/template/pageentry/itemdetail/viewholder/EpisodesVh;",
    name = "setupLayout\$lambda\$5",
    returnType = "V",
    filters = listOf(
        resourceLiteral(ResourceType.COLOR, "colorPrimary"),
    ),
)

object SelectableViewHolderApplySelectedItemColorsFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/uicomponents/overlay/SelectableViewHolder;",
    name = "applySelectedItemColors",
    returnType = "V",
    parameters = listOf("I", "I"),
)

object SelectableViewHolderApplySelectionFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/uicomponents/overlay/SelectableViewHolder;",
    name = "applySelection",
    returnType = "V",
    parameters = emptyList(),
)

object MenuOptionsItemViewHolderBindDataFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/chromecast/dialog/MenuOptionsItemViewHolder;",
    name = "bindData",
    returnType = "V",
)

object ComposeColorKtClinitFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/dr/composables/theme/ColorKt;",
    name = "<clinit>",
    returnType = "V",
    filters = listOf(
        literal(0xff676767L),
    ),
)

object ComposeFontKtClinitFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/dr/composables/theme/FontKt;",
    name = "<clinit>",
    returnType = "V",
)

object FullScreenDialogInvokeFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/dr/composables/FullScreenDialogUIKt\$FullScreenDialog\$1;",
    name = "invoke",
    returnType = "V",
    parameters = listOf(
        "Landroidx/compose/runtime/Composer;",
        "I",
    ),
)

object DRSynDialogGetBtnOnOffBackgroundFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/dr/dialog/DRSynDialogFragment;",
    name = "getBtnOnOffBackground",
    returnType = "I",
    parameters = emptyList(),
)
