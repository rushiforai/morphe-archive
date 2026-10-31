package app.template.patches.drtv.layout.theme

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private val COLOR_UPDATES = mapOf(
    // Main backgrounds -> #121212
    "colorPrimary" to "#121212",
    "default_page_background_color" to "#121212",
    "idp_bg" to "#121212",
    "bg_sign_in" to "#121212",
    "bg_search" to "#121212",
    "isabel_background" to "#121212",
    "manage_profile_fragment_background" to "#121212",
    "background_gradient_end" to "#121212",

    // Card / surface / dialog / branded row / button backgrounds -> #242424 / #313131
    "branded_background_default_color" to "#242424",
    "h6_dr_carousel_item_bg" to "#242424",
    "h6_dr_carousel_item_meta_data_content" to "#242424",
    "jump_to_menu_container_background" to "#242424",
    "bg_idp_meta_text" to "#242424",
    "bg_idp_synopsis_focused" to "#313131",
    "bg_cta_secondary_light_default" to "#313131",
    "bg_cta_secondary_light_frame" to "#555555",
    "bg_cta_primary_light_default" to "#313131",
    "bg_cta_primary_light_frame" to "#555555",
    "item_detail_btn_background_default" to "#ffffff",
    "button_normal_color" to "#ffffff",
    "rounded_corner_selector_default" to "#ffffff",

    // Navigation bar & tabs
    "tab_btn_bg_color" to "@color/ruddy",
    "tab_btn_bg_underline_color" to "#313131",
    "tab_btn_text_color_default" to "#b3b3b3",
    "tab_btn_text_color_focused" to "#ffffff",
    "ic_search_default" to "#ffffff",
    "ic_close_default" to "#ffffff",

    // Secondary / metadata grey text
    "neutral_grey_20" to "#b3b3b3",
    "idp_duration_left_text" to "#b3b3b3",
    "idp_meta_text" to "#cccccc",
    "list_tag_line" to "#b3b3b3",
    "default_description" to "#cccccc",
    "txt_description" to "#cccccc",
    "txt_vide_description" to "#cccccc",
    "h6_dr_carousel_item_tag_line_txt" to "#cccccc",
    "txt_h1_tag_line" to "#cccccc",
    "txt_tag_line" to "#cccccc",
    "ed2_body_text_color_default" to "#cccccc",
    "tvc2_item_type_color" to "#cccccc",

    // Primary text colors -> #ffffff
    "h6_dr_carousel_item_asset_title_txt" to "#ffffff",
    "idp_header_text" to "#ffffff",
    "row_a_title_text" to "#ffffff",
    "txt_asset_link_default" to "#ffffff",
    "txt_cta_secondary_light_default" to "#ffffff",
    "txt_cta_primary_light_default" to "#ffffff",
    "btn_custom_dialog_text_default" to "#ffffff",
    "pin_edit_text_color" to "#ffffff",
    "search_text_cursor" to "#ffffff",
    "txt_dialog_edit" to "#ffffff",
    "txt_dialog_profile_full_name_title" to "#ffffff",
    "txt_dialog_profile_manage_title" to "#ffffff",
    "txt_dialog_sign_out" to "#ffffff",
    "txt_dialog_title" to "#ffffff",
    "txt_edit_text" to "#ffffff",
    "txt_episode_number" to "#ffffff",
    "txt_episode_title" to "#ffffff",
    "txt_exit_secondary_light_default" to "#ffffff",
    "txt_h1_asset_title" to "#ffffff",
    "txt_h7" to "#ffffff",
    "txt_lh_title" to "#ffffff",
    "txt_markdown_view_custom" to "#ffffff",
    "txt_menu_category_default" to "#ffffff",
    "txt_parental_lock_message" to "#ffffff",
    "txt_profile_item" to "#ffffff",
    "txt_profile_item_default" to "#ffffff",
    "txt_profile_item_focused" to "#ffffff",
    "txt_profile_parental_lock_toggle_default" to "#ffffff",
    "txt_profile_selection_title" to "#ffffff",
    "txt_recent_search_header" to "#ffffff",
    "txt_row_list_item_badge" to "#ffffff",
    "txt_sign_in_code" to "#ffffff",
    "txt_sign_in_web_url" to "#ffffff",
    "txt_title" to "#ffffff",
    "txt_title_list_item_default" to "#ffffff",
    "txt_title_list_item_focused" to "#ffffff",
    "schedule_item_text_color" to "#ffffff",
)

