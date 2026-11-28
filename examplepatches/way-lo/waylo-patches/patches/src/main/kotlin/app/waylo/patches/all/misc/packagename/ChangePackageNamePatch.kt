// Original source: https://github.com/ReVanced/revanced-patches (GPL v3)
// Ported via https://github.com/hoo-dles/morphe-patches
// and https://github.com/docbt/patched-up (GPL v3), package renamed for way-lo Patches
package app.waylo.patches.all.misc.packagename

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.OptionException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element
import org.w3c.dom.NodeList
import java.util.logging.Logger

lateinit var packageNameOption: Option<String>

private fun NodeList.elements(): List<Element> =
    (0 until length).map { item(it) as Element }

/**
 * Set the package name to use.
 * If this is called multiple times, the first call will set the package name.
 *
 * @param fallbackPackageName The package name to use if the user has not already specified a package name.
 * @return The package name that was set.
 * @throws OptionException.ValueValidationException If the package name is invalid.
 */
fun setOrGetFallbackPackageName(fallbackPackageName: String): String {
    val packageName = packageNameOption.value!!

    return if (packageName == packageNameOption.default) {
        fallbackPackageName.also { packageNameOption.value = it }
    } else {
        packageName
    }
}

val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Appends \".morphe\" to the package name by default. " +
            "Changing the package name of the app can lead to unexpected issues.",
    // Universal patch: off by default so it is never applied to other apps by accident.
    // Patches that need it (Google News) pull it in through dependsOn().
    default = false,
) {
    packageNameOption = stringOption(
        key = "packageName",
        default = "Default",
        values = mapOf("Default" to "Default"),
        title = "Package name",
        description = "The name of the package to rename the app to.",
        required = true,
    ) { value ->
        value == "Default" || value!!.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+\$"))
    }

    // Both default to true: a renamed app that keeps the original app's permission or provider
    // names cannot be installed next to the original (INSTALL_FAILED_DUPLICATE_PERMISSION,
    // INSTALL_FAILED_CONFLICTING_PROVIDER). See way-lo/waylo-patches#4.
    val updatePermissions by booleanOption(
        key = "updatePermissions",
        default = true,
        title = "Update permissions",
        description = "Rename the permissions the app declares under its package name, so it can be " +
                "installed next to the original app. Disabling this can cause installation errors.",
    )

    val updateProviders by booleanOption(
        key = "updateProviders",
        default = true,
        title = "Update providers",
        description = "Rename the content provider authorities the app declares under its package name, so " +
                "it can be installed next to the original app. Disabling this can cause installation errors.",
    )

    finalize {
        val incompatibleAppPackages = setOf(
            "com.reddit.frontpage",
            "com.duolingo",
            "com.twitter.android",
            "tv.twitch.android.app",
        )

        // Provider authorities renamed in the manifest, old to new.
        val renamedAuthorities = mutableMapOf<String, String>()

        document("AndroidManifest.xml").use { document ->
            val manifest = document.getElementsByTagName("manifest").item(0) as Element
            val packageName = manifest.getAttribute("package")

            if (incompatibleAppPackages.contains(packageName)) {
                return@finalize Logger.getLogger(this::class.java.name).severe(
                    "'$packageName' does not work correctly with \"Change package name\"",
                )
            }

            val replacementPackageName = packageNameOption.value
            val newPackageName = if (replacementPackageName != packageNameOption.default) {
                replacementPackageName!!
            } else {
                "$packageName.morphe"
            }

            manifest.setAttribute("package", newPackageName)

            // "com.example.app" or "com.example.app.anything", renamed to the new package.
            fun renamed(name: String): String? = when {
                name == packageName -> newPackageName
                name.startsWith("$packageName.") -> newPackageName + name.substring(packageName.length)
                else -> null
            }

            if (updatePermissions == true) {
                val androidName = "android:name"

                // Every permission the app declares under its package name. A copy installed next to
                // the original must not declare the same permission (signature permissions are owned
                // by the first app that declares them).
                val renamedPermissions = document.getElementsByTagName("permission").elements()
                    .mapNotNull { permission ->
                        val name = permission.getAttribute(androidName)
                        renamed(name)?.let { newName -> name to newName }
                    }
                    .toMap()

                if (renamedPermissions.isNotEmpty()) {
                    // The declarations, their uses, and components protected by them.
                    val permissionAttributes = listOf(
                        "android:name", "android:permission", "android:readPermission", "android:writePermission",
                    )
                    document.getElementsByTagName("*").elements().forEach { element ->
                        permissionAttributes.forEach { attribute ->
                            renamedPermissions[element.getAttribute(attribute)]?.let { newName ->
                                if (element.tagName == "permission" ||
                                    element.tagName == "uses-permission" ||
                                    attribute != "android:name"
                                ) {
                                    element.setAttribute(attribute, newName)
                                }
                            }
                        }
                    }
                }
            }

            if (updateProviders == true) {
                val androidAuthority = "android:authorities"

                document.getElementsByTagName("provider").elements().forEach { provider ->
                    val authorities = provider.getAttribute(androidAuthority).split(";")
                    val newAuthorities = authorities.map { authority ->
                        renamed(authority)?.also { renamedAuthorities[authority] = it } ?: authority
                    }
                    if (newAuthorities != authorities) {
                        provider.setAttribute(androidAuthority, newAuthorities.joinToString(";"))
                    }
                }
            }
        }

        // Some apps read a provider authority from a string resource instead of building it from
        // their package name (Google News: content_authority). Rename those too, so the app keeps
        // finding its own provider.
        if (renamedAuthorities.isNotEmpty()) {
            document("res/values/strings.xml").use { document ->
                document.getElementsByTagName("string").elements().forEach { string ->
                    renamedAuthorities[string.textContent]?.let { newAuthority -> string.textContent = newAuthority }
                }
            }
        }
    }
}
