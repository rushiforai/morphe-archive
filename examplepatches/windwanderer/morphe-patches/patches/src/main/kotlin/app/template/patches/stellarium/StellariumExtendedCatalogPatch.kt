package app.template.patches.stellarium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.Constants.COMPATIBILITY_Stellarium
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.NodeList
import java.util.logging.Logger

/*
 * Stellarium's extended catalogs are delivered as a Play Asset Delivery pack,
 * which a sideloaded install cannot receive. This patch is the local half of
 * the workaround:
 *
 * - the launcher activity accepts a ZIP through the share sheet or "open with",
 * - the extension extracts it into the app's files directory and replaces the
 *   previous pack atomically, then ends the process so the engine reloads it,
 * - a hook on Play Core's getPackLocation() answers with the local pack, so the
 *   native asset pack code registers it exactly as it would a downloaded pack.
 *
 * Nothing is downloaded and nothing asks for a pack at launch. Without a ZIP,
 * the hook returns null and the app behaves as before.
 */

/** The Play Core type getPackLocation() returns, which the hook must produce. */
private const val ASSET_PACK_LOCATION =
    "Lcom/google/android/play/core/assetpacks/AssetPackLocation;"

/** The launcher activity the ZIP intents and the startup hook belong to. */
private const val LAUNCHER_ACTIVITY = "Lcom/stellariumlabs/stellarium/mobile/StellariumFree;"

/** The launcher as the manifest names it, without the descriptor syntax. */
private const val LAUNCHER_CLASS = "com.stellariumlabs.stellarium.mobile.StellariumFree"

/** Qt's activity base, which owns onNewIntent() for the launcher. */
private const val QT_ACTIVITY_BASE = "Lorg/qtproject/qt/android/QtActivityBase;"

/** The extension class merged into the app by this patch. */
private const val ASSET_SHIM = "Lapp/template/extension/stellarium/AssetShim;"

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
private const val ACTION_VIEW = "android.intent.action.VIEW"
private const val ACTION_SEND = "android.intent.action.SEND"
private const val CATEGORY_DEFAULT = "android.intent.category.DEFAULT"

/** ZIP types different file managers and browsers use when they share a file. */
private val ZIP_MIME_TYPES = listOf(
    "application/zip",
    "application/x-zip-compressed",
    "application/x-zip",
)

private val logger = Logger.getLogger("StellariumExtendedCatalog")

/**
 * Adds the open/share entry points for a ZIP to the launcher activity.
 *
 * The extension cannot add them itself: an extension is precompiled DEX and its
 * manifest is not merged, so the filters have to be written into the APK's
 * manifest before it is assembled. This is a separate dependency of
 * [extendedCatalogPatch], and it is on by default so Simple mode applies the two
 * together; selecting the catalog alone still pulls it in as a dependency.
 */
@Suppress("unused")
val zipSupportPatch = resourcePatch(
    name = "Stellarium Extended Catalog (ZIP support)",
    description = "Adds the \"open with\" and share-sheet entries that let Stellarium receive a " +
        "locally downloaded extended catalog ZIP. Used by Stellarium Extended Catalog.",
    // On by default: the manager only offers default patches in Simple mode, and the
    // catalog patch is useless without these manifest entries. It is still a normal
    // patch in Expert mode, where it can be deselected.
    default = true,
) {
    compatibleWith(COMPATIBILITY_Stellarium)
    execute {
        document("AndroidManifest.xml").use { document ->
            val activity = findLauncherActivity(document)
                ?: throw PatchException(
                    "The manifest has no launcher activity to attach the ZIP intents to"
                )

            var added = 0
            for (action in listOf(ACTION_VIEW, ACTION_SEND)) {
                if (hasZipFilter(activity, action)) {
                    logger.info("The manifest already handles $action for ZIP files")
                    continue
                }
                activity.appendChild(zipFilter(document, action))
                added++
            }
            logger.info("Added $added ZIP intent filter(s) to the launcher activity")
        }
    }
}

