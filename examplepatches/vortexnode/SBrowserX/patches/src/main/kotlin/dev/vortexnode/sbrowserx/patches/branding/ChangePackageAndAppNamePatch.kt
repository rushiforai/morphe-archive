package dev.vortexnode.sbrowserx.patches.branding

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import dev.vortexnode.sbrowserx.shared.Constants.ANDROID_NS
import dev.vortexnode.sbrowserx.shared.Constants.COMPATIBILITY_SBROWSER
import dev.vortexnode.sbrowserx.shared.Constants.SBROWSER_DEFAULT_APP_NAME
import dev.vortexnode.sbrowserx.shared.Constants.SBROWSER_DEFAULT_PATCHED_PACKAGE_NAME
import dev.vortexnode.sbrowserx.shared.Constants.SBROWSER_PACKAGE_NAME
import org.w3c.dom.Element

private val PACKAGE_NAME_REGEX = Regex("^[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+$")
private const val LEGACY_BROWSER_PREFIX = "com.sec.android.app.browser"
private const val SBROWSER_PROVIDER_CLASS =
    "Lcom/sec/android/app/sbrowser/sites/provider/SBrowserProvider;"

private val EXACT_AUTHORITY_SUFFIXES = setOf(
    "aiSummary",
    "aiOnDeviceOptionsProvider",
    "androidx-startup",
    "recentDownloadSearch",
    "recentWebsiteSearch",
    "webPushNotification",
    "notificationsearchkeywords",
    "searchindexables",
    "ManageAppDataProvider",
    "browser",
    "migration",
    "operatorbookmarks",
    "ChromeBrowserProvider",
    "BrowserProviderProxy",
    "card",
    "sfinder.searchprovider",
    "bnrDocuments",
    "sbrowser2",
    "FileProvider",
    "DownloadFileProvider",
    "mediahistory",
    "quickaccesspinned",
    "searchengine",
    "mostvisited",
    "sitessearchkeywords",
    "settingsearchkeywords",
    "scloud.quickaccess.sync",
    "scloud.quickaccess.sync2",
    "backup",
    "backup2",
    "scloud.sync",
    "provider.DumpProvider",
    "account",
    "handoffData",
    "sync.setting.provider",
    "PageContentProvider",
    "CapsuleProvider",
    "provider.routines.v3",
    "mlkitinitprovider",
)

internal object SBrowserPackageRenameTarget {
    @Volatile
    var packageName: String = SBROWSER_DEFAULT_PATCHED_PACKAGE_NAME

    @Volatile
    var appName: String = SBROWSER_DEFAULT_APP_NAME
}

internal val changePackageAndAppNameResourcePatch = resourcePatch(
    description = "Allows changing the app name and package name so the modified browser can be installed alongside the original Samsung Internet.",
) {
    finalize {
        val newPackage = SBrowserPackageRenameTarget.packageName
        val newAppName = SBrowserPackageRenameTarget.appName

        document("AndroidManifest.xml").use { manifest ->
            val root = manifest.documentElement
                ?: error("AndroidManifest.xml is missing root <manifest> element")

            val application = root.getElementsByTagName("application").item(0) as? Element
                ?: error("AndroidManifest.xml is missing <application> element")

            if (newPackage != SBROWSER_PACKAGE_NAME) {
                root.setAttribute("package", newPackage)
                rewriteManifestForClone(root, application, SBROWSER_PACKAGE_NAME, newPackage)
            }

            application.setAttributeNS(ANDROID_NS, "android:label", newAppName)
            rewriteAppLabels(application, newAppName)
        }

        // Apply custom SBrowserX launcher icon ("X" badge) across all densities + monochrome theme
        val iconClassLoader = SBrowserPackageRenameTarget::class.java.classLoader
        for (density in listOf("mdpi", "xhdpi", "xxhdpi")) {
            for (fileName in listOf("internet_foreground.webp", "internet_color_theme.webp")) {
                val targetFile = get("res/drawable-$density/$fileName")
                if (targetFile.exists()) {
                    iconClassLoader.getResourceAsStream("sbrowserx/icon/drawable-$density/$fileName")?.use { input ->
                        targetFile.outputStream().use { output -> input.copyTo(output) }
                    }
                }
            }
        }
    }
}

