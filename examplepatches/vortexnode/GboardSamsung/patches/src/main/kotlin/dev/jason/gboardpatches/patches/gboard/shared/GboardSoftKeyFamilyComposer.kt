package dev.jason.gboardpatches.patches.gboard.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbi
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import java.util.WeakHashMap

internal enum class GboardSoftKeyFamilyFeature(
    val beforeOrder: Int?,
    val afterOrder: Int?,
    val beforeRuntimeCalls: List<RuntimeCallId> = emptyList(),
    val afterRuntimeCalls: List<RuntimeCallId> = emptyList(),
) {
    LONG_PRESS_QUICK_ACTIONS(
        beforeOrder = 300,
        afterOrder = null,
        beforeRuntimeCalls = listOf(
            RuntimeCallId.LONG_PRESS_QUICK_ACTIONS_RUNTIME_MAYBE_PATCH_METADATA,
        ),
    ),
    CUSTOM_SYMBOLS(
        beforeOrder = 700,
        afterOrder = null,
        beforeRuntimeCalls = listOf(
            RuntimeCallId.ADD_SYMBOLS_SOFT_KEY_RUNTIME_PATCH_SOFT_KEY_METADATA,
        ),
    ),
    SAMSUNG_SPACEBAR_GESTURES(
        beforeOrder = null,
        afterOrder = 900,
        afterRuntimeCalls = listOf(
            RuntimeCallId.SPACEBAR_GESTURE_RUNTIME_AFTER_SOFT_KEY_BIND,
            RuntimeCallId.SPACEBAR_CHEVRON_RUNTIME_AFTER_SOFT_KEY_BIND,
        ),
    ),
    TOOLBAR_ROUND_CHIPS(
        beforeOrder = null,
        afterOrder = 910,
        afterRuntimeCalls = listOf(
            RuntimeCallId.TOOLBAR_ROUND_CHIPS_RUNTIME_AFTER_SOFT_KEY_BIND,
        ),
    ),
    ;

    val runtimeCalls: List<RuntimeCallId>
        get() = beforeRuntimeCalls + afterRuntimeCalls
}

internal fun interface GboardSoftKeyFamilyTransformation {
    fun apply(ownerClass: MutableClass, selectedFeatures: Collection<GboardSoftKeyFamilyFeature>)
}

internal val gboardSoftKeyFamilyTransformation = GboardSoftKeyFamilyTransformation {
        ownerClass,
        features,
    ->
    if (features.isEmpty()) return@GboardSoftKeyFamilyTransformation
    val selected = features.toSet()
    check(selected.size == features.size) { "Duplicate SoftKey-family feature intent" }

    val plan = GboardSoftKeyFamilyTransformationPlan.preflight(ownerClass, selected)
    plan.commit()
}

private val gboardSoftKeyFamilyComposerPatch = bytecodePatch(
    description = "Compose selected Gboard SoftKey bind policies in one verified transformation.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute { }

    finalize {
        val selected = GboardSoftKeyFamilyFeatureSelections.take(this)
        if (selected.isEmpty()) return@finalize
        gboardSoftKeyFamilyTransformation.apply(
            GboardVersionBindings.softKeyBind.ownerClass(this),
            selected,
        )
    }
}

internal fun gboardSoftKeyFamilyFeaturePatch(
    description: String,
    feature: GboardSoftKeyFamilyFeature,
) = bytecodePatch(description = description) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardSoftKeyFamilyComposerPatch)

    execute {
        GboardSoftKeyFamilyFeatureSelections.add(this, feature)
    }
}

internal class GboardSoftKeyFamilySelectionStore<K : Any> {
    private val selectedByContext = WeakHashMap<K, MutableSet<GboardSoftKeyFamilyFeature>>()

    @Synchronized
    fun add(context: K, feature: GboardSoftKeyFamilyFeature) {
        selectedByContext.getOrPut(context) { linkedSetOf() }.add(feature)
    }

