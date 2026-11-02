/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.distractionFree.doubleTap

import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.shared.parameterRegisterStart
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

internal object ReelOnDoubleTapFingerprint : Fingerprint(
    parameters = listOf("Landroid/view/MotionEvent;"),
    returnType = "Z",
    name = "onDoubleTap",
    strings = listOf("android_purge_26_q3_ClipsItemGestureDetector_onDoubleTap"),
    custom = { _, classDef ->
        classDef.superclass == "Landroid/view/GestureDetector\$SimpleOnGestureListener;" &&
            classDef.fields.count { it.type == "Lcom/instagram/clips/intf/ClipsViewerConfig;" } == 1
    },
)

@Suppress("unused")
val disableDoubleTapOnReelPatch =
    bytecodePatch(
        description = "Disable double tap like on reels",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {

            ReelOnDoubleTapFingerprint.matchAll(1..1).single().method.apply {
                if (parameterRegisterStart(this) == 0) {
                    throw PatchException("Reel double-tap handler requires a local register")
                }
                addInstructions(
                    0,
                    DOUBLE_TAP_PREF_DESCRIPTOR.format("disableDoubleTapReel"),
                )
            }
        }
    }
