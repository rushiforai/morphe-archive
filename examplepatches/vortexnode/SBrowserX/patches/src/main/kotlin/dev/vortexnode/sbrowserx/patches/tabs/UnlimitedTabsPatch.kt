package dev.vortexnode.sbrowserx.patches.tabs

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import dev.vortexnode.sbrowserx.patches.core.sbrowserXCorePatch
import dev.vortexnode.sbrowserx.shared.Constants.COMPATIBILITY_SBROWSER
import dev.vortexnode.sbrowserx.shared.findMethodOrThrow

private const val TAB_COUNT_MANAGER_CLASS =
    "Lcom/sec/android/app/sbrowser/multi_instance/MultiInstanceTabCountManager;"

@Suppress("unused")
val unlimitedTabsPatch = bytecodePatch(
    name = "Remove 99-Tab Limit",
    description = "Removes the 99-tab limit so you can keep thousands of open tabs.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SBROWSER)
    dependsOn(sbrowserXCorePatch)

    execute {
        // MultiInstanceTabCountManager.getMaxTabCount()I (.locals 0, single return p0)
        val maxTabMethod = findMethodOrThrow(
            classType = TAB_COUNT_MANAGER_CLASS,
            methodName = "getMaxTabCount",
            parameterTypes = emptyList(),
            returnType = "I",
        )
        val insns = maxTabMethod.implementation?.instructions
            ?: error("Missing instructions in MultiInstanceTabCountManager.getMaxTabCount")
        maxTabMethod.addInstructions(
            insns.size - 1,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->adjustMaxTabCount(I)I
                move-result p0
            """.trimIndent(),
        )
    }
}
