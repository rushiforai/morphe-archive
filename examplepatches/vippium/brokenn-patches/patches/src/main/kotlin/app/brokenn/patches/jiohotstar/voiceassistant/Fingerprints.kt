package app.brokenn.patches.jiohotstar.voiceassistant

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Search-bar mic gate; false hides the primary mic branch.
internal object VoiceSearchEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ui/model/pagedata/ExplorePageData;",
    name = "getVoiceSearchEnabled",
    returnType = "Z"
)

// Page-proto CVD orb field; mappers gate on hasCvdOrb.
internal object WatchPageCvdOrbFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ui/model/pagedata/WatchPageData;",
    name = "hasCvdOrb",
    returnType = "Z"
)

internal object ExplorePageCvdOrbFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ui/model/pagedata/ExplorePageData;",
    name = "hasCvdOrb",
    returnType = "Z"
)

internal object LandingPageCvdOrbFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ui/model/pagedata/LandingPageData;",
    name = "hasCvdOrb",
    returnType = "Z"
)

internal object LandingV2PageCvdOrbFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/ui/model/pagedata/LandingV2PageData;",
    name = "hasCvdOrb",
    returnType = "Z"
)

// Equaliser-config readers (disambiguated by param count); false kills the fallback mic.
internal object CvdEqualiserEventFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L", "L"),
    filters = listOf(
        string("all.cvd.equaliser_enabled")
    )
)

internal object CvdEqualiserFlowFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    filters = listOf(
        string("all.cvd.equaliser_enabled")
    )
)

// Page-type parser; renaming the CVD wire names keeps every payload from resolving to a CVD page.
internal object CvdPageTypeParserFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        string("LandingV2Page"),
        string("ConversationalDiscoveryPage")
    )
)

// Navigation screens bind their route string in the static initialiser.
internal object CvdPageScreenFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/navigation/Screen${'$'}CVDPage;",
    name = "<clinit>",
    returnType = "V"
)

internal object CvdActionSheetScreenFingerprint : Fingerprint(
    definingClass = "Lcom/hotstar/navigation/Screen${'$'}CVDActionSheetPage;",
    name = "<clinit>",
    returnType = "V"
)

// Renderers, anchored on the test tags they set rather than any obfuscated class name.
internal object CvdOrbComposableFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("cvdOrb"),
        string("BffCVDOrb_")
    )
)

internal object CvdChatBubbleComposableFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("cvd_chat_bubble")
    )
)

internal object CvdActionSheetComposableFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("tag_cvd_action_sheet_page_content_sheet")
    )
)

// Gate that lets the assistant open from core search.
internal object CvdCoreSearchGateFingerprint : Fingerprint(
    filters = listOf(
        string("all.cvd.allowed_cvd_from_core_search_for_lpd")
    )
)

// Widget enum clinit (filters in string order); renamed wires make the parser skip CVD widgets.
internal object CvdWidgetTypeFingerprint : Fingerprint(
    filters = listOf(
        string("CVDHeroWidget"),
        string("CVDControlUnitWidget"),
        string("CVDOrbWidget"),
        string("CVD_ORB_WIDGET")
    )
)

// Sub-nav row parser; the Ask pill rides the ILLUSTRATION_PILL branch like Swiggy pills.
internal object CvdSubNavParserFingerprint : Fingerprint(
    filters = listOf(
        string("getSubMenuItemsList(...)"),
        string("getIllustrationPill(...)")
    )
)

// The home suggestion tray converter: StaggeredTrayWidget -> its BFF model.
internal object HomeSuggestionTrayFingerprint : Fingerprint(
    parameters = listOf("Lcom/hotstar/ui/model/widget/StaggeredTrayWidget;"),
    filters = listOf(
        string("getTrayHeader(...)"),
        string("getItemsList(...)")
    )
)
