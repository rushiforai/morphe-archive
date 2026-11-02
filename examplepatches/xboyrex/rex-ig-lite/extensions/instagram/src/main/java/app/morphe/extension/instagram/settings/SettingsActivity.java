/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 */
package app.morphe.extension.instagram.settings;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.preference.Preference;
import android.preference.PreferenceFragment;
import android.preference.PreferenceManager;
import android.preference.PreferenceScreen;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import java.util.function.Supplier;

import app.morphe.extension.rex.downloader.StorageUtils;
import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.constants.UI;
import app.morphe.extension.instagram.settings.preference.Helper;
import app.morphe.extension.instagram.settings.preference.ScreenBuilder;
import app.morphe.extension.instagram.settings.preference.widgets.InstagramPreferenceStyle;
import app.morphe.extension.instagram.settings.preference.widgets.SwitchPref;
import app.morphe.extension.instagram.theme.MaterialYouTheme;
import app.morphe.extension.instagram.ui.RexAboutView;
import app.morphe.extension.instagram.ui.RexDialogs;
import app.morphe.extension.instagram.ui.RexVectorIcons;

public class SettingsActivity extends Activity {

    private LinearLayout root;
    private LinearLayout toolbar;
    private LinearLayout content;
    private LinearLayout customContainer;
    private TextView titleTextView;

