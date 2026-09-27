package com.zeldrisho.patches

import com.google.gson.JsonParser
import util.JsonCompatibility
import util.JsonPatch
import util.formatPatchList
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

class PatchListGeneratorTest {
    /** Checks version, patch, dependency, and option metadata in the generated JSON. */
    @Test
    fun formatsPatchMetadataAsValidatedPrettyJson() {
        val json = formatPatchList(
            "2.3.4",
            listOf(
                JsonPatch(
                    name = "Synthetic patch",
                    description = "Keeps <content> intact",
                    default = false,
                    dependencies = listOf("BasePatch"),
                    options = listOf(
                        JsonPatch.Option(
                            key = "enabled",
                            title = "Enable feature",
                            description = null,
                            required = true,
                            type = "Boolean",
                            default = true,
                            values = null,
                        ),
                    ),
                ),
            ),
        )

        val root = JsonParser.parseString(json).asJsonObject
        assertEquals("2.3.4", root.get("version").asString)
        assertTrue(root.get("NOTE").asString.contains("Do NOT manually edit"))
        val patch = root.getAsJsonArray("patches").single().asJsonObject
        assertEquals("Synthetic patch", patch.get("name").asString)
        assertEquals("Keeps <content> intact", patch.get("description").asString)
        assertEquals("BasePatch", patch.getAsJsonArray("dependencies").single().asString)
        assertEquals("enabled", patch.getAsJsonArray("options").single().asJsonObject.get("key").asString)
    }

    /** Checks preservation of compatibility targets, nullable fields, signatures, and option choices. */
    @Test
    fun serializesCompatibilityTargetsAndOptionValuesWithoutLosingMetadata() {
        val patch = JsonPatch(
            name = "Compatible patch",
            dependencies = emptyList(),
            compatiblePackages = listOf(
                JsonCompatibility(
                    packageName = "com.example.app",
                    name = "Example",
                    description = "Supported build",
                    apkFileType = "APKM",
                    appIconColor = "#12ABEF",
                    signatures = setOf("sha256:abc"),
                    targets = listOf(
                        JsonCompatibility.Target(
                            version = "4.2",
                            versionCodes = mapOf("BASE" to 42, "SPLIT" to 43),
                            isExperimental = true,
                            minSdk = 26,
                            description = "Experimental target",
                        ),
                        JsonCompatibility.Target(
                            version = "4.1",
                            versionCodes = null,
                            isExperimental = false,
                            minSdk = null,
                            description = null,
                        ),
                    ),
                ),
            ),
            options = listOf(
                JsonPatch.Option(
                    key = "choice",
                    title = "Choice",
                    description = "Choose <one>",
                    required = false,
                    type = "String",
                    default = "one",
                    values = linkedMapOf("one" to "One", "two" to "Two"),
                ),
            ),
        )

        val root = JsonParser.parseString(formatPatchList("1.2.3", listOf(patch))).asJsonObject
        val app = root.getAsJsonArray("patches").single().asJsonObject
            .getAsJsonArray("compatiblePackages").single().asJsonObject
        assertEquals("APKM", app.get("apkFileType").asString)
        assertEquals("#12ABEF", app.get("appIconColor").asString)
        assertEquals("sha256:abc", app.getAsJsonArray("signatures").single().asString)
        val targets = app.getAsJsonArray("targets")
        assertEquals(42, targets[0].asJsonObject.getAsJsonObject("versionCodes").get("BASE").asInt)
        assertTrue(targets[0].asJsonObject.get("isExperimental").asBoolean)
        assertEquals("Experimental target", targets[0].asJsonObject.get("description").asString)
        assertTrue(targets[1].asJsonObject.get("minSdk").isJsonNull)
        assertTrue(targets[1].asJsonObject.get("versionCodes").isJsonNull)
        val option = root.getAsJsonArray("patches").single().asJsonObject
            .getAsJsonArray("options").single().asJsonObject
        assertEquals("Choose <one>", option.get("description").asString)
        assertEquals("Two", option.getAsJsonObject("values").get("two").asString)
    }

    /** Checks that universal compatibility remains null and empty options remain an array. */
    @Test
    fun serializesUniversalPatchesAndNullableFields() {
        val root = JsonParser.parseString(
            formatPatchList(
                "1.0.0",
                listOf(JsonPatch(name = "Universal", dependencies = emptyList(), options = emptyList())),
            ),
        ).asJsonObject
        val patch = root.getAsJsonArray("patches").single().asJsonObject
        assertEquals("Universal", patch.get("name").asString)
        assertTrue(patch.get("compatiblePackages").isJsonNull)
        assertEquals(0, patch.getAsJsonArray("options").size())
    }

    /** Verifies that formatting rejects a patch with an empty name. */
    @Test
    fun rejectsInvalidMetadataBeforeReturningJson() {
        assertFailsWith<IllegalStateException> {
            formatPatchList(
                "2.3.4",
                listOf(JsonPatch(name = "", dependencies = emptyList(), options = emptyList())),
            )
        }
    }
}
