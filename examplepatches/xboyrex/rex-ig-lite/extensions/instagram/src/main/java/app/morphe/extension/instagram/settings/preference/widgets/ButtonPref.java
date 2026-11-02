/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import android.app.Activity;
import android.content.Context;
import android.preference.Preference;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;

import java.lang.ref.WeakReference;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.instagram.settings.ActivityHook;
import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.settings.preference.fragments.FragmentHook;
import app.morphe.extension.instagram.patches.Block;
import app.morphe.extension.instagram.patches.customise.font.FontStorage;
import app.morphe.extension.instagram.patches.download.DownloadMapping;
import app.morphe.extension.instagram.patches.devFlags.RecommendedFlags;
import app.morphe.extension.instagram.constants.UI;
import app.morphe.extension.instagram.utils.InstaUtils;
import app.morphe.extension.instagram.patches.focusLock.FocusLockDialogs;
import app.morphe.extension.instagram.patches.dm.SavedMessagesHook;
import app.morphe.extension.instagram.ui.RexDialogs;
import app.morphe.extension.instagram.ui.RexVectorIcons;

import static app.morphe.extension.instagram.utils.IgStr.str;

public class ButtonPref extends Preference {
    private final Context context;
    private boolean pressedHighlightEnabled;
    private Runnable customClickAction;
    private boolean forceTrailVisible;

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

    public void setCustomClickAction(Runnable action) {
        this.customClickAction = action;
        this.forceTrailVisible = true;
    }

    public void setLeftVectorIcon(String svgPath) {
        InstagramPreferenceStyle.setLeftIcon(this, svgPath);
    }

    public void setRightVectorIcon(String svgPath) {
        InstagramPreferenceStyle.setRightIcon(this, svgPath);
        this.forceTrailVisible = true;
    }

    private void init() {
        setOnPreferenceClickListener(new OnPreferenceClickListener() {
            @Override
            public boolean onPreferenceClick(Preference preference) {
                try {
                    if (customClickAction != null) {
                        customClickAction.run();
                        return true;
                    }

                    String key = getKey();
                    if (key == null) {
                        return true;
                    }

                    if (key.equals("rex_export_dev_overrides") || key.equals("rex_import_dev_overrides") || key.equals("rex_import_id_mapping")
                            || key.equals("rex_export_pref") || key.equals("rex_import_pref")
                            || key.equals("rex_download_set_path") || key.equals("rex_pref_add_font")) {
                        ActivityHook.launchFragment((Activity) context, key);

                    } else if (key.equals("rex_reset_pref")) {
                        InstaUtils.showResetSettingsDialog(context);

                    } else if (key.equals("rex_focus_lock_action")) {
                        FocusLockDialogs.onActionPressed(context, ButtonPref.this);

                    } else if (key.equals("rex_delete_analytics_cache")) {
                        Block.deleteAnalyticsCacheFolder();

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

                    } else if (key.equals(Constants.REX_FRAGMENT_DEV_OPTIONS)) {
                        RexDialogs.showDevOptionsWarningDialog(context, () -> FragmentHook.startFragment(Constants.REX_FRAGMENT_DEV_OPTIONS));

                    } else if (isFragmentNavigation(key)) {
                        FragmentHook.startFragment(key);

                    } else if (key.equals("rex_rec_flags_refresh_file")) {
                        RecommendedFlags.downloadRecommendedFlagsFile(
                                recreateActivityOnComplete(context)
                        );
                    }
                } catch (Exception e) {
                    Utils.showToastShort(e.getMessage());
                    Logger.printException(() -> "Preference button onclick failure", e);
                }
                return true;
            }
        });
    }

