/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.distractionFree.doubleTap

import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

internal object ReelOnDoubleTapFingerprint : Fingerprint(
    parameters = listOf("Landroid/view/MotionEvent;"),
    returnType = "Z",
    name = "onDoubleTap",
    strings = listOf("android_purge_26_q3_ClipsItemGestureDetector_onDoubleTap"),
)

@Suppress("unused")
val disableDoubleTapOnReelPatch =
    patch(
        description = "Disable double tap like on reels",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            runCatching {

            ReelOnDoubleTapFingerprint.method.addInstructions(
                0,
                DOUBLE_TAP_PREF_DESCRIPTOR.format("disableDoubleTapReel"),
            )
        
            }
        }
    }