@Suppress("unused")
val changePackageAndAppNamePatch = bytecodePatch(
    name = "Change package and app name",
    description = "Changes the package name, custom permissions, provider authorities, internal content:// URIs, UriMatcher rules, and app display name so SBrowserX runs cleanly alongside stock Samsung Internet.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SBROWSER)

    dependsOn(changePackageAndAppNameResourcePatch)

    val targetPackageName = stringOption(
        key = "package_name",
        default = SBROWSER_DEFAULT_PATCHED_PACKAGE_NAME,
        values = linkedMapOf(
            SBROWSER_DEFAULT_PATCHED_PACKAGE_NAME to SBROWSER_DEFAULT_PATCHED_PACKAGE_NAME,
            SBROWSER_PACKAGE_NAME to SBROWSER_PACKAGE_NAME,
        ),
        title = "Package name",
        description = "Custom Android package name for the patched browser.",
        required = true,
    ) { value ->
        value != null && PACKAGE_NAME_REGEX.matches(value.trim())
    }

    val targetAppName = stringOption(
        key = "app_name",
        default = SBROWSER_DEFAULT_APP_NAME,
        values = linkedMapOf(
            SBROWSER_DEFAULT_APP_NAME to SBROWSER_DEFAULT_APP_NAME,
            "Samsung Internet" to "Samsung Internet",
        ),
        title = "App name",
        description = "Custom launcher display name for the patched browser.",
        required = true,
    ) { value ->
        !value.isNullOrBlank()
    }

    execute {
        val newPackage = checkNotNull(targetPackageName.value).trim()
        val newAppName = checkNotNull(targetAppName.value).trim()
        require(PACKAGE_NAME_REGEX.matches(newPackage)) {
            "Invalid package name: '$newPackage'"
        }
        require(newAppName.isNotEmpty()) {
            "App name cannot be blank"
        }

        SBrowserPackageRenameTarget.packageName = newPackage
        SBrowserPackageRenameTarget.appName = newAppName

        if (newPackage == SBROWSER_PACKAGE_NAME) return@execute

        val classesToPatch = mutableListOf<String>()
        classDefForEach { classDef ->
            val isProviderClass = classDef.type == SBROWSER_PROVIDER_CLASS
            val hasCandidate = classDef.methods.any { method ->
                method.implementation?.instructions?.any { insn ->
                    if (insn.opcode == Opcode.CONST_STRING || insn.opcode == Opcode.CONST_STRING_JUMBO) {
                        val str = ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string
                        str != null && rewriteCloneString(str, newPackage, isProviderClass) != str
                    } else {
                        false
                    }
                } == true
            }
            if (hasCandidate) {
                classesToPatch.add(classDef.type)
            }
        }

        for (classType in classesToPatch) {
            val isProviderClass = classType == SBROWSER_PROVIDER_CLASS
            val mutableClass = mutableClassDefBy(classType)
            for (method in mutableClass.methods) {
                val impl = method.implementation ?: continue
                val instructions = impl.instructions
                for (index in instructions.indices) {
                    val insn = instructions[index]
                    if (insn.opcode != Opcode.CONST_STRING && insn.opcode != Opcode.CONST_STRING_JUMBO) continue
                    val ref = (insn as? ReferenceInstruction)?.reference as? StringReference ?: continue
                    val original = ref.string
                    val updated = rewriteCloneString(original, newPackage, isProviderClass)
                    if (updated != original) {
                        val reg = (insn as OneRegisterInstruction).registerA
                        method.replaceInstruction(index, "const-string v$reg, \"${escapeSmali(updated)}\"")
                    }
                }
            }
        }
    }
}

