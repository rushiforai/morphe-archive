package app.morphe.patches.reddit.layout.nsfw

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.all.misc.resources.resourceMappingPatch
import app.morphe.patches.reddit.misc.settings.settingsPatch
import app.morphe.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT
import app.morphe.util.ResourceGroup
import app.morphe.util.copyResources
import app.morphe.util.findFreeRegister
import app.morphe.util.setExtensionIsPatchIncluded
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import java.util.logging.Logger

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/reddit/patches/NsfwFeedModePatch;"

private const val DRAWER_EXTENSION_CLASS =
    "Lapp/morphe/extension/reddit/patches/NsfwDrawerRow;"

private const val REFRESH_EXTENSION_CLASS =
    "Lapp/morphe/extension/reddit/patches/NsfwFeedRefresher;"

private const val ICON_EXTENSION_CLASS =
    "Lapp/morphe/extension/reddit/patches/NsfwModeIcon;"

private val nsfwFeedModeResourcePatch = resourcePatch {
    execute {
        copyResources(
            "nsfwmode",
            ResourceGroup(
                resourceDirectoryName = "drawable",
                "morphe_nsfw_mode_icon.xml"
            )
        )
    }
}

@Suppress("unused")
val nsfwFeedModePatch = bytecodePatch(
    name = "NSFW mode",
    description = "Adds an NSFW row to the navigation drawer that reduces the home feed to " +
            "its 18+ posts. Turned off until it is switched on. Reddit only sends 18+ posts to " +
            "accounts that have 'Show NSFW content' enabled, so the feed is empty without that " +
            "account setting."
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    dependsOn(
        settingsPatch,
        nsfwFeedModeResourcePatch,
        resourceMappingPatch
    )

    execute {
        setExtensionIsPatchIncluded(EXTENSION_CLASS)

        // region Home feed

        // The one hook that reaches the home feed. Filters the GraphQL response's edges before
        // they become feed elements, which is the last point a post's NSFW state is visible:
        // the elements carry only a link id, a unique id, promoted and an identifier.
        try {
            NsfwHomeFeedPageFingerprint.method.addInstructions(
                0,
                """
                    invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->filterHomeFeedResponse(Ljava/lang/Object;)V
                """
            )
        } catch (ex: Exception) {
            Logger.getLogger(this::class.java.name).warning(
                "'NSFW mode' could not hook the home feed page builder: ${ex.message}"
            )
        }

        // endregion

        // region Feed refresh

        // Switching the mode has to reload the feed, since what is on screen was filtered under
        // the old one. Capturing a feed view model as it is built is the only handle on the
        // app's own refresh; the extension picks the home one out and drives it by shape.
        try {
            NsfwFeedViewModelFingerprint.method.apply {
                addInstructions(
                    implementation!!.instructions.size - 1,
                    """
                        invoke-static/range { p0 .. p0 }, $REFRESH_EXTENSION_CLASS->captureFeedViewModel(Ljava/lang/Object;)V
                    """
                )
            }

            setExtensionIsPatchIncluded(REFRESH_EXTENSION_CLASS)
        } catch (ex: Exception) {
            Logger.getLogger(this::class.java.name).warning(
                "'NSFW mode' could not hook the feed view model: ${ex.message}"
            )
        }

        // endregion

        // region Home app bar mark

        // The app bar is Compose, so the mark is one painterResource call rather than a view:
        // the swap is done by rewriting the resource id it is given.
        try {
            NsfwHomeAppBarBrandIconFingerprint.let {
                it.method.apply {
                    val index = it.instructionMatches.first().index
                    val register = getInstruction<OneRegisterInstruction>(index).registerA

                    addInstructions(
                        index + 1,
                        """
                            invoke-static/range { v$register .. v$register }, $ICON_EXTENSION_CLASS->brandIcon(I)I
                            move-result v$register
                        """
                    )
                }
            }
        } catch (ex: Exception) {
            Logger.getLogger(this::class.java.name).warning(
                "'NSFW mode' could not swap the home app bar mark: ${ex.message}"
            )
        }

        // endregion

        // region Navigation drawer row

        // Best effort, and the two hooks are independent on purpose: wiring the row to the click
        // router meant one bad fingerprint cost both, which is exactly what happened on 2026.14.0.
        try {
            NsfwDrawerSectionFingerprint.method.apply {
                val collectionParameter = parameterTypes.indexOf("Ljava/util/Collection;")

                addInstructions(
                    0,
                    """
                        invoke-static/range { p$collectionParameter .. p$collectionParameter }, $DRAWER_EXTENSION_CLASS->addNsfwRow(Ljava/util/Collection;)Ljava/util/Collection;
                        move-result-object p$collectionParameter
                    """
                )
            }

            setExtensionIsPatchIncluded(DRAWER_EXTENSION_CLASS)
        } catch (ex: Exception) {
            Logger.getLogger(this::class.java.name).warning(
                "'NSFW mode' could not add its navigation drawer row: ${ex.message}"
            )
        }

        try {
            NsfwDrawerItemClickFingerprint.method.apply {
                val free = findFreeRegister(0)

                addInstructionsWithLabels(
                    0,
                    """
                        invoke-static/range { p0 .. p1 }, $DRAWER_EXTENSION_CLASS->onDrawerActionDispatched(Ljava/lang/Object;Ljava/lang/Object;)Z
                        move-result v$free
                        if-eqz v$free, :not_handled
                        return-void
                        :not_handled
                        nop
                    """
                )
            }
        } catch (ex: Exception) {
            Logger.getLogger(this::class.java.name).warning(
                "'NSFW mode' could not hook the drawer click router: ${ex.message}"
            )
        }

        // endregion
    }
}
