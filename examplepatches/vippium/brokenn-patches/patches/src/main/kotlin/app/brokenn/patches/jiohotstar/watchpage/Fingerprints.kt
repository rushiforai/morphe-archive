package app.brokenn.patches.jiohotstar.watchpage

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

// The watch-page tab-strip converter: AdaptiveTabContainerWidget -> BffAdaptiveTabContainerWidget.
internal object AdaptiveTabConverterFingerprint : Fingerprint(
    returnType = "Lcom/hotstar/bff/models/widget/BffAdaptiveTabContainerWidget;",
    parameters = listOf("Lcom/hotstar/ui/model/widget/AdaptiveTabContainerWidget;")
)

// The IllustrationPill converter.
internal object PillConverterFingerprint : Fingerprint(
    returnType = "Lcom/hotstar/bff/models/widget/BffIllustrationPillWidget;",
    parameters = listOf("L"),
    filters = listOf(
        string("getIllustration(...)"),
        string("getActions(...)")
    )
)

// The sub-nav row parser (sponsored pills ride the ILLUSTRATION_PILL branch).
internal object SubNavParserFingerprint : Fingerprint(
    filters = listOf(
        string("getSubMenuItemsList(...)"),
        string("getIllustrationPill(...)")
    )
)
