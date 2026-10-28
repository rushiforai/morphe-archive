/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.morphe.patches.reddit.customclients.boostforreddit.debug

import app.morphe.patches.reddit.customclients.boostforreddit.bindings.BoostApi

internal val ExceptionHandlerFingerprint = BoostApi.Timber.exceptionHandler.fingerprint()

internal val TimberFingerprint = BoostApi.Timber.timber.fingerprint()
