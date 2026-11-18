package app.zeldrisho.patches.zalo.media

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_261002
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/** Exposes the native save action for ordinary non-owner photo and video stories. */
@Suppress("unused")
val saveZaloStoriesPatch = bytecodePatch(
    name = "Save Zalo stories",
    description = "Adds the native save action to ordinary photo and video stories from other accounts.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO_261002)
    execute {
        val method = StoryMenu.matchAll(1..1).single().method
        val implementation = requireNotNull(method.implementation)
        check(implementation.registerCount == 26) { "Story menu register layout changed" }
        val instructions = implementation.instructions
        val reportTitle = instructions.indices.singleOrNull { index ->
            (instructions[index] as? ReferenceInstruction)?.reference?.toString() ==
                "Lpj/u2;->str_bottom_sheet_menu_report_title:I"
        } ?: error("Story report action changed")
        val index = reportTitle - 3
        check(index > 0 && instructions[index].opcode == Opcode.IF_NEZ &&
            (instructions[index] as? OneRegisterInstruction)?.registerA == 10 &&
            instructions[index - 1].opcode == Opcode.RETURN_OBJECT &&
            (instructions[index - 1] as? OneRegisterInstruction)?.registerA == 1 &&
            (instructions[index + 1] as? ReferenceInstruction)?.reference?.toString() ==
                "La21/h;->Companion:La21/g;"
        ) { "Story menu non-owner branch changed" }

        // The branch is reached only for ordinary (not advertised or Zalo Video) non-owner stories.
        // Keep Zalo's native status checks and limit the action to types 1 and 2, which its saver handles.
        method.addInstructionsAtControlFlowLabel(index, """
            if-nez v10, :continue_story_menu
            if-eqz v4, :continue_story_menu
            iget v0, v4, Lda1/b;->p:I
            const/4 v2, 0x1
            if-eq v0, v2, :continue_story_menu
            const/4 v2, 0x5
            if-eq v0, v2, :continue_story_menu
            iget v0, v4, Lda1/b;->d:I
            const/4 v2, 0x1
            if-eq v0, v2, :add_story_save
            const/4 v2, 0x2
            if-ne v0, v2, :continue_story_menu
            :add_story_save
            sget-object v14, La21/h;->Companion:La21/g;
            const/16 v15, 0x24
            sget v16, Lpj/o2;->ic_bottom_sheet_story_download:I
            sget v0, Lpj/u2;->str_bottom_sheet_story_download_tittle:I
            invoke-virtual {v13, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;
            move-result-object v17
            const/16 v18, 0x0
            const/16 v19, 0x0
            const/16 v20, 0x0
            const/16 v21, 0x0
            const/16 v22, 0x0
            const/16 v23, 0x1f0
            invoke-static/range {v14 .. v23}, La21/g;->a(La21/g;IILjava/lang/String;Ljava/lang/String;ZLandroid/graphics/drawable/Drawable;Ljava/lang/String;Lzk/l;I)La21/h;
            move-result-object v0
            invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            :continue_story_menu
            nop
        """.trimIndent())
    }
}

private object StoryMenu : Fingerprint(
    definingClass = "Lb21/b;", name = "b",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/util/List;", parameters = listOf("La21/f;"),
    filters = listOf(string("dataStoryViewFull")),
)
