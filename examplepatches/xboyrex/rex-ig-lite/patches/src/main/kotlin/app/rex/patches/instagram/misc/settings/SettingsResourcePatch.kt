/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.misc.settings

import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.patch
import app.morphe.util.ResourceGroup
import app.morphe.util.copyResources
import org.w3c.dom.Element

val settingsResourcePatch =
    patch(
        description = "Settings resource patch.",
    ) {
        execute {
            runCatching {
                // Add xboyrex Settings to the launcher icon long-press shortcuts
                document("res/xml/shortcuts.xml").use {
                    val existing = it.getElementsByTagName("shortcut")
                    for (index in 0 until existing.length) {
                        val sc = existing.item(index) as? Element ?: continue
                        if (sc.getAttribute("android:shortcutId") == "rex_settings") return@use
                    }

                    val rexExtra =
                        it.createElement("extra").apply {
                            setAttribute("android:name", "rex")
                            setAttribute("android:value", "true")
                        }
                    val launchTypeExtra =
                        it.createElement("extra").apply {
                            setAttribute("android:name", "rex_launch_type")
                            setAttribute("android:value", "settings")
                        }
                    val shortcutExtra =
                        it.createElement("extra").apply {
                            setAttribute("android:name", "shortcut")
                            setAttribute("android:value", "settings")
                        }
                    val intentElement =
                        it.createElement("intent").apply {
                            setAttribute("android:targetPackage", packageMetadata.packageName)
                            setAttribute("android:action", "android.intent.action.VIEW")
                            setAttribute("android:targetClass", "com.instagram.modal.ModalActivity")
                            appendChild(rexExtra)
                            appendChild(launchTypeExtra)
                            appendChild(shortcutExtra)
                        }
                    val shortcutElement =
                        it.createElement("shortcut").apply {
                            setAttribute("android:icon", "@drawable/rex_settings_shortcut_icon")
                            setAttribute("android:enabled", "true")
                            setAttribute("android:shortcutId", "rex_settings")
                            setAttribute("android:shortcutShortLabel", "@string/rex_title_settings")
                            setAttribute("android:shortcutLongLabel", "@string/rex_title_settings")
                            appendChild(intentElement)
                        }
                    it.documentElement.insertBefore(shortcutElement, it.documentElement.firstChild)
                }

                // Apply InstaRex app label & custom crimson launcher icon (22951.png) for UnClone & Clone builds
                runCatching {
                    document("AndroidManifest.xml").use { doc ->
                        val appEl = doc.documentElement.getElementsByTagName("application").item(0) as? Element
                        if (appEl != null) {
                            appEl.setAttribute("android:label", "InstaRex")
                            appEl.setAttribute("android:icon", "@drawable/rex_ic_launcher_instarex")
                            appEl.setAttribute("android:roundIcon", "@drawable/rex_ic_launcher_round")
                        }
                    }
                }
                runCatching {
                    document("res/values/strings.xml").use { doc ->
                        val children = doc.documentElement.childNodes
                        for (i in 0 until children.length) {
                            val node = children.item(i) as? Element ?: continue
                            if (node.textContent == "Instagram") {
                                node.textContent = "InstaRex"
                            }
                        }
                    }
                }

                copyResources(
                    "instagram/settings",
                    ResourceGroup(
                        "drawable",
                    "rex_ghost_icon.xml",
                    "rex_ic_access_point.xml",
                    "rex_ic_access_point_filled.xml",
                    "rex_ic_ad_circle_off.xml",
                    "rex_ic_ad_circle_off_filled.xml",
                    "rex_ic_ad_off.xml",
                    "rex_ic_ad_off_filled.xml",
                    "rex_ic_adjustments.xml",
                    "rex_ic_adjustments_filled.xml",
                    "rex_ic_archive.xml",
                    "rex_ic_archive_filled.xml",
                    "rex_ic_arrow_left.xml",
                    "rex_ic_arrow_left_filled.xml",
                    "rex_ic_arrow_up_bar.xml",
                    "rex_ic_arrow_up_bar_filled.xml",
                    "rex_ic_arrows_down_up.xml",
                    "rex_ic_arrows_left_right.xml",
                    "rex_ic_at_sign.xml",
                    "rex_ic_badge_cc.xml",
                    "rex_ic_badge_cc_filled.xml",
                    "rex_ic_badge_check.xml",
                    "rex_ic_badge_check_filled.xml",
                    "rex_ic_badge_hd.xml",
                    "rex_ic_badge_hd_filled.xml",
                    "rex_ic_bell.xml",
                    "rex_ic_bell_cog.xml",
                    "rex_ic_bell_cog_filled.xml",
                    "rex_ic_bell_filled.xml",
                    "rex_ic_bell_off.xml",
                    "rex_ic_bell_off_filled.xml",
                    "rex_ic_bell_ringing.xml",
                    "rex_ic_bell_ringing_filled.xml",
                    "rex_ic_bell_z.xml",
                    "rex_ic_bell_z_filled.xml",
                    "rex_ic_binary_tree.xml",
                    "rex_ic_binary_tree_filled.xml",
                    "rex_ic_bolt.xml",
                    "rex_ic_bolt_filled.xml",
                    "rex_ic_bookmark.xml",
                    "rex_ic_bookmark_filled.xml",
                    "rex_ic_bookmark_off.xml",
                    "rex_ic_bookmark_off_filled.xml",
                    "rex_ic_bookmarks.xml",
                    "rex_ic_bookmarks_filled.xml",
                    "rex_ic_brightness_down.xml",
                    "rex_ic_brightness_down_filled.xml",
                    "rex_ic_bug.xml",
                    "rex_ic_bug_filled.xml",
                    "rex_ic_camera.xml",
                    "rex_ic_camera_filled.xml",
                    "rex_ic_camera_off.xml",
                    "rex_ic_camera_off_filled.xml",
                    "rex_ic_chart_dots.xml",
                    "rex_ic_chart_dots_filled.xml",
                    "rex_ic_check.xml",
                    "rex_ic_check_filled.xml",
                    "rex_ic_checks.xml",
                    "rex_ic_checks_filled.xml",
                    "rex_ic_chevron_down.xml",
                    "rex_ic_chevron_down_filled.xml",
                    "rex_ic_chevron_right.xml",
                    "rex_ic_chevron_right_filled.xml",
                    "rex_ic_circle.xml",
                    "rex_ic_circle_check.xml",
                    "rex_ic_circle_check_filled.xml",
                    "rex_ic_circle_dashed.xml",
                    "rex_ic_circle_dashed_filled.xml",
                    "rex_ic_circle_dotted.xml",
                    "rex_ic_circle_dotted_filled.xml",
                    "rex_ic_circle_filled.xml",
                    "rex_ic_circle_off.xml",
                    "rex_ic_circle_off_filled.xml",
                    "rex_ic_clock.xml",
                    "rex_ic_clock_edit.xml",
                    "rex_ic_clock_edit_filled.xml",
                    "rex_ic_clock_filled.xml",
                    "rex_ic_clock_plus.xml",
                    "rex_ic_clock_plus_filled.xml",
                    "rex_ic_code_2.xml",
                    "rex_ic_code_2_filled.xml",
                    "rex_ic_color_picker.xml",
                    "rex_ic_color_picker_filled.xml",
                    "rex_ic_color_swatch.xml",
                    "rex_ic_color_swatch_filled.xml",
                    "rex_ic_compass_off.xml",
                    "rex_ic_compass_off_filled.xml",
                    "rex_ic_copy.xml",
                    "rex_ic_copy_filled.xml",
                    "rex_ic_corner_up_right.xml",
                    "rex_ic_database.xml",
                    "rex_ic_database_filled.xml",
                    "rex_ic_database_import.xml",
                    "rex_ic_database_import_filled.xml",
                    "rex_ic_dots_circle.xml",
                    "rex_ic_dots_circle_filled.xml",
                    "rex_ic_download.xml",
                    "rex_ic_download_cloud.xml",
                    "rex_ic_download_cloud_filled.xml",
                    "rex_ic_download_filled.xml",
                    "rex_ic_edit.xml",
                    "rex_ic_edit_filled.xml",
                    "rex_ic_external_link.xml",
                    "rex_ic_eye.xml",
                    "rex_ic_eye_check.xml",
                    "rex_ic_eye_check_filled.xml",
                    "rex_ic_eye_closed.xml",
                    "rex_ic_eye_closed_filled.xml",
                    "rex_ic_eye_filled.xml",
                    "rex_ic_eye_off.xml",
                    "rex_ic_eye_off_filled.xml",
                    "rex_ic_fast_forward.xml",
                    "rex_ic_fast_forward_filled.xml",
                    "rex_ic_file_code.xml",
                    "rex_ic_file_code_filled.xml",
                    "rex_ic_file_download.xml",
                    "rex_ic_file_download_filled.xml",
                    "rex_ic_file_export.xml",
                    "rex_ic_file_export_filled.xml",
                    "rex_ic_file_import.xml",
                    "rex_ic_file_import_filled.xml",
                    "rex_ic_file_text.xml",
                    "rex_ic_file_text_filled.xml",
                    "rex_ic_file_upload.xml",
                    "rex_ic_file_upload_filled.xml",
                    "rex_ic_film.xml",
                    "rex_ic_film_filled.xml",
                    "rex_ic_filter.xml",
                    "rex_ic_filter_cog.xml",
                    "rex_ic_filter_cog_filled.xml",
                    "rex_ic_filter_filled.xml",
                    "rex_ic_float_right.xml",
                    "rex_ic_float_right_filled.xml",
                    "rex_ic_focus.xml",
                    "rex_ic_focus_filled.xml",
                    "rex_ic_folder.xml",
                    "rex_ic_folder_cog.xml",
                    "rex_ic_folder_cog_filled.xml",
                    "rex_ic_folder_filled.xml",
                    "rex_ic_folder_plus.xml",
                    "rex_ic_folder_plus_filled.xml",
                    "rex_ic_folder_up.xml",
                    "rex_ic_folder_up_filled.xml",
                    "rex_ic_gallery.xml",
                    "rex_ic_gallery_filled.xml",
                    "rex_ic_gauge.xml",
                    "rex_ic_gauge_filled.xml",
                    "rex_ic_ghost.xml",
                    "rex_ic_ghost_2.xml",
                    "rex_ic_ghost_2_filled.xml",
                    "rex_ic_ghost_filled.xml",
                    "rex_ic_github.xml",
                    "rex_ic_github_filled.xml",
                    "rex_ic_globe.xml",
                    "rex_ic_globe_filled.xml",
                    "rex_ic_hand.xml",
                    "rex_ic_hand_click.xml",
                    "rex_ic_hand_move.xml",
                    "rex_ic_hand_two_fingers.xml",
                    "rex_ic_hash.xml",
                    "rex_ic_heart.xml",
                    "rex_ic_heart_broken.xml",
                    "rex_ic_heart_broken_filled.xml",
                    "rex_ic_heart_filled.xml",
                    "rex_ic_heart_handshake.xml",
                    "rex_ic_heart_handshake_filled.xml",
                    "rex_ic_heart_off.xml",
                    "rex_ic_heart_off_filled.xml",
                    "rex_ic_heart_spark.xml",
                    "rex_ic_heart_spark_filled.xml",
                    "rex_ic_hexagon.xml",
                    "rex_ic_hexagon_filled.xml",
                    "rex_ic_history.xml",
                    "rex_ic_history_filled.xml",
                    "rex_ic_id_badge.xml",
                    "rex_ic_id_badge_filled.xml",
                    "rex_ic_image.xml",
                    "rex_ic_image_filled.xml",
                    "rex_ic_images.xml",
                    "rex_ic_images_filled.xml",
                    "rex_ic_inbox_off.xml",
                    "rex_ic_inbox_off_filled.xml",
                    "rex_ic_info.xml",
                    "rex_ic_info_filled.xml",
                    "rex_ic_instagram.xml",
                    "rex_ic_instagram_filled.xml",
                    "rex_ic_key.xml",
                    "rex_ic_key_filled.xml",
                    "rex_ic_language.xml",
                    "rex_ic_layout_bottombar.xml",
                    "rex_ic_layout_bottombar_collapse.xml",
                    "rex_ic_layout_bottombar_collapse_filled.xml",
                    "rex_ic_layout_bottombar_filled.xml",
                    "rex_ic_layout_grid.xml",
                    "rex_ic_layout_grid_filled.xml",
                    "rex_ic_layout_list.xml",
                    "rex_ic_layout_list_filled.xml",
                    "rex_ic_layout_navbar.xml",
                    "rex_ic_layout_navbar_filled.xml",
                    "rex_ic_link.xml",
                    "rex_ic_link_filled.xml",
                    "rex_ic_list_checks.xml",
                    "rex_ic_list_checks_filled.xml",
                    "rex_ic_list_details.xml",
                    "rex_ic_list_details_filled.xml",
                    "rex_ic_lock.xml",
                    "rex_ic_lock_access.xml",
                    "rex_ic_lock_access_filled.xml",
                    "rex_ic_lock_filled.xml",
                    "rex_ic_lock_open.xml",
                    "rex_ic_lock_open_filled.xml",
                    "rex_ic_mail_opened.xml",
                    "rex_ic_mail_opened_filled.xml",
                    "rex_ic_menu.xml",
                    "rex_ic_message_circle.xml",
                    "rex_ic_message_circle_filled.xml",
                    "rex_ic_message_circle_off.xml",
                    "rex_ic_message_circle_off_filled.xml",
                    "rex_ic_message_dots.xml",
                    "rex_ic_message_dots_filled.xml",
                    "rex_ic_message_off.xml",
                    "rex_ic_message_off_filled.xml",
                    "rex_ic_message_pin.xml",
                    "rex_ic_message_pin_filled.xml",
                    "rex_ic_microphone.xml",
                    "rex_ic_microphone_filled.xml",
                    "rex_ic_microphone_off.xml",
                    "rex_ic_microphone_off_filled.xml",
                    "rex_ic_monitor.xml",
                    "rex_ic_monitor_filled.xml",
                    "rex_ic_mood_smile.xml",
                    "rex_ic_mood_smile_filled.xml",
                    "rex_ic_moon.xml",
                    "rex_ic_moon_filled.xml",
                    "rex_ic_moon_stars.xml",
                    "rex_ic_moon_stars_filled.xml",
                    "rex_ic_movie_off.xml",
                    "rex_ic_movie_off_filled.xml",
                    "rex_ic_music.xml",
                    "rex_ic_music_filled.xml",
                    "rex_ic_note_off.xml",
                    "rex_ic_note_off_filled.xml",
                    "rex_ic_package.xml",
                    "rex_ic_palette.xml",
                    "rex_ic_palette_filled.xml",
                    "rex_ic_pause.xml",
                    "rex_ic_pause_filled.xml",
                    "rex_ic_photo_down.xml",
                    "rex_ic_photo_down_filled.xml",
                    "rex_ic_play.xml",
                    "rex_ic_play_filled.xml",
                    "rex_ic_playlist_add.xml",
                    "rex_ic_playlist_add_filled.xml",
                    "rex_ic_playlist_x.xml",
                    "rex_ic_playlist_x_filled.xml",
                    "rex_ic_radar.xml",
                    "rex_ic_radar_filled.xml",
                    "rex_ic_refresh_cw.xml",
                    "rex_ic_repeat.xml",
                    "rex_ic_repeat_off.xml",
                    "rex_ic_repeat_once.xml",
                    "rex_ic_rotate_cw.xml",
                    "rex_ic_scissors.xml",
                    "rex_ic_scissors_filled.xml",
                    "rex_ic_scroll_text.xml",
                    "rex_ic_scroll_text_filled.xml",
                    "rex_ic_search.xml",
                    "rex_ic_settings.xml",
                    "rex_ic_settings_2.xml",
                    "rex_ic_settings_2_filled.xml",
                    "rex_ic_settings_filled.xml",
                    "rex_ic_share_2.xml",
                    "rex_ic_share_3.xml",
                    "rex_ic_share_off.xml",
                    "rex_ic_shield.xml",
                    "rex_ic_shield_check.xml",
                    "rex_ic_shield_check_filled.xml",
                    "rex_ic_shield_filled.xml",
                    "rex_ic_shield_lock.xml",
                    "rex_ic_shield_lock_filled.xml",
                    "rex_ic_skip_forward.xml",
                    "rex_ic_skip_forward_filled.xml",
                    "rex_ic_sliders_horizontal.xml",
                    "rex_ic_sliders_horizontal_filled.xml",
                    "rex_ic_sparkles.xml",
                    "rex_ic_sparkles_filled.xml",
                    "rex_ic_square.xml",
                    "rex_ic_square_check.xml",
                    "rex_ic_square_check_filled.xml",
                    "rex_ic_square_filled.xml",
                    "rex_ic_star.xml",
                    "rex_ic_star_filled.xml",
                    "rex_ic_sun.xml",
                    "rex_ic_sun_filled.xml",
                    "rex_ic_swipe.xml",
                    "rex_ic_target.xml",
                    "rex_ic_target_filled.xml",
                    "rex_ic_telegram.xml",
                    "rex_ic_terminal.xml",
                    "rex_ic_terminal_filled.xml",
                    "rex_ic_text_plus.xml",
                    "rex_ic_text_plus_filled.xml",
                    "rex_ic_text_scan_2.xml",
                    "rex_ic_text_scan_2_filled.xml",
                    "rex_ic_trash_2.xml",
                    "rex_ic_trash_2_filled.xml",
                    "rex_ic_trash_x.xml",
                    "rex_ic_trash_x_filled.xml",
                    "rex_ic_type.xml",
                    "rex_ic_type_filled.xml",
                    "rex_ic_unlink.xml",
                    "rex_ic_unlink_filled.xml",
                    "rex_ic_user_check.xml",
                    "rex_ic_user_check_filled.xml",
                    "rex_ic_user_exclamation.xml",
                    "rex_ic_user_exclamation_filled.xml",
                    "rex_ic_user_minus.xml",
                    "rex_ic_user_minus_filled.xml",
                    "rex_ic_user_off.xml",
                    "rex_ic_user_off_filled.xml",
                    "rex_ic_user_plus.xml",
                    "rex_ic_user_plus_filled.xml",
                    "rex_ic_user_round.xml",
                    "rex_ic_user_round_filled.xml",
                    "rex_ic_user_round_search.xml",
                    "rex_ic_user_round_search_filled.xml",
                    "rex_ic_user_x.xml",
                    "rex_ic_user_x_filled.xml",
                    "rex_ic_users.xml",
                    "rex_ic_users_filled.xml",
                    "rex_ic_users_group.xml",
                    "rex_ic_users_group_filled.xml",
                    "rex_ic_video.xml",
                    "rex_ic_video_filled.xml",
                    "rex_ic_volume.xml",
                    "rex_ic_volume_filled.xml",
                    "rex_ic_volume_off.xml",
                    "rex_ic_volume_off_filled.xml",
                    "rex_ic_wand.xml",
                    "rex_ic_wand_filled.xml",
                    "rex_ic_whatsapp.xml",
                    "rex_ic_whatsapp_filled.xml",
                    "rex_ic_world_www.xml",
                    "rex_ic_world_www_filled.xml",
                    "rex_ic_x.xml",
                    "rex_ic_x_filled.xml",
                    "rex_ic_youtube.xml",
                    "rex_ic_youtube_filled.xml",
                    "rex_ic_zoom_in.xml",
                    "rex_ic_zoom_in_filled.xml",
                    "rex_ic_launcher_background.xml",
                    "rex_ic_launcher_foreground.xml",
                    "rex_ic_launcher_instarex.xml",
                    "rex_ic_launcher_round.xml",
                    "rex_settings_shortcut_foreground.xml",
                    "rex_settings_shortcut_icon.xml",
                    ),
                    ResourceGroup(
                        "raw",
                    "instarex_pro_config_v6.json",
                    "rex_font_ios_beach.ttf",
                    "rex_font_ios_classic.ttf",
                    "rex_font_ios_directional.ttf",
                    "rex_font_ios_elegant.ttf",
                    "rex_font_ios_extrabold_ct.ttf",
                    "rex_font_ios_hindi.ttf",
                    "rex_font_ios_indic.ttf",
                    "rex_font_ios_literature.ttf",
                    "rex_font_ios_modern.ttf",
                    "rex_font_ios_neon.ttf",
                    "rex_font_ios_papyrus.ttf",
                    "rex_font_ios_semibold_lite_ct.ttf",
                    "rex_font_ios_strong.ttf",
                    "rex_font_ios_typewriter.ttf",
                    "rex_icon_manifest.json",
                    "rex_initial_features_catalogue.json",
                    "rex_recommended_flags_v3.json",
                    "rex_tabler_icons_license.txt",
                    ),
                )
            }
        }
    }
