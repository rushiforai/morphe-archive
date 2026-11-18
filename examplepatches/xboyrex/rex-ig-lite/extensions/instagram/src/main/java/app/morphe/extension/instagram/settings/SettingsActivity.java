/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.util.TypedValue;
import android.view.View;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.window.OnBackInvokedDispatcher;

import androidx.annotation.RequiresApi;

import java.lang.reflect.Proxy;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.function.Supplier;

import app.morphe.extension.rex.downloader.StorageUtils;
import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.constants.UI;
import app.morphe.extension.instagram.patches.devFlags.RecommendedFlags;
import app.morphe.extension.instagram.settings.preference.Helper;
import app.morphe.extension.instagram.settings.preference.ScreenBuilder;
import app.morphe.extension.instagram.settings.preference.widgets.InstagramPreferenceStyle;
import app.morphe.extension.instagram.settings.preference.widgets.InstagramSearchStyle;
import app.morphe.extension.instagram.settings.preference.widgets.RexHaptics;
import app.morphe.extension.instagram.settings.preference.widgets.SearchResultPreference;
import app.morphe.extension.instagram.settings.preference.widgets.SwitchPref;
import app.morphe.extension.instagram.theme.MaterialYouTheme;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import app.morphe.extension.instagram.settings.preference.fragments.FragmentHook;
import app.morphe.extension.instagram.settings.preference.widgets.RexAboutView;
import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.instagram.settings.preference.widgets.RexVectorIcons;
import app.morphe.extension.shared.Logger;

public final class SettingsActivity {

    private SettingsActivity() {
    }

    private static final int FRAGMENT_CONTAINER_ID = 1001;
    private static final String STATE_FRAGMENT_NAME = "rex_settings_fragment_name";
    private static final String STATE_FRAGMENT_STATE = "rex_settings_fragment_state";
    private static final String STATE_DISPLAY_TITLE = "rex_settings_display_title";
    private static final String STATE_SEARCH_QUERY = "rex_settings_search_query";
    private static final String STATE_SEARCH_MODE = "rex_settings_search_mode";
    private static final String STATE_TARGET_PREFERENCE_KEY = "rex_settings_target_preference_key";

    private static final Map<Activity, Controller> sControllers = new WeakHashMap<>();

    static Controller getController(Activity activity) {
        return activity == null ? null : sControllers.get(activity);
    }

    public static boolean refreshCurrentScreen(Context context) {
        Activity activity = null;
        if (context instanceof Activity) {
            activity = (Activity) context;
        }
        if (activity == null) return false;
        Controller controller = getController(activity);
        if (controller != null) {
            controller.refreshActiveFragmentInPlace();
            return true;
        }
        return false;
    }

