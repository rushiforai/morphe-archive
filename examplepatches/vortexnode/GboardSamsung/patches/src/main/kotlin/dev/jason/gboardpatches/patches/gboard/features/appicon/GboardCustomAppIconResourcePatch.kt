package dev.jason.gboardpatches.patches.gboard.features.appicon

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.resource.PublicXmlManager
import dev.jason.gboardpatches.patches.gboard.shared.ANDROID_NS
import dev.jason.gboardpatches.patches.gboard.shared.childElements
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import java.io.File
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val CUSTOM_APP_ICON_MIPMAP_NAME = "ic_gboardsamsung_app"
internal const val CUSTOM_APP_ICON_MIPMAP_REF = "@mipmap/$CUSTOM_APP_ICON_MIPMAP_NAME"
internal const val CUSTOM_APP_ICON_LAYER_NAME = "ic_gboardsamsung_launcher_layer"
internal const val CUSTOM_APP_ICON_EMPTY_NAME = "ic_gboardsamsung_launcher_empty"

private const val CLASSPATH_LIGHT_PNG = "/gboard/appicon/ic_gboardsamsung_light.png"
private const val CLASSPATH_DARK_PNG = "/gboard/appicon/ic_gboardsamsung_dark.png"
private const val CLASSPATH_LEGACY_PNG = "/gboard/appicon/ic_gboardsamsung_legacy.png"

internal const val ADAPTIVE_ICON_XML =
    "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" +
        "<adaptive-icon xmlns:android=\"http://schemas.android.com/apk/res/android\">\n" +
        "    <background android:drawable=\"@drawable/$CUSTOM_APP_ICON_LAYER_NAME\"/>\n" +
        "    <foreground android:drawable=\"@drawable/$CUSTOM_APP_ICON_EMPTY_NAME\"/>\n" +
        "</adaptive-icon>\n"

internal const val EMPTY_FOREGROUND_XML =
    "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" +
        "<shape xmlns:android=\"http://schemas.android.com/apk/res/android\" android:shape=\"rectangle\">\n" +
        "    <solid android:color=\"#00000000\"/>\n" +
        "</shape>\n"

internal val gboardCustomAppIconResourcePatch = resourcePatch(
    description =
        "Replace Gboard's launcher icon with the GboardSamsung Light/Dark adaptive icon " +
            "(automatically switches via Android night-mode resources).",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        applyCustomAppIcon()
    }
}

context(context: ResourcePatchContext)
private fun applyCustomAppIcon() = with(context) {
    val lightBytes = loadBundledIconBytes(CLASSPATH_LIGHT_PNG)
    val darkBytes = loadBundledIconBytes(CLASSPATH_DARK_PNG)
    val legacyBytes = loadBundledIconBytes(CLASSPATH_LEGACY_PNG)

    writeResourceFile(this["res/drawable-nodpi/$CUSTOM_APP_ICON_LAYER_NAME.png", false], lightBytes)
    writeResourceFile(this["res/drawable-night-nodpi/$CUSTOM_APP_ICON_LAYER_NAME.png", false], darkBytes)
    writeResourceFile(this["res/drawable/$CUSTOM_APP_ICON_EMPTY_NAME.xml", false], EMPTY_FOREGROUND_XML.toByteArray(Charsets.UTF_8))
    writeResourceFile(this["res/mipmap-anydpi-v26/$CUSTOM_APP_ICON_MIPMAP_NAME.xml", false], ADAPTIVE_ICON_XML.toByteArray(Charsets.UTF_8))
    writeResourceFile(this["res/mipmap-xxxhdpi/$CUSTOM_APP_ICON_MIPMAP_NAME.png", false], legacyBytes)

    PublicXmlManager(this["res/values/public.xml"]).use { publicIds ->
        publicIds.createPublicId("drawable", CUSTOM_APP_ICON_LAYER_NAME)
        publicIds.createPublicId("drawable", CUSTOM_APP_ICON_EMPTY_NAME)
        publicIds.createPublicId("mipmap", CUSTOM_APP_ICON_MIPMAP_NAME)
        document("AndroidManifest.xml").use { manifest ->
            applyCustomAppIconToManifest(manifest)
        }
    }
}

internal fun applyCustomAppIconToManifest(manifestDocument: Document) {
    val applications = manifestDocument.documentElement.childElements("application").toList()
    check(applications.size == 1) {
        "Expected exactly one application element, found ${applications.size}"
    }
    val application = applications.single()
    application.setAttributeNS(ANDROID_NS, "android:icon", CUSTOM_APP_ICON_MIPMAP_REF)
    application.setAttributeNS(ANDROID_NS, "android:roundIcon", CUSTOM_APP_ICON_MIPMAP_REF)

    for (tag in listOf("activity", "activity-alias")) {
        for (node in application.childElements(tag).toList()) {
            if (node.hasAndroidAttr("icon")) {
                node.setAttributeNS(ANDROID_NS, "android:icon", CUSTOM_APP_ICON_MIPMAP_REF)
            }
            if (node.hasAndroidAttr("roundIcon")) {
                node.setAttributeNS(ANDROID_NS, "android:roundIcon", CUSTOM_APP_ICON_MIPMAP_REF)
            }
        }
    }
}

internal fun loadBundledIconBytes(classpathLocation: String): ByteArray {
    val stream = GboardCustomAppIconResourceMarker::class.java.getResourceAsStream(classpathLocation)
        ?: error("Missing bundled GboardSamsung icon resource: $classpathLocation")
    return stream.use { it.readBytes() }
}

private fun writeResourceFile(target: File, bytes: ByteArray) {
    val parent = target.parentFile
    check(parent != null && (parent.isDirectory || parent.mkdirs())) {
        "Could not create resource directory for ${target.path}"
    }
    target.writeBytes(bytes)
}

private fun Element.hasAndroidAttr(localName: String): Boolean {
    if (hasAttributeNS(ANDROID_NS, localName)) return true
    return hasAttribute("android:$localName")
}

private object GboardCustomAppIconResourceMarker
