/*
 * Copyright 2026 brealorg.
 * Adapted from https://github.com/brealorg/breal-morphe-patches (82d70f7).
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.patches.reddit.customclients.boostforreddit.fix.widget

import app.morphe.patches.reddit.customclients.boostforreddit.bindings.BoostApi

internal val imageWidgetProviderUpdateWithSubmissionFingerprint = BoostApi.UpdateImageWidget.imageWidgetProviderUpdateWithSubmission.fingerprint(
    strings = listOf("Widget updateWithSubmissions %d"),
)
