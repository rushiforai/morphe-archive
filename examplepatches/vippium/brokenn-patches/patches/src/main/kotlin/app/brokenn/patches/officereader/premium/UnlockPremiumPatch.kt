package app.brokenn.patches.officereader.premium

import app.brokenn.patches.officereader.shared.Constants.COMPATIBILITY_OFFICEREADER
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ABOUT_FRAGMENT = "Lnet/sjava/officereader/ui/fragments/AboutFragment;"
private const val BINDINGS = "Lnet/sjava/officereader/databinding/FragmentAboutBinding;"

internal object IsPurchasedFingerprint : Fingerprint(
    definingClass = "Lnet/sjava/officereader/services/OptionService;",
    name = "isPurchased",
    returnType = "Z",
)

internal object ShowRateAppFingerprint : Fingerprint(
    definingClass = ABOUT_FRAGMENT,
    name = "showRateApp",
    parameters = listOf("Landroid/content/Context;"),
)

internal object OnViewCreatedFingerprint : Fingerprint(
    definingClass = ABOUT_FRAGMENT,
    name = "onViewCreated",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

internal object RowBuilderFingerprint : Fingerprint(
    definingClass = ABOUT_FRAGMENT,
    name = "p",
    returnType = "Lnet/sjava/officereader/databinding/AboutRowBinding;",
)

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks premium and removes Family-apps promos from the About screens.",
) {
    compatibleWith(COMPATIBILITY_OFFICEREADER)

    execute {
        // Premium gate: the Play Billing flow only writes this preference flag.
        IsPurchasedFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // No in-app rate dialog.
        ShowRateAppFingerprint.method.addInstructions(0, "return-void")

        // The rate-app row is built through p(...); return an unattached binding for it.
        RowBuilderFingerprint.method.addInstructions(0, """
            sget v0, Lnet/sjava/officereader/R${'$'}id;->about_rate:I
            if-ne p3, v0, :pass
            invoke-virtual {p0}, Lau2;->getLayoutInflater()Landroid/view/LayoutInflater;
            move-result-object v0
            const/4 v1, 0x0
            invoke-static {v0, v1, v1}, Lnet/sjava/officereader/databinding/AboutRowBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lnet/sjava/officereader/databinding/AboutRowBinding;
            move-result-object v0
            return-object v0
            :pass
            nop
        """)

        // Family-apps section (title, card): VISIBLE(0) → GONE(8).
        val method = OnViewCreatedFingerprint.method
        val ins = method.implementation?.instructions?.toList()
            ?: throw PatchException("onViewCreated has no implementation")
        var hidden = 0
        ins.forEachIndexed { i, insn ->
            if (insn.opcode != com.android.tools.smali.dexlib2.Opcode.INVOKE_VIRTUAL) return@forEachIndexed
            val mref = (insn as? ReferenceInstruction)?.reference as? MethodReference
            if (mref == null || mref.name != "setVisibility" || mref.definingClass != "Landroid/view/View;") {
                return@forEachIndexed
            }
            val nearFamily = (maxOf(0, i - 4) until i).any { j ->
                val r = (ins[j] as? ReferenceInstruction)?.reference as? FieldReference
                r != null && r.definingClass == BINDINGS && r.name.startsWith("aboutFamily")
            }
            if (!nearFamily) return@forEachIndexed
            val intReg = (ins[i] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction).registerD
            for (j in i - 1 downTo maxOf(0, i - 5)) {
                val c = ins[j] as? OneRegisterInstruction
                if (c != null && c.registerA == intReg && ins[j].opcode.name.startsWith("const")) {
                    method.replaceInstruction(j, "const/16 v$intReg, 0x8")
                    hidden++
                    break
                }
            }
        }
        if (hidden < 2) {
            throw PatchException("Expected 2 family-section visibility calls, patched $hidden")
        }
    }
}
