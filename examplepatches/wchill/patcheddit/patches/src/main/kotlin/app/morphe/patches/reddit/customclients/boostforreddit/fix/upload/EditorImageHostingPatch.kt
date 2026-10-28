/*
 * Copyright 2026 brealorg.
 * Modifications Copyright 2026 wchill.
 * Adapted from https://github.com/brealorg/breal-morphe-patches (0226c2e).
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.patches.reddit.customclients.boostforreddit.fix.upload

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.all.misc.PatchCategory
import app.morphe.patches.all.misc.resources.addResourcesPatch
import app.morphe.patches.reddit.customclients.AppCompatibility
import app.morphe.patches.reddit.customclients.ExtensionPatches
import app.morphe.patches.reddit.customclients.boostforreddit.misc.settings.boostMorpheSettingsResourcesPatch
import app.morphe.patches.reddit.customclients.boostforreddit.misc.settings.boostMorpheSettingsPatch
import app.morphe.patches.reddit.customclients.boostforreddit.misc.settings.addBoostSettings
import app.morphe.util.ResourceGroup

private val editorImageHostingResourcesPatch = resourcePatch(default = false) {
    dependsOn(
        boostMorpheSettingsResourcesPatch,
        addResourcesPatch(
            "boost",
            ResourceGroup(
                "xml", "morphe_boost_editor_image_hosting.xml", "morphe_boost_editor_image_hosting_entry.xml",
            ),
            ResourceGroup("layout", "morphe_boost_imgbb_api_key_dialog.xml"),
        ),
    )

    execute {
        addBoostSettings("morphe_boost_editor_image_hosting_entry", beforeTitle = "Search")
    }
}

@Suppress("unused")
val editorImageHostingPatch = bytecodePatch(
    name = "Configure editor image hosting",
    description =
        "Uses Imgur Free or your configured ImgBB account for images attached to comments and text posts.",
    default = true,
) {
    category(PatchCategory.COMMENTS)
    dependsOn(ExtensionPatches.Boost, boostMorpheSettingsPatch, editorImageHostingResourcesPatch)
    compatibleWith(*AppCompatibility.Boost)

    execute {
        remoteConfigStringFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    const-string v0, "uploader_format"
                    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :morphe_native_editor_provider
                    invoke-static {}, Lapp/morphe/extension/boost/upload/ExternalImageUploadSettings;->getEditorProvider()Ljava/lang/String;
                    move-result-object v0
                    return-object v0
                """,
                ExternalLabel("morphe_native_editor_provider", getInstruction(0)),
            )
        }
        mediaUploaderFactoryFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    const-string v0, "imgbb"
                    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :morphe_native_upload_factory
                    invoke-static {}, Lapp/morphe/extension/boost/upload/ExternalImageUploadFactory;->createImgBbUploader()${returnType}
                    move-result-object v0
                    return-object v0
                """,
                ExternalLabel("morphe_native_upload_factory", getInstruction(0)),
            )
        }
    }
}