private val DARK_TEXT_STYLES = setOf(
    "BaseTextStyleH10", "ButtonStyleOutline", "ButtonStyleSolid", "ButtonStyleSolidSmall",
    "DRESHE1Description", "DRProfileTitleHeading", "DRSHE1ItemTitle", "DRST1ItemText",
    "DRSynDialogMessage", "DRSynDialogTitle", "PintEditStyle", "ProfileRadioButtonStyle",
    "SHC1ItemTagline", "SHC1ItemTitle", "ST3ItemTextStyle", "ST3ItemTitleStyle",
    "ST3RowEntryTagLine", "SeasonTabSelectedTextAppearance", "TextStyleBase",
    "TextStyleD10Details", "TextStyleEd1Caption", "TextStyleItemDetailsSynopsis",
    "TextStyleListTitle", "TextStyleRecentSearchListItem", "TextStyleScheduleTitle",
    "TextStyleTVC2ItemTime", "TextStyleTVC2ItemTitle", "TextStyleTVC2ItemType",
    "TextStyleViewFullTitle", "TextStyleViewTitle",
)

private val BLACK_COLOR_REFS = setOf(
    "@color/black", "@color/black_one", "@color/black_two", "@color/black_three",
    "@color/black_four", "@color/black_five", "@color/black_six", "#000000", "#ff000000",
)

private val CARD_BACKGROUND_LAYOUTS = listOf(
    "res/layout/dh_white_sticker_tv.xml",
    "res/layout/dh_white_sticker.xml",
    "res/layout/drshe1_view_holder.xml",
    "res/layout/drchd3_view_holder.xml",
    "res/layout/live_channel_list_item.xml",
    "res/layout/drsyn_dialog.xml",
    "res/layout/dialog_spinner_options.xml",
    "res/layout/mandatory_login_dialog.xml",
)

private val FULLSCREEN_BACKGROUND_LAYOUTS = listOf(
    "res/layout/fragment_splash.xml",
    "res/layout/fragment_sports_detail.xml",
)

private val WHITE_TEXT_LAYOUTS = listOf(
    "res/layout/dh_white_sticker_tv.xml",
    "res/layout/dh_white_sticker.xml",
    "res/layout/drd11_view_holder.xml",
    "res/layout/dialog_spinner_options.xml",
    "res/layout/d3_episode_detail_layout.xml",
    "res/layout/d10_row_layout.xml",
    "res/layout/overlay_spinner_content.xml",
    "res/layout/layout_delete_profile_toast.xml",
    "res/layout/drchd3_view_holder.xml",
    "res/layout/dialog_fragment_deregister_device_layout.xml",
    "res/layout/item_menu_option.xml",
    "res/layout/fragment_watchlist.xml",
    "res/layout/c1_list_item.xml",
    "res/layout-v22/d3_episode_detail_layout.xml",
)

private val DRAWABLE_COLOR_XMLS = listOf(
    "res/drawable/bg_btn_outline_square.xml",
    "res/drawable/bg_outline_rectangle_black.xml",
    "res/drawable/enter_password_default.xml",
    "res/drawable/ic_trailer_default.xml",
    "res/drawable/stv2_load_more_btn_normal.xml",
    "res/drawable/ic_bell_icon.xml",
    "res/drawable/ic_bookmark.xml",
    "res/drawable/ic_clock_black_24dp.xml",
    "res/drawable/ic_epg_play_arrow_default.xml",
    "res/drawable/ic_keyboard_black_24dp.xml",
    "res/drawable/ic_trailer.xml",
    "res/drawable/right_arrow_icon.xml",
    "res/color/dh_main_btn_text_color.xml",
    "res/drawable-anydpi-v24/ic_read_subtitles.xml",
    "res/drawable-anydpi-v24/ic_drop_down_default.xml",
    "res/drawable-anydpi-v24/ic_pin_default.xml",
    "res/drawable-anydpi-v24/ic_drsyn_dialog_close.xml",
    "res/drawable-anydpi-v24/ic_close_black.xml",
    "res/drawable-anydpi-v24/ic_sign_language.xml",
    "res/drawable-anydpi-v24/ic_audio_description.xml",
    "res/drawable-anydpi-v24/ic_epg_play_arrow.xml",
    "res/drawable-anydpi-v24/ic_lock.xml",
)

