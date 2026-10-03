package com.zeldrisho.patches.threads.links

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import com.zeldrisho.patches.threads.shared.Constants.COMPATIBILITY_THREADS

@Suppress("unused")
val openLinksExternallyPatch = bytecodePatch(
    name = "Open links externally",
    description = "Opens HTTP(S) links in an external app when one can handle them; otherwise keeps Threads' normal link handling.",
) {
    compatibleWith(COMPATIBILITY_THREADS)
    extendWith("extensions/extension.mpe")

    execute {
        injectOpenLinksExternally(WebLinkHandler.method)
    }
}

/**
 * Prepends an external-link launch attempt to the resolved Threads web-link handler.
 *
 * The target must expose context at p1 and URL at p4, return an object, and provide
 * v0/v1 as scratch registers. A successful launch returns Kotlin Unit; a failed
 * launch falls through to the original handler.
 */
internal fun injectOpenLinksExternally(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    method.addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, p1
            move-object/from16 v1, p4
            invoke-static {v0, v1}, Lcom/zeldrisho/threads/extension/OpenLinksExternally;->open(Landroid/content/Context;Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :threads_default_link_handling
            sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
            return-object v0
            :threads_default_link_handling
            nop
        """.trimIndent(),
    )
}
