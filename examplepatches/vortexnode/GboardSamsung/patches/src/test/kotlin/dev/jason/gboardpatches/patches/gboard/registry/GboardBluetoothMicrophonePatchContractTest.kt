package dev.jason.gboardpatches.patches.gboard.registry

import dev.jason.gboardpatches.patches.gboard.features.bluetoothmicrophone.BLUETOOTH_MICROPHONE_FEATURE_MARKER
import dev.jason.gboardpatches.patches.gboard.features.bluetoothmicrophone.gboardBluetoothMicrophoneFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.bluetoothmicrophone.gboardBluetoothMicrophoneFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesSettingsPatch
import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardBluetoothMicrophonePatchContractTest {
    @Test
    fun publicPatchIsIndependentAndExact1853Only() {
        val patch = gboardBluetoothMicrophonePatch
        assertEquals("Use Bluetooth Microphone", patch.name)
        assertEquals(BLUETOOTH_MICROPHONE_DESCRIPTION, patch.description)
        assertTrue(patch.default)
        assertEquals(
            listOf(
                gboardPatchesSettingsPatch,
                gboardBluetoothMicrophoneFeatureMarkerPatch,
                gboardBluetoothMicrophoneFlagValuePatch,
            ),
            patch.dependencies.toList(),
        )
        assertFalse(patch.dependencies.any { dependency ->
            dependency.toString().contains("AdvancedVoice", ignoreCase = true) ||
                dependency.toString().contains("LongPressQuickActions", ignoreCase = true)
        })
        assertEquals(1, gboardBluetoothMicrophoneFlagValuePatch.dependencies.size)
        assertEquals(
            "18.5.4.993608717-release-arm64-v8a",
            patch.compatibility!!.single().targets.single().version,
        )
        assertEquals(
            "dev.jason.gboardpatches.feature.bluetooth_microphone",
            BLUETOOTH_MICROPHONE_FEATURE_MARKER,
        )
    }

    @Test
    fun generatedInventoryContainsExactlyOneBluetoothMicrophoneRowWithoutOptions() {
        val rows = generatedPublishedPatches()
            .filter { it.get("name").asString == "Use Bluetooth Microphone" }

        assertEquals(1, rows.size)
        val row = rows.single()
        assertEquals(BLUETOOTH_MICROPHONE_DESCRIPTION, row.get("description").asString)
        assertTrue(row.get("use").asBoolean)
        assertEquals(0, row.getAsJsonArray("options").size())
        assertEquals(
            listOf("18.5.4.993608717-release-arm64-v8a"),
            row.getAsJsonObject("compatiblePackages")
                .getAsJsonArray("com.google.android.inputmethod.latin")
                .map { it.asString },
        )
    }

    @Test
    fun readmeListsBluetoothMicrophoneAmongVoiceFeatures() {
        val readme = Files.readString(
            repositoryRoot().resolve("README.md"),
            StandardCharsets.UTF_8,
        )

        val voiceFeaturesSection = readme
            .substringAfter("## Active Patch Catalog (35 patches)")
            .substringAfter("Language, AI, Suggestions")
            .substringBefore("</details>")

        assertTrue(voiceFeaturesSection.contains("`Use Bluetooth Microphone`"))
    }

    private fun repositoryRoot(): Path {
        val workingDirectory = Path.of("").toAbsolutePath().normalize()
        return generateSequence(workingDirectory) { it.parent }
            .firstOrNull { Files.isRegularFile(it.resolve("settings.gradle.kts")) }
            ?: error("Could not locate repository root from $workingDirectory")
    }

    private companion object {
        const val BLUETOOTH_MICROPHONE_DESCRIPTION =
            "Enable Voice typing -> Use Bluetooth microphone.\n" +
                "Включает опцию «Голосовой ввод -> Использовать Bluetooth-микрофон»."
    }
}