private val BUNDLED_DARK_PNGS = mapOf(
    "shadow.9.png" to "drtv/darktheme/res/drawable-xxxhdpi/shadow.9.png",
    "bg_search_focused.png" to "drtv/darktheme/res/drawable-xxxhdpi/bg_search_focused.png",
    "ic_pin_default.png" to "drtv/darktheme/res/drawable-xhdpi/ic_pin_default.png",
    "ic_lock.png" to "drtv/darktheme/res/drawable-xhdpi/ic_lock.png",
    "ic_drop_down_default.png" to "drtv/darktheme/res/drawable-xhdpi/ic_drop_down_default.png",
    "ic_drop_down_black.png" to "drtv/darktheme/res/drawable-xhdpi/ic_drop_down_black.png",
    "ic_drop_down_black_up.png" to "drtv/darktheme/res/drawable-xhdpi/ic_drop_down_black_up.png",
    "ic_audio_description.png" to "drtv/darktheme/res/drawable-xhdpi/ic_audio_description.png",
    "ic_read_subtitles.png" to "drtv/darktheme/res/drawable-xhdpi/ic_read_subtitles.png",
    "ic_sign_language.png" to "drtv/darktheme/res/drawable-xhdpi/ic_sign_language.png",
    "ic_drsyn_dialog_close.png" to "drtv/darktheme/res/drawable-xhdpi/ic_drsyn_dialog_close.png",
    "ic_close_black.png" to "drtv/darktheme/res/drawable-xhdpi/ic_close_black.png",
    "ic_epg_play_arrow.png" to "drtv/darktheme/res/drawable-xhdpi/ic_epg_play_arrow.png",
    "ic_arrow_back.png" to "drtv/darktheme/res/drawable-xhdpi/ic_arrow_back.png",
)

