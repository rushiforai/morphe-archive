package dev.vortexnode.sbrowserx.patches.updates

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import dev.vortexnode.sbrowserx.shared.Constants.COMPATIBILITY_SBROWSER
import dev.vortexnode.sbrowserx.shared.findMethodOrThrow
import dev.vortexnode.sbrowserx.shared.returnConstantBoolean

private const val UPDATE_MANAGER_CLASS =
    "Lcom/sec/android/app/sbrowser/stub/UpdateManager;"
private const val STUB_REQUEST_CLASS =
    "Lcom/sec/android/app/sbrowser/common/stub/StubRequest;"
private const val APP_UPDATE_MANAGER_CLASS =
    "Lcom/sec/android/app/sbrowser/stub/AppUpdateManager;"

@Suppress("unused")
val disableUpdatePromptsPatch = bytecodePatch(
    name = "Disable Update Prompts & Badges",
    description = "Hides store update prompts, banners, and update badges.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SBROWSER)

    execute {
        // 1. UpdateManager: disable Galaxy Store & Google Play update checks
        findMethodOrThrow(
            classType = UPDATE_MANAGER_CLASS,
            methodName = "checkUpdateAtLoadFinishedIfAvailable",
            parameterTypes = listOf("Landroid/app/Activity;"),
            returnType = "V",
        ).addInstructions(0, "return-void")

        findMethodOrThrow(
            classType = UPDATE_MANAGER_CLASS,
            methodName = "checkUpdateOnGalaxyStore",
            parameterTypes = emptyList(),
            returnType = "V",
        ).addInstructions(0, "return-void")

        findMethodOrThrow(
            classType = UPDATE_MANAGER_CLASS,
            methodName = "checkUpdateOnGooglePlay",
            parameterTypes = emptyList(),
            returnType = "V",
        ).addInstructions(0, "return-void")

        // 2. StubRequest.isUpdateAvailable(StubData)Z (.locals 0) -> false via p0
        findMethodOrThrow(
            classType = STUB_REQUEST_CLASS,
            methodName = "isUpdateAvailable",
            parameterTypes = listOf("Lcom/sec/android/app/sbrowser/common/stub/StubData;"),
            returnType = "Z",
        ).addInstructions(
            0,
            """
                const/4 p0, 0x0
                return p0
            """.trimIndent(),
        )

        // 3. AppUpdateManager: never report forced or recommended updates
        for (methodName in listOf("hasForcedVersionConfig", "hasRecommendedVersionConfig")) {
            findMethodOrThrow(
                classType = APP_UPDATE_MANAGER_CLASS,
                methodName = methodName,
                parameterTypes = emptyList(),
                returnType = "Z",
            ).returnConstantBoolean(false)
        }
        // .locals 0 methods: use p0 safely
        for (methodName in listOf("hasLowerForcedConfig", "hasLowerRecommendConfig")) {
            findMethodOrThrow(
                classType = APP_UPDATE_MANAGER_CLASS,
                methodName = methodName,
                parameterTypes = emptyList(),
                returnType = "Z",
            ).addInstructions(
                0,
                """
                    const/4 p0, 0x0
                    return p0
                """.trimIndent(),
            )
        }
    }
}
