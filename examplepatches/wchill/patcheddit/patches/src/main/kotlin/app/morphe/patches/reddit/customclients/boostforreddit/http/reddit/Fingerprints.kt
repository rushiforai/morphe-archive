/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 * Modifications Copyright 2026 brealorg.
 * Adapted from https://github.com/brealorg/breal-morphe-patches (82d70f7).
 */

package app.morphe.patches.reddit.customclients.boostforreddit.http.reddit

import app.morphe.patches.reddit.customclients.boostforreddit.bindings.BoostApi

import com.android.tools.smali.dexlib2.AccessFlags

// Badge construction is inlined into the binders.
internal val SetCommentBabushkaTextFingerprint = BoostApi.CommentViewHolder.bind.fingerprint()

internal val SetSubmissionBabushkaTextFingerprint = BoostApi.SubmissionViewHolder.bind.fingerprint()

internal val ContributionModelConstructorFingerprint = BoostApi.ContributionModel.construct.fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
)

internal val ContributionModelWriteToParcelFingerprint = BoostApi.ContributionModel.writeToParcel.fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC),
)

internal val SubmissionModelDeserializeFingerprint = BoostApi.SubmissionModel.fromSubmission.fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

internal val CommentModelDeserializeFingerprint = BoostApi.CommentModel.commentModelDeserialize.fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
)

internal val StateSubmissionViewSetStateFingerprint = BoostApi.StateSubmissionView.setState.fingerprint(
    strings = listOf("reddit", "copyright_takedown"),
)

internal val GlideHttpUrlFetcherFetchFingerprint = BoostApi.HttpUrlFetcher.loadDataWithRedirects.fingerprint()