    @Synchronized
    fun take(context: K): Collection<GboardSoftKeyFamilyFeature> =
        selectedByContext.remove(context).orEmpty()
}

private object GboardSoftKeyFamilyFeatureSelections {
    private val store = GboardSoftKeyFamilySelectionStore<BytecodePatchContext>()

    fun add(context: BytecodePatchContext, feature: GboardSoftKeyFamilyFeature) =
        store.add(context, feature)

    fun take(context: BytecodePatchContext): Collection<GboardSoftKeyFamilyFeature> =
        store.take(context)
}

private data class GboardSoftKeyFamilyTransformationPlan(
    val ownerClass: MutableClass,
    val committedMethods: Set<MutableMethod>?,
) {
    fun commit() {
        val methods = committedMethods ?: return
        ownerClass.methods.clear()
        ownerClass.methods.addAll(methods)
    }

    companion object {
        fun preflight(
            ownerClass: MutableClass,
            selected: Set<GboardSoftKeyFamilyFeature>,
        ): GboardSoftKeyFamilyTransformationPlan {
            val target = ownerClass.resolveSoftKeyTargetForPreflight()
            target.requireSoftKeyTargetShape()
            selected.verifyCanonicalOrders()
            selected.verifyRuntimeAbis()

            if (ownerClass.hasAnySoftKeyFamilyState(target)) {
                ownerClass.verifyExactSoftKeyFamilyState(selected)
                return GboardSoftKeyFamilyTransformationPlan(ownerClass, null)
            }

            target.requireSupportedSoftKeyStock()
            val candidate = MutableClass(ownerClass)
            val candidateTarget = GboardVersionBindings.softKeyBind.resolve(candidate)
            candidateTarget.applySelectedSoftKeyFamily(selected)
            candidate.verifyExactSoftKeyFamilyState(selected)

            val originalTarget = target
            val committed = ownerClass.methods.toMutableSet().apply {
                remove(originalTarget)
                add(MutableMethod(candidateTarget))
            }
            return GboardSoftKeyFamilyTransformationPlan(ownerClass, committed)
        }
    }
}

private fun MutableClass.resolveSoftKeyTargetForPreflight(): MutableMethod {
    val binding = GboardVersionBindings.softKeyBind
    val exact = methods.filter(binding::matches)
    check(exact.size <= 1) { "Ambiguous SoftKey bind target: ${binding.reference}" }
    exact.singleOrNull()?.let { return it }

    val nearMisses = methods.filter { method ->
        method.definingClass == binding.ownerDescriptor && method.name == binding.name
    }
    check(nearMisses.isEmpty()) {
        val actual = nearMisses.joinToString { method ->
            "(${method.parameterTypes.joinToString("")})${method.returnType}"
        }
        "SoftKey bind prototype drift: expected ${binding.reference}, found $actual"
    }
    error("Could not find ${binding.reference}")
}

private fun MutableMethod.requireSoftKeyTargetShape() {
    check(
        parameterTypes == listOf(
            GboardVersionBindings.softKeyMetadataType.descriptor,
            "J",
        ) && returnType == "Z" && implementation != null
    ) { "Unexpected SoftKey bind target shape: $definingClass->$name" }
}

private fun MutableMethod.requireSupportedSoftKeyStock() {
    check(GboardVersionBindings.targetVersion in setOf("18.0.3", "18.5.4")) {
        "Unsupported Gboard SoftKey stock contract for ${GboardVersionBindings.targetVersion}"
    }
    requireExact1803SoftKeyStockShape()
}