private fun rewriteCloneString(
    value: String,
    newPkg: String,
    isProviderClass: Boolean,
): String {
    val oldPkg = SBROWSER_PACKAGE_NAME
    return when {
        isProviderClass && value == oldPkg -> newPkg

        value.startsWith("content://$oldPkg/") ||
            value.startsWith("content://$oldPkg.") ||
            value == "content://$oldPkg" ->
            "content://$newPkg" + value.removePrefix("content://$oldPkg")

        value.startsWith("/data/data/$oldPkg") ->
            "/data/data/$newPkg" + value.removePrefix("/data/data/$oldPkg")

        value == "${oldPkg}_preferences.xml" ->
            "${newPkg}_preferences.xml"

        value.startsWith("$oldPkg.permission.") ||
            value.startsWith("$oldPkg.operatorbookmarks.permission.") ||
            value == "$oldPkg.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION" ->
            newPkg + value.removePrefix(oldPkg)

        value.startsWith("$LEGACY_BROWSER_PREFIX.permission.") ->
            "$newPkg.legacy" + value.removePrefix(LEGACY_BROWSER_PREFIX)

        value.startsWith("$oldPkg.") && EXACT_AUTHORITY_SUFFIXES.contains(value.removePrefix("$oldPkg.")) ->
            newPkg + value.removePrefix(oldPkg)

        else -> value
    }
}

private fun escapeSmali(input: String): String =
    input.replace("\\", "\\\\").replace("\"", "\\\"")

private fun rewriteAppLabels(application: Element, newAppName: String) {
    val allElements = application.getElementsByTagName("*")
    for (i in 0 until allElements.length) {
        val el = allElements.item(i) as? Element ?: continue
        if (el.tagName == "activity" || el.tagName == "activity-alias" || el.tagName == "intent-filter") {
            val label = el.getAttributeNS(ANDROID_NS, "label")
            if (label == "@string/app_name" || label == "@string/app_name_internet") {
                el.setAttributeNS(ANDROID_NS, "android:label", newAppName)
            }
        }
    }
}

private fun rewriteManifestForClone(
    root: Element,
    application: Element,
    oldPkg: String,
    newPkg: String,
) {
    val declaredPermRemap = mutableMapOf<String, String>()
    val permissionNodes = root.getElementsByTagName("permission")
    for (i in 0 until permissionNodes.length) {
        val el = permissionNodes.item(i) as? Element ?: continue
        val permName = el.getAttributeNS(ANDROID_NS, "name")
        if (permName.isEmpty()) continue
        val renamed = when {
            permName.startsWith("$oldPkg.") -> newPkg + permName.removePrefix(oldPkg)
            permName.startsWith("$LEGACY_BROWSER_PREFIX.") ->
                "$newPkg.legacy" + permName.removePrefix(LEGACY_BROWSER_PREFIX)
            else -> "$newPkg.$permName"
        }
        declaredPermRemap[permName] = renamed
        el.setAttributeNS(ANDROID_NS, "android:name", renamed)
    }

    val allElements = root.getElementsByTagName("*")
    for (i in 0 until allElements.length) {
        val el = allElements.item(i) as? Element ?: continue
        when (el.tagName) {
            "uses-permission" -> remapAttrIfPresent(el, "name", declaredPermRemap)
            "activity", "activity-alias", "service", "receiver" ->
                remapAttrIfPresent(el, "permission", declaredPermRemap)
            "provider" -> {
                remapAttrIfPresent(el, "permission", declaredPermRemap)
                remapAttrIfPresent(el, "readPermission", declaredPermRemap)
                remapAttrIfPresent(el, "writePermission", declaredPermRemap)
            }
        }
    }

    val appProviders = application.getElementsByTagName("provider")
    for (i in 0 until appProviders.length) {
        val el = appProviders.item(i) as? Element ?: continue
        val authorities = el.getAttributeNS(ANDROID_NS, "authorities")
        if (authorities.isEmpty()) continue
        val updated = authorities
            .split(";")
            .joinToString(";") { part ->
                val trimmed = part.trim()
                when {
                    trimmed.isEmpty() -> trimmed
                    trimmed == oldPkg || trimmed.startsWith("$oldPkg.") ->
                        newPkg + trimmed.removePrefix(oldPkg)
                    trimmed.startsWith("$newPkg.") -> trimmed
                    else -> "$newPkg.$trimmed"
                }
            }
        el.setAttributeNS(ANDROID_NS, "android:authorities", updated)
    }
}

private fun remapAttrIfPresent(
    el: Element,
    attrLocalName: String,
    remap: Map<String, String>,
) {
    val current = el.getAttributeNS(ANDROID_NS, attrLocalName)
    val updated = remap[current]
    if (updated != null) {
        el.setAttributeNS(ANDROID_NS, "android:$attrLocalName", updated)
    }
}
