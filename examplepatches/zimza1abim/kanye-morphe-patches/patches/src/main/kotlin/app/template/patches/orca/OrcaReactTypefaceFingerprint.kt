package app.template.patches.orca

import app.morphe.patcher.Fingerprint

/**
 * React Native's shared typeface entry point: every text and text-input path
 * (including Fabric layout) resolves its face through this static method.
 * Matched by Android ABI types only; the release APK is R8-renamed, so the
 * defining class is a single lowercase name there.
 */
internal object OrcaReactTypefaceFingerprint : Fingerprint(
    returnType = "Landroid/graphics/Typeface;",
    parameters = listOf("Landroid/graphics/Typeface;", "I", "I", "Ljava/lang/String;", "Landroid/content/res/AssetManager;"),
)
