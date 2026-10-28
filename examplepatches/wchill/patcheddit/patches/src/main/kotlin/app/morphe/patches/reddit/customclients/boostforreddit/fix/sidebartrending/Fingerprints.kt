/*
 * Copyright 2026 brealorg.
 * Adapted from https://github.com/brealorg/breal-morphe-patches (82d70f7).
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.patches.reddit.customclients.boostforreddit.fix.sidebartrending

import app.morphe.patches.reddit.customclients.boostforreddit.bindings.BoostApi

internal val trendingTodayAsyncLoaderFingerprint = BoostApi.TrendingTodayAsyncLoader.doInBackground.fingerprint()

internal val trendingTodayFragmentOnViewCreatedFingerprint = BoostApi.TrendingTodayFragment.onViewCreated.fingerprint()

internal val trendingTodayViewHolderBindFingerprint = BoostApi.TrendingTodayAdapter.onBindViewHolder.fingerprint()
