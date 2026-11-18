/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.app.Activity;
import android.content.Context;
import android.preference.Preference;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.patches.customise.font.FontStorage;
import app.morphe.extension.instagram.patches.devFlags.RecommendedFlags;
import app.morphe.extension.instagram.patches.dm.SavedMessagesHook;
import app.morphe.extension.instagram.patches.download.DownloadMapping;
import app.morphe.extension.instagram.patches.focusLock.FocusLockDialogs;
import app.morphe.extension.instagram.patches.story.StoryLikeHistoryActivity;
import app.morphe.extension.instagram.patches.story.StoryMentionSettings;
import app.morphe.extension.instagram.settings.ActivityHook;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.SettingsStatus;
import app.morphe.extension.instagram.settings.preference.fragments.FragmentHook;
import app.morphe.extension.instagram.utils.InstaUtils;
import app.morphe.extension.rex.downloader.StorageUtils;
import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

public class ButtonPref extends Preference {
    // Role color tokens (#2D95E8 / #3998E8 for primary actions, #FF4438 / #F05D69 for destructive actions)
    public static final Set<String> REGISTERED_ROUTE_KEYS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            Constants.REX_FRAGMENT_SETTINGS,
            Constants.REX_FRAGMENT_GHOST,
            Constants.REX_FRAGMENT_NOTIFICATION,
            Constants.REX_FRAGMENT_PRIVACY,
            Constants.REX_FRAGMENT_GESTURES,
            Constants.REX_FRAGMENT_FEED_AND_STORIES,
            Constants.REX_FRAGMENT_UI_TWEAKS,
            Constants.REX_FRAGMENT_DISTRACTION_FREE,
            Constants.REX_FRAGMENT_MISC,
            Constants.REX_FRAGMENT_DOWNLOAD_MEDIA,
            Constants.REX_FRAGMENT_DEV_OPTIONS,
            Constants.REX_FRAGMENT_ABOUT,
            Constants.REX_FRAGMENT_ADS,
            Constants.REX_FRAGMENT_STORY,
            Constants.REX_FRAGMENT_LINKS,
            Constants.REX_FRAGMENT_NAV_BTNS,
            Constants.REX_FRAGMENT_ACTION_BAR,
            Constants.REX_FRAGMENT_DM,
            Constants.REX_FRAGMENT_FILTER_CONTENT,
            Constants.REX_FRAGMENT_REC_FLAGS,
            Constants.REX_FRAGMENT_FOCUS_LOCK,
            Constants.REX_FRAGMENT_INSTANTS,
            Constants.REX_FRAGMENT_FONT,
            Constants.REX_FRAGMENT_INITIAL_FEATURES,
            Constants.REX_FRAGMENT_CACHE_CLEANER
    )));

    public static final Set<String> REGISTERED_ACTION_KEYS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "rex_export_dev_overrides",
            "rex_import_dev_overrides",
            "rex_import_id_mapping",
            "rex_export_pref",
            "rex_import_pref",
            "rex_download_set_path",
            "rex_reset_download_path",
            "rex_pref_add_font",
            "rex_reset_pref",
            "rex_focus_lock_action",
            "rex_pref_delete_font",
            "rex_export_experiment_list",
            "rex_export_experiment_mappings",
            "rex_download_id_mapping",
            "rex_view_saved_instants",
            "view_deleted_messages",
            "rex_notification_center_btn",
            "rex_chat_wallpaper_picker",
            "rex_saved_captions_btn",
            "rex_saved_bios_btn",
            "rex_saved_profiles_btn",
            "rex_watch_history_btn",
            "rex_video_splitter_btn",
            "rex_story_like_history_btn",
            "rex_story_mention_settings_btn",
            "rex_app_language_btn",
            "rex_rec_flags_refresh_file",
            "rex_rec_flags_enable_all",
            "rex_rec_flags_reset_all",
            "rex_enable_all_ghost",
            "rex_disable_all_ghost",
            "rex_enable_all_distractions",
            "rex_disable_all_distractions",
            "rex_quick_access_sheet",
            "rex_apply_pro_config_v6",
            "rex_color_mode_btn",
            "rex_clear_cache_btn",
            "rex_creative_fonts_btn",
            "rex_private_screen_opacity_btn",
            "rex_passcode_lock_btn",
            "rex_hidden_chats_list_btn",
            "rex_whatsapp_type_btn",
            "rex_last_active_format_btn",
            "rex_emoji_type_btn",
            "rex_font_type_btn",
            "rex_add_story_fonts_btn",
            "rex_pref_add_emoji_font",
            "rex_pref_add_story_font",
            "rex_legal_licenses_btn",
            "rex_color_mode_btn",
            "rex_apply_pro_config_v6",
            "rex_export_pro_config_v6",
            "rex_story_font_source_btn",
            "rex_browse_xboyrex_story_fonts_btn",
            "rex_initial_features_search_btn",
            "rex_initial_features_category_btn",
            "rex_initial_features_status_btn",
            "rex_initial_features_presets_btn",
            "rex_initial_features_enable_safe_btn",
            "rex_initial_features_reset_all_btn",
            "rex_initial_features_export_btn",
            "rex_import_initial_features",
            "rex_initial_features_restart_now",
            "rex_rec_flags_restart_now",
            "rex_cache_cleaner_status_btn",
            "rex_cache_cleaner_clean_now_btn",
            "rex_cache_cleaner_limit_btn",
            "rex_cache_cleaner_custom_limit_btn",
            Constants.REX_APP_VERSION_PREFERENCE,
            Constants.REX_PATCH_VERSION_PREFERENCE
    )));

    public static final Set<String> PRIMARY_ACTION_KEYS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "rex_enable_all_ghost",
            "rex_enable_all_distractions",
            "rex_export_pref",
            "rex_import_pref",
            "rex_rec_flags_refresh_file",
            "rex_quick_access_sheet",
            "rex_apply_pro_config_v6",
            "rex_color_mode_btn",
            "rex_initial_features_presets_btn",
            "rex_initial_features_enable_safe_btn",
            "rex_initial_features_restart_now",
            "rex_rec_flags_restart_now",
            "rex_cache_cleaner_clean_now_btn"
    )));

    public static final Set<String> DESTRUCTIVE_ACTION_KEYS = Collections.unmodifiableSet(new HashSet<>(Arrays.asList(
            "rex_reset_pref",
            "rex_pref_delete_font",
            "rex_reset_download_path",
            "rex_disable_all_ghost",
            "rex_disable_all_distractions",
            "rex_clear_cache_btn",
            "rex_rec_flags_reset_all",
            "rex_initial_features_reset_all_btn"
    )));

    private final Context context;
    private View rowView;
    private boolean pressedHighlightEnabled;

    public ButtonPref(Context context) {
        super(context);
        this.context = context;
        init();
    }

    public ButtonPref(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.context = context;
        init();
    }

    public ButtonPref(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.context = context;
        init();
    }

    public static boolean isFragmentNavigation(String key) {
        return key != null && REGISTERED_ROUTE_KEYS.contains(key);
    }

    public static boolean isRegisteredAction(String key) {
        if (key == null) return false;
        return REGISTERED_ACTION_KEYS.contains(key) || SettingsStatus.FLAGS.containsKey(key);
    }

    public static boolean isRegisteredActionOrRoute(String key) {
        return isFragmentNavigation(key) || isRegisteredAction(key);
    }

    public static boolean isPrimaryActionKey(String key) {
        return key != null && PRIMARY_ACTION_KEYS.contains(key);
    }

    public static boolean isDestructiveActionKey(String key) {
        return key != null && DESTRUCTIVE_ACTION_KEYS.contains(key);
    }

    private void init() {
        setOnPreferenceClickListener(preference -> {
            try {
                if (rowView != null) RexHaptics.tap(rowView); else RexHaptics.tap(context);
                if (rowView != null) {
                    InstagramPreferenceStyle.pulseRowIcon(rowView);
                }
                String key = getKey();
                if (key == null) return false;

                if (!isRegisteredActionOrRoute(key)) {
                    Utils.showToastShort("Action unavailable: " + key);
                    return false;
                }

                if (key.equals("rex_export_dev_overrides")
                        || key.equals("rex_import_dev_overrides")
                        || key.equals("rex_import_id_mapping")
                        || key.equals("rex_export_pref")
                        || key.equals("rex_import_pref")
                        || key.equals("rex_download_set_path")
                        || key.equals("rex_pref_add_font")
                        || key.equals("rex_pref_add_emoji_font")
                        || key.equals("rex_pref_add_story_font")
                        || key.equals("rex_import_initial_features")) {
                    ActivityHook.launchFragment(context, key);

                } else if (key.equals("rex_reset_download_path")) {
                    RexDialogs.showConfirmDialog(
                            context,
                            "Reset Download Path",
                            "Reset custom download folder back to default (/storage/emulated/0/Download/xboyrex)?",
                            "Reset Path",
                            true,
                            () -> {
                                StorageUtils.saveCustomPath("");
                                Utils.showToastShort("Download path reset to default");
                                Runnable recreate = recreateActivityOnComplete(context);
                                if (recreate != null) recreate.run();
                            }
                    );

                } else if (key.equals("rex_reset_pref")) {
                    InstaUtils.showResetSettingsDialog(context);

                } else if (key.equals("rex_focus_lock_action")) {
                    FocusLockDialogs.onActionPressed(context, ButtonPref.this);

                } else if (key.equals("rex_pref_delete_font")) {
                    RexDialogs.showConfirmDialog(
                            context,
                            "Delete Custom Font",
                            "Remove the imported custom font file and revert to default typography?",
                            "Delete Font",
                            true,
                            () -> {
                                FontStorage.DeleteResult result = FontStorage.delete();
                                Utils.showToastShort(str(
                                        result == FontStorage.DeleteResult.DELETED ? "rex_pref_delete_font_success" :
                                                result == FontStorage.DeleteResult.NOT_FOUND ? "rex_pref_delete_font_warn" :
                                                        "rex_pref_delete_font_fail"));
                            }
                    );

                } else if (key.equals("rex_export_experiment_list")) {
                    InstaUtils.decompileExperiments(false);

                } else if (key.equals("rex_export_experiment_mappings")) {
                    InstaUtils.decompileExperiments(true);

                } else if (key.equals("rex_download_id_mapping")) {
                    DownloadMapping.downloadMapping();

                } else if (key.equals("rex_view_saved_instants")) {
                    ActivityHook.launchActivity(context,
                            app.morphe.extension.instagram.patches.instants.InstantsVaultActivity.class);

                } else if (key.equals("view_deleted_messages")) {
                    SavedMessagesHook.openDeletedMessages(context);

                } else if (key.equals("rex_notification_center_btn")) {
                    RexDialogs.showNotificationCenterDialog(context);

                } else if (key.equals("rex_chat_wallpaper_picker")) {
                    RexRuntimeFeatures.pickChatWallpaper(context);

                } else if (key.equals("rex_saved_captions_btn")) {
                    RexVault.showSavedCaptionsDialog(context);

                } else if (key.equals("rex_saved_bios_btn")) {
                    RexVault.showSavedBiosDialog(context);

                } else if (key.equals("rex_saved_profiles_btn")) {
                    RexVault.showSavedProfilesDialog(context);

                } else if (key.equals("rex_watch_history_btn")) {
                    RexVault.showWatchHistoryDialog(context);

                } else if (key.equals("rex_video_splitter_btn")) {
                    RexRuntimeFeatures.showVideoSplitterDialog(context);

                } else if (key.equals("rex_story_like_history_btn")) {
                    StoryLikeHistoryActivity.open(context);

                } else if (key.equals("rex_story_mention_settings_btn")) {
                    StoryMentionSettings.showSettings(context);

                } else if (key.equals("rex_app_language_btn")) {
                    RexDialogs.showAppLanguagePicker(context);

                } else if (key.equals("rex_legal_licenses_btn")) {
                    RexDialogs.showLegalLicensesDialog(context);

                } else if (key.equals("rex_quick_access_sheet")) {
                    RexDialogs.showHomeQuickMenu(context);

                } else if (key.equals("rex_clear_cache_btn")) {
                    RexDialogs.showConfirmDialog(
                            context,
                            "Clear Cache & Temporary Media",
                            "Clear cached temporary media files and freed storage now?",
                            "Clear Cache",
                            true,
                            () -> RexRuntimeFeatures.clearTemporaryCache(context)
                    );

                } else if (key.equals("rex_creative_fonts_btn")) {
                    RexRuntimeFeatures.showCreativeFontsDialog(context);

                } else if (key.equals("rex_private_screen_opacity_btn")) {
                    RexRuntimeFeatures.showOpacityDialog(context);

                } else if (key.equals("rex_passcode_lock_btn")) {
                    RexRuntimeFeatures.showPasscodeSetupDialog(context);

                } else if (key.equals("rex_hidden_chats_list_btn")) {
                    RexRuntimeFeatures.showHiddenChatsListDialog(context);

                } else if (key.equals("rex_whatsapp_type_btn")) {
                    RexRuntimeFeatures.showWhatsAppTypePicker(context, recreateActivityOnComplete(context));

                } else if (key.equals("rex_last_active_format_btn")) {
                    RexRuntimeFeatures.showLastActiveFormatPicker(context, recreateActivityOnComplete(context));

                } else if (key.equals("rex_emoji_type_btn")) {
                    RexRuntimeFeatures.showEmojiTypePicker(context, () -> app.morphe.extension.instagram.settings.SettingsActivity.refreshCurrentScreen(context));

                } else if (key.equals("rex_font_type_btn")) {
                    RexRuntimeFeatures.showFontTypePicker(context, () -> app.morphe.extension.instagram.settings.SettingsActivity.refreshCurrentScreen(context));

                } else if (key.equals("rex_add_story_fonts_btn")) {
                    RexRuntimeFeatures.showAddStoryFontsDialog(context, () -> app.morphe.extension.instagram.settings.SettingsActivity.refreshCurrentScreen(context));

                } else if (key.equals("rex_story_font_source_btn")) {
                    RexRuntimeFeatures.showStoryFontSourcePicker(context, () -> app.morphe.extension.instagram.settings.SettingsActivity.refreshCurrentScreen(context));

                } else if (key.equals("rex_browse_xboyrex_story_fonts_btn")) {
                    RexRuntimeFeatures.showXboyrexStoryFontPackBrowser(context, () -> app.morphe.extension.instagram.settings.SettingsActivity.refreshCurrentScreen(context));

                } else if (key.equals("rex_initial_features_search_btn")) {
                    InitialFeaturePreference.showSearchDialog(context, () -> app.morphe.extension.instagram.settings.SettingsActivity.refreshCurrentScreen(context));

                } else if (key.equals("rex_initial_features_category_btn")) {
                    InitialFeaturePreference.showCategoryFilterDialog(context, () -> app.morphe.extension.instagram.settings.SettingsActivity.refreshCurrentScreen(context));

                } else if (key.equals("rex_initial_features_status_btn")) {
                    InitialFeaturePreference.showStatusFilterDialog(context, () -> app.morphe.extension.instagram.settings.SettingsActivity.refreshCurrentScreen(context));

                } else if (key.equals("rex_initial_features_presets_btn")) {
                    InitialFeaturePreference.showPresetsDialog(context, () -> app.morphe.extension.instagram.settings.SettingsActivity.refreshCurrentScreen(context));

                } else if (key.equals("rex_initial_features_enable_safe_btn")) {
                    app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.applyPreset(
                            context,
                            app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.PRESET_RECOMMENDED_SAFE,
                            () -> app.morphe.extension.instagram.settings.SettingsActivity.refreshCurrentScreen(context)
                    );

                } else if (key.equals("rex_initial_features_reset_all_btn")) {
                    app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.resetAllFlagsTransactionally(
                            context,
                            () -> app.morphe.extension.instagram.settings.SettingsActivity.refreshCurrentScreen(context)
                    );

                } else if (key.equals("rex_initial_features_export_btn")) {
                    String json = app.morphe.extension.instagram.patches.devFlags.InitialFeaturesManager.exportJsonConfig();
                    InstaUtils.writeDiagnosticJsonToDownloads("InstaRex_Initial_Features_Backup.json", json, "Exported Initial Features backup to Download/xboyrex");

                } else if (key.equals("rex_initial_features_restart_now") || key.equals("rex_rec_flags_restart_now")) {
                    app.morphe.extension.instagram.settings.SettingsRestart.restartNow(context);

                } else if (key.equals("rex_cache_cleaner_status_btn") || key.equals("rex_cache_cleaner_clean_now_btn")) {
                    app.morphe.extension.instagram.settings.feature.AppCacheCleaner.showCleanNowConfirmDialog(
                            context,
                            () -> app.morphe.extension.instagram.settings.SettingsActivity.refreshCurrentScreen(context)
                    );

                } else if (key.equals("rex_cache_cleaner_limit_btn")) {
                    app.morphe.extension.instagram.settings.feature.AppCacheCleaner.showCacheLimitPickerDialog(
                            context,
                            () -> app.morphe.extension.instagram.settings.SettingsActivity.refreshCurrentScreen(context)
                    );

                } else if (key.equals("rex_cache_cleaner_custom_limit_btn")) {
                    app.morphe.extension.instagram.settings.feature.AppCacheCleaner.showCustomLimitDialog(
                            context,
                            () -> app.morphe.extension.instagram.settings.SettingsActivity.refreshCurrentScreen(context)
                    );

                } else if (key.equals("rex_color_mode_btn")) {
                    RexRuntimeFeatures.showColorModePicker(context, recreateActivityOnComplete(context));

                } else if (key.equals("rex_apply_pro_config_v6")) {
                    RexRuntimeFeatures.applyBuiltInProConfigV6(context);

                } else if (key.equals("rex_export_pro_config_v6")) {
                    RexRuntimeFeatures.exportBuiltInProConfigV6(context);

                } else if (key.equals("rex_enable_all_ghost")) {
                    setGhostGroupState(true);
                    Utils.showToastShort("Enabled all Ghost Mode switches");
                    Runnable r = recreateActivityOnComplete(context);
                    if (r != null) r.run();

                } else if (key.equals("rex_disable_all_ghost")) {
                    setGhostGroupState(false);
                    Utils.showToastShort("Disabled all Ghost Mode switches");
                    Runnable r = recreateActivityOnComplete(context);
                    if (r != null) r.run();

                } else if (key.equals("rex_enable_all_distractions")) {
                    setDistractionGroupState(true);
                    Utils.showToastShort("Enabled all Distraction-Free filters");
                    Runnable r = recreateActivityOnComplete(context);
                    if (r != null) r.run();

                } else if (key.equals("rex_disable_all_distractions")) {
                    setDistractionGroupState(false);
                    Utils.showToastShort("Disabled all Distraction-Free filters");
                    Runnable r = recreateActivityOnComplete(context);
                    if (r != null) r.run();

                } else if (key.equals(Constants.REX_APP_VERSION_PREFERENCE)
                        || key.equals(Constants.REX_PATCH_VERSION_PREFERENCE)) {
                    CharSequence t = getTitle();
                    if (t != null) {
                        Utils.setClipboard(t.toString());
                        Utils.showToastShort("Copied: " + t);
                    }

                } else if (key.equals(Constants.REX_FRAGMENT_DEV_OPTIONS)) {
                    RexDialogs.showDevWarningDialog(context, () -> FragmentHook.startFragment(Constants.REX_FRAGMENT_DEV_OPTIONS));

                } else if (isFragmentNavigation(key)) {
                    FragmentHook.startFragment(key);

                } else if (key.equals("rex_rec_flags_refresh_file")) {
                    RecommendedFlags.downloadRecommendedFlagsFile(() -> app.morphe.extension.instagram.settings.SettingsActivity.refreshCurrentScreen(context));

                } else if (key.equals("rex_rec_flags_enable_all")) {
                    RecommendedFlags.enableAllBooleanFlagsTransactionally(context, () -> app.morphe.extension.instagram.settings.SettingsActivity.refreshCurrentScreen(context));

                } else if (key.equals("rex_rec_flags_reset_all")) {
                    RecommendedFlags.resetAllFlagsTransactionally(context, () -> app.morphe.extension.instagram.settings.SettingsActivity.refreshCurrentScreen(context));

                } else if (SettingsStatus.FLAGS.containsKey(key)) {
                    Boolean active = SettingsStatus.FLAGS.get(key);
                    Utils.showToastShort(key + ": " + (Boolean.TRUE.equals(active) ? "Active" : "Inactive"));
                }
            } catch (Exception e) {
                Utils.showToastShort(RexDialogs.userSafeErrorMessage(e, "Action failed. Please try again."));
                Logger.printException(() -> "Preference button onclick failure", e);
            }
            return true;
        });
    }

    public static void setGhostGroupState(boolean enabled) {
        SharedPref.setBooleanPref(Settings.TURN_ON_ALL_GHOST_MODES.key, enabled);
        SharedPref.setBooleanPref(Settings.VIEW_DM_ANONYMOUSLY.key, enabled);
        SharedPref.setBooleanPref(Settings.MARK_AS_READ_AFTER_REPLY.key, enabled);
        SharedPref.setBooleanPref(Settings.MARK_AS_SEEN_ON_REACTION.key, enabled);
        SharedPref.setBooleanPref(Settings.VIEW_BLOCKED_PROFILES_SECRETLY.key, enabled);
        SharedPref.setBooleanPref(Settings.DISABLE_TYPING_STATUS.key, enabled);
        SharedPref.setBooleanPref(Settings.DISABLE_SCREENSHOT_DETECTION.key, enabled);
        SharedPref.setBooleanPref(Settings.HIDE_VIEW_ONCE_SEEN.key, enabled);
        SharedPref.setBooleanPref(Settings.UNLIMITED_REPLAYS.key, enabled);
        SharedPref.setBooleanPref(Settings.GHOST_INSTANTS.key, enabled);
        SharedPref.setBooleanPref(Settings.VIEW_STORIES_ANONYMOUSLY.key, enabled);
        SharedPref.setBooleanPref(Settings.VIEW_LIVE_ANONYMOUSLY.key, enabled);
        SharedPref.setBooleanPref(Settings.HIDE_AUDIO_SEEN.key, enabled);
    }

    public static void setDistractionGroupState(boolean enabled) {
        SharedPref.setBooleanPref(Settings.DISABLE_STORIES.key, enabled);
        SharedPref.setBooleanPref(Settings.HIDE_STORIES_TRAY.key, enabled);
        SharedPref.setBooleanPref(Settings.HIDE_HIDDEN_REQUESTS.key, enabled);
        SharedPref.setBooleanPref(Settings.DISABLE_HIGHLIGHTS.key, enabled);
        SharedPref.setBooleanPref(Settings.HIDE_NOTES_TRAY.key, enabled);
        SharedPref.setBooleanPref(Settings.DISABLE_EXPLORE.key, enabled);
        SharedPref.setBooleanPref(Settings.DISABLE_COMMENTS.key, enabled);
        SharedPref.setBooleanPref(Settings.HIDE_FEED_POSTS.key, enabled);
        SharedPref.setBooleanPref(Settings.LIMIT_FOLLOWING_FEED.key, enabled);
        SharedPref.setBooleanPref(Settings.DISABLE_DISCOVER_PEOPLE.key, enabled);
        SharedPref.setBooleanPref(Settings.DISABLE_REELS_SCROLLING.key, enabled);
        SharedPref.setBooleanPref(Settings.DISABLE_SWIPE_TO_CREATE.key, enabled);
        SharedPref.setBooleanPref(Settings.HIDE_GROUP_CREATION_BUTTON_ON_SHARESHEET.key, enabled);
        SharedPref.setBooleanPref(Settings.HIDE_REELS_FOLLOW_BUTTON.key, enabled);
        SharedPref.setBooleanPref(Settings.HIDE_LIKES.key, enabled);
        SharedPref.setBooleanPref(Settings.HIDE_SHARE_BUTTON.key, enabled);
        SharedPref.setBooleanPref(Settings.HIDE_RESHARE_BUTTON.key, enabled);
    }

    private static Runnable recreateActivityOnComplete(Context context) {
        if (!(context instanceof Activity)) return null;
        WeakReference<Activity> activityReference = new WeakReference<>((Activity) context);
        return () -> {
            Activity activity = activityReference.get();
            if (activity != null && !activity.isFinishing() && !activity.isDestroyed()) {
                activity.recreate();
            }
        };
    }

    @Override
    protected View onCreateView(ViewGroup parent) {
        View view = InstagramPreferenceStyle.createPreferenceView(
                context,
                InstagramPreferenceStyle.TRAILING_CHEVRON,
                iconResourceNameForKey(getKey())
        );
        rowView = view;
        return view;
    }

    @Override
    protected void onBindView(View view) {
        rowView = view;
        String key = getKey();
        if (!isRegisteredActionOrRoute(key)) {
            setEnabled(false);
        }
        InstagramPreferenceStyle.bindText(this, view);
        InstagramPreferenceStyle.bindIcon(view, iconResourceNameForKey(key));
        InstagramPreferenceStyle.setTrailingVisible(view, hasVisibleTrail(key));
        InstagramPreferenceStyle.setPressedHighlightEnabled(view, pressedHighlightEnabled);
        InstagramPreferenceStyle.applyActionRoleStyling(view, key, isEnabled());
    }

    public static boolean hasVisibleTrail(String key) {
        return isRegisteredActionOrRoute(key)
                && !Constants.REX_APP_VERSION_PREFERENCE.equals(key)
                && !Constants.REX_PATCH_VERSION_PREFERENCE.equals(key)
                && !SettingsStatus.FLAGS.containsKey(key);
    }

    public void setPressedHighlightEnabled(boolean enabled) {
        if (pressedHighlightEnabled != enabled) {
            pressedHighlightEnabled = enabled;
            notifyChanged();
        }
    }

    /**
     * Resolves any preference or route key to its unique semantic Tabler icon ID via {@link RexIcon}.
     */
    public static String iconResourceNameForKey(String key) {
        return "rex_vec_" + RexIcon.iconForKey(key);
    }
}
