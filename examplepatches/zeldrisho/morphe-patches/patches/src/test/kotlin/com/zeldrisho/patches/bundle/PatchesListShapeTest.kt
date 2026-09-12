package com.zeldrisho.patches.bundle

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
        val candidates = listOf(
            File("../patches-list.json"), // working dir = patches/
            File("patches-list.json"), // working dir = repo root
        )
        return candidates.firstOrNull { it.isFile }?.readText()
            ?: error("patches-list.json not found; run ./gradlew generatePatchesList")
    }

    /**
     * Verify that all expected patches are present in patches-list.json with the correct metadata.
     */
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
        for (name in listOf("Bypass native startup tamper check", "Disable ads", "Disable sponsored placements", "Filter promo notifications", "Remove AD_ID permission", "microG Drive support")) {
            assertTrue(json.contains("\"name\": \"$name\""), "missing patch: $name")
        }
        assertTrue(json.contains("com.zing.zalo"), "missing Zalo package group")
        assertTrue(json.contains("26.08.01"), "Zalo target version must stay pinned")
    }

    /**
     * Verify that exactly 10 patches are present with no leftover template scaffolding.
     */
    @Test fun patchCountMatchesSources() {
        // Exactly 10 patches (4 Threads + 6 Zalo) — template scaffolding was removed,
        // so any extra entry (e.g. a resurrected "Example Patch") fails loudly.
        // Note: "name" also appears on compatiblePackages entries ("Threads", "Zalo"),
        // so only top-level patch names are counted (6-space indent in output).
        val json = listJson()
        val names = Regex("(?m)^      \"name\": \"(.*?)\"").findAll(json).map { it.groupValues[1] }.toList()
        assertEquals(
            listOf(
                "Bypass native startup tamper check",
                "Change app name",
                "Change package name",
                "Disable ads",
                "Disable sponsored placements",
                "Filter promo notifications",
                "Hide ads",
                "Remove AD_ID permission",
                "Remove AD_ID permission",
                "microG Drive support",
            ),
            names.sorted(),
            "expected exactly 10 patches, found: $names",
        )
    }

    /**
     * Verify that the Change package name patch is disabled by default to prevent breaking SSO/providers/push.
     */
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
