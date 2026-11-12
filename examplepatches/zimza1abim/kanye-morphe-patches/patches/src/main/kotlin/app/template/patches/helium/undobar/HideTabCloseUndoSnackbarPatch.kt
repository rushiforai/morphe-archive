package app.template.patches.helium.undobar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.helium.titaniumCompatibility
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val OBJECT = "Ljava/lang/Object;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
// Chromium keeps these public tab API class names; member names are obfuscated.
private const val TAB = "Lorg/chromium/chrome/browser/tab/Tab;"
private const val TAB_MODEL = "Lorg/chromium/chrome/browser/tabmodel/TabModel;"
private const val COMMIT_HELPER = "titaniumCommitClosedTabs"

private val INVOKES = setOf(
    Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE,
)
private val STATIC_INVOKES = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)

private val compatibility = titaniumCompatibility()

private fun Method.calls(): List<MethodReference> = implementation?.instructions?.toList().orEmpty().mapNotNull {
    (it as? ReferenceInstruction)?.reference as? MethodReference
}

private fun MethodReference.params() = parameterTypes.map(CharSequence::toString)

private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

/** The undo bar's SnackbarController: `(Object)V` callback pair on a single interface. */
private fun isSnackbarController(iface: ClassDef?): Boolean =
    iface != null && AccessFlags.INTERFACE.isSet(iface.accessFlags) &&
        iface.virtualMethods.toList().let { methods ->
            methods.size == 2 && methods.all {
                it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(OBJECT)
            }
        }

private data class UndoBarSite(
    val controllerClass: String,
    val controllerInterface: String,
    val showMethod: Method,
    val showIndex: Int,
    val snackbarType: String,
    val managerType: String,
)

