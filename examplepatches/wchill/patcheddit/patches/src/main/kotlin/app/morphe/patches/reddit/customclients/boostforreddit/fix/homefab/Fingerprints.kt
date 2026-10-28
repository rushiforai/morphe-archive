/*
 * Modifications Copyright 2026 brealorg.
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 * Adapted from https://github.com/brealorg/breal-morphe-patches (82d70f7).
 */

package app.morphe.patches.reddit.customclients.boostforreddit.fix.homefab

import app.morphe.patches.reddit.customclients.boostforreddit.bindings.BoostApi

internal val fabNestedScrollFingerprint = BoostApi.ScrollAwareFABBehavior.fabNestedScroll.fingerprint()

internal val fabMenuNestedScrollFingerprint = BoostApi.ScrollAwareFABMenuBehavior.fabMenuNestedScroll.fingerprint()

internal val fabMiniNestedScrollFingerprint = BoostApi.ScrollAwareFABMiniBehavior.fabMiniNestedScroll.fingerprint()

internal val fabMenuDependentViewChangedFingerprint =
    BoostApi.ScrollAwareFABMenuBehavior.onDependentViewChanged.fingerprint()

internal val fabMenuDependentViewRemovedFingerprint =
    BoostApi.ScrollAwareFABMenuBehavior.onDependentViewRemoved.fingerprint()

// Inbox/Profile fab + fab_submit, Search fab_save and Home fab_random.
internal val fabBottomNavigationDependentViewChangedFingerprint =
    BoostApi.ScrollAwareFABBehaviorBottomNavigation.onDependentViewChanged.fingerprint()

internal val fabBottomNavigationDependentViewRemovedFingerprint =
    BoostApi.ScrollAwareFABBehaviorBottomNavigation.onDependentViewRemoved.fingerprint()
