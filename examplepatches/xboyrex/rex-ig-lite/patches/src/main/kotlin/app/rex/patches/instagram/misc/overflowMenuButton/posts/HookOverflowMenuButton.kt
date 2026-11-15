/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.overflowMenuButton.posts

import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.FEED_OVERFLOW_MENU_BUTTON_CLASS
import app.rex.utils.changeFirstString
import app.rex.utils.classNameToExtension
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.registersUsed

@Suppress("unused")
val hookOverflowMenuButton =
    patch(
        description = "This patch hooks array values initialisation in overflow menu button constructor.",
    ) {
        dependsOn(includeButtonsInOverflowMenuArrayPatch, hookOverflowMenuButtonOnClickPatch)
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        execute {
            runCatching {
            val enumBtnClass = classNameToExtension(EnumButtonClassFingerprint.originalClassDef.type)
            GetEnumButtonClassExtensionFingerprint.changeFirstString(enumBtnClass)

            AddFeedButtonExtensionFingerprint.changeFirstString(AddFeedOverflowOptionFingerprint.originalMethod.name)

            (AddFeedButtonFingerprint.matchOrNull() ?: AddFeedButtonFactoryFingerprint.match()).let {
                val arrayListRegister = it.instructionMatches[1].instruction.registersUsed.single()
                val checkCastIndex = it.instructionMatches.last().index
                val checkCastRegister = it.instructionMatches.last().instruction.registersUsed.single()

                it.method.addInstructions(
                    checkCastIndex + 1,
                    """
                    invoke-static {v$checkCastRegister,v$arrayListRegister},$FEED_OVERFLOW_MENU_BUTTON_CLASS->addFeedOverflowButton(Ljava/lang/Object;Ljava/util/ArrayList;)V
                    """.trimIndent(),
                )
            }
        
            }
        }
    }