/**
 * Enables the local extended catalog: hooks the Play Core location lookup, the
 * launcher's startup, and Qt's new-intent callback, and merges the extension
 * that does the importing.
 *
 * This patch depends on [premiumPatch] because the native side of the unlock
 * still has to be in place: without it the app never gets as far as asking for
 * the pack. It depends on [zipSupportPatch] for the manifest entries.
 */
@Suppress("unused")
val extendedCatalogPatch = bytecodePatch(
    name = "Stellarium Extended Catalog",
    description = "Import a locally downloaded extended catalog ZIP instead of waiting for a Play " +
        "Asset Delivery download that a sideloaded install can never receive. Nothing is " +
        "downloaded and nothing is requested at launch; without a ZIP the app is unchanged. " +
        "Enabled by default; turn it off in Expert mode if you do not want the ZIP entry.",
    // On by default so Simple mode applies it together with the premium unlock. Without a
    // ZIP the hooks return the original values and the app behaves exactly as before.
    default = true,
) {
    compatibleWith(COMPATIBILITY_Stellarium)
    dependsOn(premiumPatch, zipSupportPatch)
    extendWith("extensions/stellariumassetpack.mpe")

    execute {
        val manager = findPackManager()
        val locationType = findLocationType()
        hookPackLocation(manager, locationType)
        hookLauncherStartup()
        hookNewIntent()
    }
}

/**
 * The one class in the app that implements Play Core's getPackLocation(String).
 * The Play Core interface declares it without a body, so the implementation is
 * what the hook goes into.
 */
private fun BytecodePatchContext.findPackManager(): ClassDef {
    val candidates = ArrayList<ClassDef>()
    classDefForEach { classDef ->
        val method = classDef.methods.firstOrNull { method ->
            method.name == "getPackLocation" &&
                method.parameterTypes.size == 1 &&
                method.parameterTypes[0] == "Ljava/lang/String;" &&
                method.returnType == ASSET_PACK_LOCATION &&
                method.implementation != null
        }
        if (method != null) candidates += classDef
    }

    if (candidates.size != 1) {
        throw PatchException(
            "Expected one implementation of Play Core's getPackLocation(String), " +
                "found ${candidates.size}"
        )
    }
    return candidates.single()
}

/**
 * The concrete AssetPackLocation the app creates for a downloaded pack. It is
 * the only subclass with a public (int, String, String) constructor, which is
 * what lets the extension build one without a Play download.
 */
private fun BytecodePatchContext.findLocationType(): String {
    val subclasses = ArrayList<ClassDef>()
    classDefForEach { classDef ->
        if (classDef.superclass != ASSET_PACK_LOCATION) return@classDefForEach
        val constructor = classDef.methods.firstOrNull { method ->
            method.name == "<init>" &&
                method.parameterTypes == listOf(
                    "I",
                    "Ljava/lang/String;",
                    "Ljava/lang/String;",
                )
        }
        if (constructor != null) subclasses += classDef
    }

    if (subclasses.size != 1) {
        throw PatchException(
            "Expected one concrete AssetPackLocation subclass with an (int, String, String) " +
                "constructor, found ${subclasses.size}"
        )
    }
    return subclasses.single().type
}

/**
 * Makes getPackLocation() answer with the imported pack.
 *
 * The method is entered once for every pack name Play Core asks about. The pack
 * name is not available at the return sites (the register is reused by then), so
 * the entry hook stores it in a thread local stack and the return hook reads it
 * back. Every return site is wrapped: the original result is kept, the extension
 * is asked for the local pack, and the original is returned when there is none.
 */
