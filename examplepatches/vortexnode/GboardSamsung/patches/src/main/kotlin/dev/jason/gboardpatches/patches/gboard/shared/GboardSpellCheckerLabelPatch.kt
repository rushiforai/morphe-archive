package dev.jason.gboardpatches.patches.gboard.shared

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.resource.PublicXmlManager
import dev.jason.gboardpatches.patches.gboard.features.packagerename.APP_DISPLAY_NAME_RESOURCE_PATH
import dev.jason.gboardpatches.patches.gboard.features.packagerename.isValidGboardAppDisplayName
import java.io.File
import java.io.StringWriter
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.OutputKeys
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import org.w3c.dom.Attr
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val GBOARD_SPELL_CHECKER_LABEL = "GboardSamsung"
internal const val GBOARD_SPELL_CHECKER_SERVICE_CLASS =
    "com.android.inputmethod.latin.spellcheck.AndroidSpellCheckerService"
internal const val SPELL_CHECKER_LABEL_RESOURCE = "gboard_patches_spell_checker_label"
internal const val SPELL_CHECKER_LABEL_RESOURCE_REF = "@string/$SPELL_CHECKER_LABEL_RESOURCE"
internal const val SPELL_CHECKER_METADATA_NAME = "android.view.textservice.scs"

context(context: ResourcePatchContext)
internal fun applyGboardSpellCheckerLabel(
    labelText: String = GBOARD_SPELL_CHECKER_LABEL,
) = with(context) {
    // Patcher 2.x decodes resources lazily on request; decode values files before scanning.
    decode("res/values*/*.xml")
    val target = this[APP_DISPLAY_NAME_RESOURCE_PATH, false]
    check(target.isFile) {
        "Missing existing default string resources at $APP_DISPLAY_NAME_RESOURCE_PATH"
    }
    val factory = DocumentBuilderFactory.newInstance().apply { isNamespaceAware = true }
    val builder = factory.newDocumentBuilder()
    val labelResources = builder.parse(target)
    val otherResources = this["res", false].listFiles().orEmpty().asSequence()
        .filter { it.isDirectory && (it.name == "values" || it.name.startsWith("values-")) }
        .flatMap { it.listFiles().orEmpty().asSequence() }
        .filter { it.isFile && it.extension == "xml" && it.absoluteFile != target.absoluteFile }
        .sortedBy { it.path }
        .map { builder.parse(it) }
        .toList()

    PublicXmlManager(this["res/values/public.xml"]).use { publicIds ->
        document("AndroidManifest.xml").use { manifest ->
            val xmlResourceName = resolveSpellCheckerXmlResourceName(manifest)
            val spellCheckerPaths = if (xmlResourceName != null) {
                runCatching { decode("res/xml*/$xmlResourceName.xml") }
                runCatching { decode("res/xml/$xmlResourceName.xml") }
                val discovered = findSpellCheckerXmlRelativePaths(this["res", false], xmlResourceName)
                check(discovered.isNotEmpty()) {
                    "Spell checker metadata references @xml/$xmlResourceName, " +
                        "but no matching res/xml*/$xmlResourceName.xml file was found"
                }
                discovered
            } else {
                emptyList()
            }

            withOpenedDocuments(spellCheckerPaths) { spellCheckerDocuments ->
                applyGboardSpellCheckerLabel(
                    manifestDocument = manifest,
                    spellCheckerDocuments = spellCheckerDocuments,
                    labelText = labelText,
                    labelResourceDocument = labelResources,
                    otherValueResourceDocuments = otherResources,
                    publicIds = publicIds,
                )
            }

            val writer = StringWriter()
            TransformerFactory.newInstance().newTransformer().apply {
                setOutputProperty(OutputKeys.ENCODING, "utf-8")
            }.transform(DOMSource(labelResources), StreamResult(writer))
            check(target.parentFile.isDirectory || target.parentFile.mkdirs()) {
                "Could not create default spell-checker resource directory"
            }
            target.writeText(writer.toString(), Charsets.UTF_8)
        }
    }
}

