package app.template.patches.anytype

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val EXT = "Lapp/font/extension/anytype/"
private const val MANAGER = "${EXT}CustomFontManager;"
private const val UI = "${EXT}FontUi;"
private const val FACE = "Landroid/graphics/Typeface;"
private const val STRING = "Ljava/lang/String;"
private const val OBJECT = "Ljava/lang/Object;"
private const val CONTEXT = "Landroid/content/Context;"
private const val TEXT_VIEW = "Landroid/widget/TextView;"
private var applicationType = ""
private var applicationLabel = 0L
private var appearanceIcon = 0L
private var secondaryColor = 0L

private fun Method.calls() = implementation?.instructions?.toList().orEmpty().mapNotNull {
    (it as? ReferenceInstruction)?.reference as? MethodReference
}.toList()
private fun Method.fields() = implementation?.instructions?.toList().orEmpty().mapNotNull {
    (it as? ReferenceInstruction)?.reference as? FieldReference
}.toList()
private fun MethodReference.descriptor() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
private fun newMethod(owner: String, name: String, types: List<String>, result: String, registers: Int, flags: Int = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value) =
    MutableMethod(ImmutableMethod(owner, name, types.map { ImmutableMethodParameter(it, emptySet(), null) }, result,
        flags, emptySet(), emptySet(), ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList())))

private val resources = resourcePatch {
    execute {
        val ids = mutableMapOf<String, Long>()
        document("res/values/public.xml").use { xml ->
            val entries = xml.getElementsByTagName("public")
            for (i in 0 until entries.length) {
                val e = entries.item(i) as org.w3c.dom.Element
                ids[e.getAttribute("type") + "/" + e.getAttribute("name")] = e.getAttribute("id").removePrefix("0x").toLong(16)
            }
        }
        applicationLabel = ids["string/settings_application"] ?: throw PatchException("Application section resource missing")
        secondaryColor = ids["color/text_secondary"] ?: throw PatchException("Settings text color missing")
        appearanceIcon = ids["drawable/ic_settings_appearance"] ?: throw PatchException("Settings icon resource missing")
        document("AndroidManifest.xml").use { xml ->
            val ns = "http://schemas.android.com/apk/res/android"
            val app = xml.getElementsByTagName("application").item(0) as org.w3c.dom.Element
            applicationType = "L" + app.getAttribute("android:name").replace('.', '/') + ";"
            val picker = xml.createElement("activity")
            picker.setAttributeNS(ns, "android:name", "app.font.extension.anytype.FontPickerActivity")
            picker.setAttributeNS(ns, "android:exported", "false")
            picker.setAttributeNS(ns, "android:theme", "@android:style/Theme.Translucent.NoTitleBar")
            picker.setAttributeNS(ns, "android:configChanges", "orientation|screenSize|keyboardHidden|uiMode")
            app.appendChild(picker)
        }
    }
}

