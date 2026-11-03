/*
 * Zerobun Morphe patches - GPLv3.
 *
 * Captures Instagram follower/following rows as you scroll them and sends them to a
 * self-hosted tracker, which keeps the history and works out who joined and left.
 *
 * How the follow list and the User model fit together was learned from Piko
 * (https://github.com/crimera/piko, GPLv3). This is a standalone implementation with
 * its own extension package, so it is applied alongside Piko rather than replacing it.
 */

package app.zerobun.patches.instagram.followertrack

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.getReference
import app.zerobun.patches.instagram.Constants.COMPATIBILITY_INSTAGRAM
import app.zerobun.patches.instagram.Constants.FOLLOW_LIST_DATA_CLASS
import app.zerobun.patches.instagram.Constants.USER_SESSION_CLASS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun smaliString(value: String) =
    "\"" + value.replace("\\", "\\\\").replace("\"", "\\\"") + "\""

@Suppress("unused")
val followerTrackPatch = bytecodePatch(
    name = "Follower tracker",
    description = "Captures follower and following lists as you scroll them and sends them to " +
        "your self-hosted tracker, which records who joined and who left, and when. " +
        "Uses only the requests the app already makes. Apply alongside Piko.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    extendWith("extensions/extension.mpe")

    val trackerUrl by stringOption(
        key = "trackerUrl",
        default = "https://insta.zerobun.com/egress/followers",
        title = "Tracker URL",
        description = "Where captured rows are sent.",
        required = true,
    ) { it!!.startsWith("https://") }

    val trackerToken by stringOption(
        key = "trackerToken",
        default = "",
        title = "Tracker token",
        description = "INSTA_RELAY_TOKEN from the server's .env. Sent as a Bearer token.",
        required = true,
    ) { !it.isNullOrBlank() }

    val batchSize by stringOption(
        key = "batchSize",
        default = "50",
        title = "Batch size",
        description = "Rows buffered before each upload (1-200).",
        required = true,
    ) { it!!.toIntOrNull()?.let { n -> n in 1..200 } == true }

    execute {
        val config = linkedMapOf(
            "cfg.url" to trackerUrl!!,
            "cfg.token" to trackerToken!!,
            "cfg.batch" to batchSize!!,
        )

        // User getters. Id and username are required; name and picture are extras.
        config["m.id"] = UserIdGetterFingerprint.instructionMatches.last()
            .instruction.getReference<MethodReference>()!!.name
        config["m.username"] = UserNameGetterFingerprint.originalMethod.name
        runCatching { config["m.fullName"] = FullNameGetterFingerprint.originalMethod.name }
        runCatching { config["m.picInfo"] = ProfilePicInfoGetterFingerprint.originalMethod.name }

        // Which list, and whose. Best effort: without it rows still upload, unattributed.
        runCatching {
            val binderClass = FollowListBindViewFingerprint.classDef
            val listTypeField = binderClass.fields.first { field ->
                classDefByOrNull(field.type)?.superclass == "Ljava/lang/Enum;"
            }
            val listTypeEnum = classDefBy(listTypeField.type)
            val listTypeValueField = listTypeEnum.fields.first {
                it.type == "Ljava/lang/String;" && !AccessFlags.STATIC.isSet(it.accessFlags)
            }
            val listConfigClass = Fingerprint(
                returnType = "V",
                name = "<init>",
                parameters = listOf("Landroid/os/Bundle;", USER_SESSION_CLASS, FOLLOW_LIST_DATA_CLASS),
            ).classDef
            val listConfigField = binderClass.fields.first { it.type == listConfigClass.type }
            val followListDataField = listConfigClass.fields.first { it.type == FOLLOW_LIST_DATA_CLASS }
            val sessionField = binderClass.fields.first { it.type == USER_SESSION_CLASS }

            // FollowListData's factory stores its first String parameter (the target user
            // id) straight into a field.
            val factory = mutableClassDefBy(FOLLOW_LIST_DATA_CLASS).methods.first {
                it.returnType == FOLLOW_LIST_DATA_CLASS &&
                    it.parameterTypes == listOf(listTypeEnum.type, "Ljava/lang/String;", "Ljava/lang/String;", "Z")
            }
            val firstStringParamRegister =
                factory.implementation!!.registerCount - factory.parameterTypes.size + 1
            val targetIdField = factory.instructions.first {
                it.opcode == Opcode.IPUT_OBJECT &&
                    (it as TwoRegisterInstruction).registerA == firstStringParamRegister
            }.let { (it as ReferenceInstruction).reference as FieldReference }

            config["f.listType"] = listTypeField.name
            config["f.listTypeValue"] = listTypeValueField.name
            config["f.listConfig"] = listConfigField.name
            config["f.followListData"] = followListDataField.name
            config["f.targetId"] = targetIdField.name
            config["f.session"] = sessionField.name
        }.onFailure {
            println("Follower tracker: list context not resolved, collecting identities only (${it.message})")
        }

        // Hand the values to the extension through Config.put calls injected at the start
        // of the hook. Runtime values cannot be folded away by the extension's optimiser.
        OnRowBoundHookFingerprint.method.apply {
            val locals = implementation!!.registerCount - parameterTypes.size
            if (locals < 2) throw PatchException("onRowBound has no free registers for config")
            addInstructions(
                0,
                config.entries.joinToString("\n") { (key, value) ->
                    """
                    const-string v0, ${smaliString(key)}
                    const-string v1, ${smaliString(value)}
                    invoke-static {v0, v1}, $CONFIG_CLASS->put(Ljava/lang/String;Ljava/lang/String;)V
                    """.trimIndent()
                },
            )
        }

        // Call the hook at bindView's single return. The return instruction is replaced in
        // place, so any branch that jumps to it now runs the hook first.
        FollowListBindViewFingerprint.method.apply {
            val returnIndex = instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .singleOrNull()?.index
                ?: throw PatchException("Expected exactly one return in the follow-list bindView")
            replaceInstruction(
                returnIndex,
                "invoke-static/range {p0 .. p3}, $HOOK_CLASS->" +
                    "onRowBound(Ljava/lang/Object;ILandroid/view/View;Ljava/lang/Object;)V",
            )
            addInstruction(returnIndex + 1, "return-void")
        }
    }
}