private fun BytecodePatchContext.hookPackLocation(managerClass: ClassDef, locationType: String) {
    val manager = mutableClassDefBy(managerClass)
    val method = manager.methods.firstOrNull { method ->
        method.name == "getPackLocation" &&
            method.parameterTypes.size == 1 &&
            method.parameterTypes[0] == "Ljava/lang/String;" &&
            method.returnType == ASSET_PACK_LOCATION &&
            method.implementation != null
    } ?: throw PatchException("Play Core's getPackLocation(String) has no implementation")

    val implementation = method.implementation
        ?: throw PatchException("Play Core's getPackLocation(String) has no code")
    if (implementation.registerCount < 3) {
        throw PatchException(
            "Play Core's getPackLocation(String) has only ${implementation.registerCount} " +
                "registers, so the hook has no scratch registers"
        )
    }

    if (containsCall(implementation.instructions, "rememberPackName")) {
        logger.info("Play Core's getPackLocation(String) is already hooked")
        return
    }

    method.addInstructions(
        0,
        """
            invoke-static {p1}, $ASSET_SHIM->rememberPackName(Ljava/lang/String;)V
        """,
    )

    // Re-read the instructions because the entry hook moved every return site.
    val returns = implementation.instructions.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode == Opcode.RETURN_OBJECT) index else null
    }
    if (returns.size != 3) {
        throw PatchException(
            "Expected three return sites in Play Core's getPackLocation(String), " +
                "found ${returns.size}"
        )
    }

    val locationName = locationType
        .removePrefix("L")
        .removeSuffix(";")
        .replace('/', '.')

    // Highest index first, so the lower return sites do not move while the
    // blocks are inserted. The branch target is the original return itself;
    // addInstructionsWithLabels keeps that label pointing at it after the
    // instructions are inserted.
    for (site in returns.sortedDescending()) {
        val originalReturn = implementation.instructions[site]
        val original = "pack_original_$site"
        method.addInstructionsWithLabels(
            site,
            """
                const-string v1, "$locationName"
                invoke-static {v1}, $ASSET_SHIM->getPackLocation(Ljava/lang/String;)Ljava/lang/Object;
                move-result-object v2
                if-eqz v2, :$original
                check-cast v2, $ASSET_PACK_LOCATION
                return-object v2
            """,
            ExternalLabel(original, originalReturn),
        )
    }

    logger.info(
        "Hooked getPackLocation(String) at ${returns.size} return sites, " +
            "with $locationName as the pack location"
    )
}

/** Hooks the launcher's onCreate() so a ZIP that started the app is imported. */
private fun BytecodePatchContext.hookLauncherStartup() {
    val classDef = classDefByOrNull(LAUNCHER_ACTIVITY)
        ?: throw PatchException("The manifest's launcher activity $LAUNCHER_ACTIVITY is missing")
    val launcher = mutableClassDefBy(classDef)
    val method = launcher.methods.firstOrNull { method ->
        method.name == "onCreate" &&
            method.parameterTypes == listOf("Landroid/os/Bundle;") &&
            method.returnType == "V" &&
            method.implementation != null
    } ?: throw PatchException("$LAUNCHER_ACTIVITY has no onCreate(Bundle)")

    val implementation = method.implementation!!
    if (containsCall(
            implementation.instructions,
            "handleIntent",
            listOf("Landroid/app/Activity;"),
        )
    ) {
        logger.info("$LAUNCHER_ACTIVITY.onCreate(Bundle) is already hooked")
        return
    }

    method.addInstructions(
        0,
        """
            invoke-static {p0}, $ASSET_SHIM->handleIntent(Landroid/app/Activity;)V
        """,
    )
    logger.info("Hooked $LAUNCHER_ACTIVITY.onCreate(Bundle)")
}

/** Hooks Qt's onNewIntent() so a ZIP shared with a running app is imported too. */
private fun BytecodePatchContext.hookNewIntent() {
    val classDef = classDefByOrNull(QT_ACTIVITY_BASE)
        ?: throw PatchException("Qt's $QT_ACTIVITY_BASE is missing")
    val qtActivity = mutableClassDefBy(classDef)
    val method = qtActivity.methods.firstOrNull { method ->
        method.name == "onNewIntent" &&
            method.parameterTypes == listOf("Landroid/content/Intent;") &&
            method.returnType == "V" &&
            method.implementation != null
    } ?: throw PatchException("$QT_ACTIVITY_BASE has no onNewIntent(Intent)")

    val implementation = method.implementation!!
    if (containsCall(
            implementation.instructions,
            "handleIntent",
            listOf("Landroid/app/Activity;", "Landroid/content/Intent;"),
        )
    ) {
        logger.info("$QT_ACTIVITY_BASE.onNewIntent(Intent) is already hooked")
        return
    }

    method.addInstructions(
        0,
        """
            invoke-static {p0, p1}, $ASSET_SHIM->handleIntent(Landroid/app/Activity;Landroid/content/Intent;)V
        """,
    )
    logger.info("Hooked $QT_ACTIVITY_BASE.onNewIntent(Intent)")
}

