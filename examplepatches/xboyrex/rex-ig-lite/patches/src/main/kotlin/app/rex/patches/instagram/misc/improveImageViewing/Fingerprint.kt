/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.improveImageViewing

import app.rex.patches.instagram.utils.Constants.EXTENDED_IMAGE_URL_CLASS
import app.morphe.patcher.Fingerprint

internal object SetDPIMetricsFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("%sdpi; %sx%s"),
)

internal object ReturnExtendedImageUrlFingerprint : Fingerprint(
    returnType = EXTENDED_IMAGE_URL_CLASS,
    parameters = listOf("Ljava/lang/Integer;", "Ljava/util/List;", "I"),
)
