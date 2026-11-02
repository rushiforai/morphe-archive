/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.trackDataIntf

import app.rex.utils.changeFirstString
import app.rex.utils.changeStringAt
import app.rex.utils.methodExtractor
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.indexOfFirstInstruction
import com.android.tools.smali.dexlib2.Opcode

val trackDataIntfEntity =
    bytecodePatch(
        description = "This patch is used for decoding obfuscated code of track data interface",
    ) {
        execute {
            val trackDataFromMusicInfoMethodName = TrackDataFromMusicInfoMethodFingerprint.method.name
            GetTrackDataExtension.changeFirstString(trackDataFromMusicInfoMethodName)

            mutableClassDefBy(IMMUTABLE_PANDO_AUDIO_FILTER_INFO_CLASS_DESCRIPTOR)
                .methods
                .last {
                    it.returnType ==
                        "Lcom/facebook/pando/TreeUpdaterJNI;"
                }.apply {
                    val mappingMethodInvokeInstruction = getInstruction(indexOfFirstInstruction(Opcode.INVOKE_VIRTUAL))
                    GetMappingsExtension.changeFirstString(mappingMethodInvokeInstruction.methodExtractor().name)
                }
        }
    }