/** Whether the instructions already call a method of the extension with this name. */
private fun containsCall(
    instructions: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>,
    name: String,
    parameters: List<String>? = null,
): Boolean = instructions.any { instruction ->
    if (instruction !is ReferenceInstruction) return@any false
    val reference = instruction.reference as? MethodReference ?: return@any false
    reference.definingClass == ASSET_SHIM &&
        reference.name == name &&
        (parameters == null || reference.parameterTypes == parameters)
}

/**
 * The manifest's launcher activity, by its known name first and by its
 * MAIN/LAUNCHER filter second, so a release that renames the Java class still
 * gets the filters on the right activity.
 */
private fun findLauncherActivity(document: Document): Element? {
    val activities = document.getElementsByTagName("activity")
    for (index in 0 until activities.length) {
        val activity = activities.item(index) as? Element ?: continue
        val name = androidAttribute(activity, "name")
        if (name == LAUNCHER_CLASS || name == ".StellariumFree" ||
            name.endsWith(".StellariumFree")
        ) {
            return activity
        }
    }

    for (index in 0 until activities.length) {
        val activity = activities.item(index) as? Element ?: continue
        if (hasAction(activity, "android.intent.action.MAIN") &&
            hasCategory(activity, "android.intent.category.LAUNCHER")
        ) {
            return activity
        }
    }
    return null
}

/** Whether [activity] already has an [action] filter that accepts ZIP files and implicit intents. */
private fun hasZipFilter(activity: Element, action: String): Boolean {
    val filters = activity.getElementsByTagName("intent-filter")
    for (index in 0 until filters.length) {
        val filter = filters.item(index) as? Element ?: continue
        if (!hasAction(filter, action)) continue
        if (!hasCategory(filter, CATEGORY_DEFAULT)) continue
        if (hasMimeType(filter, "application/zip")) return true
    }
    return false
}

/** Builds one intent filter with the action, the default category and every ZIP MIME type. */
private fun zipFilter(document: Document, action: String): Element {
    val filter = document.createElement("intent-filter")
    filter.appendChild(androidElement(document, "action", "name", action))
    filter.appendChild(androidElement(document, "category", "name", CATEGORY_DEFAULT))
    for (mimeType in ZIP_MIME_TYPES) {
        filter.appendChild(androidElement(document, "data", "mimeType", mimeType))
    }
    return filter
}

/** An element with one android: attribute, the form every component of a filter uses. */
private fun androidElement(
    document: Document,
    tag: String,
    attribute: String,
    value: String,
): Element = document.createElement(tag).apply {
    setAttribute("android:$attribute", value)
}

private fun hasAction(filter: Element, action: String): Boolean =
    childWithAttribute(filter, "action", "name", action) != null

private fun hasCategory(filter: Element, category: String): Boolean =
    childWithAttribute(filter, "category", "name", category) != null

private fun hasMimeType(filter: Element, mimeType: String): Boolean =
    childWithAttribute(filter, "data", "mimeType", mimeType) != null

/** The first child named [tag] whose android:[attribute] is [value], or null. */
private fun childWithAttribute(
    parent: Element,
    tag: String,
    attribute: String,
    value: String,
): Element? {
    val children: NodeList = parent.getElementsByTagName(tag)
    for (index in 0 until children.length) {
        val child = children.item(index) as? Element ?: continue
        if (androidAttribute(child, attribute) == value) return child
    }
    return null
}

/** Reads an android: attribute, whether the DOM exposes it by namespace or by prefix. */
private fun androidAttribute(element: Element, name: String): String {
    val namespaced = element.getAttributeNS(ANDROID_NAMESPACE, name)
    return if (namespaced.isNotEmpty()) namespaced else element.getAttribute("android:$name")
}
