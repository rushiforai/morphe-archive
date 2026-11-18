package app.brokenn.patches.jiohotstar.player

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

// The PlayerWidget converter: builds the control-bar data from its menu items.
// Matched by its PlayerWidget parameter and the getItemsList call inside - the
// defining class is R8-obfuscated and changes between app versions.
object PlayerWidgetConverterFingerprint : Fingerprint(
    parameters = listOf("Lcom/hotstar/ui/model/widget/PlayerWidget;"),
    filters = listOf(
        string("getItemsList(...)")
    )
)
