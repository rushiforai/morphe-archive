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
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import app.morphe.util.matchSingle
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val PEOPLE_CELL_CLASS = "Lcom/instagram/igds/components/peoplecell/IgdsPeopleCell;"

private object SupportingTextViewFingerprint : Fingerprint(
    definingClass = PEOPLE_CELL_CLASS,
    name = "getAdditionalSupportingTextView",
    parameters = emptyList(),
    returnType = "Landroid/widget/TextView;",
)

@Suppress("unused")
val viewStoryMentionsPatch =
    bytecodePatch(
        name = "View story mentions",
        description = "Add option to view visible and hidden story mentions.",
    ) {
        dependsOn(settingsPatch, handleStoryButtonPatch, userDataEntity, mediaDataEntity, instagramDialogBoxEntity, videoDataEntity)

        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            val supportingText = SupportingTextViewFingerprint.matchSingle()
            val supportingField = supportingText.method.instructions
                .filter { it.opcode == Opcode.IGET_OBJECT }
                .mapNotNull { it.getReference<FieldReference>() }
                .singleOrNull { it.definingClass == PEOPLE_CELL_CLASS && it.type == "Landroid/widget/TextView;" }
                ?: throw PatchException("Could not uniquely resolve people cell supporting text field")

            val setters = mapOf(
                "setPrimaryText" to listOf("Ljava/lang/CharSequence;", "Z"),
                "setSupportingText" to listOf("Ljava/lang/CharSequence;"),
                "setProfileImage" to listOf("Lcom/instagram/common/typedurl/ImageUrl;", "Landroid/view/View\$OnClickListener;"),
            )
            setters.forEach { (name, parameters) ->
                val target = supportingText.classDef.methods.singleOrNull { method ->
                    AccessFlags.PUBLIC.isSet(method.accessFlags) &&
                        !AccessFlags.STATIC.isSet(method.accessFlags) &&
                        method.returnType == "V" && method.parameterTypes == parameters &&
                        method.implementation != null &&
                        (name != "setSupportingText" || method.instructions.any {
                            it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>() == supportingField
                        })
                } ?: throw PatchException("Could not uniquely resolve people cell $name")

                Fingerprint(
                    definingClass = "$PATCHES_DESCRIPTOR/story/ViewStoryMentionsPatch;",
                    name = name,
                    parameters = listOf(PEOPLE_CELL_CLASS) + parameters,
                    returnType = "V",
                    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC),
                ).matchSingle().method.addInstruction(
                    0,
                    "invoke-virtual/range {p0 .. p${parameters.size}}, $target",
                )
            }

            enableSettings("viewStoryMentions")
        }
    }
