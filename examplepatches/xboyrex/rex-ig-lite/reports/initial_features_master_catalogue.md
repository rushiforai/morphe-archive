# Initial Features — Master 72-Entry Experimental Flag Catalogue

- **Repository**: [xboyrex/rex-ig-lite](https://github.com/xboyrex/rex-ig-lite)
- **JSON Source**: `assets/configs/initial_features_catalogue.json` & `patches/src/main/resources/instagram/settings/raw/rex_initial_features_catalogue.json`
- **Total Canonical Entries**: **72** across **10 categories**

| # | ID | Canonical Flag Name | Category | Type | Default | Recommended | Support | Restart |
|---|---|---|---|:---:|:---:|:---:|:---:|:---:|
| 1 | `init_reels_hands_free_mode` | `reels android hands free mode` | Reels & Playback | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 2 | `init_reels_overflow_interested_options` | `reels overflow interested options` | Reels & Playback | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 3 | `init_reels_android_profile_in_ufi` | `reels android profile in ufi` | Reels & Playback | `bool` | `DEFAULT` | `DISABLE` | `Conflicting` | `Yes` |
| 4 | `init_ufi_ini` | `ufi ini` | Reels & Playback | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 5 | `init_reels_overlay_follow_ufi` | `reels overlay` | Reels & Playback | `bool` | `DEFAULT` | `ENABLE` | `Conflicting` | `Yes` |
| 6 | `init_reposts` | `reposts` | Reels & Playback | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 7 | `init_reels_third_party_downloads` | `reels third party downloads` | Reels & Playback | `bool` | `DEFAULT` | `DISABLE` | `Supported` | `Yes` |
| 8 | `init_fast_reels_fbidv2_lockup` | `fast reels fbidv2 enable lockup` | Reels & Playback | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 9 | `init_reels_viewer_stories_cluster` | `reels_viewer_stories_cluster` | Reels & Playback | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 10 | `init_stories_memories_format` | `stories memories format` | Stories & Mentions | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 11 | `init_stories_tray_unconnected_stories` | `stories tray unconnected stories` | Stories & Mentions | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 12 | `init_stories_mentions_incremental_2025` | `stories mentions incremental 2025` | Stories & Mentions | `bool` | `DEFAULT` | `ENABLE` | `Experimental` | `Yes` |
| 13 | `init_stories_valentines_day_2025` | `stories valentines day 2025` | Stories & Mentions | `bool` | `DEFAULT` | `ENABLE` | `Experimental` | `Yes` |
| 14 | `init_stories_gallery_multi_select_button` | `stories_gallery_multi_select_button` | Stories & Mentions | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 15 | `init_stories_top_five_besties` | `stories top five besties` | Stories & Mentions | `bool` | `DEFAULT` | `ENABLE` | `Experimental` | `Yes` |
| 16 | `init_stories_emoji_quick_reaction_refresh` | `stories_emoji_quick_reaction_refresh` | Stories & Mentions | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 17 | `init_story_creation_entrypoints` | `story_creation_entrypoints` | Stories & Mentions | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 18 | `init_saved_in_profile` | `saved in profile` | Feed & Explore | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 19 | `init_explore_tall_grid_view_count` | `explore_tall_grid_explore_view_count_enabled` | Feed & Explore | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 20 | `init_relevance_explore_lab_android` | `relevance_explore_lab_android` | Feed & Explore | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 21 | `init_android_should_use_new_explore_icon` | `android should use new explore icon` | Feed & Explore | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 22 | `init_navigation_refresh_settings_opt_in` | `navigation refresh -> enable settings opt in` | Feed & Explore | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 23 | `init_android_center_headers` | `android center headers` | Navigation & Interface | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 24 | `init_android_enable_view_pager` | `android enable view pager` | Navigation & Interface | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 25 | `init_centered_tabs_with_nav_bar` | `centered tabs with nav bar` | Navigation & Interface | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 26 | `init_navigation_refresh_badging` | `navigation refresh` | Navigation & Interface | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 27 | `init_profile_overflow_menu_redesign` | `profile_overflow_menu_redesign` | Navigation & Interface | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 28 | `init_igds_wordmark_h1` | `igds_wordmark_h1` | Navigation & Interface | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 29 | `init_shortcuts` | `shortcuts` | Navigation & Interface | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 30 | `init_igd_message_translations` | `igd message translations` | Messaging & Calling | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 31 | `init_growth_call_on_whatsapp` | `growth call on whatsapp` | Messaging & Calling | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 32 | `init_igd_android_calling_buttons_config` | `igd android calling buttons config` | Messaging & Calling | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 33 | `init_igd_android_action_bar_rewrite` | `igd android action bar rewrite` | Messaging & Calling | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 34 | `init_thread_header_calling_button_icon_variant` | `thread header calling button icon variant` | Messaging & Calling | `enum` | `1` | `1` | `Supported` | `Yes` |
| 35 | `init_is_ig_to_p92_app_switcher_enabled` | `is ig to p92 app switcher enabled android` | Messaging & Calling | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 36 | `init_threads_chimes` | `threads chimes` | Messaging & Calling | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 37 | `init_meta_ai_cdd_comments_sheet` | `meta ai cdd comments sheet` | Messaging & Calling | `bool` | `DEFAULT` | `ENABLE` | `Experimental` | `Yes` |
| 38 | `init_igd_android_events` | `igd_android_events` | Messaging & Calling | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 39 | `init_igd_android_t24_pod` | `igd_android_t24_pod` | Messaging & Calling | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 40 | `init_notes_emoji_quick_reply` | `notes emoji quick reply` | Notes & Reactions | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 41 | `init_notes_pog_like_animation` | `notes pog like animation` | Notes & Reactions | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 42 | `init_notes_reply_cta` | `notes reply cta` | Notes & Reactions | `enum` | `Variant 1: Reply to Username` | `Variant 1: Reply to Username` | `Supported` | `Yes` |
| 43 | `init_poll_notes` | `poll notes` | Notes & Reactions | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 44 | `init_notes_game` | `notes game` | Notes & Reactions | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 45 | `init_notes_expiry_improvements` | `notes_expiry_improvements` | Notes & Reactions | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 46 | `init_notes_self_sheet_redesign` | `notes self sheet redesign` | Notes & Reactions | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 47 | `init_multiple_profile_pictures` | `multiple profile pictures` | Profile & Social | `bool` | `DEFAULT` | `DISABLE` | `Unsupported` | `Yes` |
| 48 | `init_profile_android_grid_reordering` | `profile android grid reordering` | Profile & Social | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 49 | `init_ig4a_friending_center_search` | `ig4a_friending_center_search` | Profile & Social | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 50 | `init_ig4a_highlight_reordering` | `ig4a_highlight_reordering` | Profile & Social | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 51 | `init_main_feed_nav_hatch_upsell` | `main_feed_nav_hatch_upsell` | Profile & Social | `bool` | `DEFAULT` | `DISABLE` | `Experimental` | `Yes` |
| 52 | `init_gallery_toolbar_square_pogs` | `gallery toolbar redesign square pogs enabled` | Gallery & Upload Quality | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 53 | `init_gallery_toolbar_disable_album_filters` | `gallery toolbar redesign should disable album filters` | Gallery & Upload Quality | `bool` | `DEFAULT` | `DISABLE` | `Supported` | `Yes` |
| 54 | `init_image_upload_debug_settings` | `Image Upload Debug Settings` | Gallery & Upload Quality | `enum` | `WebP` | `WebP` | `Supported` | `Yes` |
| 55 | `init_high_quality_upload_overrides` | `High-Quality Upload Overrides` | Gallery & Upload Quality | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 56 | `init_ugc_voice_enable_audio_consumption` | `ugc voice enable audio consumption` | AI & Experimental | `bool` | `DEFAULT` | `DISABLE` | `Unsupported` | `Yes` |
| 57 | `init_sharing_ai_voices` | `sharing_ai_voices` | AI & Experimental | `bool` | `DEFAULT` | `ENABLE` | `Experimental` | `Yes` |
| 58 | `init_tya_django` | `tya_django` | AI & Experimental | `bool` | `DEFAULT` | `ENABLE` | `Experimental` | `Yes` |
| 59 | `init_ig4a_game_hub` | `ig4a_game_hub` | AI & Experimental | `bool` | `DEFAULT` | `ENABLE` | `Experimental` | `Yes` |
| 60 | `init_loot_android` | `loot_android` | AI & Experimental | `bool` | `DEFAULT` | `ENABLE` | `Experimental` | `Yes` |
| 61 | `init_drafts_edit_button` | `drafts edit button` | Developer & Diagnostics | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 62 | `init_comment_author_badge` | `comment author badge` | Developer & Diagnostics | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 63 | `init_hscroll_sms_to_messages` | `hscroll sms to messages` | Developer & Diagnostics | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 64 | `init_igd_android_emoji_category_tabs` | `igd android emoji category tabs` | Developer & Diagnostics | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 65 | `init_nido` | `nido` | Developer & Diagnostics | `bool` | `DEFAULT` | `ENABLE` | `Experimental` | `Yes` |
| 66 | `init_es_adaptive_sharesheet_both_rows` | `es adaptive sharesheet force show both rows` | Developer & Diagnostics | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 67 | `init_android_viewer_always_show_comment_bar` | `android viewer always show comment bar` | Developer & Diagnostics | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 68 | `init_client_search_bottom_search_bar` | `client search bottom search bar fbigid` | Developer & Diagnostics | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 69 | `init_comment_dislikes` | `comment dislikes` | Developer & Diagnostics | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 70 | `init_friends_lane_floating_pogs` | `friends lane floating pogs entrypoint enabled` | Developer & Diagnostics | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 71 | `init_stories_tab_v2` | `stories_tab_v2` | Developer & Diagnostics | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
| 72 | `init_navigation_refresh_enable_view_pager` | `navigation refresh -> android enable view pager` | Navigation & Interface | `bool` | `DEFAULT` | `ENABLE` | `Supported` | `Yes` |
