package com.zeldrisho.patches.zalo.media

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal object MediaExpiryStatus : Fingerprint(
    definingClass = "Lvk0/g;",
    name = "n",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Lvk0/a;",
    parameters = listOf("Lo00/q;", "Lo00/e2;"),
    filters = listOf(
        fieldAccess(definingClass = "Lvk0/a;", name = "BIG_FILE_EXPIRED", type = "Lvk0/a;"),
        fieldAccess(definingClass = "Lvk0/a;", name = "BIG_FILE_NOT_EXPIRED", type = "Lvk0/a;"),
    ),
)

/** The backup/restore age cutoff used while building the local media list. */
internal object MediaBackupAgeFilter : Fingerprint(
    definingClass = "Lvl/c;",
    name = "i",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Ljava/util/ArrayList;"),
    filters = listOf(string("BACKUP_MEDIA_LIMIT_TIME_DAY")),
)

/** Lazily computes the cutoff used by Drive media restore. */
internal object MediaRestoreAgeCutoff : Fingerprint(
    definingClass = "Ldm/d;",
    name = "n",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "J",
    parameters = emptyList(),
    filters = listOf(string("BACKUP_MEDIA_LIMIT_TIME_DAY")),
)

internal object SelectedMediaQuality : Fingerprint(
    definingClass = "Luh1/u;",
    name = "c",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = emptyList(),
    filters = listOf(string("LAST_SELECTION_MEDIA_QUALITY_")),
)

internal object OriginalMediaQualityEnabled : Fingerprint(
    definingClass = "Luh1/u;",
    name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
)

internal object OriginalMediaQualityEntitled : Fingerprint(
    definingClass = "Luh1/u;",
    name = "f",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
)

internal object OriginalMediaQualityAvailable : Fingerprint(
    definingClass = "Luh1/u;",
    name = "e",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        methodCall(definingClass = "Luh1/u;", name = "b", returnType = "Z"),
        methodCall(definingClass = "Luh1/u;", name = "f", returnType = "Z"),
    ),
)

/** Builds the quality-picker arguments; its first parameter is the current quality. */
internal object QualityPickerArguments : Fingerprint(
    definingClass = "Luh1/b;",
    name = "a",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("I", "Landroid/os/Bundle;", "Ljava/lang/String;", "Ljava/lang/String;"),
    filters = listOf(string("EXTRA_CURRENT_QUALITY")),
)

internal object PickerQualityInitialization : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/picker/mediapicker/MediaPickerView;",
    name = "b7",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        fieldAccess(definingClass = "Lvh1/d;", name = "HD", type = "Lvh1/d;"),
    ),
)

internal object PhotoQualityChipUpdate : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/picker/mediapicker/MediaPickerView;",
    name = "y6",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Lcom/zing/zalo/ui/picker/mediapicker/MediaPickerView;", "I"),
    filters = listOf(methodCall(definingClass = "Lvh1/c;", name = "a", returnType = "Ljava/lang/String;")),
)

/** Updates the quality chip after media selection on the landing page. */
internal object LandingPageQualityChipUpdate : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/picker/landingpage/LandingPageView;",
    name = "B6",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("I"),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/zing/zalo/ui/picker/landingpage/LandingPageView;",
            name = "Z1",
            type = "I",
        ),
        methodCall(definingClass = "Lvh1/c;", name = "a", returnType = "Ljava/lang/String;"),
    ),
)

/** Initializes the landing-page quality chip when the send mode opens. */
internal object LandingPageQualityChipInitialization : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/picker/landingpage/LandingPageView;",
    name = "W4",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Landroid/view/View;",
    parameters = listOf(
        "Landroid/view/LayoutInflater;",
        "Landroid/view/ViewGroup;",
        "Landroid/os/Bundle;",
    ),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/zing/zalo/ui/picker/landingpage/LandingPageView;",
            name = "Z1",
            type = "I",
        ),
        methodCall(definingClass = "Lvh1/c;", name = "a", returnType = "Ljava/lang/String;"),
    ),
)

/** Updates the host chat input-bar chip when picker selection changes. */
internal object ChatInputBarQualityChipUpdate : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/chat/widget/inputbar/ChatInputBar;",
    name = "r",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("I"),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/zing/zalo/ui/chat/widget/inputbar/ChatInputBar;",
            name = "J0",
            type = "I",
        ),
        methodCall(definingClass = "Lvh1/c;", name = "a", returnType = "Ljava/lang/String;"),
    ),
)

/** Final rendering boundary for the quality-chip label. */
internal object QualityChipLabel : Fingerprint(
    definingClass = "Lcom/zing/zalo/ui/picker/mediapicker/MediaPickerQualityChip;",
    name = "setText",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/CharSequence;"),
)

internal object SelectedPhotoOriginalFlag : Fingerprint(
    definingClass = "Lbq0/g;",
    name = "a",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            definingClass = "Lcom/zing/zalo/data/mediapicker/model/MediaItem;",
            name = "q",
            type = "Z",
        ),
        fieldAccess(definingClass = "Lo00/k0;", name = "s0", type = "Z"),
    ),
)

internal val mediaFingerprints = listOf(
    MediaExpiryStatus,
    MediaBackupAgeFilter,
    MediaRestoreAgeCutoff,
    SelectedMediaQuality,
    OriginalMediaQualityEnabled,
    OriginalMediaQualityEntitled,
    OriginalMediaQualityAvailable,
    QualityPickerArguments,
    PickerQualityInitialization,
    PhotoQualityChipUpdate,
    LandingPageQualityChipUpdate,
    LandingPageQualityChipInitialization,
    ChatInputBarQualityChipUpdate,
    QualityChipLabel,
    SelectedPhotoOriginalFlag,
)
