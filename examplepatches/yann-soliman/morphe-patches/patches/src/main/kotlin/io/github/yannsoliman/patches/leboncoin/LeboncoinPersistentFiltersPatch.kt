package io.github.yannsoliman.patches.leboncoin

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val SEARCH_REQUEST_REPOSITORY = "Lvdy;"
private const val SEARCH_REQUEST_MODEL =
    "Lfr/leboncoin/libraries/core/search/SearchRequestModel;"

@Suppress("unused")
val leboncoinPersistentFiltersPatch = bytecodePatch(
    name = "Leboncoin: persistent search filters",
    description = "Keeps the category, keywords, seller type, price, sort order, location and dynamic filters from the previous search when starting a new one. Leboncoin 100.125.0 only.",
) {
    compatibleWith(Compatibility(
        name = "Leboncoin",
        packageName = "fr.leboncoin",
        apkFileType = ApkFileType.XAPK,
        targets = listOf(AppTarget(version = "100.125.0")),
    ))

    execute {
        val copyLastSearch = Fingerprint(
            definingClass = SEARCH_REQUEST_REPOSITORY,
            name = "l",
            returnType = "Ljava/lang/Object;",
            parameters = listOf("Lm0a;"),
        ).matchAll(1..1).single().method

        val instructions = copyLastSearch.implementation!!.instructions.toList()
        check(instructions.size == 81) {
            "Unexpected persistent-search method instruction count: ${instructions.size}"
        }

        val modelCastIndex = instructions.withIndex().single { (_, instruction) ->
            instruction.opcode == Opcode.CHECK_CAST &&
                ((instruction as? ReferenceInstruction)?.reference as? TypeReference)
                    ?.type == SEARCH_REQUEST_MODEL
        }.index

        check(modelCastIndex == 37) {
            "Unexpected SearchRequestModel cast position: $modelCastIndex"
        }

        // The stock method copies only the previous location into an otherwise
        // empty model. Reuse the complete detached database model instead, but
        // clear its primary key so subsequent edits create a new search rather
        // than overwriting the previous entry.
        copyLastSearch.addInstructions(
            modelCastIndex + 1,
            "const-wide/16 v1, 0x0\n" +
                "iput-wide v1, v0, $SEARCH_REQUEST_MODEL->b:J\n" +
                "return-object v0",
        )
    }
}
