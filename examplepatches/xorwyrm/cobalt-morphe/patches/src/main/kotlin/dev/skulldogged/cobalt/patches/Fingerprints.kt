package dev.skulldogged.cobalt.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.anyInstruction
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

internal object YouTubeApplicationInitFingerprint : Fingerprint(
    filters = listOf(
        string("Application.onCreate"),
        string("Application creation"),
    ),
)

internal object OfflineVideoEndpointFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Ljava/util/Map;",
        "L",
        "Ljava/lang/String",
        "L",
    ),
    filters = listOf(
        anyInstruction(
            string("Unsupported Offline Video Action: "),
            string("Unsupported Offline Video Action: %s"),
        ),
    ),
)
