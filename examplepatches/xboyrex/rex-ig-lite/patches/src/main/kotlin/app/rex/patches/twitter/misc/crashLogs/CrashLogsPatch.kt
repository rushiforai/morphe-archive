/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.twitter.misc.crashLogs

import app.rex.patches.twitter.misc.extension.twitterInitHook
import app.rex.patches.twitter.utils.Constants.COMPATIBILITY_X
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val crashLogsPatch =
    bytecodePatch(
        description = "Adds recording crash logs functionality",
    ) {
        compatibleWith(COMPATIBILITY_X)

        execute {
            twitterInitHook.fingerprint.method.apply {

                val freeRegister = 0
                addInstructions(
                    instructions.size - 1,
                    """
                    new-instance v$freeRegister, Lapp/morphe/extension/rex/CustomCrashHandler;
                    invoke-direct {v$freeRegister, p0}, Lapp/morphe/extension/rex/CustomCrashHandler;-><init>(Landroid/content/Context;)V
                    invoke-static {v$freeRegister}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread${'$'}UncaughtExceptionHandler;)V
                    """.trimIndent(),
                )
            }
        }
    }
