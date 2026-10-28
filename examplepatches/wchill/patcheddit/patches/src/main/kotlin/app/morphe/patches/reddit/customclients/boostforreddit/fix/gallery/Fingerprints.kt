/*
 * Modifications Copyright 2026 brealorg.
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 * Adapted from https://github.com/brealorg/breal-morphe-patches (82d70f7).
 */

package app.morphe.patches.reddit.customclients.boostforreddit.fix.gallery

import app.morphe.patches.reddit.customclients.boostforreddit.bindings.BoostApi

internal val galleryPageSelectedFingerprint = BoostApi.GalleryPageListener.galleryPageSelected.fingerprint()

internal val galleryPagerStateFingerprint = BoostApi.GalleryPageListener.galleryPagerState.fingerprint()

internal val galleryPageFactoryFingerprint = BoostApi.GalleryActivityImagePagerAdapter.galleryPageFactory.fingerprint()

internal val imageModelFragmentOnCreateViewFingerprint = BoostApi.ImageModelFragment.onCreateView.fingerprint()

internal val imageModelFragmentOnDestroyFingerprint = BoostApi.ImageModelFragment.onDestroy.fingerprint()