private fun MutableMethod.requireExact1803SoftKeyStockShape() {
    val instructions = implementation?.instructions
        ?: error("No instructions in formal 18.0.3 SoftKey bind target")
    check(accessFlags == (AccessFlags.PUBLIC.value or AccessFlags.FINAL.value)) {
        "18.0.3 SoftKey bind access drift in $definingClass->$name"
    }
    if (GboardVersionBindings.targetVersion == "18.5.4") {
        check(implementation!!.registerCount == 8 && returnInstructionIndices().size == 2 &&
            implementation!!.tryBlocks.isNotEmpty()) {
            "18.5.4 SoftKey bind register/return/exception boundary drift"
        }
    }
    val traceMarkers = instructions.count { instruction ->
        (instruction as? ReferenceInstruction)?.reference?.toString()
            ?.contains("SoftKeyView.setSoftKeyDef") == true
    }
    val bindTokenWrites = instructions.count { instruction ->
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.IPUT_WIDE &&
            field?.definingClass == GboardVersionBindings.softKeyBind.ownerDescriptor &&
            field.name == "f" && field.type == "J"
    }
    val metadataReads = instructions.count { instruction ->
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.IGET_OBJECT &&
            field?.definingClass == GboardVersionBindings.softKeyBind.ownerDescriptor &&
            field.name == "e" &&
            field.type == GboardVersionBindings.softKeyMetadataType.descriptor
    }
    check(
        traceMarkers == 1 && bindTokenWrites == 1 && metadataReads >= 1 &&
            returnInstructionIndices().isNotEmpty()
    ) {
        "18.0.3 SoftKey bind semantic shape drift in $definingClass->$name: " +
            "trace=$traceMarkers tokenWrites=$bindTokenWrites metadataReads=$metadataReads"
    }
}

private fun Set<GboardSoftKeyFamilyFeature>.verifyCanonicalOrders() {
    mapNotNull { it.beforeOrder }.also { orders ->
        check(orders.size == orders.distinct().size) { "Duplicate SoftKey before order" }
    }
    mapNotNull { it.afterOrder }.also { orders ->
        check(orders.size == orders.distinct().size) { "Duplicate SoftKey after order" }
    }
}

private fun Set<GboardSoftKeyFamilyFeature>.verifyRuntimeAbis() {
    forEach { feature ->
        feature.runtimeCalls.forEach { call ->
            val abi = RuntimeAbiCatalog.abi(call)
            check(abi.returnType in setOf("V", "Ljava/lang/Object;")) {
                "Unexpected SoftKey Runtime ABI for $call: ${abi.reference}"
            }
        }
    }
}

private fun MutableClass.hasAnySoftKeyFamilyState(target: MutableMethod): Boolean =
    target.implementation!!.instructions.any { instruction -> instruction.softKeyFamilyCall() != null }

internal fun MutableMethod.applySelectedSoftKeyFamily(
    selected: Set<GboardSoftKeyFamilyFeature>,
) {
    val before = selected.filter { feature -> feature.beforeOrder != null }
        .sortedBy { feature -> feature.beforeOrder }
        .joinToString("\n\n", transform = GboardSoftKeyFamilyFeature::beforeDelegate)
    val after = selected.filter { feature -> feature.afterOrder != null }
        .sortedBy { feature -> feature.afterOrder }
        .joinToString("\n\n", transform = GboardSoftKeyFamilyFeature::afterDelegate)

    if (before.isNotEmpty()) addInstructions(0, before)
    if (after.isNotEmpty()) {
        val returns = returnInstructionIndices()
        check(returns.isNotEmpty()) { "SoftKey after chain requires at least one normal return" }
        returns.asReversed().forEach { returnIndex -> addInstructions(returnIndex, after) }
    }
}

internal fun GboardSoftKeyFamilyFeature.beforeDelegate(): String = when (this) {
    GboardSoftKeyFamilyFeature.CUSTOM_SYMBOLS ->
        metadataTransformDelegate(beforeRuntimeCalls.single(), "p0, p1")
    GboardSoftKeyFamilyFeature.LONG_PRESS_QUICK_ACTIONS ->
        metadataTransformDelegate(beforeRuntimeCalls.single(), "p1, p0")
    GboardSoftKeyFamilyFeature.SAMSUNG_SPACEBAR_GESTURES,
    GboardSoftKeyFamilyFeature.TOOLBAR_ROUND_CHIPS ->
        error("$this has no before-stock contribution")
}

