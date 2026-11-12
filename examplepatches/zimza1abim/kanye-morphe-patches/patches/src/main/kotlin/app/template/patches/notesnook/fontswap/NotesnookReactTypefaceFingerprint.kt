package app.template.patches.notesnook.fontswap

import app.morphe.patcher.Fingerprint

// Android type ABI, not an app/library class name, method name, opcode offset
// or register number. Ambiguous/absent matches stop patching safely.
internal object NotesnookReactTypefaceFingerprint : Fingerprint(
    returnType = "Landroid/graphics/Typeface;",
    parameters = listOf("Landroid/graphics/Typeface;", "I", "I", "Ljava/lang/String;", "Landroid/content/res/AssetManager;"),
)