@Suppress("unused")
val hideTabCloseUndoSnackbarPatch = bytecodePatch(
    name = "Hide tab close undo snackbar",
    description = "Hides the Undo bar after closing a tab. Closed tabs stay in Recent tabs.",
    default = false,
) {
    compatibleWith(compatibility)

    execute {
        // Chromium's UndoBarController: implements SnackbarController, both callbacks
        // restore/commit tabs through Tab + TabModel, and one no-arg method builds a
        // Snackbar with a static factory taking (CharSequence, SnackbarController, ...)
        // and hands it to SnackbarManager.show(Snackbar).
        val sites = mutableListOf<UndoBarSite>()
        classDefForEach { classDef ->
            val controllerInterface = classDef.interfaces.firstOrNull {
                isSnackbarController(classDefByOrNull(it))
            } ?: return@classDefForEach
            val iface = classDefBy(controllerInterface)
            val callbacks = classDef.virtualMethods.filter { method ->
                iface.virtualMethods.any { it.name == method.name && it.parameterTypes == method.parameterTypes }
            }
            if (callbacks.size != 2 || !callbacks.all { callback ->
                    val calls = callback.calls()
                    calls.any { it.definingClass == TAB && it.returnType == "I" && it.parameterTypes.isEmpty() } &&
                        calls.any { it.definingClass == TAB_MODEL && it.params() == listOf("I") }
                }) return@classDefForEach

            classDef.methods.forEach { method ->
                if (method.returnType != "V" || method.parameterTypes.isNotEmpty() ||
                    AccessFlags.STATIC.isSet(method.accessFlags)) return@forEach
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                val factory = instructions.firstNotNullOfOrNull { insn ->
                    insn.methodRef()?.takeIf {
                        insn.opcode in STATIC_INVOKES && it.returnType.startsWith("L") &&
                            CHAR_SEQUENCE in it.params() && controllerInterface in it.params()
                    }
                } ?: return@forEach
                val snackbarType = factory.returnType
                instructions.forEachIndexed { index, insn ->
                    val ref = insn.methodRef() ?: return@forEachIndexed
                    if (insn.opcode in INVOKES && ref.returnType == "V" && ref.params() == listOf(snackbarType) &&
                        ref.definingClass != snackbarType) {
                        sites += UndoBarSite(classDef.type, controllerInterface, method, index, snackbarType, ref.definingClass)
                    }
                }
            }
        }
        val site = sites.singleOrNull()
            ?: throw PatchException("Tab close undo bar must be unique: ${sites.size}")

        // onDismissNoAction is the callback SnackbarManager.dismissSnackbars(controller)
        // fires. It commits the pending closures, exactly like the bar timing out.
        // Chromium 156 outlines that invoke-interface into helpers which still receive
        // the controller. The view update reachable from the same method also reaches
        // the action-click path, and that path calls both callbacks, so only callees
        // that take the controller are part of the dismiss fingerprint.
        val callbackNames = { method: Method ->
            method.calls().filter {
                it.definingClass == site.controllerInterface && it.returnType == "V" && it.params() == listOf(OBJECT)
            }.map { it.name }
        }
        val bodyOf = { ref: MethodReference ->
            classDefByOrNull(ref.definingClass)?.methods?.singleOrNull { method ->
                method.name == ref.name && method.returnType == ref.returnType &&
                    method.parameterTypes.map(CharSequence::toString) == ref.params()
            }
        }
        val dismissNames = classDefBy(site.managerType).methods.filter {
            it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(site.controllerInterface)
        }.flatMap { method ->
            callbackNames(method) + method.calls()
                .filter { site.controllerInterface in it.params() }
                .flatMap { bodyOf(it)?.let(callbackNames).orEmpty() }
        }.toSet()
        val dismiss = dismissNames.singleOrNull()
            ?: throw PatchException("SnackbarController dismiss callback not identified: $dismissNames")

        val snackbar = classDefBy(site.snackbarType)
        fun snackbarField(type: String) = snackbar.instanceFields.filter { it.type == type }.singleOrNull()
            ?: throw PatchException("Snackbar field of type $type must be unique")
        val controllerField = snackbarField(site.controllerInterface)
        val payloadField = snackbarField(OBJECT)

        val owner = mutableClassDefBy(site.controllerClass)
        if (owner.methods.none { it.name == COMMIT_HELPER }) {
            owner.methods.add(
                MutableMethod(ImmutableMethod(
                    owner.type, COMMIT_HELPER,
                    listOf(ImmutableMethodParameter(site.snackbarType, emptySet(), null)), "V",
                    AccessFlags.PRIVATE.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
                    emptySet(), emptySet(), ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList()),
                )).apply {
                    addInstructions(0, """
                        iget-object v0, p0, ${site.snackbarType}->${controllerField.name}:${site.controllerInterface}
                        iget-object v1, p0, ${site.snackbarType}->${payloadField.name}:$OBJECT
                        invoke-interface {v0, v1}, ${site.controllerInterface}->$dismiss($OBJECT)V
                        return-void
                    """)
                },
            )
        }

        // Swap SnackbarManager.show(snackbar) for an immediate dismiss of that snackbar.
        val showMethod = owner.methods.single {
            it.name == site.showMethod.name && it.parameterTypes == site.showMethod.parameterTypes &&
                it.returnType == site.showMethod.returnType
        }
        val show = showMethod.implementation!!.instructions.elementAt(site.showIndex)
        val snackbarRegister = when (show) {
            is RegisterRangeInstruction -> show.startRegister + 1
            is FiveRegisterInstruction -> show.registerD
            else -> throw PatchException("Unexpected snackbar show instruction: ${show.opcode}")
        }
        val helper = "${owner.type}->$COMMIT_HELPER(${site.snackbarType})V"
        showMethod.replaceInstruction(
            site.showIndex,
            if (snackbarRegister < 16) "invoke-static {v$snackbarRegister}, $helper"
            else "invoke-static/range {v$snackbarRegister .. v$snackbarRegister}, $helper",
        )
    }
}
