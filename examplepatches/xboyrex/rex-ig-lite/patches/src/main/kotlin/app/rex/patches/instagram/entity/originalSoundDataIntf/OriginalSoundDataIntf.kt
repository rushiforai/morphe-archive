/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.originalSoundDataIntf

import app.rex.utils.changeFirstString
import app.rex.utils.classNameToExtension
import app.rex.utils.methodExtractor
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.Opcode

val originalSoundDataIntfEntity =
    bytecodePatch(
        description = "This patch is used for decoding obfuscated code of Original sound data interface",
    ) {
        execute {
            OriginalSoundMapperFingerprint.apply {
                val audioIdStrIndex = stringMatches[0].index
                val hideMixingStrIndex = stringMatches[1].index
                val audioNameStrIndex = stringMatches[2].index
                val audioUrlStrIndex = stringMatches[3].index
                method.apply {
                    var nexInvokeInterfaceInstruction = getInstruction(indexOfFirstInstruction(audioIdStrIndex, Opcode.INVOKE_INTERFACE))
                    GetAudioIdExtension.changeFirstString(nexInvokeInterfaceInstruction.methodExtractor().name)

                    nexInvokeInterfaceInstruction = getInstruction(indexOfFirstInstruction(audioNameStrIndex, Opcode.INVOKE_INTERFACE))
                    GetAudioNameExtension.changeFirstString(nexInvokeInterfaceInstruction.methodExtractor().name)

                    nexInvokeInterfaceInstruction = getInstruction(indexOfFirstInstruction(audioUrlStrIndex, Opcode.INVOKE_INTERFACE))
                    GetAudioUrlExtension.changeFirstString(nexInvokeInterfaceInstruction.methodExtractor().name)

                    nexInvokeInterfaceInstruction =
                        getInstruction(indexOfFirstInstruction(hideMixingStrIndex, Opcode.MOVE_RESULT_OBJECT) - 1)
                    GetUserDataExtension.changeFirstString(nexInvokeInterfaceInstruction.methodExtractor().name)
                }
            }
        }
    }
