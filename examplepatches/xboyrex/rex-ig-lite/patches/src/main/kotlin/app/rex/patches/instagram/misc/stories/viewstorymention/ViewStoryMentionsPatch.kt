/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.stories.viewstorymention

import app.rex.patches.instagram.entity.dialogbox.instagramDialogBoxEntity
import app.rex.patches.instagram.entity.mediadata.mediaDataEntity
import app.rex.patches.instagram.entity.userdata.userDataEntity
import app.rex.patches.instagram.entity.videoData.videoDataEntity
import app.rex.patches.instagram.misc.settings.settingsPatch
import app.rex.patches.instagram.misc.stories.handleStoryButtonPatch
import app.rex.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.rex.patches.instagram.utils.Constants.PATCHES_DESCRIPTOR
import app.rex.patches.instagram.utils.enableSettings
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val PEOPLE_CELL_CLASS = "Lcom/instagram/igds/components/peoplecell/IgdsPeopleCell;"

private object SupportingTextViewFingerprint : Fingerprint(
    definingClass = PEOPLE_CELL_CLASS,
    name = "getAdditionalSupportingTextView",
    parameters = emptyList(),
    returnType = "Landroid/widget/TextView;",
    filters = listOf(
        fieldAccess(definingClass = "this", type = "Landroid/widget/TextView;", opcode = Opcode.IGET_OBJECT),
    ),
)

/**
 * People cell setter with [parameters]. The supporting text setter is told apart by [field], the view it updates.
 */
private fun peopleCellSetterFingerprint(parameters: List<String>, field: FieldReference?) = Fingerprint(
    definingClass = PEOPLE_CELL_CLASS,
    returnType = "V",
    parameters = parameters,
    filters = field?.let { listOf(fieldAccess(reference = it, opcode = Opcode.IGET_OBJECT)) },
)

@Suppress("unused")
val viewStoryMentionsPatch =
    patch(
        name = "View story mentions",
        description = "Add option to view visible and hidden story mentions.",
    ) {
        dependsOn(settingsPatch, handleStoryButtonPatch, userDataEntity, mediaDataEntity, instagramDialogBoxEntity, videoDataEntity)

        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            runCatching { enableSettings("viewStoryMentions") }
            runCatching {
            val supportingField = SupportingTextViewFingerprint.instructionMatches.first().fieldReference

            val setters = mapOf(
                "setPrimaryText" to listOf("Ljava/lang/CharSequence;", "Z"),
                "setSupportingText" to listOf("Ljava/lang/CharSequence;"),
                "setProfileImage" to listOf("Lcom/instagram/common/typedurl/ImageUrl;", "Landroid/view/View\$OnClickListener;"),
            )
            setters.forEach { (name, parameters) ->
                val target = peopleCellSetterFingerprint(
                    parameters,
                    supportingField.takeIf { name == "setSupportingText" },
                ).originalMethod

                Fingerprint(
                    definingClass = "$PATCHES_DESCRIPTOR/story/ViewStoryMentionsPatch;",
                    name = name,
                    parameters = listOf(PEOPLE_CELL_CLASS) + parameters,
                    returnType = "V",
                    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
                ).method.addInstruction(
                    0,
                    "invoke-virtual/range {p0 .. p${parameters.size}}, $target",
                )
            }

                        }
        }
    }
