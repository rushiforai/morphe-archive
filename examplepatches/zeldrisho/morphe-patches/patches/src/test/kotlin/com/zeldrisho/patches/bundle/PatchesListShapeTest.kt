package com.zeldrisho.patches.bundle

import com.google.gson.JsonParser
import java.io.File
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

/**
 * Integration guard on the GENERATED patches-list.json (see AGENTS.md: never
 * hand-edit — run `./gradlew generatePatchesList`). Fails when the bundle
 * shape drifts: wrong package group, missing patch, or unpinned version.
 */
class PatchesListShapeTest {
    /**
     * Locate and read the generated patches-list.json file from the project root or patches directory.
     */
    private fun listJson(): String {
        val candidates = listOfNotNull(
            System.getProperty("patches.list.path")?.let(::File),
            File("../patches-list.json"), // working dir = patches/
            File("patches-list.json"), // working dir = repo root
        )
        return candidates.firstOrNull { it.isFile }?.readText()
            ?: error("patches-list.json not found; run ./gradlew generatePatchesList")
    }

    /**
     * Verify that all expected patches are present in patches-list.json with the correct metadata.
     */
    @Test fun metadataIsStructurallyValid() {
        val root = JsonParser.parseString(listJson()).asJsonObject
        System.getProperty("patches.project.version")?.let { expected ->
            assertEquals(expected, root["version"].asString, "generated metadata must match release version")
        }
        assertTrue(root["version"].isJsonPrimitive)
        val patches = root["patches"].asJsonArray.map { it.asJsonObject }
        val namesByPackage = mutableMapOf<String, MutableSet<String>>()
        patches.forEach { patch ->
            assertTrue(patch["name"].asString.isNotBlank())
            assertTrue(patch["default"].isJsonPrimitive)
            val optionKeys = mutableSetOf<String>()
            patch["options"].asJsonArray.forEach { option ->
                val value = option.asJsonObject
                val key = value["key"].asString
                assertTrue(key.isNotBlank())
                assertTrue(optionKeys.add(key), "duplicate option $key on ${patch["name"].asString}")
                assertTrue(value["title"].asString.isNotBlank())
                assertTrue(value["type"].asString.isNotBlank())
                if (value["required"].asBoolean) assertTrue(value.has("default"))
            }
            patch["compatiblePackages"]?.takeUnless { it.isJsonNull }?.asJsonArray?.forEach { packageEntry ->
                val packageObject = packageEntry.asJsonObject
                val packageName = packageObject["packageName"].asString
                check(namesByPackage.getOrPut(packageName) { mutableSetOf() }.add(patch["name"].asString)) {
                    "duplicate patch name ${patch["name"].asString} for $packageName"
                }
                val targets = packageObject["targets"].asJsonArray
                assertTrue(targets.size() > 0, "patch must declare at least one target")
                targets.forEach { target ->
                    val targetObject = target.asJsonObject
                    assertTrue(targetObject["version"].asString.isNotBlank())
                    assertTrue(targetObject["minSdk"].asInt > 0)
                    targetObject["versionCodes"]?.takeUnless { it.isJsonNull }?.asJsonObject?.entrySet()?.forEach { (abi, code) ->
                        assertTrue(abi.isNotBlank())
                        assertTrue(code.asInt > 0)
                    }
                }
            }
        }
    }

    @Test fun threadsBundleShape() {
        val json = listJson()
        for (name in listOf("Hide ads", "Remove AD_ID permission", "Change app name", "Change package name")) {
            assertTrue(json.contains("\"name\": \"$name\""), "missing patch: $name")
        }
        assertTrue(json.contains("com.instagram.barcelona"), "missing package group")
        assertTrue(json.contains("434.0.0.41.74"), "Threads target version must stay pinned")
    }

    @Test fun zaloBundleShape() {
        val json = listJson()
        for (name in listOf("Bypass native startup tamper check", "Disable ads", "Disable sponsored placements", "Filter promo notifications", "Hide Business Box", "Keep expired media accessible", "Remove AD_ID permission", "Change Zalo app name", "Change Zalo package name", "microG Drive support")) {
            assertTrue(json.contains("\"name\": \"$name\""), "missing patch: $name")
        }
        assertTrue(json.contains("com.zing.zalo"), "missing Zalo package group")
        assertTrue(json.contains("26.08.01"), "Zalo target version must stay pinned")
    }

    /**
     * Verify that exactly 20 patches are present with no leftover template scaffolding.
     */
    @Test fun patchCountMatchesSources() {
        // Exact-name comparison catches both added patches and removed patches.
        // Exactly 20 patches (4 Threads + 16 Zalo) — template scaffolding was removed,
        // so any extra entry (e.g. a resurrected "Example Patch") fails loudly.
        // Note: "name" also appears on compatiblePackages entries ("Threads", "Zalo"),
        // so only top-level patch names are counted (6-space indent in output).
        val json = listJson()
        val names = Regex("(?m)^      \"name\": \"(.*?)\"").findAll(json).map { it.groupValues[1] }.toList()
        assertEquals(
            listOf(
                "Bypass native startup tamper check",
                "Change Zalo app name",
                "Change Zalo package name",
                "Change app name",
                "Change package name",
                "Disable ads",
                "Disable sponsored placements",
                "Disable telemetry and crash reporting",
                "Enable Google Drive photo backup",
                "Filter promo notifications",
                "Hide Business Box",
                "Hide ads",
                "Keep expired media accessible",
                "Prefer original photo quality",
                "Remove AD_ID permission",
                "Remove AD_ID permission",
                "Remove media backup age limit",
                "Suppress outbound seen status",
                "Suppress outbound typing status",
                "microG Drive support",
            ),
            names.sorted(),
            "expected exactly 20 patches, found: $names",
        )
    }

    @Test fun removedAntiRecallIsAbsent() {
        assertTrue(!listJson().contains("\"name\": \"Anti-Recall\""), "removed Anti-Recall patch must stay absent")
    }

    /**
     * Verify that the Change package name patch is disabled by default to prevent breaking SSO/providers/push.
     */
    @Test fun everyPatchHasAnAppAndTargets() {
        val patches = JsonParser.parseString(listJson()).asJsonObject["patches"].asJsonArray
        patches.forEach { patch ->
            val apps = patch.asJsonObject["compatiblePackages"].asJsonArray
            assertTrue(apps.size() > 0, "${patch.asJsonObject["name"].asString} has no app association")
            apps.forEach { app ->
                assertTrue(app.asJsonObject["packageName"].asString.contains('.'))
                assertTrue(app.asJsonObject["targets"].asJsonArray.size() > 0)
            }
        }
    }

    @Test fun riskyRenameDefaultsRemainDisabled() {
        val patches = JsonParser.parseString(listJson()).asJsonObject["patches"].asJsonArray
        patches.filter { it.asJsonObject["name"].asString.contains("package name") }
            .forEach { assertEquals(false, it.asJsonObject["default"].asBoolean) }
    }

    @Test fun renamePatchIsOptIn() {
        // Change package name must stay off by default: renaming breaks
        // package+cert-bound flows (SSO, providers, push). See lessons-learned.
        val json = listJson()
        val block = Regex(
            "\"name\": \"Change package name\".*?\"default\": (true|false)",
            RegexOption.DOT_MATCHES_ALL,
        ).find(json)?.groupValues?.get(1)
        assertEquals("false", block, "Change package name must default to false")
    }
}
