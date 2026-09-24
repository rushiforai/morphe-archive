@file:Suppress("DEPRECATION")

package com.r3d.patchlab.patches.pairip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import java.util.logging.Logger
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility

@Suppress("unused")
val disableLicenseCheckPatch = bytecodePatch {
    compatibleWith(
        Compatibility(
            packageName = "br.com.zetabit.ios_standby",
            name = "StandBy Mode",
            apkFileType = ApkFileType.APKM
        )
    )
    execute {
        var patched = false

        // 1. Original processResponse
        ProcessLicenseResponseFingerprint.methodOrNull?.let { method ->
            method.addInstruction(0, "const/4 p1, 0x0")
            patched = true
        }

        // 2. Validate response → force early success
        ValidateLicenseResponseFingerprint.methodOrNull?.let { method ->
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """.trimIndent()
            )
            patched = true
        }

        // 3. Kill initializeLicenseCheck
        val initFingerprint = Fingerprint(
            definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
            name = "initializeLicenseCheck",
            returnType = "V"
        )

        initFingerprint.methodOrNull?.let { method ->
            method.addInstructions(
                0,
                """
                    return-void
                """.trimIndent()
            )
            patched = true
        }

        // 4. Kill startErrorDialogActivity
        val errorDialogFingerprint = Fingerprint(
            definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
            name = "startErrorDialogActivity",
            returnType = "V"
        )

        errorDialogFingerprint.methodOrNull?.let { method ->
            method.addInstructions(
                0,
                """
                    return-void
                """.trimIndent()
            )
            patched = true
        }

        if (!patched) {
            Logger.getLogger(this::class.java.name)
                .warning("Could not find any PairIP methods. No changes applied.")
        }
    }
}