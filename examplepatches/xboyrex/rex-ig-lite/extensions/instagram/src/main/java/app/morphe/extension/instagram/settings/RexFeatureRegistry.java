/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */

package app.morphe.extension.instagram.settings;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.settings.preference.widgets.RexIconRegistry;

/**
 * Central Feature Registry for InstaRex (Rex IG Lite).
 * Maps every feature ID, screen location, semantic Tabler icon ID, callback handler,
 * preference key, patch dependency, and verification status (Section 11).
 */
public final class RexFeatureRegistry {

    public static final class FeatureEntry {
        public final String featureId;
        public final String screenLocation;
        public final String iconId;
        public final String callbackTarget;
        public final String preferenceKey;
        public final String patchDependency;
        public final String testStatus;

        public FeatureEntry(
                String featureId,
                String screenLocation,
                String iconId,
                String callbackTarget,
                String preferenceKey,
                String patchDependency,
                String testStatus
        ) {
            this.featureId = featureId;
            this.screenLocation = screenLocation;
            this.iconId = iconId;
            this.callbackTarget = callbackTarget;
            this.preferenceKey = preferenceKey;
            this.patchDependency = patchDependency;
            this.testStatus = testStatus;
        }
    }

    private static final Map<String, FeatureEntry> REGISTRY = new LinkedHashMap<>();

    static {
        // Core Category Routes
        register("CAT_GHOST_MODE", Constants.REX_FRAGMENT_SETTINGS, "ghost", "FragmentHook.startFragment", Constants.REX_FRAGMENT_GHOST, "GhostModePatch", "STATIC_VERIFIED");
        register("CAT_NOTIFICATION", Constants.REX_FRAGMENT_SETTINGS, "bell", "FragmentHook.startFragment", Constants.REX_FRAGMENT_NOTIFICATION, "NotificationFilterPatch", "STATIC_VERIFIED");
        register("CAT_PRIVACY", Constants.REX_FRAGMENT_SETTINGS, "shield", "FragmentHook.startFragment", Constants.REX_FRAGMENT_PRIVACY, "HideAdsPatch", "STATIC_VERIFIED");
        register("CAT_GESTURES", Constants.REX_FRAGMENT_SETTINGS, "hand-click", "FragmentHook.startFragment", Constants.REX_FRAGMENT_GESTURES, "GestureControlPatch", "STATIC_VERIFIED");
        register("CAT_FEED_STORIES", Constants.REX_FRAGMENT_SETTINGS, "layout-grid", "FragmentHook.startFragment", Constants.REX_FRAGMENT_FEED_AND_STORIES, "FeedAndStoriesPatch", "STATIC_VERIFIED");
        register("CAT_UI_TWEAKS", Constants.REX_FRAGMENT_SETTINGS, "palette", "FragmentHook.startFragment", Constants.REX_FRAGMENT_UI_TWEAKS, "NavigationBarPatch", "STATIC_VERIFIED");
        register("CAT_FOCUS_MODE", Constants.REX_FRAGMENT_SETTINGS, "eye-off", "FragmentHook.startFragment", Constants.REX_FRAGMENT_DISTRACTION_FREE, "DistractionFreePatch", "STATIC_VERIFIED");
        register("CAT_MISC", Constants.REX_FRAGMENT_SETTINGS, "sparkles", "FragmentHook.startFragment", Constants.REX_FRAGMENT_MISC, "MiscOptionsPatch", "STATIC_VERIFIED");
        register("CAT_DOWNLOADS", Constants.REX_FRAGMENT_SETTINGS, "download", "FragmentHook.startFragment", Constants.REX_FRAGMENT_DOWNLOAD_MEDIA, "DownloadMediaPatch", "STATIC_VERIFIED");
        register("CAT_DEV_OPTIONS", Constants.REX_FRAGMENT_SETTINGS, "code-2", "RexDialogs.showDevWarningDialog", Constants.REX_FRAGMENT_DEV_OPTIONS, "DeveloperOptionsPatch", "STATIC_VERIFIED");
        register("CAT_BACKUP_RESTORE", Constants.REX_FRAGMENT_SETTINGS, "database", "RexDialogs.showBackupRestoreDialog", "rex_backup_and_restore", "AddSettingsPatch", "STATIC_VERIFIED");
        register("CAT_ABOUT", Constants.REX_FRAGMENT_SETTINGS, "info", "RexAboutView.createAboutScreen", Constants.REX_FRAGMENT_ABOUT, "AddSettingsPatch", "STATIC_VERIFIED");

        // Dynamically register all BooleanSetting & StringSetting constants declared on Settings.java
        try {
            for (Field field : Settings.class.getDeclaredFields()) {
                field.setAccessible(true);
                Object val = field.get(null);
                if (val instanceof BooleanSetting) {
                    BooleanSetting bs = (BooleanSetting) val;
                    if (bs.key != null) {
                        String icon = RexIconRegistry.resolveSemanticIconId(bs.key);
                        register(
                                "PREF_BOOL_" + field.getName(),
                                "SettingsSubpage",
                                icon,
                                "SwitchPref.onPreferenceChange -> Pref." + bs.key,
                                bs.key,
                                "AddSettingsPatch",
                                "STATIC_VERIFIED"
                        );
                    }
                } else if (val instanceof StringSetting) {
                    StringSetting ss = (StringSetting) val;
                    if (ss.key != null) {
                        String icon = RexIconRegistry.resolveSemanticIconId(ss.key);
                        register(
                                "PREF_STR_" + field.getName(),
                                "SettingsSubpage",
                                icon,
                                "ListPref/EditTextPref -> Pref." + ss.key,
                                ss.key,
                                "AddSettingsPatch",
                                "STATIC_VERIFIED"
                        );
                    }
                }
            }
        } catch (Throwable ignored) {
        }
    }

    private RexFeatureRegistry() {
    }

    private static void register(
            String featureId,
            String screenLocation,
            String iconId,
            String callbackTarget,
            String preferenceKey,
            String patchDependency,
            String testStatus
    ) {
        REGISTRY.put(featureId, new FeatureEntry(
                featureId,
                screenLocation,
                iconId,
                callbackTarget,
                preferenceKey,
                patchDependency,
                testStatus
        ));
    }

    public static List<FeatureEntry> getAllFeatures() {
        return Collections.unmodifiableList(new ArrayList<>(REGISTRY.values()));
    }

    public static FeatureEntry getByPreferenceKey(String preferenceKey) {
        if (preferenceKey == null) return null;
        for (FeatureEntry entry : REGISTRY.values()) {
            if (preferenceKey.equals(entry.preferenceKey)) {
                return entry;
            }
        }
        return null;
    }
}
