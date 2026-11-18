package app.zeldrisho.patches.zalo.notif

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.zeldrisho.patches.shared.Constants.COMPATIBILITY_ZALO_261002_AND_EXPERIMENTAL
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/** Adds a visible action alongside Zalo's existing invisible car mark-read action. */
@Suppress("unused")
val markZaloReadFromNotificationPatch = bytecodePatch(
    name = "Mark Zalo conversation read from notifications",
    description = "Adds a mark-as-read action to eligible message notifications using Zalo's native handler.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_ZALO_261002_AND_EXPERIMENTAL)
    execute {
        val version261101 = packageMetadata.versionName == "26.11.01"
        val match = (if (version261101) NotificationActions261101 else NotificationActions).matchAll(1..1).single()
        val method = match.method
        check(method.implementation?.registerCount == if (version261101) 15 else 16) { "Notification action registers changed" }
        val instructions = method.implementation!!.instructions
        val actionIndex = match.instructionMatches.single().index
        if (version261101) {
            val constructors = (actionIndex + 1 until instructions.size).filter { index ->
                (instructions[index] as? ReferenceInstruction)?.reference?.toString() ==
                    "Llph;-><init>(Ljava/lang/String;ILandroid/app/PendingIntent;I)V"
            }
            val constructor = constructors.firstOrNull() ?: error("Mark-read notification action changed")
            val call = instructions[constructor] as? FiveRegisterInstruction
            val add = instructions.getOrNull(constructor + 1) as? FiveRegisterInstruction
            check(constructor >= 2 && instructions[constructor - 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
                (instructions[constructor - 1] as? OneRegisterInstruction)?.registerA == 4 &&
                (instructions[constructor - 2] as? ReferenceInstruction)?.reference?.toString() ==
                    "Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;" &&
                call?.registerCount == 5 && call.registerC == 10 && call.registerD == 13 &&
                call.registerE == 14 && call.registerF == 4 && call.registerG == 7 &&
                instructions[constructor + 1].opcode == Opcode.INVOKE_VIRTUAL &&
                (instructions[constructor + 1] as? ReferenceInstruction)?.reference?.toString() ==
                    "Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z" &&
                add?.registerCount == 2 && add.registerC == 0 && add.registerD == 10
            ) { "Mark-read notification action contract changed" }
            // v3 is still used for native pending-intent flags; preserve it and all receiver data.
            method.addInstructionsWithLabels(constructor + 2, """
                if-eqz v4, :keep_native_actions
                sget p3, Llkk;->zds_ic_read_message_line_24:I
                sget p4, Lrok;->str_mark_as_read_title:I
                invoke-virtual {v1, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;
                move-result-object p4
                new-instance p0, Llph;
                invoke-direct {p0, p3, v4, p4}, Llph;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V
                invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
                :keep_native_actions
                nop
            """.trimIndent())
            return@execute
        }
        val constructors = (actionIndex + 1 until instructions.size).filter { index ->
            val instruction = instructions[index]
            (instruction as? ReferenceInstruction)?.reference?.toString() ==
                "Lrz/b3;-><init>(Ljava/lang/String;ILandroid/app/PendingIntent;I)V"
        }
        val constructor = constructors.firstOrNull() ?: error("Mark-read notification action changed")
        val call = instructions[constructor] as? FiveRegisterInstruction
        val add = instructions.getOrNull(constructor + 1) as? FiveRegisterInstruction
        check(constructor >= 2 && instructions[constructor - 1].opcode == Opcode.MOVE_RESULT_OBJECT &&
            (instructions[constructor - 1] as? OneRegisterInstruction)?.registerA == 5 &&
            (instructions[constructor - 2] as? ReferenceInstruction)?.reference?.toString() ==
                "Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;" &&
            call?.registerCount == 5 && call.registerC == 14 && call.registerD == 15 &&
            call.registerE == 3 && call.registerF == 5 && call.registerG == 7 &&
            instructions[constructor + 1].opcode == Opcode.INVOKE_VIRTUAL &&
            (instructions[constructor + 1] as? ReferenceInstruction)?.reference?.toString() ==
                "Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z" &&
            add?.registerCount == 2 && add.registerC == 0 && add.registerD == 14
        ) { "Mark-read notification action contract changed" }
        // v5 is the exact PendingIntent used by the existing car action. p3, p4 and v3 are
        // overwritten before their next native use. Keep the original action and all gates.
        method.addInstructionsWithLabels(constructor + 2, """
            if-eqz v5, :keep_native_actions
            sget v3, Lt22/a;->zds_ic_read_message_line_24:I
            sget p4, Lpj/u2;->str_mark_as_read_title:I
            invoke-virtual {v1, p4}, Landroid/content/Context;->getString(I)Ljava/lang/String;
            move-result-object p4
            new-instance p3, Lrz/b3;
            invoke-direct {p3, v3, v5, p4}, Lrz/b3;-><init>(ILandroid/app/PendingIntent;Ljava/lang/String;)V
            invoke-virtual {v0, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            :keep_native_actions
            nop
        """.trimIndent())
    }
}

// Experimental 26.11.01 notification action; in-app mark-read is a separate feature.
private object NotificationActions261101 : Fingerprint(
    definingClass = "Lqph;", name = "N",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("Lcom/zing/zalo/control/ContactProfile;", "I", "Ljava/lang/String;", "Lmph;"),
    filters = listOf(string("android.intent.action.ACTION_QUICK_MARK_AS_READ")),
)

private object NotificationActions : Fingerprint(
    definingClass = "Lrz/h3;", name = "M",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("Lcom/zing/zalo/control/ContactProfile;", "I", "Ljava/lang/String;", "Lrz/c3;"),
    filters = listOf(string("android.intent.action.ACTION_QUICK_MARK_AS_READ")),
)