@Suppress("unused")
val anytypeCustomFont = bytecodePatch(
    name = "Anytype custom font",
    description = "Use a TTF or OTF font across Anytype. Settings > Application > Font.",
) {
    compatibleWith(ANYTYPE_COMPATIBILITY)
    dependsOn(resources)
    extendWith("extensions/anytype.mpe")
    execute {
        // All discovery precedes mutation. Every semantic target must be unique.
        val option = Fingerprint(returnType = "V", strings = listOf("Option icon", "Arrow forward"), custom = { m, _ ->
            AccessFlags.STATIC.isSet(m.accessFlags) && m.parameterTypes.size == 5 &&
                m.parameterTypes.take(2) == listOf("I", "I") && m.parameterTypes[3] == STRING &&
                m.calls().any { it.parameterTypes.firstOrNull() == STRING && it.parameterTypes.count { p -> p == "J" } >= 3 }
        }).matchAll(1..1).single().method
        val composer = option.parameterTypes[2].toString()
        val callback = option.parameterTypes[4].toString()
        val sectionCalls = mutableSetOf<String>()
        val sectionCallers = mutableListOf<Method>()
        classDefForEach { cls -> cls.methods.forEach { m ->
            if (m.implementation?.instructions?.any { (it as? WideLiteralInstruction)?.wideLiteral == applicationLabel } == true) {
                sectionCallers += m
                m.calls().filter { it.returnType == "V" && it.parameterTypes == option.parameterTypes && it.descriptor() != option.descriptor() }
                    .forEach { sectionCalls += it.descriptor() }
            }
        } }
        if (sectionCalls.size != 1) throw PatchException("Expected one Application section callee, found ${sectionCalls.size}")
        val section = Fingerprint(returnType = "V", custom = { m, _ -> m.descriptor() in sectionCalls && AccessFlags.STATIC.isSet(m.accessFlags) }).matchAll(1..1).single().method
        val resolver = Fingerprint(custom = { m, c ->
            val p = m.parameterTypes
            !AccessFlags.STATIC.isSet(m.accessFlags) && p.size == 4 && p.takeLast(2) == listOf("I", "I") &&
                p[0].startsWith("L") && p[1].startsWith("L") && m.returnType.startsWith("L") && c.interfaces.isNotEmpty() &&
                m.calls().any { it.name == "<init>" && it.parameterTypes == p + OBJECT } &&
                classDefByOrNull(p[1].toString())?.let { weight ->
                    weight.interfaces.contains("Ljava/lang/Comparable;") && weight.instanceFields.count { it.type == "I" } == 1
                } == true
        }).matchAll(1..1).single().method
        val weightField = classDefBy(resolver.parameterTypes[1].toString()).instanceFields.single { it.type == "I" }
        val adjustments = resolver.fields().filter { it.type == "I" && it.definingClass != weightField.definingClass }.distinctBy { it.toString() }
        if (adjustments.size > 1) throw PatchException("Ambiguous font-weight adjustment")
        val adjustment = adjustments.singleOrNull()
        val adjustmentCode = if (adjustment == null) "const/4 v1, 0x0" else {
            val holder = resolver.fields().filter { it.definingClass == resolver.definingClass && it.type == adjustment.definingClass }.distinctBy { it.toString() }.singleOrNull()
                ?: throw PatchException("Font-weight adjustment owner not unique")
            "iget-object v1, p0, ${holder.definingClass}->${holder.name}:${holder.type}\niget v1, v1, ${adjustment.definingClass}->${adjustment.name}:I"
        }
        val resultClass = mutableListOf<String>()
        classDefForEach { cls ->
            if (resolver.returnType in cls.interfaces && cls.instanceFields.map { it.type }.sorted() == listOf(OBJECT, "Z").sorted()
                && cls.methods.any { it.name == "<init>" && it.parameterTypes.map { p -> p.toString() }.sorted() == listOf(OBJECT, "Z").sorted() }) resultClass += cls.type
        }
        if (resultClass.size != 1) throw PatchException("Expected one immutable Typeface result, found ${resultClass.size}")
        val resultCtor = classDefBy(resultClass.single()).methods.single { it.name == "<init>" }
        val helper = Fingerprint(returnType = "V", parameters = listOf("Landroid/util/AttributeSet;", "I"), custom = { m, c ->
            c.instanceFields.count { it.type == TEXT_VIEW } == 1 &&
                m.calls().any { it.name == "getTransformationMethod" && it.definingClass == TEXT_VIEW } &&
                m.calls().any { it.name == "setAllCaps" && it.definingClass == TEXT_VIEW }
        }).matchAll(1..1).single().method
        val helperView = classDefBy(helper.definingClass).instanceFields.single { it.type == TEXT_VIEW }
        // Inline code/bold/italic use a shared marker interface and Android spans.
        // R8 removes their trivial constructors, so match the class relationship.
        val fontSpans = mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
        classDefForEach { cls ->
            if (cls.superclass == "Landroid/text/style/TypefaceSpan;" && cls.interfaces.size == 1) fontSpans += cls
        }
        if (fontSpans.size != 1) throw PatchException("Expected one shared editor font-span class")
        val spanMarker = fontSpans.single().interfaces.single()
        val textSpans = mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
        classDefForEach { cls ->
            if (spanMarker in cls.interfaces && cls.superclass in listOf("Landroid/text/style/TypefaceSpan;", "Landroid/text/style/StyleSpan;")) textSpans += cls
        }
        if (textSpans.size < 2 || textSpans.any { cls -> cls.methods.any { it.name in listOf("updateDrawState", "updateMeasureState") } })
            throw PatchException("Shared editor span implementation changed")
        val app = mutableClassDefBy(applicationType)
        if (app.superclass != "Landroid/app/Application;") throw PatchException("Unsupported Application inheritance")
        if (app.methods.any { it.name == "attachBaseContext" }) throw PatchException("Application has custom attachBaseContext; explicit integration required")
        val materialText = option.calls().single { it.parameterTypes.firstOrNull() == STRING && it.parameterTypes.count { p -> p == "J" } >= 3 }
        val expectedText = listOf(STRING, "Landroidx/compose/ui/Modifier;", "J", "J", "J", "Landroidx/compose/ui/text/style/TextAlign;", "J", "I", "Z", "I", "I", "Landroidx/compose/ui/text/TextStyle;", composer, "I", "I", "I")
        if (materialText.parameterTypes != expectedText) throw PatchException("Unsupported Material Text ABI; refusing to guess argument mapping")
        val colorResource = option.calls().filter { it.returnType == "J" && it.parameterTypes == listOf("I", composer) }.distinctBy { it.descriptor() }.single()
        val bodyStyle = option.fields().single { it.type == "Landroidx/compose/ui/text/TextStyle;" }
        val arrowCalls = option.implementation!!.instructions.withIndex().filter { (_, ins) ->
            val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference
            ref?.parameterTypes?.take(2) == listOf("Landroidx/compose/ui/graphics/painter/Painter;", STRING)
        }
        if (arrowCalls.size != 2) throw PatchException("Expected icon and trailing arrow image calls")
        // Disambiguate by the nearest string argument's dataflow, not an instruction offset.
        val instructions = option.implementation!!.instructions.toList()
        val arrow = arrowCalls.singleOrNull { (i, ins) ->
            val regs = ins as? RegisterRangeInstruction ?: return@singleOrNull false
            val stringReg = regs.startRegister + 1
            instructions.take(i).asReversed().firstOrNull {
                it is com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction && it.registerA == stringReg
            }?.let { (it as? ReferenceInstruction)?.reference.toString() == "Arrow forward" } == true
        } ?: throw PatchException("Trailing arrow dataflow changed")

        // Initialize before providers and before any static typography is needed.
        app.methods.add(newMethod(app.type, "attachBaseContext", listOf(CONTEXT), "V", 2, AccessFlags.PROTECTED.value).apply {
            addInstructions(0, """
                invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext($CONTEXT)V
                invoke-static {p0}, $MANAGER->initialize($CONTEXT)V
                return-void
            """)
        })
        fun wrap(original: Method, locals: Int, body: (String) -> String) {
            val owner = mutableClassDefBy(original.definingClass)
            val renamed = "morpheOriginal_" + original.name
            if (owner.methods.any { it.name == renamed }) throw PatchException("Already patched: ${original.descriptor()}")
            val saved = MutableMethod(original).apply { name = renamed }
            val params = original.parameterTypes.map { it.toString() }
            val count = params.sumOf { if (it == "J" || it == "D") 2 else 1 } + if (AccessFlags.STATIC.isSet(original.accessFlags)) 0 else 1
            val wrapper = newMethod(owner.type, original.name, params, original.returnType, locals + count, original.accessFlags)
            wrapper.addInstructions(0, body(saved.descriptor()))
            owner.methods.remove(original); owner.methods.add(saved); owner.methods.add(wrapper)
        }
        val ctorArgs = if (resultCtor.parameterTypes[0] == "Z") "v1, v2, v0" else "v1, v0, v2"
        wrap(resolver, 3) { saved -> """
            iget v0, p2, ${weightField.definingClass}->${weightField.name}:I
            $adjustmentCode
            invoke-static {v0, p3, v1}, $MANAGER->resolveAdjusted(III)$FACE
            move-result-object v0
            if-eqz v0, :default_font
            new-instance v1, ${resultCtor.definingClass}
            const/4 v2, 0x0
            invoke-direct {$ctorArgs}, ${resultCtor.descriptor()}
            return-object v1
            :default_font
            invoke-virtual/range {p0 .. p4}, $saved
            move-result-object v0
            return-object v0
        """ }
        wrap(helper, 1) { saved -> """
            invoke-virtual {p0, p1, p2}, $saved
            iget-object v0, p0, ${helperView.definingClass}->${helperView.name}:$TEXT_VIEW
            invoke-static {v0}, $MANAGER->applyTree(Landroid/view/View;)V
            return-void
        """ }

        textSpans.forEach { cls ->
            val target = mutableClassDefBy(cls.type)
            listOf("updateDrawState", "updateMeasureState").forEach { name ->
                target.methods.add(newMethod(cls.type, name, listOf("Landroid/text/TextPaint;"), "V", 3, AccessFlags.PUBLIC.value).apply {
                    addInstructions(0, """
                        invoke-super {p0, p1}, ${cls.superclass}->$name(Landroid/text/TextPaint;)V
                        invoke-virtual {p1}, Landroid/graphics/Paint;->getTypeface()$FACE
                        move-result-object v0
                        invoke-static {p1, v0}, $MANAGER->setPaintTypeface(Landroid/graphics/Paint;$FACE)$FACE
                        return-void
                    """)
                })
            }
        }

        // Reuse Anytype's own Option composable. Its restart scope still calls this
        // original entry point; only the trailing image is replaced for our row.
        val uiOwner = mutableClassDefBy(UI)
        uiOwner.methods.add(newMethod(UI, "renderStatus", listOf(composer, STRING), "Z", 22).apply {
            addInstructions(0, """
                invoke-static/range {p1 .. p1}, $UI->isFont($STRING)Z
                move-result v0
                if-eqz v0, :not_font
                invoke-static {}, $MANAGER->name()$STRING
                move-result-object v0
                const/4 v1, 0x0
                const v2, $secondaryColor
                move-object/from16 v3, p0
                invoke-static {v2, v3}, ${colorResource.descriptor()}
                move-result-wide v2
                const-wide/16 v4, 0x0
                const-wide/16 v6, 0x0
                const/4 v8, 0x0
                const-wide/16 v9, 0x0
                const/4 v11, 0x2
                const/4 v12, 0x0
                const/4 v13, 0x1
                const/4 v14, 0x0
                sget-object v15, ${bodyStyle.definingClass}->${bodyStyle.name}:${bodyStyle.type}
                move-object/from16 v16, p0
                const/16 v17, 0x0
                const/16 v18, 0x0
                const v19, 0xd7fa
                invoke-static/range {v0 .. v19}, ${materialText.descriptor()}
                const/4 v0, 0x1
                return v0
                :not_font
                const/4 v0, 0x0
                return v0
            """)
        })
        // The image-call registers are dead after the invoke (the body only closes
        // groups). Use a fresh wrapper with identical image ABI to preserve locals.
        val imageRef = (arrow.value as ReferenceInstruction).reference as MethodReference
        val imageTypes = imageRef.parameterTypes.map { it.toString() }
        if (imageTypes != listOf("Landroidx/compose/ui/graphics/painter/Painter;", STRING, "Landroidx/compose/ui/Modifier;",
                "Landroidx/compose/ui/Alignment;", "Landroidx/compose/ui/layout/ContentScale;", "F",
                "Landroidx/compose/ui/graphics/BlendModeColorFilter;", composer, "I", "I"))
            throw PatchException("Unsupported trailing Image ABI")
        val optionMutable = mutableClassDefBy(option.definingClass).methods.single { it.name == option.name && it.parameterTypes == option.parameterTypes }
        val arrowRange = arrow.value as RegisterRangeInstruction
        val markerTrailing = newMethod(UI, "trailingScoped", imageTypes, "V", imageTypes.size + 1)
        markerTrailing.addInstructions(0, """
            invoke-static {}, $UI->rowLabel()$STRING
            move-result-object v0
            invoke-static {p7, v0}, $UI->renderStatus($composer$STRING)Z
            move-result v0
            if-nez v0, :done
            invoke-static/range {p0 .. p9}, ${imageRef.descriptor()}
            :done
            return-void
        """)
        uiOwner.methods.add(markerTrailing)
        optionMutable.replaceInstruction(arrow.index, "invoke-static/range {v${arrowRange.startRegister} .. v${arrowRange.startRegister + arrowRange.registerCount - 1}}, ${markerTrailing.descriptor()}")
        wrap(optionMutable, 0) { saved -> """
            invoke-static {p3, p4}, $UI->enter($STRING$OBJECT)V
            invoke-static/range {p0 .. p4}, $saved
            invoke-static {}, $UI->leave()V
            return-void
        """ }
        val sectionBridge = newMethod(UI, "applicationSection", section.parameterTypes.map { it.toString() }, "V", 11)
        sectionBridge.addInstructions(0, """
            invoke-static/range {p0 .. p4}, ${section.descriptor()}
            const v0, $applicationLabel
            invoke-static {p3, v0}, $UI->isApplication(${STRING}I)Z
            move-result v0
            if-eqz v0, :done
            const-class v0, $callback
            sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
            invoke-static {v0, v1}, $UI->listener(Ljava/lang/Class;$OBJECT)$OBJECT
            move-result-object v4
            check-cast v4, $callback
            const v0, $appearanceIcon
            const/4 v1, 0x0
            move-object v2, p2
            const-string v3, "Font"
            invoke-static/range {v0 .. v4}, ${option.descriptor()}
            :done
            return-void
        """)
        uiOwner.methods.add(sectionBridge)
        sectionCallers.forEach { caller ->
            val method = mutableClassDefBy(caller.definingClass).methods.single { it.name == caller.name && it.parameterTypes == caller.parameterTypes }
            method.implementation!!.instructions.withIndex().filter { (_, ins) ->
                ((ins as? ReferenceInstruction)?.reference as? MethodReference)?.descriptor() == section.descriptor()
            }.toList().forEach { (index, ins) ->
                val invoke = ins as? FiveRegisterInstruction ?: throw PatchException("Unsupported section invoke form")
                method.replaceInstruction(index, "invoke-static {v${invoke.registerC}, v${invoke.registerD}, v${invoke.registerE}, v${invoke.registerF}, v${invoke.registerG}}, ${sectionBridge.descriptor()}")
            }
        }
        fun inherits(type: String, base: String): Boolean {
            val frameworkParents = mapOf(
                "Landroid/widget/EditText;" to TEXT_VIEW,
                "Landroid/widget/Button;" to TEXT_VIEW,
                "Landroid/widget/CheckedTextView;" to TEXT_VIEW,
                "Landroid/widget/CompoundButton;" to "Landroid/widget/Button;",
                "Landroid/widget/Switch;" to "Landroid/widget/CompoundButton;",
                "Landroid/widget/ToggleButton;" to "Landroid/widget/CompoundButton;",
                "Landroid/widget/AutoCompleteTextView;" to "Landroid/widget/EditText;",
                "Landroid/widget/MultiAutoCompleteTextView;" to "Landroid/widget/AutoCompleteTextView;",
                "Landroid/text/TextPaint;" to "Landroid/graphics/Paint;",
                "Landroid/app/AlertDialog;" to "Landroid/app/Dialog;",
                "Landroid/app/ProgressDialog;" to "Landroid/app/AlertDialog;",
            )
            var next: String? = type
            val seen = mutableSetOf<String>()
            while (next != null && seen.add(next)) {
                if (next == base) return true
                next = frameworkParents[next] ?: classDefByOrNull(next)?.superclass
            }
            return false
        }
        val nativeSites = mutableListOf<Pair<Method, List<Pair<Int, String>>>>()
        classDefForEach { cls -> if (!cls.type.startsWith(EXT)) cls.methods.forEach { method ->
            val sites = method.implementation?.instructions?.withIndex()?.mapNotNull { (index, ins) ->
                val ref = (ins as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
                if (ins.opcode != com.android.tools.smali.dexlib2.Opcode.INVOKE_VIRTUAL && ins.opcode != com.android.tools.smali.dexlib2.Opcode.INVOKE_VIRTUAL_RANGE) return@mapNotNull null
                val target = when {
                    ref.name == "setTypeface" && ref.parameterTypes == listOf(FACE) && ref.returnType == "V" && inherits(ref.definingClass, TEXT_VIEW) -> "$MANAGER->setTypeface($TEXT_VIEW$FACE)V"
                    ref.name == "setTypeface" && ref.parameterTypes == listOf(FACE, "I") && ref.returnType == "V" && inherits(ref.definingClass, TEXT_VIEW) -> "$MANAGER->setTypeface($TEXT_VIEW${FACE}I)V"
                    ref.name == "setTypeface" && ref.parameterTypes == listOf(FACE) && ref.returnType == FACE && cls.type.startsWith("Lcom/anytypeio/anytype/") && inherits(ref.definingClass, "Landroid/graphics/Paint;") -> "$MANAGER->setPaintTypeface(Landroid/graphics/Paint;$FACE)$FACE"
                    ref.name == "show" && ref.parameterTypes.isEmpty() && ref.returnType == "V" && inherits(ref.definingClass, "Landroid/app/Dialog;") -> "$MANAGER->showDialog(Landroid/app/Dialog;)V"
                    else -> return@mapNotNull null
                }
                val code = when (ins) {
                    is RegisterRangeInstruction -> "invoke-static/range {v${ins.startRegister} .. v${ins.startRegister + ins.registerCount - 1}}, $target"
                    is FiveRegisterInstruction -> "invoke-static {${listOf(ins.registerC, ins.registerD, ins.registerE, ins.registerF, ins.registerG).take(ins.registerCount).joinToString { "v$it" }}}, $target"
                    else -> throw PatchException("Unsupported native typeface invoke encoding")
                }
                index to code
            }?.toList().orEmpty()
            if (sites.isNotEmpty()) nativeSites += method to sites
        } }
        nativeSites.forEach { (original, sites) ->
            val target = mutableClassDefBy(original.definingClass).methods.single { it.name == original.name && it.parameterTypes == original.parameterTypes }
            sites.forEach { (index, code) -> target.replaceInstruction(index, code) }
        }
        println("Native typography call sites: ${nativeSites.sumOf { it.second.size }}")
        println("Anytype font hooks: Application=${app.type}, resolver=${resolver.descriptor()}, settings=${section.descriptor()}, views=${helper.descriptor()}")
    }
}