val darkThemeResourcePatch = resourcePatch {
    execute {
        val decodableSet = listDecodableFiles().toSet()

        fun replaceInXmlFile(path: String, replacements: List<Pair<String, String>>) {
            if (path !in decodableSet) return
            val file = get(path)
            var text = file.readText()
            val original = text
            for ((old, new) in replacements) {
                text = text.replace(old, new)
            }
            if (text != original) {
                file.writeText(text)
            }
        }

        // 1. Patch res/values/colors.xml
        document("res/values/colors.xml").use { doc ->
            val colors = doc.getElementsByTagName("color")
            for (i in 0 until colors.length) {
                val node = colors.item(i) as? Element ?: continue
                val name = node.getAttribute("name")
                COLOR_UPDATES[name]?.let { newValue ->
                    node.textContent = newValue
                }
            }
        }

        // 2. Patch res/values/styles.xml
        document("res/values/styles.xml").use { doc ->
            val styles = doc.getElementsByTagName("style")
            for (i in 0 until styles.length) {
                val style = styles.item(i) as? Element ?: continue
                val name = style.getAttribute("name")

                when (name) {
                    "ActivityTheme" -> {
                        style.setAttribute("parent", "@style/Theme.AppCompat.NoActionBar")
                        val items = style.getElementsByTagName("item")
                        var hasWindowBg = false
                        for (j in 0 until items.length) {
                            val item = items.item(j) as? Element ?: continue
                            if (item.getAttribute("name") == "android:windowBackground") {
                                item.textContent = "@color/colorPrimary"
                                hasWindowBg = true
                            }
                        }
                        if (!hasWindowBg) {
                            val winBgItem = doc.createElement("item").apply {
                                setAttribute("name", "android:windowBackground")
                                textContent = "@color/colorPrimary"
                            }
                            style.appendChild(winBgItem)
                        }
                    }
                    "AppTheme.AlertDialog.NoTitle" -> {
                        style.setAttribute("parent", "@style/Theme.AppCompat.Dialog.Alert")
                    }
                    "AppTheme.PopupOverlay" -> {
                        style.setAttribute("parent", "@style/ThemeOverlay.AppCompat.Dark")
                    }
                }

                if (name in DARK_TEXT_STYLES) {
                    val items = style.getElementsByTagName("item")
                    for (j in 0 until items.length) {
                        val item = items.item(j) as? Element ?: continue
                        if (item.getAttribute("name") == "android:textColor" &&
                            item.textContent.trim() in BLACK_COLOR_REFS
                        ) {
                            item.textContent = "@color/white_one"
                        }
                    }
                }
            }
        }

        // 3. Patch XML layouts
        replaceInXmlFile(
            "res/layout/navigation_bar.xml",
            listOf("android:textColor=\"@color/grey_one\"" to "android:textColor=\"@color/white_one\""),
        )

        val cardBgReplacements = listOf(
            "android:background=\"@color/white_one\"" to "android:background=\"@color/h6_dr_carousel_item_bg\"",
            "android:background=\"@color/white\"" to "android:background=\"@color/h6_dr_carousel_item_bg\"",
            "android:background=\"#ffffffff\"" to "android:background=\"@color/h6_dr_carousel_item_bg\"",
            "android:background=\"#ffffff\"" to "android:background=\"@color/h6_dr_carousel_item_bg\"",
        )
        CARD_BACKGROUND_LAYOUTS.forEach { replaceInXmlFile(it, cardBgReplacements) }

        val fullscreenBgReplacements = listOf(
            "android:background=\"@color/white_one\"" to "android:background=\"@color/colorPrimary\"",
            "android:background=\"@color/white\"" to "android:background=\"@color/colorPrimary\"",
        )
        FULLSCREEN_BACKGROUND_LAYOUTS.forEach { replaceInXmlFile(it, fullscreenBgReplacements) }

        val whiteTextReplacements = listOf(
            "android:textColor=\"@color/black_one\"" to "android:textColor=\"@color/white_one\"",
            "android:textColor=\"@color/black_two\"" to "android:textColor=\"@color/white_one\"",
            "android:textColor=\"@color/black_three\"" to "android:textColor=\"@color/white_one\"",
            "android:textColor=\"@color/black\"" to "android:textColor=\"@color/white_one\"",
            "android:textColor=\"#ff000000\"" to "android:textColor=\"@color/white_one\"",
            "android:textColor=\"#000000\"" to "android:textColor=\"@color/white_one\"",
        )
        WHITE_TEXT_LAYOUTS.forEach { replaceInXmlFile(it, whiteTextReplacements) }

        replaceInXmlFile(
            "res/layout/season_tab_item_layout.xml",
            listOf(
                "android:background=\"@color/black_one\"" to "android:background=\"@color/white_one\"",
                "android:background=\"@color/black\"" to "android:background=\"@color/white_one\"",
            ),
        )

        // 4. Patch XML drawables and color state lists
        val drawableReplacements = listOf(
            "@color/black_one" to "@color/white_one",
            "@color/black_two" to "@color/white_one",
            "@color/black_three" to "@color/white_one",
            "@color/black" to "@color/white_one",
            "#ff000000" to "#ffffffff",
            "\"#000000\"" to "\"#ffffff\"",
            "\"#000\"" to "\"#fff\"",
        )
        DRAWABLE_COLOR_XMLS.forEach { replaceInXmlFile(it, drawableReplacements) }

        replaceInXmlFile(
            "res/drawable/tab_search_btn_focus.xml",
            listOf(
                "<solid android:color=\"#ffffffff\" />" to "<solid android:color=\"@color/tab_btn_bg_color\" />",
                "<solid android:color=\"#ffffffff\"/>" to "<solid android:color=\"@color/tab_btn_bg_color\"/>",
                "<solid android:color=\"@color/colorPrimary\" />" to "<solid android:color=\"@color/tab_btn_bg_underline_color\" />",
                "<solid android:color=\"@color/colorPrimary\"/>" to "<solid android:color=\"@color/tab_btn_bg_underline_color\"/>",
            ),
        )

        // 5. Replace 9-patch and PNG icons with bundled dark mode versions
        val classLoader = object {}.javaClass.classLoader!!
        for ((fileName, resourcePath) in BUNDLED_DARK_PNGS) {
            val bytes = classLoader.getResourceAsStream(resourcePath)?.use { it.readBytes() } ?: continue
            listDecodableFiles("res/drawable*/$fileName").forEach { targetPath ->
                val targetFile = get(targetPath, copy = false)
                targetFile.parentFile?.mkdirs()
                targetFile.writeBytes(bytes)
            }
        }
    }
}
