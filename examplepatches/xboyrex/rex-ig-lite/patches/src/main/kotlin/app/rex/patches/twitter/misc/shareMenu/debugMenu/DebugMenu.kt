/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.misc.shareMenu.debugMenu

import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.misc.shareMenu.fingerprints.ActionEnumsFingerprint
import app.rex.patches.twitter.misc.shareMenu.hooks.registerButton
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.enableSettings
import app.rex.patches.twitter.utils.versionCheckPatch
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val debugMenu =
    bytecodePatch(
        name = "Enable debug menu for posts",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch, versionCheckPatch)

        execute {
            val buttonEnumClass = ActionEnumsFingerprint.classDef.toString()
            val buttonReference = "$buttonEnumClass->ViewDebugDialog:$buttonEnumClass"
            registerButton(buttonReference, "enableDebugMenu")
            enableSettings("enableDebugMenu")
        }
    }
