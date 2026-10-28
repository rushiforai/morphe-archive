package app.morphe.patches.reddit.customclients.boostforreddit.fix.slink

import app.morphe.patches.reddit.customclients.AppCompatibility
import app.morphe.patches.reddit.customclients.RESOLVE_S_LINK_METHOD
import app.morphe.patches.reddit.customclients.SET_ACCESS_TOKEN_METHOD
import app.morphe.patches.reddit.customclients.ExtensionPatches
import app.morphe.patches.reddit.customclients.fixSLinksPatch
import app.morphe.patches.reddit.customclients.boostforreddit.wrapHook

const val EXTENSION_CLASS_DESCRIPTOR = "Lapp/morphe/extension/boost/FixSLinksPatch;"

@Suppress("unused")
val fixSlinksPatch = fixSLinksPatch(
    extensionPatch = ExtensionPatches.Boost,
) {
    compatibleWith(*AppCompatibility.Boost)

    execute {
        // region Patch navigation handler.

        HandleNavigationFingerprint.wrapHook(
            before = """
                invoke-static {p1}, $EXTENSION_CLASS_DESCRIPTOR->$RESOLVE_S_LINK_METHOD
                move-result v0
                if-eqz v0, :morphe_native_navigation
                return v0
                :morphe_native_navigation
            """,
        )

        // endregion

        // region Patch set access token.

        GetOAuthAccessTokenFingerprint.wrapHook(
            after = "invoke-static {v0}, $EXTENSION_CLASS_DESCRIPTOR->$SET_ACCESS_TOKEN_METHOD",
        )

        // endregion
    }
}
