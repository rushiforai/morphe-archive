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

import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.constants.UI;
import app.morphe.extension.instagram.patches.customise.font.FontStorage;
import app.morphe.extension.instagram.patches.devFlags.RecommendedFlags;
import app.morphe.extension.instagram.patches.dm.SavedMessagesHook;
import app.morphe.extension.instagram.patches.download.DownloadMapping;
import app.morphe.extension.instagram.patches.focusLock.FocusLockDialogs;
import app.morphe.extension.instagram.patches.story.StoryLikeHistoryActivity;
import app.morphe.extension.instagram.patches.story.StoryMentionSettings;
import app.morphe.extension.instagram.settings.ActivityHook;
import app.morphe.extension.instagram.settings.preference.fragments.FragmentHook;
import app.morphe.extension.instagram.utils.InstaUtils;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

public class ButtonPref extends Preference {
    private final Context context;
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

    private void init() {
        setOnPreferenceClickListener(preference -> {
            try {
                String key = getKey();
                if (key == null) return true;

                if (key.equals("rex_export_dev_overrides")
                        || key.equals("rex_import_dev_overrides")
                        || key.equals("rex_import_id_mapping")
                        || key.equals("rex_export_pref")
                        || key.equals("rex_import_pref")
                        || key.equals("rex_download_set_path")
                        || key.equals("rex_pref_add_font")) {
                    ActivityHook.launchFragment((Activity) context, key);

                } else if (key.equals("rex_reset_pref")) {
                    InstaUtils.showResetSettingsDialog(context);

                } else if (key.equals("rex_focus_lock_action")) {
                    FocusLockDialogs.onActionPressed(context, ButtonPref.this);

                } else if (key.equals("rex_pref_delete_font")) {
                    FontStorage.DeleteResult result = FontStorage.delete();
                    Utils.showToastShort(str(
                            result == FontStorage.DeleteResult.DELETED ? "rex_pref_delete_font_success" :
                                    result == FontStorage.DeleteResult.NOT_FOUND ? "rex_pref_delete_font_warn" :
                                            "rex_pref_delete_font_fail"));

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

                } else if (key.equals(Constants.REX_FRAGMENT_DEV_OPTIONS)) {
                    RexDialogs.showDevWarningDialog(context, () -> FragmentHook.startFragment(Constants.REX_FRAGMENT_DEV_OPTIONS));

                } else if (isFragmentNavigation(key)) {
                    FragmentHook.startFragment(key);

                } else if (key.equals("rex_rec_flags_refresh_file")) {
                    RecommendedFlags.downloadRecommendedFlagsFile(recreateActivityOnComplete(context));
                }
            } catch (Exception e) {
                Utils.showToastShort(e.getMessage());
                Logger.printException(() -> "Preference button onclick failure", e);
            }
            return true;
        });
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
        return InstagramPreferenceStyle.createPreferenceView(
                context,
                InstagramPreferenceStyle.TRAILING_CHEVRON,
                iconResourceNameForKey(getKey())
        );
    }

    @Override
    protected void onBindView(View view) {
        String key = getKey();
        InstagramPreferenceStyle.bindText(this, view);
        InstagramPreferenceStyle.bindIcon(view, iconResourceNameForKey(key));
        InstagramPreferenceStyle.setTrailingVisible(view, hasVisibleTrail(key));
        InstagramPreferenceStyle.setPressedHighlightEnabled(view, pressedHighlightEnabled);
    }

    private static boolean isFragmentNavigation(String key) {
        return key != null && key.startsWith("rex_frag_");
    }

    private static boolean hasVisibleTrail(String key) {
        return isFragmentNavigation(key)
                || (key != null && (key.startsWith("rex_") || key.equals("view_deleted_messages")));
    }

    public void setPressedHighlightEnabled(boolean enabled) {
        if (pressedHighlightEnabled != enabled) {
            pressedHighlightEnabled = enabled;
            notifyChanged();
        }
    }

    public static String iconResourceNameForKey(String key) {
        if (key == null) return null;
        if (key.equals(Constants.REX_FRAGMENT_GHOST)) return "rex_vec_ghost";
        if (key.equals(Constants.REX_FRAGMENT_NOTIFICATION)) return "rex_vec_bell";
        if (key.equals(Constants.REX_FRAGMENT_PRIVACY) || key.equals(Constants.REX_FRAGMENT_ADS)) return "rex_vec_shield";
        if (key.equals(Constants.REX_FRAGMENT_GESTURES)) return "rex_vec_gesture";
        if (key.equals(Constants.REX_FRAGMENT_FEED_AND_STORIES) || key.equals(Constants.REX_FRAGMENT_STORY)) return "rex_vec_feed";
        if (key.equals(Constants.REX_FRAGMENT_UI_TWEAKS)) return "rex_vec_ui";
        if (key.equals(Constants.REX_FRAGMENT_DISTRACTION_FREE)) return "rex_vec_focus";
        if (key.equals(Constants.REX_FRAGMENT_MISC)) return "rex_vec_misc";
        if (key.equals(Constants.REX_FRAGMENT_DOWNLOAD_MEDIA)) return "rex_vec_download";
        if (key.equals(Constants.REX_FRAGMENT_DEV_OPTIONS)) return "rex_vec_dev";
        if (key.equals(Constants.REX_FRAGMENT_ABOUT)) return "rex_vec_info";
        if (key.equals(Constants.REX_FRAGMENT_LINKS)) return UI.DRAWABLE_LINK_ICON;
        if (key.equals(Constants.REX_FRAGMENT_NAV_BTNS)) return UI.DRAWABLE_STACK_ICON;
        if (key.equals(Constants.REX_FRAGMENT_ACTION_BAR)) return UI.DRAWABLE_COLLECTIONS_ICON;
        if (key.equals(Constants.REX_FRAGMENT_DM)) return UI.DRAWABLE_SHARE_TO_DIRECT;
        if (key.equals(Constants.REX_FRAGMENT_FILTER_CONTENT)) return UI.DRAWABLE_SHARE_TO_REEL;
        if (key.equals(Constants.REX_FRAGMENT_INSTANTS)) return UI.DRAWABLE_INSTANTS_ICON;
        return null;
    }
}
