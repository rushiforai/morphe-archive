/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.logging.responseLogging

import app.rex.patches.twitter.misc.settings.settingsPatch
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.rex.patches.twitter.utils.Constants.PATCHES_DESCRIPTOR
import app.rex.patches.twitter.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

internal const val JACKSON_CLASS = "/fasterxml/jackson/core/"

internal object InputStreamFingerprint : Fingerprint(
    definingClass = JACKSON_CLASS,
    parameters = listOf("Ljava/io/InputStream"),
    custom = { methodDef, _ ->
        methodDef.returnType.contains(JACKSON_CLASS)
    },
)

@Suppress("unused")
val responseLoggingPatch =
    bytecodePatch(
        name = "Log server response",
        description = "Log json responses received from server",
    ) {
        compatibleWith(COMPATIBILITY_X)
        dependsOn(settingsPatch)

        execute {

            InputStreamFingerprint.method.addInstructions(
                0,
                """
                invoke-static {p1}, $PATCHES_DESCRIPTOR/loggers/ResponseLogger;->saveInputStream(Ljava/io/InputStream;)Ljava/io/InputStream;
                move-result-object p1
                """.trimIndent(),
            )
            enableSettings("serverResponseLogging")

            enableSettings("serverResponseLoggingOverwriteFile")
        }
    }
