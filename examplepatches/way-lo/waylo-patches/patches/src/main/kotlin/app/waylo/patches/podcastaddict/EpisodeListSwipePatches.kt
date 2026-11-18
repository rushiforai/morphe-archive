package app.waylo.patches.podcastaddict

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.waylo.patches.podcastaddict.Constants.COMPATIBILITY_PODCAST_ADDICT
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EPISODE_LIST_SWIPE_CLASS = "Lapp/waylo/extension/podcastaddict/EpisodeListSwipe;"
private const val ABS_LIST_VIEW = "Landroid/widget/AbsListView;"

private fun isListType(type: String) = type == ABS_LIST_VIEW || type.endsWith("RecyclerView;")

/**
 * Shared by the episode list swipe patches: hands every episode list view to the extension when
 * it is created. The extension only turns swipes on for the screens enabled by the patches below.
 */
private val episodeListSwipeHookPatch = patch(
    description = "Hooks the creation of episode lists for the episode list swipe patches."
) {
    extendWith("extensions/extension.mpe")

    execute {
        val method = EpisodeListCreationFingerprint.method
        val instructions = method.implementation!!.instructions.toList()

        // fragment.listView = view.findViewById(...), the last list assignment before the log
        // string. The list is a ListView (AbsListView) up to 2026.14 and a RecyclerView after.
        val stringIndex = EpisodeListCreationFingerprint.stringMatches.first().index
        val index = instructions.subList(0, stringIndex).indexOfLast { instruction ->
            instruction.opcode == Opcode.IPUT_OBJECT &&
                    isListType(((instruction as ReferenceInstruction).reference as FieldReference).type)
        }
        if (index < 0) throw PatchException("Episode list view assignment not found")

        val assignment = instructions[index] as TwoRegisterInstruction
        val listType = ((instructions[index] as ReferenceInstruction).reference as FieldReference).type
        val listRegister = assignment.registerA
        val fragmentRegister = assignment.registerB
        if (listRegister > 15 || fragmentRegister > 15) {
            throw PatchException("Episode list registers v$fragmentRegister, v$listRegister are out of range")
        }

        if (listType == ABS_LIST_VIEW) {
            method.addInstructions(
                index + 1,
                "invoke-static { v$fragmentRegister, v$listRegister }, " +
                        "$EPISODE_LIST_SWIPE_CLASS->attach(Ljava/lang/Object;Landroid/widget/AbsListView;)V"
            )
        } else {
            method.addInstructions(
                index + 1,
                "invoke-static { v$fragmentRegister, v$listRegister }, " +
                        "$EPISODE_LIST_SWIPE_CLASS->attachRecycler(Ljava/lang/Object;Landroid/view/View;)V"
            )
            hookRecyclerTouch(listType)
        }
    }
}

/**
 * Makes one of the extension's `is...Enabled()` switches return true.
 */
private fun enableSwitch(switchName: String) = patch {
    dependsOn(episodeListSwipeHookPatch)

    execute {
        mutableClassDefBy(EPISODE_LIST_SWIPE_CLASS).methods
            .singleOrNull { method -> method.name == switchName }
            ?.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            ) ?: throw PatchException("Extension switch $switchName not found")
    }
}

@Suppress("unused")
val recentEpisodesSwipePatch = patch(
    name = "Swipe to add/remove on recent episodes",
    description = "On the Recent episodes screen, swipe an episode left or right to add it to the " +
            "playlist, or to remove it if it is already there.",
    default = true
) {
    compatibleWith(COMPATIBILITY_PODCAST_ADDICT)
    dependsOn(enableSwitch("isRecentEnabled"))
}

@Suppress("unused")
val newEpisodesSwipePatch = patch(
    name = "Swipe to add/remove on new episodes",
    description = "On the New episodes screen, swipe an episode left or right to add it to the " +
            "playlist, or to remove it if it is already there.",
    default = true
) {
    compatibleWith(COMPATIBILITY_PODCAST_ADDICT)
    dependsOn(enableSwitch("isNewEpisodesEnabled"))
}
