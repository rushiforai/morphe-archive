/*
 * Copyright 2026 brealorg.
 * Adapted from https://github.com/brealorg/breal-morphe-patches (82d70f7).
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.patches.reddit.customclients.boostforreddit.fix.gifsearch

import app.morphe.patches.reddit.customclients.boostforreddit.bindings.BoostApi

internal val formattingBarInsertMarkdownFingerprint = BoostApi.FormattingBar.formattingBarInsertMarkdown.fingerprint()

internal val formattingBarOpenLinkDialogWithUrlFingerprint = BoostApi.FormattingBar.formattingBarOpenLinkDialogWithUrl.fingerprint()

internal val formattingBarOpenLinkDialogFingerprint = BoostApi.FormattingBar.formattingBarOpenLinkDialog.fingerprint()

internal val formattingBarSetEditTextFingerprint = BoostApi.FormattingBar.setEditText.fingerprint()

internal val formattingBarInitFingerprint = BoostApi.FormattingBar.construct.fingerprint()

internal val formattingBarImageMenuOptionsFingerprint = BoostApi.FormattingBar.formatImage.fingerprint()

internal val formattingBarHandleImageMenuOptionFingerprint = BoostApi.FormattingImageMenuListener.formattingBarHandleImageMenuOption.fingerprint()
