package app.quetta.patches

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private fun String.replaceHosts(hosts: List<Pair<String, String>>): String {
    var value = this
    for ((from, to) in hosts) {
        if (value.contains(from)) value = value.replace(from, to)
    }
    return value
}

/** Outcome of [rewriteHosts]: what changed, and whether an earlier run already neutralised the group. */
internal class HostRewrite(val rewritten: Int, val alreadyPatched: Boolean)

/**
 * Rewrite every string constant that contains one of [hosts].
 *
 * Longest hosts are matched first (see [Hosts]), so a replacement never feeds a later one.
 * [HostRewrite.alreadyPatched] is set when the group's own dead markers are already present, which
 * makes re-patching an already processed APK a no-op instead of a failure.
 */
internal fun BytecodePatchContext.rewriteHosts(hosts: List<Pair<String, String>>): HostRewrite {
    val markers = hosts.deadMarkers()
    val classesWithHosts = mutableListOf<ClassDef>()
    var alreadyPatched = false

    // One scan decides both questions: which classes need rewriting, and whether this APK already
    // carries the markers a previous run wrote.
    classDefForEach { classDef ->
        var found = false
        for (method in classDef.methods) {
            val instructions = method.implementation?.instructions ?: continue
            for (instruction in instructions) {
                val reference = (instruction as? ReferenceInstruction)?.reference
                if (reference !is StringReference) continue
                val value = reference.string
                if (!alreadyPatched && markers.any { value.contains(it) }) alreadyPatched = true
                if (!found && value.replaceHosts(hosts) != value) found = true
            }
        }
        if (found) classesWithHosts += classDef
    }

    var rewritten = 0
    for (classDef in classesWithHosts) {
        for (method in mutableClassDefBy(classDef).methods) {
            val instructions = method.implementation?.instructions ?: continue
            for (index in instructions.indices) {
                val instruction = method.getInstruction(index)
                val reference = (instruction as? ReferenceInstruction)?.reference ?: continue
                if (reference !is StringReference) continue
                val replaced = reference.string.replaceHosts(hosts)
                if (replaced == reference.string) continue
                val register = (instruction as OneRegisterInstruction).registerA
                method.replaceInstruction(index, "const-string v$register, \"$replaced\"")
                rewritten++
            }
        }
    }
    return HostRewrite(rewritten, alreadyPatched)
}