internal fun GboardSoftKeyFamilyFeature.afterDelegate(): String = when (this) {
    GboardSoftKeyFamilyFeature.SAMSUNG_SPACEBAR_GESTURES,
    GboardSoftKeyFamilyFeature.TOOLBAR_ROUND_CHIPS ->
        afterRuntimeCalls.joinToString("\n") { call ->
            emitSoftKeyRuntimeCall(call, "p0")
        }
    else -> error("$this has no after-stock contribution")
}

private fun metadataTransformDelegate(call: RuntimeCallId, registers: String): String = """
    ${emitSoftKeyRuntimeCall(call, registers)}

    move-result-object p1

    check-cast p1, ${GboardVersionBindings.softKeyMetadataType.descriptor}
""".trimIndent()

private fun emitSoftKeyRuntimeCall(call: RuntimeCallId, registers: String): String {
    check(call in ALL_SOFT_KEY_RUNTIME_CALLS) {
        "Runtime call $call does not belong to the SoftKey family target"
    }
    return RuntimeCallEmitter.invoke(call, registers)
}

private fun MutableClass.verifyExactSoftKeyFamilyState(
    selected: Set<GboardSoftKeyFamilyFeature>,
) {
    val actualTarget = GboardVersionBindings.softKeyBind.resolve(this)
    val normalized = MutableClass(this)
    val normalizedTarget = GboardVersionBindings.softKeyBind.resolve(normalized)
    normalizedTarget.stripExpectedSoftKeyFamilySlots(selected)
    check(normalizedTarget.implementation!!.instructions.none { it.softKeyFamilyCall() != null }) {
        "Extraneous SoftKey-family call outside selected slots"
    }
    normalizedTarget.requireSupportedSoftKeyStock()

    val expected = MutableClass(normalized)
    val expectedTarget = GboardVersionBindings.softKeyBind.resolve(expected)
    expectedTarget.applySelectedSoftKeyFamily(selected)
    check(actualTarget.gboardStructuralFingerprint() == expectedTarget.gboardStructuralFingerprint()) {
        "Malformed SoftKey-family target transformation"
    }
}

private fun MutableMethod.stripExpectedSoftKeyFamilySlots(
    selected: Set<GboardSoftKeyFamilyFeature>,
) {
    val beforeInstructionCount = selected.sumOf { feature -> feature.beforeInstructionCount() }
    val afterInstructionCount = selected.sumOf { feature ->
        if (feature.afterOrder != null) feature.afterRuntimeCalls.size else 0
    }
    if (afterInstructionCount > 0) {
        returnInstructionIndices().asReversed().forEach { returnIndex ->
            check(returnIndex >= afterInstructionCount) { "Incomplete SoftKey after chain" }
            repeat(afterInstructionCount) {
                implementation!!.removeInstruction(returnIndex - afterInstructionCount)
            }
        }
    }
    check(implementation!!.instructions.size >= beforeInstructionCount) {
        "Incomplete SoftKey before chain"
    }
    repeat(beforeInstructionCount) { implementation!!.removeInstruction(0) }
}

private fun GboardSoftKeyFamilyFeature.beforeInstructionCount(): Int = when {
    beforeOrder == null -> 0
    else -> 3
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.softKeyFamilyCall():
    String? {
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    return ALL_SOFT_KEY_RUNTIME_CALLS.firstOrNull { call ->
        reference.matches(RuntimeAbiCatalog.abi(call))
    }?.name
}

private fun MethodReference.matches(abi: RuntimeAbi): Boolean =
    definingClass == abi.owner &&
        name == abi.name &&
        parameterTypes == abi.parameters &&
        returnType == abi.returnType

private val ALL_SOFT_KEY_RUNTIME_CALLS = GboardSoftKeyFamilyFeature.entries
    .flatMapTo(linkedSetOf()) { feature -> feature.runtimeCalls }
