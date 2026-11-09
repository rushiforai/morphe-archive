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

        // fragment.listView = (AbsListView) view.findViewById(android.R.id.list)
        val index = instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.IPUT_OBJECT &&
                    ((instruction as ReferenceInstruction).reference as FieldReference).type ==
                    "Landroid/widget/AbsListView;"
        }
        if (index < 0) throw PatchException("Episode list view assignment not found")

        val assignment = instructions[index] as TwoRegisterInstruction
        val listRegister = assignment.registerA
        val fragmentRegister = assignment.registerB
        if (listRegister > 15 || fragmentRegister > 15) {
            throw PatchException("Episode list registers v$fragmentRegister, v$listRegister are out of range")
        }

        method.addInstructions(
            index + 1,
            "invoke-static { v$fragmentRegister, v$listRegister }, " +
                    "$EPISODE_LIST_SWIPE_CLASS->attach(Ljava/lang/Object;Landroid/widget/AbsListView;)V"
        )
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
