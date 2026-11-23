package dev.jason.gboardpatches.patches.gboard.registry

import com.google.gson.JsonParser
import dev.jason.gboardpatches.patches.gboard.features.packagerename.gboardPackageRenameResourcePatch
import dev.jason.gboardpatches.patches.gboard.features.packagerename.isValidGboardTargetPackageName
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import dev.jason.gboardpatches.patches.shared.Constants.GBOARD_DEFAULT_PATCHED_PACKAGE_NAME
import dev.jason.gboardpatches.patches.shared.Constants.GBOARD_PACKAGE_NAME
import dev.jason.gboardpatches.patches.shared.Constants.GBOARD_PATCHED_PACKAGE_NAME
import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardPackageRenamePatchContractTest {
    private val repositoryRoot = findRepositoryRoot()

    @Test
    fun `public patch keeps exact install time metadata dependency and compatibility`() {
        val patch = gboardPackageRenamePatch

        assertEquals("Package Rename", patch.name)
        assertEquals(PACKAGE_RENAME_DESCRIPTION, patch.description)
        assertTrue(patch.default)
        assertEquals(
            listOf(PACKAGE_NAME_OPTION_KEY, APP_DISPLAY_NAME_OPTION_KEY),
            patch.options.keys.toList(),
        )

        val packageNameOption = patch.options[PACKAGE_NAME_OPTION_KEY]
        assertEquals(PACKAGE_NAME_OPTION_TITLE, packageNameOption.title)
        assertEquals(PACKAGE_NAME_OPTION_DESCRIPTION, packageNameOption.description)
        assertEquals(GBOARD_DEFAULT_PATCHED_PACKAGE_NAME, packageNameOption.default)
        assertEquals(GBOARD_DEFAULT_PATCHED_PACKAGE_NAME, packageNameOption.value)
        assertTrue(packageNameOption.required)
        assertEquals("kotlin.String", packageNameOption.type.toString())
        assertEquals(PACKAGE_NAME_PRESETS, packageNameOption.values)

        assertTrue(isValidGboardTargetPackageName(GBOARD_DEFAULT_PATCHED_PACKAGE_NAME))
        assertTrue(isValidGboardTargetPackageName(GBOARD_PACKAGE_NAME))
        assertTrue(isValidGboardTargetPackageName("com.example.gboardsamsung"))
        assertFalse(isValidGboardTargetPackageName("invalid-package"))

        val appDisplayNameOption = patch.options[APP_DISPLAY_NAME_OPTION_KEY]
        assertEquals(APP_DISPLAY_NAME_OPTION_TITLE, appDisplayNameOption.title)
        assertEquals(APP_DISPLAY_NAME_OPTION_DESCRIPTION, appDisplayNameOption.description)
        assertEquals(APP_DISPLAY_NAME_DEFAULT, appDisplayNameOption.default)
        assertEquals(APP_DISPLAY_NAME_DEFAULT, appDisplayNameOption.value)
        assertTrue(appDisplayNameOption.required)
        assertEquals("kotlin.String", appDisplayNameOption.type.toString())
        assertEquals(APP_DISPLAY_NAME_PRESETS, appDisplayNameOption.values)

        assertEquals(1, patch.dependencies.size)
        assertSame(gboardPackageRenameResourcePatch, patch.dependencies.single())
        assertEquals("com.google.android.inputmethod.latin", GBOARD_PACKAGE_NAME)
        assertEquals(
            "gboardsamsung.com.google.android.inputmethod.latin",
            GBOARD_DEFAULT_PATCHED_PACKAGE_NAME,
        )
        assertEquals(GBOARD_DEFAULT_PATCHED_PACKAGE_NAME, GBOARD_PATCHED_PACKAGE_NAME)

        val compatibilities = checkNotNull(patch.compatibility)
        assertEquals(1, compatibilities.size)
        assertSame(COMPATIBILITY_GBOARD, compatibilities.single())
        assertEquals(GBOARD_PACKAGE_NAME, compatibilities.single().packageName)
        assertEquals(
            listOf(TARGET_VERSION),
            compatibilities.single().targets.map { target -> target.version },
        )
        assertTrue(compatibilities.single().targets.none { target -> target.isExperimental })
    }

    @Test
    fun `active inventory matches registrations with package rename options exactly once`() {
        val patches = generatedPublishedPatches()

        assertMatchesPublishedRegistrationCount(patches.size)
        val rows = patches.filter { row -> row.get("name").asString == "Package Rename" }
        assertEquals(1, rows.size)
        val row = rows.single()
        assertTrue(row.get("use").asBoolean)
        assertEquals(PACKAGE_RENAME_DESCRIPTION, row.get("description").asString)
        assertTrue(row.getAsJsonArray("dependencies").isEmpty)
        val options = row.getAsJsonArray("options")
        assertEquals(2, options.size())

        val packageNameOption = options[0].asJsonObject
        assertEquals(PACKAGE_NAME_OPTION_KEY, packageNameOption.get("key").asString)
        assertEquals(PACKAGE_NAME_OPTION_TITLE, packageNameOption.get("title").asString)
        assertEquals(PACKAGE_NAME_OPTION_DESCRIPTION, packageNameOption.get("description").asString)
        assertEquals(GBOARD_DEFAULT_PATCHED_PACKAGE_NAME, packageNameOption.get("default").asString)
        assertTrue(packageNameOption.get("required").asBoolean)
        assertEquals("kotlin.String", packageNameOption.get("type").asString)
        assertEquals(
            PACKAGE_NAME_PRESETS.entries.map { entry -> entry.key to entry.value },
            packageNameOption.getAsJsonObject("values").entrySet().map { entry ->
                entry.key to entry.value.asString
            },
        )

        val appNameOption = options[1].asJsonObject
        assertEquals(APP_DISPLAY_NAME_OPTION_KEY, appNameOption.get("key").asString)
        assertEquals(APP_DISPLAY_NAME_OPTION_TITLE, appNameOption.get("title").asString)
        assertEquals(APP_DISPLAY_NAME_OPTION_DESCRIPTION, appNameOption.get("description").asString)
        assertEquals(APP_DISPLAY_NAME_DEFAULT, appNameOption.get("default").asString)
        assertTrue(appNameOption.get("required").asBoolean)
        assertEquals("kotlin.String", appNameOption.get("type").asString)
        assertEquals(
            APP_DISPLAY_NAME_PRESETS.entries.map { entry -> entry.key to entry.value },
            appNameOption.getAsJsonObject("values").entrySet().map { entry ->
                entry.key to entry.value.asString
            },
        )

        val packages = row.getAsJsonObject("compatiblePackages")
        assertEquals(setOf(GBOARD_PACKAGE_NAME), packages.keySet())
        assertEquals(
            listOf(TARGET_VERSION),
            packages.getAsJsonArray(GBOARD_PACKAGE_NAME).map { it.asString },
        )
    }

    @Test
    fun `package rename adds no runtime binding family or flag factory`() {
        val profile = JsonParser.parseString(readSource(BINDINGS_PROFILE_PATH)).asJsonObject

        assertEquals("18.5.4", profile.get("target_version").asString)
        val bindings = profile.getAsJsonObject("bindings")
        assertFalse(bindings.has("flag_factory"))
        assertTrue(bindings.keySet().none { key -> key.contains("package_rename") })
        assertFalse(GboardPublishedPatchCatalog.publishedInventory("test-version").contains("family_ids"))
    }

    private fun readSource(relativePath: String): String = Files.readString(
        repositoryRoot.resolve(relativePath),
        StandardCharsets.UTF_8,
    )

    private fun findRepositoryRoot(): Path {
        var current = Path.of("").toAbsolutePath().normalize()
        while (true) {
            if (Files.isRegularFile(current.resolve("settings.gradle.kts"))) return current
            current = current.parent ?: error("Could not resolve repository root")
        }
    }

    private companion object {
        const val TARGET_VERSION = "18.5.4.993608717-release-arm64-v8a"
        const val PACKAGE_RENAME_DESCRIPTION =
            "Configure the Android package name (default gboardsamsung.com.google.android.inputmethod.latin, " +
                "official com.google.android.inputmethod.latin, or a custom package ID) and allow a custom app name.\n" +
                "Позволяет задать имя Android-пакета (по умолчанию gboardsamsung.com.google.android.inputmethod.latin, " +
                "официальный com.google.android.inputmethod.latin или собственный ID пакета) и пользовательское название приложения."
        const val PACKAGE_NAME_OPTION_KEY = "package_name"
        const val PACKAGE_NAME_OPTION_TITLE = "Package name / Имя пакета"
        const val PACKAGE_NAME_OPTION_DESCRIPTION =
            "Android package ID for the patched app: keep the default side-by-side ID, " +
                "use com.google.android.inputmethod.latin, or enter any valid custom Android package name.\n" +
                "ID Android-пакета пропатченного приложения: оставьте значение по умолчанию для установки рядом, " +
                "выберите com.google.android.inputmethod.latin или введите собственное корректное имя пакета."
        val PACKAGE_NAME_PRESETS = linkedMapOf(
            GBOARD_DEFAULT_PATCHED_PACKAGE_NAME to GBOARD_DEFAULT_PATCHED_PACKAGE_NAME,
            GBOARD_PACKAGE_NAME to GBOARD_PACKAGE_NAME,
        )
        const val APP_DISPLAY_NAME_OPTION_KEY = "app_display_name"
        const val APP_DISPLAY_NAME_OPTION_TITLE = "App name / Название приложения"
        const val APP_DISPLAY_NAME_OPTION_DESCRIPTION = ""
        const val APP_DISPLAY_NAME_DEFAULT = "GboardSamsung"
        val APP_DISPLAY_NAME_PRESETS = linkedMapOf(
            "GboardSamsung" to "GboardSamsung",
            "Gboard" to "Gboard",
            "Gboard Dev" to "Gboard Dev",
            "Gboard Patches" to "Gboard Patches",
            "Gboard Mod" to "Gboard Mod",
        )
        const val BINDINGS_PROFILE_PATH =
            "patches/src/main/resources/gboard/gboard-version-bindings.json"
    }
}
