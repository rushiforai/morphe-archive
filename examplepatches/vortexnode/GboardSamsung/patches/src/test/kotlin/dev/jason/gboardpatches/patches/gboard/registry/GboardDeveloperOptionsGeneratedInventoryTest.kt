package dev.jason.gboardpatches.patches.gboard.registry

import java.nio.file.Files
import java.nio.file.Path
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test

class GboardDeveloperOptionsGeneratedInventoryTest {
    @Test
    fun generatedInventoryContainsThirtyFourPublishedPatchesAndNoRetiredRows() {
        val inventory = generatedPublishedInventory()
        val patches = inventory.getAsJsonArray("patches")
        val names = patches.map { it.asJsonObject.get("name").asString }

        assertMatchesPublishedRegistrationCount(patches.size())
        RETIRED_PATCH_NAMES.forEach { retiredName ->
            assertFalse("Retired patch must stay absent: $retiredName", names.contains(retiredName))
        }
        SURVIVING_PATCH_NAMES.forEach { survivorName ->
            assertTrue("Surviving patch missing: $survivorName", names.contains(survivorName))
        }

    }

    private fun findRepositoryRoot(): Path {
        val workingDirectory = Path.of("").toAbsolutePath().normalize()
        return generateSequence(workingDirectory) { it.parent }
            .firstOrNull { candidate ->
                Files.isRegularFile(candidate.resolve("README.md")) &&
                    Files.isRegularFile(candidate.resolve("settings.gradle.kts"))
            }
            ?: error("Could not locate repository root from $workingDirectory")
    }

    private companion object {
        val RETIRED_PATCH_NAMES = listOf(
            "Clipboard Entity Extraction",
            "Clipboard Item Edit",
            "Chinese Online Voice Input",
            "Enable Undo/Redo feature",
        )
        val SURVIVING_PATCH_NAMES = listOf(
            "Dictionaries & Predictions",
            "Keypress Vibration Intensity Control",
            "Long-Press Editing Shortcuts",
            "Incognito Mode Toggle",
            "Toolbar Editing Buttons",
            "Floating Web Search",
            "Simple Calculator",
            "Swipe Down to Dismiss Keyboard",
            "Samsung Spacebar Gestures",
            "Advanced Voice Typing",
            "Use Bluetooth Microphone",
            "Change emoji size",
            "Access Points menu style",
            "Enable split keyboard",
            "Rounded Keyboard Panel",
            "Frosted Glass",
            "Top Toolbar Item Count",
            "Close Proactive Suggestions",
            "Custom Theme",
            "Quick Insert",
            "Custom Symbols",
            "Developer options",
            "Backup & Restore",
            "Emojis, stickers & GIFs Tab Order",
            "Clipboard Enhancements",
            "Clipboard Custom Character Limit",
            "Enable Inline Autofill Suggestions",
            "Grammar Checker",
            "Inline Suggestions",
            "Key Shape Selection",
            "AI Writing Tools",
            "Settings Homepage Override",
            "Package Rename",
            "Add Gboard Signature Bypass",
        )
    }
}