    private static Runnable recreateActivityOnComplete(Context context) {
        if (!(context instanceof Activity)) {
            return null;
        }
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
                getIconResourceName(getKey())
        );
    }

    @Override
    protected void onBindView(View view) {
        String key = getKey();
        String customLeftSvg = getExtras().getString(InstagramPreferenceStyle.EXTRA_LEFT_ICON_PATH);
        InstagramPreferenceStyle.bindIcon(view, !TextUtils.isEmpty(customLeftSvg) ? customLeftSvg : getIconResourceName(key));
        InstagramPreferenceStyle.bindText(this, view);
        InstagramPreferenceStyle.setTrailingVisible(
                view,
                forceTrailVisible || hasVisibleTrail(key) || !TextUtils.isEmpty(getExtras().getString(InstagramPreferenceStyle.EXTRA_RIGHT_ICON_PATH))
        );
        InstagramPreferenceStyle.setPressedHighlightEnabled(
                view,
                pressedHighlightEnabled
        );
    }

    private static boolean isFragmentNavigation(String key) {
        return key != null && key.startsWith("rex_frag_");
    }

    private static boolean hasVisibleTrail(String key) {
        return isFragmentNavigation(key)
                || (key != null
                && (key.equals("rex_export_dev_overrides")
                || key.equals("rex_import_dev_overrides")
                || key.equals("rex_import_id_mapping")
                || key.equals("rex_export_pref")
                || key.equals("rex_import_pref")
                || key.equals("rex_reset_pref")
                || key.equals("rex_focus_lock_action")
                || key.equals("rex_download_set_path")
                || key.equals("rex_delete_analytics_cache")
                || key.equals("rex_export_experiment_list")
                || key.equals("rex_export_experiment_mappings")
                || key.equals("rex_download_id_mapping")
                || key.equals("rex_rec_flags_refresh_file")
                || key.equals("rex_view_saved_instants")
                || key.equals("rex_pref_add_font")
                || key.equals("rex_pref_delete_font")
                || key.equals("view_deleted_messages")));
    }

    public void setPressedHighlightEnabled(boolean enabled) {
        if (pressedHighlightEnabled != enabled) {
            pressedHighlightEnabled = enabled;
            notifyChanged();
        }
    }

    private String getIconResourceName(String key) {
        if (key == null) {
            return null;
        }
        if (key.equals(Constants.REX_FRAGMENT_PREMIUM)) {
            return RexVectorIcons.IC_DIAMOND;
        }
        if (key.equals(Constants.REX_FRAGMENT_GHOST)) {
            return RexVectorIcons.IC_GHOST;
        }
        if (key.equals(Constants.REX_FRAGMENT_NOTIFICATION) || key.equals(Constants.REX_FRAGMENT_DM)) {
            return RexVectorIcons.IC_BELL;
        }
        if (key.equals(Constants.REX_FRAGMENT_PRIVACY) || key.equals(Constants.REX_FRAGMENT_ADS) || key.equals(Constants.REX_FRAGMENT_LINKS)) {
            return RexVectorIcons.IC_SHIELD_OUTLINE;
        }
        if (key.equals(Constants.REX_FRAGMENT_GESTURES)) {
            return RexVectorIcons.IC_HAND;
        }
        if (key.equals(Constants.REX_FRAGMENT_FEED_STORIES) || key.equals(Constants.REX_FRAGMENT_STORY)) {
            return RexVectorIcons.IC_LAYERS;
        }
        if (key.equals(Constants.REX_FRAGMENT_UI_TWEAKS)) {
            return RexVectorIcons.IC_PALETTE;
        }
        if (key.equals(Constants.REX_FRAGMENT_FOCUS_MODE) || key.equals(Constants.REX_FRAGMENT_DISTRACTION_FREE)) {
            return RexVectorIcons.IC_SPARKLES;
        }
        if (key.equals(Constants.REX_FRAGMENT_MISC)) {
            return RexVectorIcons.IC_SLIDERS;
        }
        if (key.equals(Constants.REX_FRAGMENT_DOWNLOAD_MEDIA)) {
            return RexVectorIcons.IC_DOWNLOAD;
        }
        if (key.equals(Constants.REX_FRAGMENT_NAV_BTNS)) {
            return RexVectorIcons.IC_COMPASS;
        }
        if (key.equals(Constants.REX_FRAGMENT_DEV_OPTIONS)) {
            return RexVectorIcons.IC_WRENCH;
        }
        if (key.equals(Constants.REX_FRAGMENT_ABOUT)) {
            return RexVectorIcons.IC_INFO;
        }
        if (key.equals(Constants.REX_FRAGMENT_ACTION_BAR)) {
            return RexVectorIcons.IC_LAYOUT_TOP;
        }
        if (key.equals(Constants.REX_FRAGMENT_FILTER_CONTENT)) {
            return RexVectorIcons.IC_FILTER;
        }
        if (key.equals(Constants.REX_FRAGMENT_INSTANTS)) {
            return RexVectorIcons.IC_SPARKLES;
        }
        if (key.equals(Constants.REX_FRAGMENT_FONT)) {
            return RexVectorIcons.IC_FILE_TEXT;
        }
        if (key.equals(Constants.REX_FRAGMENT_FOCUS_LOCK)) {
            return RexVectorIcons.IC_LOCK;
        }
        if (key.equals(Constants.REX_FRAGMENT_REC_FLAGS)) {
            return RexVectorIcons.IC_STAR;
        }
        return null;
    }
}
