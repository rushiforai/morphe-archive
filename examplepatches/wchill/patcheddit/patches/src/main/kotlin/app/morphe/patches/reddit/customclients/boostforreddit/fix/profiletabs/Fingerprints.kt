/*
 * Copyright 2026 brealorg.
 * Adapted from https://github.com/brealorg/breal-morphe-patches (82d70f7).
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.patches.reddit.customclients.boostforreddit.fix.profiletabs

import app.morphe.patches.reddit.customclients.boostforreddit.bindings.BoostApi

internal val userActivityBuildTabsFingerprint = BoostApi.UserActivity.onCreate.fingerprint()