context(context: ResourcePatchContext)
private fun withOpenedDocuments(
    relativePaths: List<String>,
    index: Int = 0,
    opened: MutableList<Document> = ArrayList(relativePaths.size),
    block: (List<Document>) -> Unit,
) {
    if (index == relativePaths.size) {
        block(opened)
        return
    }
    context.document(relativePaths[index]).use { document ->
        opened.add(document)
        withOpenedDocuments(relativePaths, index + 1, opened, block)
    }
}

internal fun findSpellCheckerXmlRelativePaths(
    resDir: File,
    xmlResourceName: String,
): List<String> {
    if (!resDir.isDirectory) {
        return emptyList()
    }
    val apkRoot = resDir.parentFile ?: return emptyList()
    val expectedFileName = "$xmlResourceName.xml"
    return resDir.listFiles().orEmpty().asSequence()
        .filter { it.isDirectory && (it.name == "xml" || it.name.startsWith("xml-")) }
        .map { File(it, expectedFileName) }
        .filter { it.isFile }
        .map { it.toRelativeString(apkRoot).replace(File.separatorChar, '/') }
        .sorted()
        .toList()
}

internal fun resolveSpellCheckerXmlResourceName(manifestDocument: Document): String? {
    val service = findSpellCheckerService(manifestDocument)
    val metadata = service.childElements("meta-data")
        .filter { it.androidAttribute("name")?.value == SPELL_CHECKER_METADATA_NAME }
        .toList()
    check(metadata.size <= 1) {
        "Expected at most one $SPELL_CHECKER_METADATA_NAME meta-data on " +
            "$GBOARD_SPELL_CHECKER_SERVICE_CLASS, found ${metadata.size}"
    }
    val resourceRef = metadata.singleOrNull()?.androidAttribute("resource")?.value?.trim()
        ?: return null
    check(resourceRef.startsWith("@xml/") && resourceRef.length > "@xml/".length) {
        "Unexpected spell checker metadata resource reference '$resourceRef'"
    }
    return resourceRef.removePrefix("@xml/")
}

internal fun applyGboardSpellCheckerLabel(
    manifestDocument: Document,
    spellCheckerDocuments: List<Document>,
    labelText: String = GBOARD_SPELL_CHECKER_LABEL,
    labelResourceDocument: Document,
    otherValueResourceDocuments: List<Document>,
    publicIds: PublicXmlManager,
) {
    applyGboardSpellCheckerLabel(
        manifestDocument = manifestDocument,
        spellCheckerDocuments = spellCheckerDocuments,
        labelText = labelText,
        labelResourceDocument = labelResourceDocument,
        otherValueResourceDocuments = otherValueResourceDocuments,
    )
    publicIds.createPublicId("string", SPELL_CHECKER_LABEL_RESOURCE)
}

