package app.brokenn.patches.officereader.ui

import app.brokenn.patches.officereader.shared.Constants.COMPATIBILITY_OFFICEREADER
import app.brokenn.patches.officereader.shared.ensureThemeItem
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import java.util.logging.Logger
import org.w3c.dom.Element

@Suppress("unused")
val amoledThemePatch = resourcePatch(
    name = "AMOLED theme",
    description = "Makes dark mode pure black for AMOLED screens. Light mode stays normal.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_OFFICEREADER)

    val amoledColor by stringOption(
        "amoledColor", "#FF000000",
        values = linkedMapOf(
            "Pure Black" to "#FF000000",
            "Near Black" to "#FF0A0A0A",
            "Dark Charcoal" to "#FF121212",
        ),
        title = "AMOLED color",
        description = "Hex color to use for AMOLED (e.g. #FF000000 pure black, #FF0A0A0A near-black).",
    )
    val blackenStatusBar by booleanOption(
        "amoledBlackenStatusBar", false,
        title = "Blacken Status Bar",
        description = "Also force the status bar background to AMOLED on dark themes.",
    )
    val blackenNavigationBar by booleanOption(
        "amoledBlackenNavigationBar", false,
        title = "Blacken Navigation Bar",
        description = "Also force the navigation bar background to AMOLED on dark themes.",
    )
    val blackenSurfaces by booleanOption(
        "amoledBlackenSurfaces", true,
        title = "Blacken Surfaces",
        description = "Also blacken Material3 surface container colors (recommended for full AMOLED).",
    )

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        val rawColor = (amoledColor ?: "#FF000000").trim()
        val hexRegex = Regex("^#([0-9a-fA-F]{3}|[0-9a-fA-F]{4}|[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$")
        val amoled = if (rawColor.matches(hexRegex)) rawColor else "#FF000000"
        if (amoled != rawColor) logger.warning("Invalid AMOLED color '$rawColor', using $amoled")

        val baseTargets = mutableListOf(
            "android:colorBackground",
            "android:colorBackgroundFloating",
            "android:windowBackground",
            "android:colorSurface",
            "android:colorPrimarySurface",
        )
        if (blackenStatusBar == true) baseTargets.add("android:statusBarColor")
        if (blackenNavigationBar == true) baseTargets.add("android:navigationBarColor")

        val surfaceTargets = listOf(
            "colorSurface", "android:colorSurface",
            "colorSurfaceVariant", "android:colorSurfaceVariant",
            "colorSurfaceContainer", "colorSurfaceContainerLow", "colorSurfaceContainerLowest",
            "colorSurfaceContainerHigh", "colorSurfaceContainerHighest",
            "colorSurfaceBright", "colorSurfaceDim",
            "colorPrimaryContainer", "colorSecondaryContainer", "colorTertiaryContainer",
            "colorOnPrimaryContainer", "colorOnSecondaryContainer",
            "background", "surface", "surfaceVariant",
            "outline", "outlineVariant", "scrim", "inverseSurface", "inverseOnSurface", "inversePrimary",
            "elevationOverlayColor", "surfaceColor", "surfaceContainer",
        )
        val denylist = setOf(
            "colorOnSurface", "android:colorOnSurface",
            "colorOnBackground", "android:colorOnBackground",
            "colorOnSurfaceVariant", "colorOnPrimary", "colorOnSecondary",
            "colorOnSurfaceInverse", "colorSurfaceInverse"
        )
        val targets = buildList {
            addAll(baseTargets)
            if (blackenSurfaces == true) addAll(surfaceTargets.filter { it !in denylist })
        }

        var updatedStyles = 0
        var updatedColors = 0
        var updatedColorStateLists = 0
        var updatedDrawables = 0

        // Bare (non-android:) item names only resolve if the app declares them.
        val valuesFiles = listDecodableFiles("res/values*/*.xml", null)
        val knownAppAttrs = mutableSetOf<String>()
        for (path in valuesFiles) {
            runCatching {
                document(path).use { doc ->
                    val attrs = doc.getElementsByTagName("attr")
                    for (i in 0 until attrs.length) {
                        val a = attrs.item(i) as? Element ?: continue
                        a.getAttribute("name")?.takeIf { it.isNotEmpty() }?.let { knownAppAttrs.add(it) }
                    }
                    val items = doc.getElementsByTagName("item")
                    for (i in 0 until items.length) {
                        val it = items.item(i) as? Element ?: continue
                        val n = it.getAttribute("name") ?: continue
                        if (n.isNotEmpty() && !n.startsWith("android:")) knownAppAttrs.add(n)
                    }
                }
            }
        }

        fun shouldReplaceColor(value: String): Boolean {
            val v = value.trim()
            if (v.equals("@android:color/transparent", ignoreCase = true) || v.equals("@color/transparent", ignoreCase = true)) return false
            if (v.startsWith("@") || v.startsWith("?")) return false
            return v.matches(Regex("^#([0-9a-fA-F]{3}|[0-9a-fA-F]{4}|[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$"))
        }

        // 1) Dark theme styles + values-night/colors.xml
        for (relativePath in valuesFiles) {
            runCatching {
                val dirName = relativePath.split("/")[1]
                val isNightDir = dirName.startsWith("values-night", ignoreCase = true)
                document(relativePath).use { doc ->
                    if (isNightDir && relativePath.endsWith("colors.xml", ignoreCase = true)) {
                        val colors = doc.getElementsByTagName("color")
                        var changed = false
                        for (i in 0 until colors.length) {
                            val c = colors.item(i) as? Element ?: continue
                            val name = c.getAttribute("name") ?: continue
                            val lower = name.lowercase()
                            val isSurfaceColor = lower.contains("background") ||
                                lower.contains("surface") ||
                                lower.contains("card") ||
                                lower.contains("window_background") ||
                                lower.contains("colorprimarysurface") ||
                                lower.contains("elevation")
                            if (!isSurfaceColor) continue
                            val value = c.textContent?.trim() ?: continue
                            if (shouldReplaceColor(value)) {
                                c.textContent = amoled
                                changed = true
                            }
                        }
                        if (changed) updatedColors++
                        return@use
                    }

                    val styles = doc.getElementsByTagName("style")
                    var changed = false
                    for (i in 0 until styles.length) {
                        val style = styles.item(i) as? Element ?: continue
                        val name = style.getAttribute("name")
                        val parent = style.getAttribute("parent")
                        val isTheme = parent.contains("Theme", ignoreCase = true) ||
                            name.contains("Theme", ignoreCase = true)
                        val isDark = isNightDir ||
                            name.contains("Dark", ignoreCase = true) ||
                            parent.contains("Dark", ignoreCase = true) ||
                            name.contains("Night", ignoreCase = true) ||
                            parent.contains("Night", ignoreCase = true) ||
                            name.contains("DayNight", ignoreCase = true) ||
                            parent.contains("DayNight", ignoreCase = true)
                        if (!isDark) continue
                        if (!isTheme && !isNightDir) continue
                        if (!isTheme && isNightDir) {
                            val items = style.getElementsByTagName("item")
                            var hasTarget = false
                            for (k in 0 until items.length) {
                                val it = items.item(k) as? Element ?: continue
                                if (it.getAttribute("name") in targets) { hasTarget = true; break }
                            }
                            if (!hasTarget) continue
                        }

                        var styleChanged = false
                        for (attribute in targets) {
                            if (!attribute.startsWith("android:") && attribute !in knownAppAttrs) continue
                            ensureThemeItem(doc, style, attribute, amoled)
                            styleChanged = true
                        }
                        // Auto-fix text contrast: onSurface stays light on pure black.
                        if (blackenSurfaces == true) {
                            for (textAttr in listOf("colorOnSurface", "android:colorOnSurface")) {
                                if (!textAttr.startsWith("android:") && textAttr !in knownAppAttrs) continue
                                ensureThemeItem(doc, style, textAttr, "#FFFFFFFF")
                                styleChanged = true
                            }
                        }
                        if (styleChanged) changed = true
                    }
                    if (changed) updatedStyles++
                }
            }.onFailure { logger.warning("Could not parse $relativePath: ${it.message}") }
        }

        // 2) res/color* night ColorStateLists
        for (relativePath in listDecodableFiles("res/color*/**", null)) {
            if (!relativePath.endsWith(".xml")) continue
            runCatching {
                document(relativePath).use { doc ->
                    val colors = doc.getElementsByTagName("color")
                    var changed = false
                    for (i in 0 until colors.length) {
                        val c = colors.item(i) as? Element ?: continue
                        val value = c.getAttribute("android:color")?.takeIf { it.isNotEmpty() }
                            ?: c.textContent?.trim() ?: continue
                        if (!shouldReplaceColor(value)) continue
                        if (c.getAttribute("android:color").isNotEmpty()) {
                            c.setAttribute("android:color", amoled)
                            changed = true
                        } else if (c.textContent?.trim()?.startsWith("#") == true) {
                            c.textContent = amoled
                            changed = true
                        }
                    }
                    if (changed) updatedColorStateLists++
                }
            }.onFailure { logger.warning("Could not parse $relativePath: ${it.message}") }
        }

        // 3) res/drawable* night solids
        for (relativePath in listDecodableFiles("res/drawable*/**", null)) {
            if (!relativePath.endsWith(".xml") || !relativePath.contains("night", ignoreCase = true)) continue
            runCatching {
                document(relativePath).use { doc ->
                    val solids = doc.getElementsByTagName("solid")
                    var changed = false
                    for (i in 0 until solids.length) {
                        val s = solids.item(i) as? Element ?: continue
                        val color = s.getAttribute("android:color")?.takeIf { it.isNotEmpty() } ?: continue
                        if (!shouldReplaceColor(color)) continue
                        s.setAttribute("android:color", amoled)
                        changed = true
                    }
                    if (changed) updatedDrawables++
                }
            }.onFailure { logger.warning("Could not parse $relativePath: ${it.message}") }
        }

        if (updatedStyles > 0 || updatedColors > 0 || updatedColorStateLists > 0 || updatedDrawables > 0) {
            logger.info("Applied AMOLED $amoled to $updatedStyles dark theme style(s), $updatedColors night color file(s), $updatedColorStateLists ColorStateList(s), $updatedDrawables drawable(s)")
        } else {
            logger.warning("No dark themes found. No changes applied.")
        }
    }
}
