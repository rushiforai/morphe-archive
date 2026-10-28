/*
 * Modifications Copyright 2026 brealorg.
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 * Adapted from https://github.com/brealorg/breal-morphe-patches (82d70f7).
 */

package app.morphe.patches.reddit.customclients.boostforreddit.fix.hide

import app.morphe.patches.reddit.customclients.boostforreddit.bindings.BoostApi

internal val subredditBaseHideToggleFingerprint = BoostApi.SubredditBaseActivity.onHideToggle.fingerprint()

// All feed layouts now share identity-based hiding in this base fragment.
internal val hideFragmentFingerprint = BoostApi.SubmissionRecyclerViewFragment.hideFragment.fingerprint()

internal val feedActionS1InvalidIndexFingerprint = BoostApi.SubmissionRecyclerViewFragment.feedActionS1InvalidIndex.fingerprint()