internal fun applyGboardSpellCheckerLabel(
    manifestDocument: Document,
    spellCheckerDocuments: List<Document>,
    labelText: String = GBOARD_SPELL_CHECKER_LABEL,
    labelResourceDocument: Document,
    otherValueResourceDocuments: List<Document> = emptyList(),
) {
    require(isValidGboardAppDisplayName(labelText)) {
        "Invalid Gboard spell checker label"
    }

    val service = findSpellCheckerService(manifestDocument)
    val serviceLabel = service.androidAttribute("label")
        ?: error("Gboard spell checker service is missing android:label")

    val spellCheckerRoots = spellCheckerDocuments.map { document ->
        val root = document.documentElement
        val rootName = root.localName ?: root.tagName.substringAfter(':')
        check(rootName == "spell-checker") {
            "Expected spell-checker root element, found '$rootName'"
        }
        root
    }

    val resources = labelResourceDocument.documentElement
    check(resources.tagName == "resources") {
        "Expected default spell-checker label resources root"
    }
    val existing = spellCheckerLabelResourceEntries(labelResourceDocument)
    check(existing.size <= 1) { "Duplicate default spell-checker label resources" }
    check(otherValueResourceDocuments.all { spellCheckerLabelResourceEntries(it).isEmpty() }) {
        "Spell-checker label resource collides outside default values/strings.xml"
    }

    val alreadyReferenced = serviceLabel.value == SPELL_CHECKER_LABEL_RESOURCE_REF ||
        spellCheckerRoots.any { root ->
            root.androidAttribute("label")?.value == SPELL_CHECKER_LABEL_RESOURCE_REF
        }
    if (alreadyReferenced) {
        check(existing.size == 1) {
            "Spell-checker label resource reference has no unique definition"
        }
        val entry = existing.single()
        check(
            entry.tagName == "string" &&
                entry.getAttribute("translatable") == "false" &&
                entry.getAttribute("formatted") == "false" &&
                entry.childElements().none() &&
                entry.textContent.startsWith('"') && entry.textContent.endsWith('"'),
        ) {
            "Existing spell-checker label resource is not patch-owned"
        }
    } else {
        check(existing.isEmpty()) {
            "Spell-checker label resource name is already occupied"
        }
    }

    val entry = existing.singleOrNull() ?: labelResourceDocument.createElement("string").apply {
        setAttribute("name", SPELL_CHECKER_LABEL_RESOURCE)
        setAttribute("translatable", "false")
        setAttribute("formatted", "false")
        resources.appendChild(this)
    }
    entry.textContent = encodeAndroidLabelValue(labelText)
    serviceLabel.value = SPELL_CHECKER_LABEL_RESOURCE_REF

    spellCheckerRoots.forEach { root ->
        val existingLabel = root.androidAttribute("label")
        if (existingLabel != null) {
            existingLabel.value = SPELL_CHECKER_LABEL_RESOURCE_REF
        } else if (root.namespaceURI != null || root.ownerDocument.documentElement.hasAttribute("xmlns:android")) {
            root.setAttributeNS(ANDROID_NS, "android:label", SPELL_CHECKER_LABEL_RESOURCE_REF)
        } else {
            root.setAttribute("android:label", SPELL_CHECKER_LABEL_RESOURCE_REF)
        }
    }
}

private fun findSpellCheckerService(manifestDocument: Document): Element {
    val applications = manifestDocument.documentElement.childElements("application").toList()
    check(applications.size == 1) {
        "Expected exactly one application element, found ${applications.size}"
    }
    val services = applications.single().childElements("service")
        .filter { it.androidAttribute("name")?.value == GBOARD_SPELL_CHECKER_SERVICE_CLASS }
        .toList()
    check(services.size == 1) {
        "Expected exactly one $GBOARD_SPELL_CHECKER_SERVICE_CLASS service, found ${services.size}"
    }
    return services.single()
}

private fun spellCheckerLabelResourceEntries(document: Document): List<Element> {
    val root = document.documentElement
    check(root.tagName == "resources") { "Expected values resource document" }
    return root.childElements().filter {
        it.tagName != "public" && it.getAttribute("name") == SPELL_CHECKER_LABEL_RESOURCE
    }.toList()
}

private fun encodeAndroidLabelValue(value: String): String = buildString {
    append('"')
    value.forEach { character ->
        when (character) {
            '\\' -> append("\\\\")
            '"' -> append("\\\"")
            '\'' -> append("\\'")
            else -> append(character)
        }
    }
    append('"')
}

private fun Element.androidAttribute(localName: String): Attr? =
    (0 until attributes.length).asSequence()
        .map { index -> attributes.item(index) }
        .filterIsInstance<Attr>()
        .firstOrNull { attribute ->
            (
                attribute.namespaceURI == ANDROID_NS &&
                    attribute.localName == localName
                ) ||
                attribute.nodeName == "android:$localName"
        }