    @SuppressLint("ResourceType")
    @Override
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);

        String displayTitle = null;
        String fragmentName = null;

        if (getIntent() != null && getIntent().getExtras() != null) {
            String rawTitle = getIntent().getStringExtra(Constants.REX_FRAGMENT_TITLE);
            if (rawTitle != null) {
                displayTitle = rawTitle.startsWith("rex_") ? str(rawTitle) : rawTitle;
            }
            fragmentName = getIntent().getStringExtra(Constants.REX_FRAGMENT_NAME);
        }

        if (displayTitle == null || displayTitle.isEmpty()) {
            displayTitle = "xboyrex Settings";
        }

        boolean isRootSettings = fragmentName == null || Constants.REX_FRAGMENT_SETTINGS.equals(fragmentName);
        boolean isAboutScreen = Constants.REX_FRAGMENT_ABOUT.equals(fragmentName);

        createLayout(displayTitle, isRootSettings, isAboutScreen);

        if (isAboutScreen) {
            content.addView(RexAboutView.create(this), new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT
            ));
        } else if (bundle == null) {
            SettingsFragment fragment = new SettingsFragment();
            if (getIntent() != null && getIntent().getExtras() != null) {
                fragment.setArguments(getIntent().getExtras());
            }

            getFragmentManager().beginTransaction().replace(1001, fragment).commit();
        }
    }

    @SuppressLint("ResourceType")
    private void createLayout(String displayTitle, boolean isRootSettings, boolean isAboutScreen) {
        int bgColor = isAboutScreen ? 0xFF0A0E10 : InstagramPreferenceStyle.backgroundColor();

        root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(bgColor);

        InstagramPreferenceStyle.applySystemBarStyle(this);
        if (isAboutScreen && getWindow() != null) {
            getWindow().setStatusBarColor(0xFF0A0E10);
            getWindow().setNavigationBarColor(0xFF0A0E10);
        }

        // ---------- Toolbar ----------
        toolbar = new LinearLayout(this);
        toolbar.setBackgroundColor(bgColor);

        ImageView back = new ImageView(this);
        back.setImageDrawable(RexVectorIcons.get(
                this,
                RexVectorIcons.IC_ARROW_LEFT,
                isAboutScreen ? Color.WHITE : InstagramPreferenceStyle.primaryTextColor(),
                24
        ));
        back.setOnClickListener(v -> finish());

        titleTextView = new TextView(this);
        titleTextView.setText(displayTitle);
        InstagramPreferenceStyle.applyToolbarLayout(
                this, toolbar, back, titleTextView, isRootSettings);
        titleTextView.setTextColor(isAboutScreen ? Color.WHITE : InstagramPreferenceStyle.primaryTextColor());
        if (isAboutScreen) {
            titleTextView.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
            titleTextView.setPadding(InstagramPreferenceStyle.dp(this, 8), 0, 0, 0);
            titleTextView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 21f);
            titleTextView.setTypeface(Typeface.create("sans-serif-black", Typeface.BOLD));
        }

        toolbar.addView(back);
        toolbar.addView(titleTextView);

        if (!isAboutScreen) {
            ImageView translateBtn = new ImageView(this);
            translateBtn.setScaleType(ImageView.ScaleType.CENTER);
            translateBtn.setPadding(
                    InstagramPreferenceStyle.dp(this, 6),
                    InstagramPreferenceStyle.dp(this, 6),
                    InstagramPreferenceStyle.dp(this, 6),
                    InstagramPreferenceStyle.dp(this, 6)
            );
            LinearLayout.LayoutParams trParams = new LinearLayout.LayoutParams(
                    InstagramPreferenceStyle.dp(this, 40),
                    InstagramPreferenceStyle.dp(this, 40)
            );
            trParams.gravity = Gravity.CENTER_VERTICAL;
            translateBtn.setLayoutParams(trParams);
            translateBtn.setImageDrawable(RexVectorIcons.get(
                    this,
                    RexVectorIcons.IC_TRANSLATE,
                    InstagramPreferenceStyle.primaryTextColor(),
                    22
            ));
            translateBtn.setOnClickListener(v -> RexDialogs.showTranslatorLanguagePicker(this, null));
            toolbar.addView(translateBtn);
        }

        // ---------- Custom Container (Hero Banner on Root Screen) ----------
        customContainer = new LinearLayout(this);
        customContainer.setOrientation(LinearLayout.VERTICAL);
        customContainer.setBackgroundColor(Color.TRANSPARENT);

        if (isRootSettings) {
            customContainer.addView(createHeroBanner());
        }

        root.addView(toolbar);
        root.addView(customContainer, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.WRAP_CONTENT
        ));

        // ---------- Content ----------
        content = new LinearLayout(this);
        content.setId(1001);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setBackgroundColor(bgColor);

        root.addView(content, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT,
                LinearLayout.LayoutParams.MATCH_PARENT,
                1
        ));

        root.setOnApplyWindowInsetsListener(new View.OnApplyWindowInsetsListener() {
            @Override
            public WindowInsets onApplyWindowInsets(View v, WindowInsets insets) {
                int topInset = insets.getSystemWindowInsetTop();
                int bottomInset = insets.getSystemWindowInsetBottom();

                v.setPadding(0, topInset, 0, 0);

                content.setPadding(
                        content.getPaddingLeft(),
                        content.getPaddingTop(),
                        content.getPaddingRight(),
                        bottomInset
                );

                return insets;
            }
        });

        setContentView(root);
    }

    /**
     * Distinct two-tone xboyrex Hero Banner:
     * "xboy" in crisp White/Black + "rex" in Liquid Glass Electric Cyan (#88C2CE),
     * with Mayank's signature subtitle underneath.
     */
    private View createHeroBanner() {
        LinearLayout banner = new LinearLayout(this);
        banner.setOrientation(LinearLayout.VERTICAL);
        banner.setGravity(Gravity.CENTER);
        int padH = InstagramPreferenceStyle.dp(this, 16);
        int padTop = InstagramPreferenceStyle.dp(this, 14);
        int padBot = InstagramPreferenceStyle.dp(this, 18);
        banner.setPadding(padH, padTop, padH, padBot);

        TextView brandView = new TextView(this);
        SpannableStringBuilder ssb = new SpannableStringBuilder("xboyrex");
        int firstColor = UI.isDarkMode() ? Color.WHITE : Color.BLACK;
        int secondColor = 0xFF88C2CE; // Liquid Glass Cyan (matching 23424_0f7360.jpg)
        ssb.setSpan(new ForegroundColorSpan(firstColor), 0, 4, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        ssb.setSpan(new ForegroundColorSpan(secondColor), 4, ssb.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        brandView.setText(ssb);
        brandView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 33f);
        brandView.setTypeface(Typeface.create("sans-serif-black", Typeface.BOLD));
        brandView.setGravity(Gravity.CENTER);
        banner.addView(brandView);

        TextView subView = new TextView(this);
        subView.setText("Made with ⚡ By ㅤᏞᴀᴢʏㅤᎷꫝʏᴀɴк まやんく");
        subView.setTextColor(0xFF9BB4BC);
        subView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        subView.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        subView.setGravity(Gravity.CENTER);
        LinearLayout.LayoutParams subLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        subLp.topMargin = InstagramPreferenceStyle.dp(this, 4);
        subView.setLayoutParams(subLp);
        banner.addView(subView);

        return banner;
    }

    public LinearLayout getCustomContainer() {
        return customContainer;
    }

    public static class SettingsFragment extends PreferenceFragment {

        Context context;

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
            refreshPreferenceSummary(
                    "rex_download_set_path",
                    StorageUtils::getCustomPathForDisplay
            );
            Preference preference = findPreference(Settings.AMOLED_THEME.key);
            if (preference instanceof SwitchPref) {
                SwitchPref amoledPreference = (SwitchPref) preference;
                amoledPreference.setChecked(MaterialYouTheme.isAmoledEnabled());
                amoledPreference.setSwitchInteractionEnabled(
                        MaterialYouTheme.canEnableAmoled(getActivity())
                );
            }
        }

        @Override
        public void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);

            context = getActivity();
            PreferenceManager preferenceManager = getPreferenceManager();
            PreferenceScreen screen = preferenceManager.createPreferenceScreen(context);
            preferenceManager.setSharedPreferencesName(Constants.SHARED_PREF_NAME);

            Helper helper = new Helper(context);
            ScreenBuilder screenBuilder = new ScreenBuilder(context, screen, helper);

            String fragment_name = Constants.REX_FRAGMENT_SETTINGS;
            if (getArguments() != null) {
                fragment_name = getArguments().getString(Constants.REX_FRAGMENT_NAME, Constants.REX_FRAGMENT_SETTINGS);
            }
            if (fragment_name.equals(Constants.REX_FRAGMENT_SETTINGS)) {
                screenBuilder.buildSettingsPage();
            } else if (fragment_name.equals(Constants.REX_FRAGMENT_GHOST)) {
                screenBuilder.ghostSection();
            } else if (fragment_name.equals(Constants.REX_FRAGMENT_NOTIFICATION) || fragment_name.equals(Constants.REX_FRAGMENT_DM)) {
                screenBuilder.notificationSection();
            } else if (fragment_name.equals(Constants.REX_FRAGMENT_PRIVACY) || fragment_name.equals(Constants.REX_FRAGMENT_ADS) || fragment_name.equals(Constants.REX_FRAGMENT_LINKS)) {
                screenBuilder.privacySection();
            } else if (fragment_name.equals(Constants.REX_FRAGMENT_GESTURES)) {
                screenBuilder.gesturesSection();
            } else if (fragment_name.equals(Constants.REX_FRAGMENT_FEED_STORIES) || fragment_name.equals(Constants.REX_FRAGMENT_STORY)) {
                screenBuilder.feedAndStoriesSection();
            } else if (fragment_name.equals(Constants.REX_FRAGMENT_UI_TWEAKS)) {
                screenBuilder.uiTweaksSection();
            } else if (fragment_name.equals(Constants.REX_FRAGMENT_FOCUS_MODE) || fragment_name.equals(Constants.REX_FRAGMENT_DISTRACTION_FREE)) {
                screenBuilder.distractionFreeSection();
            } else if (fragment_name.equals(Constants.REX_FRAGMENT_FOCUS_LOCK)) {
                screenBuilder.buildFocusLockSection();
            } else if (fragment_name.equals(Constants.REX_FRAGMENT_MISC)) {
                screenBuilder.buildMiscSection();
            } else if (fragment_name.equals(Constants.REX_FRAGMENT_DOWNLOAD_MEDIA)) {
                screenBuilder.buildDownloadSection();
            } else if (fragment_name.equals(Constants.REX_FRAGMENT_NAV_BTNS)) {
                screenBuilder.buildNavigationSection();
            } else if (fragment_name.equals(Constants.REX_FRAGMENT_DEV_OPTIONS)) {
                screenBuilder.buildDeveloperSection();
            } else if (fragment_name.equals(Constants.REX_FRAGMENT_ABOUT) || fragment_name.equals(Constants.REX_FRAGMENT_BACKUP)) {
                screenBuilder.aboutSection(SettingsStatus.FLAGS);
            } else if (fragment_name.equals(Constants.REX_FRAGMENT_ACTION_BAR)) {
                screenBuilder.buildActionBarSection();
            } else if (fragment_name.equals(Constants.REX_FRAGMENT_FILTER_CONTENT)) {
                screenBuilder.filterContentSection();
            } else if (fragment_name.equals(Constants.REX_FRAGMENT_REC_FLAGS)) {
                preferenceManager.setSharedPreferencesName(Constants.REC_FLAGS);
                screenBuilder.buildRecommendedFlagsSection();
            } else if (fragment_name.equals(Constants.REX_FRAGMENT_INSTANTS)) {
                screenBuilder.buildInstantsSection();
            } else if (fragment_name.equals(Constants.REX_FRAGMENT_FONT)) {
                screenBuilder.buildFontSection();
            }

            setPreferenceScreen(screen);
        }

        @Override
        public void onActivityCreated(Bundle savedInstanceState) {
            super.onActivityCreated(savedInstanceState);

            View rootView = getView();
            ListView listView = null;
            if (rootView != null) {
                View list = rootView.findViewById(android.R.id.list);
                if (list instanceof ListView) {
                    listView = (ListView) list;
                }
            }
            if (listView != null) {
                listView.setPadding(0, InstagramPreferenceStyle.dp(context, 4), 0, InstagramPreferenceStyle.dp(context, 16));
                listView.setClipToPadding(false);
                listView.setDivider(null);
                listView.setDividerHeight(0);
                listView.setSelector(new ColorDrawable(Color.TRANSPARENT));
                listView.setCacheColorHint(Color.TRANSPARENT);
                listView.setBackgroundColor(InstagramPreferenceStyle.backgroundColor());
            }

            if (rootView != null) {
                rootView.setBackgroundColor(InstagramPreferenceStyle.backgroundColor());
            }
        }
    }
}
