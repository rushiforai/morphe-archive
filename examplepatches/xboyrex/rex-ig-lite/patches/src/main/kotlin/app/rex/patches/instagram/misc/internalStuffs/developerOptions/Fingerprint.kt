/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.internalStuffs.developerOptions

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object FragmentNavigatorTransitionFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/Integer;"),
    strings = listOf("FragmentNavigator.transitionInternal", "FragmentNavigator", "Fragment is null when attempting transition"),
)

internal object HomeIconOnClickListenerFingerprint : Fingerprint(
    name = "onLongClick",
    strings = listOf("click", "activity"),
)

internal object DeveloperOptionCallWithCallableFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.FINAL, AccessFlags.PUBLIC),
    strings = listOf("debug_options_error"),
)
