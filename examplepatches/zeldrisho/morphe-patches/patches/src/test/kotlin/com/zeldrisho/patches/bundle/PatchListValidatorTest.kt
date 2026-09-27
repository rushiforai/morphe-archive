package com.zeldrisho.patches.bundle

import util.PatchListValidator
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFails
import kotlin.test.assertFailsWith

class PatchListValidatorTest {
    @Test
    fun validMinimalMetadataIsAccepted() {
        PatchListValidator.validate(validPatch())
    }

    @Test
    fun malformedRootMetadataIsRejected() {
        assertFailsWith<IllegalArgumentException> {
            PatchListValidator.validate("{\"version\":\"\",\"patches\":[]}")
        }
        assertFailsWith<IllegalArgumentException> {
            PatchListValidator.validate("{\"version\":\"1.0.0\",\"patches\":[true]}")
        }
    }

    /** Verifies rejection of missing patch and compatibility-target arrays. */
    @Test
    fun rejectsMissingPatchesAndMissingTargetArray() {
        assertFailsWith<IllegalStateException> {
            PatchListValidator.validate("{\"version\":\"1.0.0\"}")
        }
        assertFailsWith<IllegalStateException> {
            PatchListValidator.validate(
                "{\"version\":\"1\",\"patches\":[{\"name\":\"P\",\"default\":true,\"options\":[],\"compatiblePackages\":[{\"packageName\":\"com.test.app\"}]}]}",
            )
        }
    }

    /** Exercises invalid patch defaults, options, package names, and target metadata. */
    @Test
    fun rejectsMissingPatchOptionAndCompatibilityMetadata() {
        val cases = listOf(
            "{\"version\":\"1\",\"patches\":[{\"name\":\"P\",\"options\":[]}]}",
            "{\"version\":\"1\",\"patches\":[{\"name\":\"P\",\"default\":true}]}",
            "{\"version\":\"1\",\"patches\":[{\"name\":\"P\",\"default\":true,\"options\":[{\"key\":\"k\",\"required\":true,\"title\":\"K\",\"type\":\"S\"}]}]}",
            "{\"version\":\"1\",\"patches\":[{\"name\":\"P\",\"default\":true,\"options\":[],\"compatiblePackages\":[{\"packageName\":\"bad\",\"targets\":[]}]}]}",
            "{\"version\":\"1\",\"patches\":[{\"name\":\"P\",\"default\":true,\"options\":[],\"compatiblePackages\":[{\"packageName\":\"com.test.app\",\"targets\":[]}]}]}",
            "{\"version\":\"1\",\"patches\":[{\"name\":\"P\",\"default\":true,\"options\":[],\"compatiblePackages\":[{\"packageName\":\"com.test.app\",\"targets\":[{\"version\":\"\",\"minSdk\":23}]}]}]}",
        )
        cases.forEach { json -> assertFails { PatchListValidator.validate(json) } }
    }

    /** Checks the diagnostics for empty patch names and invalid package names. */
    @Test
    fun invalidPackageAndMissingPatchNameHaveSpecificErrors() {
        val missingName = assertFailsWith<IllegalStateException> {
            PatchListValidator.validate("{\"version\":\"1\",\"patches\":[{\"name\":\"\",\"default\":true,\"options\":[]}]}")
        }
        assertEquals("patch has no name", missingName.message)

        val invalidPackage = assertFailsWith<IllegalStateException> {
            PatchListValidator.validate(
                "{\"version\":\"1\",\"patches\":[{\"name\":\"P\",\"default\":true,\"options\":[],\"compatiblePackages\":[{\"packageName\":\"bad\",\"targets\":[]}] }]}",
            )
        }
        assertEquals("P has an invalid package", invalidPackage.message)
    }

    @Test
    fun duplicatePatchNamesAreRejected() {
        assertFailsWith<IllegalStateException> {
            PatchListValidator.validate(
                """
                {"version":"1.0.0","patches":[
                  {"name":"Example","default":true,"options":[],"compatiblePackages":[{"packageName":"com.example.app","targets":[{"version":"1","minSdk":23}]}]},
                  {"name":"Example","default":true,"options":[],"compatiblePackages":[{"packageName":"com.example.app","targets":[{"version":"1","minSdk":23}]}]}
                ]}
                """.trimIndent(),
            )
        }
    }

    /** Verifies that an explicit null minimum SDK is accepted as unrestricted. */
    @Test
    fun nullableMinimumSdkMeansAnyDeviceSdk() {
        PatchListValidator.validate(validPatch().replace("\"minSdk\":23", "\"minSdk\":null"))
    }

    @Test
    fun invalidTargetSdkIsRejected() {
        assertFailsWith<IllegalArgumentException> {
            PatchListValidator.validate(validPatch().replace("\"minSdk\":23", "\"minSdk\":0"))
        }
    }

    @Test
    fun duplicateOptionsAreRejected() {
        assertFailsWith<IllegalStateException> {
            PatchListValidator.validate(
                validPatch().replace(
                    "\"options\":[{\"key\":\"enabled\",\"title\":\"Enabled\",\"type\":\"BOOLEAN\",\"required\":false}]",
                    "\"options\":[{\"key\":\"enabled\",\"title\":\"Enabled\",\"type\":\"BOOLEAN\",\"required\":false},{\"key\":\"enabled\",\"title\":\"Again\",\"type\":\"BOOLEAN\",\"required\":false}]",
                ),
            )
        }
    }

    private fun validPatch() = """
        {"version":"1.0.0","patches":[{
          "name":"Example","default":true,
          "options":[{"key":"enabled","title":"Enabled","type":"BOOLEAN","required":false}],
          "compatiblePackages":[{"packageName":"com.example.app","targets":[{"version":"1","minSdk":23}]}]
        }]}
    """.trimIndent()
}