    @SuppressLint("ResourceType")
    public static void setupOnActivity(Activity activity, Bundle savedInstanceState) {
        app.morphe.extension.instagram.utils.IgStr.applyLocaleToContext(activity);
        Controller controller = new Controller(activity);
        sControllers.put(activity, controller);
        controller.setup(savedInstanceState);

        if (activity != null && activity.getApplication() != null) {
            activity.getApplication().registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override public void onActivityCreated(Activity a, Bundle b) {}
                @Override public void onActivityStarted(Activity a) {}
                @Override
                public void onActivityResumed(Activity a) {
                    if (a == activity) {
                        controller.onResume();
                    }
                }
                @Override
                public void onActivityPaused(Activity a) {
                    if (a == activity) {
                        controller.onPause();
                    }
                }
                @Override public void onActivityStopped(Activity a) {}
                @Override
                public void onActivitySaveInstanceState(Activity a, Bundle b) {
                    if (a == activity) {
                        controller.onSaveInstanceState(b);
                    }
                }
                @Override
                public void onActivityDestroyed(Activity a) {
                    if (a == activity) {
                        a.getApplication().unregisterActivityLifecycleCallbacks(this);
                        sControllers.remove(activity);
                        controller.onDestroy();
                    }
                }
            });
        }
    }

    public static boolean handleBackPressed(Activity activity) {
        Controller controller = getController(activity);
        if (controller != null && controller.exitSearchIfActive()) {
            return true;
        }
        if (controller != null && controller.rootSettings && SettingsRestart.promptRestartIfPending(activity)) {
            return true;
        }
        return false;
    }

    public static class Controller {
        private final Activity activity;
        private FrameLayout root;
        private FrameLayout chromeOverlay;
        private LinearLayout toolbar;
        private FrameLayout contentFrame;
        private LinearLayout customContainer;
        private TextView titleTextView;
        private ImageView backButton;
        private View noResultsOverlay;
        private SettingsFragment rootFragment;
        private SettingsSearchController searchController;
        private boolean refreshSearchIndexOnResume;
        private final Runnable recommendedFlagsChanged = this::refreshSearchIndex;
        private LinearLayout restartBanner;
        private final Runnable restartStateChanged = this::updateRestartBannerVisibility;
        private String fragmentName;
        private String displayTitle;
        private String targetPreferenceKey;
        private String restoredSearchQuery = "";
        private boolean restoredSearchMode;
        private boolean rootSettings;
        private Object searchBackDispatcher;
        private Object searchBackCallback;
        private boolean searchBackCallbackRegistered;

        public Controller(Activity activity) {
            this.activity = activity;
        }

        @SuppressLint("ResourceType")
        public void setup(Bundle savedInstanceState) {
            Bundle intentExtras = activity.getIntent() == null ? null : activity.getIntent().getExtras();
            String requestedFragmentName = intentExtras == null
                    ? null
                    : intentExtras.getString(Constants.REX_FRAGMENT_NAME);
            String requestedTitle = intentExtras == null
                    ? null
                    : intentExtras.getString(Constants.REX_FRAGMENT_TITLE);
            targetPreferenceKey = intentExtras == null
                    ? null
                    : intentExtras.getString(Constants.REX_SEARCH_TARGET_PREFERENCE_KEY);

            if (savedInstanceState != null) {
                requestedFragmentName = savedInstanceState.getString(STATE_FRAGMENT_NAME, requestedFragmentName);
                displayTitle = savedInstanceState.getString(STATE_DISPLAY_TITLE);
                restoredSearchQuery = savedInstanceState.getString(STATE_SEARCH_QUERY, "");
                restoredSearchMode = savedInstanceState.getBoolean(STATE_SEARCH_MODE, false);
                targetPreferenceKey = savedInstanceState.getString(
                        STATE_TARGET_PREFERENCE_KEY,
                        targetPreferenceKey
                );
            }

            if (displayTitle == null || displayTitle.isEmpty()) {
                displayTitle = str(requestedTitle);
            }
            if (displayTitle == null || displayTitle.isEmpty()) {
                displayTitle = str("rex_title_settings");
            }

            rootSettings = requestedFragmentName == null
                    || Constants.REX_FRAGMENT_SETTINGS.equals(requestedFragmentName);
            fragmentName = requestedFragmentName == null
                    ? Constants.REX_FRAGMENT_SETTINGS
                    : requestedFragmentName;
            createLayout(displayTitle, rootSettings);

            if (activity instanceof androidx.activity.ComponentActivity) {
                try {
                    ((androidx.activity.ComponentActivity) activity).getOnBackPressedDispatcher().addCallback(
                            (androidx.lifecycle.LifecycleOwner) activity,
                            new androidx.activity.OnBackPressedCallback(true) {
                                @Override
                                public void handleOnBackPressed() {
                                    if (exitSearchIfActive()) {
                                        return;
                                    }
                                    if (rootSettings && SettingsRestart.promptRestartIfPending(activity)) {
                                        return;
                                    }
                                    remove();
                                    activity.finish();
                                }
                            }
                    );
                } catch (Throwable ignored) {
                }
            } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                Api33BackHelper.register(activity, () -> {
                    if (exitSearchIfActive()) {
                        return;
                    }
                    if (rootSettings && SettingsRestart.promptRestartIfPending(activity)) {
                        return;
                    }
                    activity.finish();
                });
            }

            SettingsFragment fragment = null;
            if (savedInstanceState != null) {
                android.app.Fragment restoredFragment = activity.getFragmentManager()
                        .findFragmentById(FRAGMENT_CONTAINER_ID);
                if (restoredFragment instanceof SettingsFragment) {
                    fragment = (SettingsFragment) restoredFragment;
                    fragment.updateNavigationArguments(fragmentName, targetPreferenceKey);
                }
            }

            if (Constants.REX_FRAGMENT_ABOUT.equals(fragmentName)) {
                FrameLayout fc = root.findViewById(FRAGMENT_CONTAINER_ID);
                if (fc != null) {
                    fc.removeAllViews();
                    fc.addView(RexAboutView.createAboutScreen(activity), new FrameLayout.LayoutParams(
                            FrameLayout.LayoutParams.MATCH_PARENT,
                            FrameLayout.LayoutParams.MATCH_PARENT
                    ));
                }
                return;
            }
            if (fragment == null && activity.getFragmentManager().findFragmentById(FRAGMENT_CONTAINER_ID) == null) {
                fragment = new SettingsFragment();
                fragment.setArguments(createFragmentArguments());
                if (savedInstanceState != null) {
                    fragment.setInitialSavedState(savedInstanceState.getParcelable(STATE_FRAGMENT_STATE));
                }
                activity.getFragmentManager().beginTransaction()
                        .replace(FRAGMENT_CONTAINER_ID, fragment)
                        .commit();
            }
        }

        private static String resolveSubpageDescription(String fragment) {
            if (fragment == null || Constants.REX_FRAGMENT_ABOUT.equals(fragment)) return "";
            if (Constants.REX_FRAGMENT_GHOST.equals(fragment) || Constants.REX_FRAGMENT_DM.equals(fragment)) {
                return "Enable ghost mode to hide your activity from others";
            }
            if (Constants.REX_FRAGMENT_NOTIFICATION.equals(fragment)) {
                return "Silence push alerts and configure per-channel notification filters";
            }
            if (Constants.REX_FRAGMENT_PRIVACY.equals(fragment)
                    || Constants.REX_FRAGMENT_ADS.equals(fragment)
                    || Constants.REX_FRAGMENT_LINKS.equals(fragment)) {
                return "Extra options to customize your Instagram experience";
            }
            if (Constants.REX_FRAGMENT_GESTURES.equals(fragment)) {
                return "Customize double-tap, swipe, long-press, and zoom gestures";
            }
            if (Constants.REX_FRAGMENT_FEED_AND_STORIES.equals(fragment)
                    || Constants.REX_FRAGMENT_STORY.equals(fragment)) {
                return "Configure feed playback, story behavior, and high-quality media uploads";
            }
            if (Constants.REX_FRAGMENT_UI_TWEAKS.equals(fragment)
                    || Constants.REX_FRAGMENT_FONT.equals(fragment)) {
                return "Customize your app appearance with fonts and emojis";
            }
            if (Constants.REX_FRAGMENT_DISTRACTION_FREE.equals(fragment)
                    || Constants.REX_FRAGMENT_FOCUS_LOCK.equals(fragment)) {
                return "Block distracting content to focus on what matters";
            }
            if (Constants.REX_FRAGMENT_MISC.equals(fragment)
                    || Constants.REX_FRAGMENT_INSTANTS.equals(fragment)) {
                return "Additional features and settings";
            }
            if (Constants.REX_FRAGMENT_DOWNLOAD_MEDIA.equals(fragment)) {
                return "Save media in separate folders and customize download behavior";
            }
            if (Constants.REX_FRAGMENT_DEV_OPTIONS.equals(fragment)
                    || Constants.REX_FRAGMENT_REC_FLAGS.equals(fragment)) {
                return "Manage MetaConfig overrides, experiment mappings, and backup files";
            }
            if (Constants.REX_FRAGMENT_INITIAL_FEATURES.equals(fragment)) {
                return "72 verified Instagram experimental flags across 10 categories with safe presets";
            }
            if (Constants.REX_FRAGMENT_CACHE_CLEANER.equals(fragment)) {
                return "Inspect cache usage, clean temporary media, and configure automatic cache limits";
            }
            return "Configure Rex IG Lite preferences and runtime hooks";
        }

        private Bundle createFragmentArguments() {
            Bundle arguments = new Bundle();
            arguments.putString(Constants.REX_FRAGMENT_NAME, fragmentName);
            arguments.putString(Constants.REX_FRAGMENT_TITLE, displayTitle);
            if (targetPreferenceKey != null && !targetPreferenceKey.isEmpty()) {
                arguments.putString(
                        Constants.REX_SEARCH_TARGET_PREFERENCE_KEY,
                        targetPreferenceKey
                );
            }
            return arguments;
        }

        @SuppressLint("ResourceType")
        private void createLayout(String displayTitle, boolean isRootSettings) {
            root = new FrameLayout(activity);
            root.setBackgroundColor(InstagramPreferenceStyle.backgroundColor());

            LinearLayout page = new LinearLayout(activity);
            page.setOrientation(LinearLayout.VERTICAL);
            page.setBackgroundColor(InstagramPreferenceStyle.backgroundColor());
            root.addView(page, new FrameLayout.LayoutParams(
                    FrameLayout.LayoutParams.MATCH_PARENT,
                    FrameLayout.LayoutParams.MATCH_PARENT
            ));

            InstagramPreferenceStyle.applySystemBarStyle(activity);

            // ---------- Toolbar ----------
            toolbar = new LinearLayout(activity);
            toolbar.setOrientation(LinearLayout.HORIZONTAL);
            toolbar.setGravity(android.view.Gravity.CENTER_VERTICAL);
            toolbar.setLayoutDirection(View.LAYOUT_DIRECTION_LOCALE);
            toolbar.setBackgroundColor(InstagramPreferenceStyle.backgroundColor());

            int toolbarPadding = InstagramPreferenceStyle.dp(activity, 15);
            toolbar.setPadding(toolbarPadding, InstagramPreferenceStyle.dp(activity, 10), toolbarPadding, InstagramPreferenceStyle.dp(activity, 8));

            int iconSize = InstagramPreferenceStyle.dp(activity, 44);

            ImageView toolbarBackBtn = new ImageView(activity);
            toolbarBackBtn.setImageDrawable(RexVectorIcons.create(activity, "rex_vec_arrow-left", InstagramPreferenceStyle.primaryTextColor(), 24));
            toolbarBackBtn.setScaleType(ImageView.ScaleType.CENTER);
            int backPad = InstagramPreferenceStyle.dp(activity, 8);
            toolbarBackBtn.setPadding(backPad, backPad, backPad, backPad);
            toolbarBackBtn.setContentDescription("Back");
            toolbarBackBtn.setOnClickListener(v -> {
                RexHaptics.tap(v);
                if (exitSearchIfActive()) {
                    return;
                }
                if (isRootSettings && SettingsRestart.promptRestartIfPending(activity)) {
                    return;
                }
                activity.finish();
            });
            LinearLayout.LayoutParams tbBackLp = new LinearLayout.LayoutParams(
                    InstagramPreferenceStyle.dp(activity, 44),
                    InstagramPreferenceStyle.dp(activity, 44)
            );
            tbBackLp.gravity = android.view.Gravity.CENTER_VERTICAL;
            tbBackLp.setMarginEnd(InstagramPreferenceStyle.dp(activity, 6));
            toolbar.addView(toolbarBackBtn, tbBackLp);

            titleTextView = new TextView(activity);
            titleTextView.setText(isRootSettings ? "InstaRex Settings" : displayTitle);
            int titleTextSize = isRootSettings ? 22 : 22;
            titleTextView.setTextSize(TypedValue.COMPLEX_UNIT_SP, titleTextSize);
            titleTextView.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            titleTextView.setIncludeFontPadding(false);
            titleTextView.setMaxLines(1);
            titleTextView.setTextDirection(View.TEXT_DIRECTION_LOCALE);
            titleTextView.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
            if (!isRootSettings) {
                titleTextView.setAutoSizeTextTypeUniformWithConfiguration(
                        18,
                        24,
                        1,
                        TypedValue.COMPLEX_UNIT_SP
                );
            }
            LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                    0,
                    LinearLayout.LayoutParams.WRAP_CONTENT,
                    1.0f
            );
            titleParams.gravity = android.view.Gravity.CENTER_VERTICAL;
            titleParams.setMarginStart(InstagramPreferenceStyle.dp(activity, 4));
            titleTextView.setLayoutParams(titleParams);
            titleTextView.setTextColor(InstagramPreferenceStyle.primaryTextColor());

            toolbar.addView(titleTextView);

            int pad = InstagramPreferenceStyle.dp(activity, 8);
            ImageView langBtn = new ImageView(activity);
            langBtn.setImageDrawable(RexVectorIcons.create(activity, "rex_vec_globe", InstagramPreferenceStyle.primaryTextColor(), 24));
            langBtn.setScaleType(ImageView.ScaleType.CENTER);
            langBtn.setPadding(pad, pad, pad, pad);
            langBtn.setContentDescription("App Language & Translator");
            langBtn.setOnClickListener(v -> {
                RexHaptics.tap(v);
                app.morphe.extension.instagram.settings.preference.widgets.RexIcon.pulseIcon(langBtn);
                RexDialogs.showAppLanguagePicker(activity);
            });
            LinearLayout.LayoutParams langLp = new LinearLayout.LayoutParams(
                    InstagramPreferenceStyle.dp(activity, 48),
                    InstagramPreferenceStyle.dp(activity, 48)
            );
            langLp.gravity = android.view.Gravity.CENTER_VERTICAL;
            toolbar.addView(langBtn, langLp);

            customContainer = new LinearLayout(activity);
            customContainer.setOrientation(LinearLayout.VERTICAL);
            customContainer.setBackgroundColor(Color.TRANSPARENT);

            if (isRootSettings) {
                LinearLayout heroBox = new LinearLayout(activity);
                heroBox.setOrientation(LinearLayout.VERTICAL);
                heroBox.setGravity(android.view.Gravity.CENTER_HORIZONTAL);
                heroBox.setPadding(
                        InstagramPreferenceStyle.dp(activity, 16),
                        InstagramPreferenceStyle.dp(activity, 2),
                        InstagramPreferenceStyle.dp(activity, 16),
                        InstagramPreferenceStyle.dp(activity, 12)
                );

                TextView brandTitle = new TextView(activity);
                SpannableStringBuilder ssb = new SpannableStringBuilder("InstaRex");
                ssb.setSpan(new ForegroundColorSpan(0xFFF5F7FA), 0, 5, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                ssb.setSpan(new ForegroundColorSpan(InstagramPreferenceStyle.accentColor()), 5, 8, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                brandTitle.setText(ssb);
                brandTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 38);
                brandTitle.setTypeface(Typeface.create("sans-serif-black", Typeface.BOLD));
                brandTitle.setLetterSpacing(-0.02f);
                brandTitle.setGravity(android.view.Gravity.CENTER);
                brandTitle.setOnClickListener(v -> {
                    RexHaptics.tap(v);
                    RexDialogs.showHomeQuickMenu(activity);
                });
                brandTitle.setOnLongClickListener(v -> {
                    RexHaptics.longPress(v);
                    RexDialogs.showHomeQuickMenu(activity);
                    return true;
                });
                heroBox.addView(brandTitle);

                TextView brandSub = new TextView(activity);
                brandSub.setText("Made with \u2665 " + "by xboyrex");
                brandSub.setTextColor(0xFFA4ACB8);
                brandSub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
                brandSub.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
                brandSub.setGravity(android.view.Gravity.CENTER);
                brandSub.setPadding(0, InstagramPreferenceStyle.dp(activity, 4), 0, 0);
                brandSub.setOnClickListener(v -> {
                    RexHaptics.tap(v);
                    FragmentHook.startFragment(Constants.REX_FRAGMENT_ABOUT);
                });
                heroBox.addView(brandSub);

                TextView versionBadge = new TextView(activity);
                String rawVer = app.morphe.extension.shared.Utils.getPatchesReleaseVersion();
                String verStr = "Rex IG Lite • " + (rawVer == null || rawVer.isEmpty() ? "v3.16.0" : (rawVer.startsWith("v") ? rawVer : "v" + rawVer)) + " • AMOLED Suite";
                versionBadge.setText(verStr);
                versionBadge.setTextColor(0xFF9AA3AE);
                versionBadge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
                versionBadge.setGravity(android.view.Gravity.CENTER);
                versionBadge.setPadding(0, InstagramPreferenceStyle.dp(activity, 2), 0, 0);
                heroBox.addView(versionBadge);

                customContainer.addView(heroBox, new LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        LinearLayout.LayoutParams.WRAP_CONTENT
                ));
            } else {
                String subpageDescription = resolveSubpageDescription(fragmentName);
                if (subpageDescription != null && !subpageDescription.isEmpty()) {
                    TextView subpageDescView = new TextView(activity);
                    subpageDescView.setText(subpageDescription);
                    subpageDescView.setTextColor(InstagramPreferenceStyle.TEXT_SECONDARY_GREY);
                    subpageDescView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
                    subpageDescView.setPadding(
                            InstagramPreferenceStyle.dp(activity, 19),
                            InstagramPreferenceStyle.dp(activity, 2),
                            InstagramPreferenceStyle.dp(activity, 19),
                            InstagramPreferenceStyle.dp(activity, 10)
                    );
                    customContainer.addView(subpageDescView, new LinearLayout.LayoutParams(
                            LinearLayout.LayoutParams.MATCH_PARENT,
                            LinearLayout.LayoutParams.WRAP_CONTENT
                    ));
                }
            }

            page.addView(toolbar, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, InstagramPreferenceStyle.dp(activity, 64)));
            page.addView(customContainer, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));

            // ---------- Content ----------
            contentFrame = new FrameLayout(activity);
            contentFrame.setBackgroundColor(InstagramPreferenceStyle.backgroundColor());
            contentFrame.setClipToPadding(false);

            FrameLayout fragmentContainer = new FrameLayout(activity);
            fragmentContainer.setId(FRAGMENT_CONTAINER_ID);
            fragmentContainer.setBackgroundColor(InstagramPreferenceStyle.backgroundColor());
            fragmentContainer.setClipToPadding(false);
            contentFrame.addView(fragmentContainer, new FrameLayout.LayoutParams(
                    FrameLayout.LayoutParams.MATCH_PARENT,
                    FrameLayout.LayoutParams.MATCH_PARENT
            ));

            noResultsOverlay = InstagramSearchStyle.createNoResultsView(activity);
            noResultsOverlay.setVisibility(View.GONE);
            contentFrame.addView(noResultsOverlay, new FrameLayout.LayoutParams(
                    FrameLayout.LayoutParams.MATCH_PARENT,
                    FrameLayout.LayoutParams.MATCH_PARENT
            ));

            page.addView(contentFrame, new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    0,
                    1f
            ));

            restartBanner = createPersistentRestartBanner();
            page.addView(restartBanner, new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT
            ));
            updateRestartBannerVisibility();

            chromeOverlay = new FrameLayout(activity);
            root.addView(chromeOverlay, new FrameLayout.LayoutParams(
                    FrameLayout.LayoutParams.MATCH_PARENT,
                    FrameLayout.LayoutParams.MATCH_PARENT
            ));

            backButton = new ImageView(activity);
            backButton.setImageDrawable(RexVectorIcons.create(activity, "rex_vec_arrow-left", InstagramPreferenceStyle.primaryTextColor(), 24));
            backButton.setScaleType(ImageView.ScaleType.CENTER);
            backButton.setPaddingRelative(
                    0,
                    0,
                    InstagramPreferenceStyle.dp(activity, 16),
                    0
            );
            backButton.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    RexHaptics.tap(view);
                    if (exitSearchIfActive()) {
                        return;
                    }
                    if (isRootSettings && SettingsRestart.promptRestartIfPending(activity)) {
                        return;
                    }
                    activity.finish();
                }
            });
            backButton.setVisibility(View.GONE);
            FrameLayout.LayoutParams overlayBackParams = new FrameLayout.LayoutParams(
                    iconSize,
                    iconSize
            );
            overlayBackParams.gravity = android.view.Gravity.START | android.view.Gravity.TOP;
            overlayBackParams.setMarginStart(InstagramPreferenceStyle.dp(activity, 15));
            overlayBackParams.topMargin = InstagramPreferenceStyle.dp(activity, 13);
            chromeOverlay.addView(backButton, overlayBackParams);

            root.setOnApplyWindowInsetsListener((v, insets) -> {
                int topInset = insets.getSystemWindowInsetTop();
                int bottomInset = insets.getSystemWindowInsetBottom();

                v.setPadding(0, topInset, 0, 0);

                if (rootFragment != null && rootFragment.listView != null) {
                    rootFragment.applyBottomInset(bottomInset);
                } else {
                    android.app.Fragment f = activity.getFragmentManager().findFragmentById(FRAGMENT_CONTAINER_ID);
                    if (f instanceof SettingsFragment) {
                        ((SettingsFragment) f).applyBottomInset(bottomInset);
                    } else {
                        contentFrame.setPadding(0, 0, 0, bottomInset);
                    }
                }

                return insets;
            });

            activity.setContentView(root);
        }

        void onRootFragmentReady(
                SettingsFragment fragment,
                PreferenceScreen rootScreen
        ) {
            if (!rootSettings || searchController != null) {
                return;
            }

            rootFragment = fragment;
            searchController = new SettingsSearchController(
                    activity,
                    createSearchIndex(fragment, rootScreen),
                    new SettingsSearchController.Listener() {
                        @Override
                        public void onSearchStateChanged(SettingsSearchController.State state) {
                            if (rootFragment != null) {
                                rootFragment.renderSearchState(state);
                            }
                            noResultsOverlay.setVisibility(
                                    state.noResults ? View.VISIBLE : View.GONE
                            );
                        }

                        @Override
                        public void onSearchChromeChanged(boolean inToolbar) {
                            applySearchChromeState(inToolbar);
                        }
                    }
            );
            searchController.attach(chromeOverlay);
            fragment.searchEntryView = searchController.createSearchEntryView();
            chromeOverlay.bringChildToFront(backButton);
            searchController.restore(restoredSearchQuery, restoredSearchMode);
        }

        private SettingsSearchIndex createSearchIndex(
                SettingsFragment fragment,
                PreferenceScreen rootScreen
        ) {
            final PreferenceManager preferenceManager = fragment.getPreferenceManager();
            final Context context = fragment.getActivity();
            return SettingsSearchIndex.create(
                    rootScreen,
                    new SettingsSearchIndex.ScreenFactory() {
                        @Override
                        public PreferenceScreen build(String fragmentName) {
                            String previousSharedPreferencesName =
                                    preferenceManager.getSharedPreferencesName();
                            preferenceManager.setSharedPreferencesName(
                                    Constants.REX_FRAGMENT_REC_FLAGS.equals(fragmentName)
                                            ? Constants.REC_FLAGS
                                            : Constants.SHARED_PREF_NAME
                            );
                            try {
                                PreferenceScreen screen =
                                        preferenceManager.createPreferenceScreen(context);
                                new ScreenBuilder(context, screen, new Helper(context))
                                        .buildFragmentForSearch(fragmentName);
                                return screen;
                            } finally {
                                preferenceManager.setSharedPreferencesName(
                                        previousSharedPreferencesName
                                );
                            }
                        }
                    }
            );
        }

        private LinearLayout createPersistentRestartBanner() {
            LinearLayout bar = new LinearLayout(activity);
            bar.setOrientation(LinearLayout.HORIZONTAL);
            bar.setGravity(android.view.Gravity.CENTER_VERTICAL);
            int hPad = InstagramPreferenceStyle.dp(activity, 16);
            int vPad = InstagramPreferenceStyle.dp(activity, 12);
            bar.setPadding(hPad, vPad, hPad, vPad);
            android.graphics.drawable.GradientDrawable bg = new android.graphics.drawable.GradientDrawable();
            bg.setColor(0xFF141821);
            bg.setStroke(Math.max(1, InstagramPreferenceStyle.dp(activity, 1)), 0x333998E8);
            bar.setBackground(bg);

            TextView msg = new TextView(activity);
            msg.setText("Restart required to apply changes");
            msg.setTextColor(0xFFF5F7FA);
            msg.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            msg.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            LinearLayout.LayoutParams msgLp = new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
            bar.addView(msg, msgLp);

            TextView btn = new TextView(activity);
            btn.setText("Restart Now");
            btn.setTextColor(Color.WHITE);
            btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
            btn.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            int bH = InstagramPreferenceStyle.dp(activity, 14);
            int bV = InstagramPreferenceStyle.dp(activity, 8);
            btn.setPadding(bH, bV, bH, bV);
            android.graphics.drawable.GradientDrawable btnBg = new android.graphics.drawable.GradientDrawable();
            btnBg.setColor(InstagramPreferenceStyle.accentColor());
            btnBg.setCornerRadius(InstagramPreferenceStyle.dp(activity, 18));
            btn.setBackground(btnBg);
            btn.setOnClickListener(v -> {
                RexHaptics.tap(v);
                SettingsRestart.restartNow(activity);
            });
            bar.addView(btn);
            bar.setVisibility(View.GONE);
            return bar;
        }

        void updateRestartBannerVisibility() {
            if (restartBanner == null) return;
            restartBanner.post(() -> {
                boolean show = SettingsRestart.isRestartPending();
                restartBanner.setVisibility(show ? View.VISIBLE : View.GONE);
            });
        }

        void refreshActiveFragmentInPlace() {
            try {
                RexDialogs.clearActivityBlur(activity);
                android.app.Fragment f = activity.getFragmentManager().findFragmentById(FRAGMENT_CONTAINER_ID);
                if (f instanceof SettingsFragment) {
                    ((SettingsFragment) f).rebuildScreenPreservingScroll();
                }
                updateRestartBannerVisibility();
            } catch (Throwable ignored) {}
        }

        public void onPause() {
            RecommendedFlags.removeChangeListener(recommendedFlagsChanged);
            SettingsRestart.removeListener(restartStateChanged);
            refreshSearchIndexOnResume = searchController != null;
        }

        public void onResume() {
            RexDialogs.clearActivityBlur(activity);
            SettingsRestart.addListener(restartStateChanged);
            updateRestartBannerVisibility();
            if (rootSettings) {
                RecommendedFlags.addChangeListener(recommendedFlagsChanged);
            }
            if (refreshSearchIndexOnResume) {
                refreshSearchIndexOnResume = false;
                refreshSearchIndex();
            }
        }

        private void refreshSearchIndex() {
            if (rootFragment != null && searchController != null) {
                searchController.replaceIndex(createSearchIndex(
                        rootFragment,
                        rootFragment.buildScreen(Constants.REX_FRAGMENT_SETTINGS)
                ));
            }
        }

        private void applySearchChromeState(boolean inToolbar) {
            if (inToolbar) {
                registerSearchBackCallback();
            } else {
                unregisterSearchBackCallback();
            }
            titleTextView.setVisibility(inToolbar ? View.GONE : View.VISIBLE);
            if (customContainer != null) {
                customContainer.setVisibility(inToolbar ? View.GONE : View.VISIBLE);
            }
            if (backButton != null) {
                backButton.setVisibility(inToolbar ? View.VISIBLE : View.GONE);
                if (chromeOverlay != null && inToolbar) {
                    chromeOverlay.bringChildToFront(backButton);
                }
            }
        }

        public void onSaveInstanceState(Bundle outState) {
            SettingsSearchController.State searchState = searchController == null
                    ? null
                    : searchController.state();
            outState.putString(STATE_FRAGMENT_NAME, fragmentName);
            outState.putString(STATE_DISPLAY_TITLE, displayTitle);
            outState.putString(
                    STATE_SEARCH_QUERY,
                    searchState == null ? restoredSearchQuery : searchState.query
            );
            outState.putBoolean(
                    STATE_SEARCH_MODE,
                    searchState == null ? restoredSearchMode : searchState.searchMode
            );
            outState.putString(STATE_TARGET_PREFERENCE_KEY, targetPreferenceKey);

            android.app.Fragment fragment = activity.getFragmentManager()
                    .findFragmentById(FRAGMENT_CONTAINER_ID);
            if (fragment instanceof SettingsFragment) {
                outState.putParcelable(
                        STATE_FRAGMENT_STATE,
                        activity.getFragmentManager().saveFragmentInstanceState(fragment)
                );
            }
        }

        public boolean exitSearchIfActive() {
            if (searchController == null
                    || searchController.state() == null
                    || !searchController.state().searchMode) {
                return false;
            }
            searchController.exitSearchMode();
            return true;
        }

        private void registerSearchBackCallback() {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU
                    || searchBackCallbackRegistered) {
                return;
            }

            try {
                Class<?> callbackClass = Class.forName("android.window.OnBackInvokedCallback");
                Class<?> dispatcherClass = Class.forName("android.window.OnBackInvokedDispatcher");
                Object dispatcher = Activity.class
                        .getMethod("getOnBackInvokedDispatcher")
                        .invoke(activity);
                Object callback = Proxy.newProxyInstance(
                        SettingsActivity.class.getClassLoader(),
                        new Class<?>[]{callbackClass},
                        (proxy, method, args) -> {
                            String methodName = method.getName();
                            int parameterCount = method.getParameterTypes().length;
                            if ("hashCode".equals(methodName) && parameterCount == 0) {
                                return System.identityHashCode(proxy);
                            }
                            if ("equals".equals(methodName) && parameterCount == 1) {
                                return proxy == (args == null ? null : args[0]);
                            }
                            if ("toString".equals(methodName) && parameterCount == 0) {
                                return "RexInstagramSettingsSearchBackCallback";
                            }
                            if ("onBackInvoked".equals(methodName)) {
                                exitSearchIfActive();
                            }
                            return null;
                        }
                );
                int priorityDefault = dispatcherClass
                        .getField("PRIORITY_DEFAULT")
                        .getInt(null);
                dispatcher.getClass()
                        .getMethod("registerOnBackInvokedCallback", int.class, callbackClass)
                        .invoke(dispatcher, priorityDefault, callback);
                searchBackDispatcher = dispatcher;
                searchBackCallback = callback;
                searchBackCallbackRegistered = true;
            } catch (Throwable throwable) {
                Logger.printException(
                        () -> "Instagram settings search back callback registration failed",
                        throwable
                );
                searchBackDispatcher = null;
                searchBackCallback = null;
                searchBackCallbackRegistered = false;
            }
        }

        private void unregisterSearchBackCallback() {
            if (!searchBackCallbackRegistered || searchBackCallback == null) {
                return;
            }

            try {
                Class<?> callbackClass = Class.forName("android.window.OnBackInvokedCallback");
                Object dispatcher = searchBackDispatcher;
                if (dispatcher == null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                    dispatcher = Activity.class
                            .getMethod("getOnBackInvokedDispatcher")
                            .invoke(activity);
                }
                if (dispatcher != null) {
                    dispatcher.getClass()
                            .getMethod("unregisterOnBackInvokedCallback", callbackClass)
                            .invoke(dispatcher, searchBackCallback);
                }
            } catch (Throwable throwable) {
                Logger.printException(
                        () -> "Instagram settings search back callback unregistration failed",
                        throwable
                );
            }
            searchBackDispatcher = null;
            searchBackCallback = null;
            searchBackCallbackRegistered = false;
        }

        public void onDestroy() {
            RecommendedFlags.removeChangeListener(recommendedFlagsChanged);
            SettingsRestart.removeListener(restartStateChanged);
            unregisterSearchBackCallback();
        }

        public LinearLayout getCustomContainer() {
            return customContainer;
        }
    }

    public static class SettingsFragment extends PreferenceFragment {

        Context context;
        private PreferenceManager preferenceManager;
        private Helper helper;
        private String fragmentName = Constants.REX_FRAGMENT_SETTINGS;
        private String targetPreferenceKey;
        private ListView listView;
        private View searchEntryView;
        private boolean searchEntryAdded;
        private int lastBottomInset;
        private final SharedPreferences.OnSharedPreferenceChangeListener dependencyListener =
                (preferences, key) -> {
                    helper.updateDependencies(getPreferenceScreen());
                    ScreenBuilder.assignCardGroupPositions(getPreferenceScreen(), fragmentName);
                };

        void applyBottomInset(int bottomInset) {
            this.lastBottomInset = bottomInset;
            if (listView != null && context != null) {
                listView.setClipToPadding(false);
                listView.setPadding(
                        0,
                        listView.getPaddingTop(),
                        0,
                        bottomInset + InstagramPreferenceStyle.dp(context, 76)
                );
            }
        }

        void updateNavigationArguments(String fragmentName, String targetPreferenceKey) {
            this.fragmentName = fragmentName == null
                    ? Constants.REX_FRAGMENT_SETTINGS
                    : fragmentName;
            this.targetPreferenceKey = targetPreferenceKey;

            Bundle arguments = getArguments();
            if (arguments != null) {
                arguments.putString(Constants.REX_FRAGMENT_NAME, this.fragmentName);
                if (targetPreferenceKey == null || targetPreferenceKey.isEmpty()) {
                    arguments.remove(Constants.REX_SEARCH_TARGET_PREFERENCE_KEY);
                } else {
                    arguments.putString(
                            Constants.REX_SEARCH_TARGET_PREFERENCE_KEY,
                            targetPreferenceKey
                    );
                }
            }
        }

        private void refreshPreferenceSummary(
                String key,
                Supplier<CharSequence> summaryProvider
        ) {
            Preference preference = findPreference(key);
            if (preference != null) {
                preference.setSummary(summaryProvider.get());
            }
        }

        @Override
        public void onResume() {
            super.onResume();
            preferenceManager.getSharedPreferences()
                    .registerOnSharedPreferenceChangeListener(dependencyListener);
            helper.updateDependencies(getPreferenceScreen());
            ScreenBuilder.assignCardGroupPositions(getPreferenceScreen(), fragmentName);
            refreshPreferenceSummary(
                    "rex_download_set_path",
                    StorageUtils::getCustomPathForDisplay
            );
            Preference preference = findPreference(Settings.AMOLED_THEME.key);
            if (preference instanceof SwitchPref) {
                SwitchPref amoledPreference = (SwitchPref) preference;
                amoledPreference.setChecked(MaterialYouTheme.isAmoledEnabled());
            }
        }

        @Override
        public void onPause() {
            preferenceManager.getSharedPreferences()
                    .unregisterOnSharedPreferenceChangeListener(dependencyListener);
            super.onPause();
        }

        @Override
        public void onDestroyView() {
            listView = null;
            searchEntryView = null;
            searchEntryAdded = false;
            super.onDestroyView();
        }

        @Override
        public void onCreate(Bundle savedInstanceState) {
            app.morphe.extension.instagram.utils.IgStr.applyLocaleToContext(getActivity());
        super.onCreate(savedInstanceState);

            context = getActivity();
            preferenceManager = getPreferenceManager();
            preferenceManager.setSharedPreferencesName(Constants.SHARED_PREF_NAME);

            if (getArguments() != null) {
                fragmentName = getArguments().getString(
                        Constants.REX_FRAGMENT_NAME,
                        Constants.REX_FRAGMENT_SETTINGS
                );
                targetPreferenceKey = getArguments().getString(
                        Constants.REX_SEARCH_TARGET_PREFERENCE_KEY
                );
            }

            preferenceManager.setSharedPreferencesName(
                    Constants.REX_FRAGMENT_REC_FLAGS.equals(fragmentName)
                            ? Constants.REC_FLAGS
                            : Constants.SHARED_PREF_NAME
            );

            setPreferenceScreen(buildScreen(fragmentName));
        }

        @Override
        public void onActivityCreated(Bundle savedInstanceState) {
            View rootView = getView();
            listView = null;
            if (rootView != null) {
                View list = rootView.findViewById(android.R.id.list);
                if (list instanceof ListView) {
                    listView = (ListView) list;
                }
            }
            styleListView();

            if (rootView != null) {
                rootView.setBackgroundColor(InstagramPreferenceStyle.backgroundColor());
            }

            Activity activity = getActivity();
            Controller controller = getController(activity);
            if (isRootFragment() && controller != null) {
                controller.onRootFragmentReady(
                        this,
                        getPreferenceScreen()
                );
            } else if (listView != null
                    && targetPreferenceKey != null
                    && !targetPreferenceKey.isEmpty()) {
                scrollToPreference(listView, targetPreferenceKey);
            }

            super.onActivityCreated(savedInstanceState);
            styleListView();
        }

        private void styleListView() {
            if (listView == null) return;
            listView.setPadding(
                    0,
                    InstagramPreferenceStyle.dp(context, 8),
                    0,
                    lastBottomInset + InstagramPreferenceStyle.dp(context, 76)
            );
            listView.setClipToPadding(false);
            listView.setDivider(null);
            listView.setDividerHeight(0);
            listView.setSelector(new ColorDrawable(Color.TRANSPARENT));
            listView.setCacheColorHint(Color.TRANSPARENT);
            listView.setBackgroundColor(InstagramPreferenceStyle.backgroundColor());
        }

        void rebuildScreenPreservingScroll() {
            int firstPos = listView != null ? listView.getFirstVisiblePosition() : 0;
            int topOffset = (listView != null && listView.getChildCount() > 0 && listView.getChildAt(0) != null)
                    ? listView.getChildAt(0).getTop() : 0;
            PreferenceScreen rebuilt = buildScreen(fragmentName);
            setPreferenceScreen(rebuilt);
            if (listView != null) {
                rebuilt.bind(listView);
                styleListView();
                listView.setSelectionFromTop(firstPos, topOffset);
            }
        }

        private PreferenceScreen buildScreen(String fragmentName) {
            PreferenceScreen screen = preferenceManager.createPreferenceScreen(context);
            helper = new Helper(context);
            new ScreenBuilder(context, screen, helper).buildFragment(fragmentName);
            helper.updateDependencies(screen);
            ScreenBuilder.assignCardGroupPositions(screen, fragmentName);
            return screen;
        }

        private boolean isRootFragment() {
            return fragmentName == null
                    || Constants.REX_FRAGMENT_SETTINGS.equals(fragmentName);
        }

        private void renderSearchState(SettingsSearchController.State state) {
            if (!isRootFragment() || state == null) {
                return;
            }

            PreferenceScreen screen = preferenceManager.createPreferenceScreen(context);
            if (!state.searchMode) {
                new ScreenBuilder(context, screen, new Helper(context))
                        .buildFragment(Constants.REX_FRAGMENT_SETTINGS);
            } else {
                for (SettingsSearchIndex.Result result : state.results) {
                    SearchResultPreference pref = new SearchResultPreference(
                            context,
                            result
                    );
                    pref.getExtras().putBoolean(InstagramPreferenceStyle.EXTRA_CARD_FIRST, true);
                    pref.getExtras().putBoolean(InstagramPreferenceStyle.EXTRA_CARD_LAST, true);
                    screen.addPreference(pref);
                }
            }
            setPreferenceScreen(screen);
            if (listView != null) {
                if (searchEntryView != null) {
                    if (state.searchMode && searchEntryAdded) {
                        listView.removeHeaderView(searchEntryView);
                        searchEntryAdded = false;
                    } else if (!state.searchMode && !searchEntryAdded) {
                        listView.addHeaderView(searchEntryView, null, false);
                        searchEntryAdded = true;
                    }
                }
                screen.bind(listView);
                listView.setDivider(null);
                listView.setDividerHeight(0);
                listView.setClipToPadding(false);
                listView.setPadding(
                        0,
                        InstagramPreferenceStyle.dp(context, state.searchMode ? 10 : 2),
                        0,
                        lastBottomInset + InstagramPreferenceStyle.dp(context, 76)
                );
            }
        }

        private void scrollToPreference(
                final ListView listView,
                final String preferenceKey
        ) {
            if (findPreference(preferenceKey) == null) {
                return;
            }

            listView.post(new Runnable() {
                @Override
                public void run() {
                    ListAdapter adapter = listView.getAdapter();
                    int position = findPreferencePosition(adapter, preferenceKey);
                    if (position < 0) {
                        return;
                    }

                    listView.setSelectionFromTop(
                            position,
                            InstagramPreferenceStyle.dp(context, 16)
                    );
                }
            });
        }

        private static int findPreferencePosition(
                ListAdapter adapter,
                String preferenceKey
        ) {
            if (adapter == null) {
                return -1;
            }
            for (int position = 0; position < adapter.getCount(); position++) {
                if (isTargetPreference(adapter, position, preferenceKey)) {
                    return position;
                }
            }
            return -1;
        }

        private static boolean isTargetPreference(
                ListAdapter adapter,
                int position,
                String preferenceKey
        ) {
            if (adapter == null || position < 0 || position >= adapter.getCount()) {
                return false;
            }
            Object item = adapter.getItem(position);
            if (!(item instanceof Preference)) {
                return false;
            }
            String itemKey = ((Preference) item).getKey();
            return preferenceKey.equals(itemKey);
        }
    }

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    private static class Api33BackHelper {
        static void register(Activity activity, Runnable onBack) {
            try {
                activity.getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
                        OnBackInvokedDispatcher.PRIORITY_DEFAULT,
                        onBack::run
                );
            } catch (Throwable ignored) {
            }
        }
    }
}
