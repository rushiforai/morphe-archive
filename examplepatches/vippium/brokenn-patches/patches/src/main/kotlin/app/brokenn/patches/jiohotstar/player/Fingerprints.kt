package app.brokenn.patches.jiohotstar.player

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

// The PlayerWidget converter: matched by its PlayerWidget parameter and the getItemsList
// call inside — the defining class is R8-renamed between app versions.
internal object PlayerWidgetConverterFingerprint : Fingerprint(
    parameters = listOf("Lcom/hotstar/ui/model/widget/PlayerWidget;"),
    filters = listOf(
        string("getItemsList(...)")
    )
)

internal object PlayerTopBarFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("icon-settings"),
        string("threeSixtyItem")
    )
)

internal object PlayerBackButtonFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("common-v2__a11y_go_back_cta"),
        string("tag_arrow_back_button")
    )
)
