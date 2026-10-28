/*
 * Copyright 2026 wchill.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 * Modifications Copyright 2026 brealorg.
 * Adapted from https://github.com/brealorg/breal-morphe-patches (0226c2e).
 */

package app.morphe.patches.reddit.customclients.boostforreddit.debug

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.reddit.customclients.AppCompatibility
import app.morphe.patches.reddit.customclients.ExtensionPatches
import app.morphe.patches.all.misc.PatchCategory
import app.morphe.patches.all.misc.crashlog.crashLogPatch
import app.morphe.patches.all.misc.resources.addResourcesPatch
import app.morphe.patches.reddit.customclients.boostforreddit.bindings.BoostApi
import app.morphe.patches.reddit.customclients.boostforreddit.misc.settings.boostMorpheSettingsPatch
import app.morphe.patches.reddit.customclients.boostforreddit.misc.settings.boostMorpheSettingsResourcesPatch
import app.morphe.patches.reddit.customclients.boostforreddit.misc.settings.addBoostSettings
import app.morphe.util.ResourceGroup

const val EXTENSION_CLASS_DESCRIPTOR = "Lapp/morphe/extension/boost/debug/ExceptionHook;"

private val fatalCrashLogPatch = crashLogPatch(BoostApi.BaseActivity.onCreate.fingerprint())

private val exceptionLogResourcesPatch = resourcePatch(default = false) {
    dependsOn(
        boostMorpheSettingsResourcesPatch,
        addResourcesPatch(
            "boost",
            ResourceGroup(
                "xml",
                "morphe_boost_exception_log.xml",
                "morphe_boost_diagnostics_entry.xml",
                "morphe_boost_fatal_crash_logs.xml",
            ),
            ResourceGroup("layout", "morphe_boost_log_text.xml", "morphe_boost_log_divider.xml"),
        ),
    )

    execute {
        addBoostSettings("morphe_boost_diagnostics_entry")
    }
}

@Suppress("unused")
val hookExceptionHandler = bytecodePatch(
    name = "Log exceptions",
    description = "Logs reported errors and fatal crashes, viewable in Morphe settings.",
    default = true
) {
    category(PatchCategory.ADVANCED)
    dependsOn(ExtensionPatches.Boost, boostMorpheSettingsPatch, exceptionLogResourcesPatch, fatalCrashLogPatch)
    compatibleWith(*AppCompatibility.Boost)

    execute {
        BoostApi.MyApplication.onCreate.fingerprint().method.addInstructions(
            0,
            "invoke-static {p0}, $EXTENSION_CLASS_DESCRIPTOR->initialize(Landroid/app/Application;)V",
        )
        ExceptionHandlerFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const-string v0, "Non-fatal Boost error"
                    invoke-static {p0, v0}, $EXTENSION_CLASS_DESCRIPTOR->handleException(Ljava/lang/Throwable;Ljava/lang/String;)V
                """,
            )
        }
    }
}
