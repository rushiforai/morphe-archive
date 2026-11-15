/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.dialogbox

import app.rex.utils.changeFirstString
import app.rex.utils.classNameToExtension
import app.morphe.patcher.patch.patch

val instagramDialogBoxEntity =
    patch(
        description = "This patch is used for decoding obfuscated code of the native box of Instagram",
    ) {
        execute {
            runCatching {
            ConstructorExtensionFingerprint.changeFirstString(
                classNameToExtension(GetDialogFingerprint.originalClassDef.type),
            )

            GetDialogExtensionFingerprint.changeFirstString(GetDialogFingerprint.originalMethod.name)

            ShowDialogHelperFingerprint.instructionMatches.let {
                SetTitleExtensionFingerprint.changeFirstString(it[0].fieldReference.name)
                SetMessageExtensionFingerprint.changeFirstString(it[1].methodReference.name)
                SetCancelableExtensionFingerprint.changeFirstString(it[3].methodReference.name)
                SetCanceledOnTouchOutsideExtensionFingerprint.changeFirstString(it[5].methodReference.name)
                SetNegativeButtonExtensionFingerprint.changeFirstString(it[7].methodReference.name)
                SetPositiveButtonExtensionFingerprint.changeFirstString(it[9].methodReference.name)
                SetOnDismissListenerExtensionFingerprint.changeFirstString(it[10].methodReference.name)
            }

            AddDialogMenuItemsExtensionFingerprint.changeFirstString(AddDialogMenuItemsFingerprint.originalMethod.name)

            ClearMenuBottomCornersExtensionFingerprint.changeFirstString(
                GetDialogFingerprint.instructionMatches.last().fieldReference.name,
            )
        
            }
        }
    }
