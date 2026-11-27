package dev.vortexnode.sbrowserx.extension.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;

import dev.vortexnode.sbrowserx.extension.SBrowserXCrxInstaller;
import dev.vortexnode.sbrowserx.extension.SBrowserXGoogleTranslator;
import dev.vortexnode.sbrowserx.extension.SBrowserXHooks;
import dev.vortexnode.sbrowserx.extension.SBrowserXPrefs;
import dev.vortexnode.sbrowserx.extension.SBrowserXStrings;
import dev.vortexnode.sbrowserx.extension.SBrowserXWebRtcManager;

public final class SBrowserXSettingsActivity extends Activity {
    private static final int TEAL_DOT_COLOR = 0xFF00BFA5;
    private static final int ONEUI_BLUE = 0xFF387AFF;
    private static final int REQ_PICK_EXTENSION = 4101;

    private TextView webrtcSummaryView;
    private TextView gtransSummaryView;
    private TextView extDlSummaryView;
    private Switch extDlImagesSwitch;
    private Switch darkBrightSwitch;
    private Switch forceDarkSwitch;
    private TextView compactBtnSummaryView;
    private TextView daysValueView;
    private TextView blurLevelValueView;
    private LinearLayout blurLevelRow;
    private TextView urlBlurLevelValueView;
    private LinearLayout urlBlurLevelRow;
    private TextView compactBlurLevelValueView;
    private LinearLayout compactBlurLevelRow;
    private View extInstallDot, extPackDot, webrtcDot, fingerprintDot, hideAdsDot, gtransDot, extDlDot, amoledDot, forceDarkDot, blurDot;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SBrowserXPrefs.init(this);

        boolean night = SBrowserXHooks.isBrowserNightMode(this);
        boolean amoled = night && SBrowserXPrefs.isAmoledBlackEnabled(this);

        int bgColor = amoled ? 0xFF000000 : (night ? 0xFF0D0D10 : 0xFFF2F2F7);
        int cardColor = amoled ? 0xFF121216 : (night ? 0xFF1C1C22 : 0xFFFFFFFF);
        int textPrimary = night ? 0xFFF5F5F7 : 0xFF111111;
        int textSecondary = night ? 0xFFA2A2AD : 0xFF63636B;
        int accent = ONEUI_BLUE;
        int dialogTheme = night
                ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;

        if (getWindow() != null) {
            getWindow().setStatusBarColor(bgColor);
            getWindow().setNavigationBarColor(bgColor);
        }

        ScrollView scroll = new ScrollView(this);
        scroll.setBackgroundColor(bgColor);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        applyOneUiEdgeToEdgePadding(root, dp(16), dp(14), dp(16), dp(36));

        // One UI 8 Top Bar with circular '<' back button
        root.addView(buildOneUiHeader(this, SBrowserXStrings.get(SBrowserXStrings.TITLE_HUB), night, textPrimary, v -> finish()));

        // --- Extensions (user-requested order: 1. Pack, 2. Manage, 3. CWS, 4. Install from file) ---
        root.addView(sectionHeader(SBrowserXStrings.get(SBrowserXStrings.CAT_EXTENSIONS), textSecondary));
        LinearLayout extCard = card(cardColor);
        extPackDot = createTealDot();
        addActionRow(extCard, SBrowserXStrings.get(SBrowserXStrings.EXT_PACK_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.EXT_PACK_SUMMARY),
                textPrimary, textSecondary, extPackDot, v -> showRecommendedPackDialog(dialogTheme));
        extCard.addView(divider(night));
        addActionRow(extCard, SBrowserXStrings.get(SBrowserXStrings.EXT_MANAGE_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.EXT_MANAGE_SUMMARY),
                textPrimary, textSecondary, null, v -> SBrowserXHooks.openNativeExtensionsActivity(this));
        extCard.addView(divider(night));
        addActionRow(extCard, SBrowserXStrings.get(SBrowserXStrings.EXT_OPEN_CWS),
                SBrowserXStrings.get(SBrowserXStrings.EXT_OPEN_CWS_SUMMARY),
                textPrimary, textSecondary, null, v -> openWebUrlInSelf("https://chromewebstore.google.com/category/extensions"));
        extCard.addView(divider(night));
        extInstallDot = createTealDot();
        addActionRow(extCard, SBrowserXStrings.get(SBrowserXStrings.EXT_INSTALL_FILE),
                SBrowserXStrings.get(SBrowserXStrings.EXT_INSTALL_FILE_SUMMARY),
                textPrimary, textSecondary, extInstallDot, v -> launchFilePicker());
        root.addView(extCard);

        // --- Privacy & Security ---
        root.addView(sectionHeader(SBrowserXStrings.get(SBrowserXStrings.CAT_PRIVACY), textSecondary));
        LinearLayout privacyCard = card(cardColor);
        webrtcDot = createTealDot();
        webrtcSummaryView = addActionRow(privacyCard, SBrowserXStrings.get(SBrowserXStrings.WEBRTC_TITLE),
                SBrowserXStrings.webrtcLabel(SBrowserXPrefs.getWebRtcPolicy(this)),
                textPrimary, textSecondary, webrtcDot,
                v -> startActivity(new Intent(this, SBrowserXWebRtcDialogActivity.class)));
        privacyCard.addView(divider(night));
        fingerprintDot = createTealDot();
        addSwitchRow(privacyCard, SBrowserXStrings.get(SBrowserXStrings.FINGERPRINT_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.FINGERPRINT_SUMMARY),
                SBrowserXPrefs.isFingerprintProtectionEnabled(this), night, textPrimary, textSecondary, fingerprintDot,
                (btn, checked) -> {
                    SBrowserXPrefs.setFingerprintProtectionEnabled(this, checked);
                    SBrowserXWebRtcManager.applyToProfile(this);
                    refreshDynamicViews();
                });

        root.addView(privacyCard);

        // --- Card A: Assistant & Translate ---
        root.addView(sectionHeader(SBrowserXStrings.get(SBrowserXStrings.CAT_ASSIST_TRANSLATE), textSecondary));
        LinearLayout assistCard = card(cardColor);
        addActionRow(assistCard, SBrowserXStrings.get(SBrowserXStrings.ASSIST_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.ASSIST_SUMMARY),
                textPrimary, textSecondary, null,
                v -> startActivity(new Intent(this, SBrowserXBrowsingAssistActivity.class)));
        assistCard.addView(divider(night));
        gtransDot = createTealDot();
        gtransSummaryView = addActionRow(assistCard, SBrowserXStrings.get(SBrowserXStrings.GTRANS_SETTINGS_TITLE),
                buildTranslateSummary(),
                textPrimary, textSecondary, gtransDot,
                v -> startActivity(new Intent(this, SBrowserXTranslateSettingsActivity.class)));
        root.addView(assistCard);

        // --- Card B: Downloads & Tabs ---
        root.addView(sectionHeader(SBrowserXStrings.get(SBrowserXStrings.CAT_DOWNLOADS_TABS), textSecondary));
        LinearLayout dlTabsCard = card(cardColor);
        extDlDot = createTealDot();
        extDlSummaryView = addActionRow(dlTabsCard, SBrowserXStrings.get(SBrowserXStrings.EXT_DL_TITLE),
                SBrowserXHooks.getExternalDownloaderSummary(this),
                textPrimary, textSecondary, extDlDot,
                v -> startActivity(new Intent(this, SBrowserXExternalDownloaderDialogActivity.class)));
        dlTabsCard.addView(divider(night));
        extDlImagesSwitch = addSwitchRow(dlTabsCard, SBrowserXStrings.get(SBrowserXStrings.EXT_DL_IMAGES_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.EXT_DL_IMAGES_SUMMARY),
                SBrowserXPrefs.isExternalDownloaderImagesEnabled(this), night, textPrimary, textSecondary, null,
                (btn, checked) -> {
                    SBrowserXPrefs.setExternalDownloaderImagesEnabled(this, checked);
                    refreshDynamicViews();
                });
        dlTabsCard.addView(divider(night));
        addSwitchRow(dlTabsCard, SBrowserXStrings.get(SBrowserXStrings.UNLIMITED_TABS_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.UNLIMITED_TABS_SUMMARY),
                SBrowserXPrefs.isUnlimitedTabsEnabled(this), night, textPrimary, textSecondary, null,
                (btn, checked) -> SBrowserXPrefs.setUnlimitedTabsEnabled(this, checked));
        dlTabsCard.addView(divider(night));
        addSwitchRow(dlTabsCard, SBrowserXStrings.get(SBrowserXStrings.TEXT_REFLOW_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.TEXT_REFLOW_SUMMARY),
                SBrowserXPrefs.isTextReflowOnZoomEnabled(this), night, textPrimary, textSecondary, null,
                (btn, checked) -> SBrowserXPrefs.setTextReflowOnZoomEnabled(this, checked));
        root.addView(dlTabsCard);

        // --- Card C: Backup & Sync ---
        root.addView(sectionHeader(SBrowserXStrings.get(SBrowserXStrings.CAT_BACKUP_SECTION), textSecondary));
        LinearLayout backupCard = card(cardColor);
        addActionRow(backupCard, SBrowserXStrings.get(SBrowserXStrings.SYNC_BACKUP_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.SYNC_BACKUP_SUMMARY),
                textPrimary, textSecondary, null,
                v -> startActivity(new Intent(this, SBrowserXBackupActivity.class)));
        root.addView(backupCard);

        // --- Appearance & UI ---
        root.addView(sectionHeader(SBrowserXStrings.get(SBrowserXStrings.CAT_APPEARANCE), textSecondary));
        LinearLayout appearanceCard = card(cardColor);
        addActionRow(appearanceCard, SBrowserXStrings.get(SBrowserXStrings.SP_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.SP_SUMMARY),
                textPrimary, textSecondary, null,
                v -> startActivity(new Intent(this, SBrowserXStartPageSettingsActivity.class)));
        appearanceCard.addView(divider(night));
        amoledDot = createTealDot();
        addSwitchRow(appearanceCard, SBrowserXStrings.get(SBrowserXStrings.AMOLED_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.AMOLED_SUMMARY),
                SBrowserXPrefs.isAmoledBlackEnabled(this), night, textPrimary, textSecondary, amoledDot,
                (btn, checked) -> {
                    SBrowserXPrefs.setAmoledBlackEnabled(this, checked);
                    refreshDynamicViews();
                });

        appearanceCard.addView(divider(night));
        boolean isCompactLayout = SBrowserXHooks.isCompactLayoutActivePublic();
        blurDot = createTealDot();
        Switch swBottomBlur = addSwitchRow(appearanceCard, SBrowserXStrings.get(SBrowserXStrings.BOTTOM_BLUR_TITLE),
                isCompactLayout ? SBrowserXStrings.get(SBrowserXStrings.LAYOUT_ONLY_STANDARD)
                        : SBrowserXStrings.get(SBrowserXStrings.BOTTOM_BLUR_SUMMARY),
                SBrowserXPrefs.isBottomBarBlurEnabled(this), night, textPrimary, textSecondary, blurDot,
                (btn, checked) -> {
                    SBrowserXPrefs.setBottomBarBlurEnabled(this, checked);
                    refreshDynamicViews();
                });
        if (isCompactLayout) {
            swBottomBlur.setEnabled(false);
            ((View) swBottomBlur.getParent()).setAlpha(0.42f);
            ((View) swBottomBlur.getParent()).setClickable(false);
        }
        appearanceCard.addView(divider(night));
        addBlurTransparencySliderRow(appearanceCard, textPrimary);
        if (isCompactLayout && blurLevelRow != null) {
            blurLevelRow.setEnabled(false);
            blurLevelRow.setAlpha(0.42f);
        }
        appearanceCard.addView(divider(night));
        Switch swUrlBlur = addSwitchRow(appearanceCard, SBrowserXStrings.get(SBrowserXStrings.URL_BAR_BLUR_TITLE),
                isCompactLayout ? SBrowserXStrings.get(SBrowserXStrings.LAYOUT_ONLY_STANDARD)
                        : SBrowserXStrings.get(SBrowserXStrings.URL_BAR_BLUR_SUMMARY),
                SBrowserXPrefs.isUrlBarBlurEnabled(this), night, textPrimary, textSecondary, null,
                (btn, checked) -> {
                    SBrowserXPrefs.setUrlBarBlurEnabled(this, checked);
                    refreshDynamicViews();
                });
        if (isCompactLayout) {
            swUrlBlur.setEnabled(false);
            ((View) swUrlBlur.getParent()).setAlpha(0.42f);
            ((View) swUrlBlur.getParent()).setClickable(false);
        }
        appearanceCard.addView(divider(night));
        addUrlBarTransparencySliderRow(appearanceCard, textPrimary);
        if (isCompactLayout && urlBlurLevelRow != null) {
            urlBlurLevelRow.setEnabled(false);
            urlBlurLevelRow.setAlpha(0.42f);
        }
        appearanceCard.addView(divider(night));
        Switch swCompactBlur = addSwitchRow(appearanceCard, SBrowserXStrings.get(SBrowserXStrings.COMPACT_BAR_BLUR_TITLE),
                !isCompactLayout ? SBrowserXStrings.get(SBrowserXStrings.LAYOUT_ONLY_COMPACT)
                        : SBrowserXStrings.get(SBrowserXStrings.COMPACT_BAR_BLUR_SUMMARY),
                SBrowserXPrefs.isCompactBarBlurEnabled(this), night, textPrimary, textSecondary, null,
                (btn, checked) -> {
                    SBrowserXPrefs.setCompactBarBlurEnabled(this, checked);
                    refreshDynamicViews();
                });
        if (!isCompactLayout) {
            swCompactBlur.setEnabled(false);
            ((View) swCompactBlur.getParent()).setAlpha(0.42f);
            ((View) swCompactBlur.getParent()).setClickable(false);
        }
        appearanceCard.addView(divider(night));
        addCompactBarTransparencySliderRow(appearanceCard, textPrimary);
        if (!isCompactLayout && compactBlurLevelRow != null) {
            compactBlurLevelRow.setEnabled(false);
            compactBlurLevelRow.setAlpha(0.42f);
        }
        appearanceCard.addView(divider(night));
        compactBtnSummaryView = addActionRow(appearanceCard, SBrowserXStrings.get(SBrowserXStrings.COMPACT_AI_BTN_TITLE),
                isCompactLayout
                        ? SBrowserXStrings.compactButtonLabel(SBrowserXPrefs.getCompactAiButton(this))
                        : SBrowserXStrings.get(SBrowserXStrings.LAYOUT_ONLY_COMPACT),
                textPrimary, textSecondary, null,
                isCompactLayout ? v -> startActivity(new Intent(this, SBrowserXCompactButtonDialogActivity.class)) : null);
        if (!isCompactLayout && compactBtnSummaryView != null && compactBtnSummaryView.getParent() instanceof View) {
            ((View) compactBtnSummaryView.getParent()).setAlpha(0.42f);
        }
        root.addView(appearanceCard);

        // --- New Features Highlight ---
        root.addView(sectionHeader(SBrowserXStrings.get(SBrowserXStrings.CAT_HIGHLIGHT), textSecondary));
        LinearLayout highlightCard = card(cardColor);
        addDaysSliderRow(highlightCard, textPrimary, textSecondary);
        highlightCard.addView(divider(night));
        addActionRow(highlightCard, SBrowserXStrings.get(SBrowserXStrings.MARK_ALL_VIEWED),
                null, textPrimary, textSecondary, null, v -> {
                    SBrowserXPrefs.markAllViewed(this);
                    refreshDynamicViews();
                    Toast.makeText(this, SBrowserXStrings.get(SBrowserXStrings.MARK_ALL_VIEWED_DONE), Toast.LENGTH_SHORT).show();
                });
        root.addView(highlightCard);

        // --- Restart ---
        LinearLayout restartCard = card(cardColor);
        LinearLayout.LayoutParams rlp = (LinearLayout.LayoutParams) restartCard.getLayoutParams();
        rlp.topMargin = dp(16);
        addActionRow(restartCard, SBrowserXStrings.get(SBrowserXStrings.RESTART_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.RESTART_SUMMARY),
                textPrimary, textSecondary, null, v -> SBrowserXWebRtcManager.restartBrowser(this));
        root.addView(restartCard);

        scroll.addView(root);
        setContentView(scroll);
        refreshDynamicViews();
    }

    @Override
    protected void onResume() {
        super.onResume();
        refreshDynamicViews();
    }

    private String buildTranslateSummary() {
        boolean on = SBrowserXPrefs.isGoogleTranslateEnabled(this);
        String lang = SBrowserXGoogleTranslator.getLanguageDisplayName(SBrowserXPrefs.getTranslateTargetLang(this));
        String state = on ? SBrowserXStrings.get(SBrowserXStrings.BTN_ENABLE) : SBrowserXStrings.get(SBrowserXStrings.BTN_DISABLE);
        return state + " • " + lang;
    }

    private void launchFilePicker() {
        SBrowserXPrefs.markFeatureViewed(this, SBrowserXPrefs.FEATURE_EXT_INSTALLER);
        refreshDynamicViews();
        try {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType("*/*");
            startActivityForResult(intent, REQ_PICK_EXTENSION);
        } catch (Throwable t) {
            Toast.makeText(this, SBrowserXStrings.get(SBrowserXStrings.EXT_INSTALL_FAIL) + t.getMessage(), Toast.LENGTH_LONG).show();
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQ_PICK_EXTENSION && resultCode == RESULT_OK && data != null && data.getData() != null) {
            Toast.makeText(this, SBrowserXStrings.get(SBrowserXStrings.EXT_INSTALLING), Toast.LENGTH_SHORT).show();
            SBrowserXCrxInstaller.installFromUri(this, data.getData(), (ok, msg) -> {
                String toast = ok
                        ? SBrowserXStrings.get(SBrowserXStrings.EXT_INSTALL_OK) + " (" + msg + ")"
                        : SBrowserXStrings.get(SBrowserXStrings.EXT_INSTALL_FAIL) + msg;
                Toast.makeText(this, toast, Toast.LENGTH_LONG).show();
            });
        }
    }

    private void showRecommendedPackDialog(int theme) {
        SBrowserXPrefs.markFeatureViewed(this, SBrowserXPrefs.FEATURE_EXT_PACK);
        refreshDynamicViews();
        String[][] items = SBrowserXCrxInstaller.RECOMMENDED_EXTENSIONS;
        String[] labels = new String[items.length];
        boolean[] checked = new boolean[items.length];
        for (int i = 0; i < items.length; i++) {
            labels[i] = items[i][1];
            checked[i] = true;
        }

        new AlertDialog.Builder(this, theme)
                .setTitle(SBrowserXStrings.get(SBrowserXStrings.EXT_PACK_TITLE))
                .setMultiChoiceItems(labels, checked, (dialog, which, isChecked) -> checked[which] = isChecked)
                .setPositiveButton(SBrowserXStrings.get(SBrowserXStrings.BTN_INSTALL), (dialog, which) -> {
                    List<String> selectedIds = new ArrayList<>();
                    for (int i = 0; i < items.length; i++) {
                        if (checked[i]) selectedIds.add(items[i][0]);
                    }
                    if (selectedIds.isEmpty()) return;
                    Toast.makeText(this, SBrowserXStrings.get(SBrowserXStrings.EXT_INSTALLING), Toast.LENGTH_SHORT).show();
                    SBrowserXCrxInstaller.installFromChromeWebStore(this, selectedIds, (ok, msg) -> {
                        String toast = ok
                                ? SBrowserXStrings.get(SBrowserXStrings.EXT_INSTALL_OK) + " (" + msg + ")"
                                : SBrowserXStrings.get(SBrowserXStrings.EXT_INSTALL_FAIL) + msg;
                        Toast.makeText(this, toast, Toast.LENGTH_LONG).show();
                    });
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void openWebUrlInSelf(String url) {
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
            intent.setPackage(getPackageName());
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(intent);
            finish();
        } catch (Throwable t) {
            Toast.makeText(this, t.getMessage(), Toast.LENGTH_SHORT).show();
        }
    }

    private void refreshDynamicViews() {
        if (webrtcSummaryView != null) {
            webrtcSummaryView.setText(SBrowserXStrings.webrtcLabel(SBrowserXPrefs.getWebRtcPolicy(this)));
        }
        if (gtransSummaryView != null) {
            gtransSummaryView.setText(buildTranslateSummary());
        }
        if (extDlSummaryView != null) {
            extDlSummaryView.setText(SBrowserXHooks.getExternalDownloaderSummary(this));
        }
        if (extDlImagesSwitch != null) {
            boolean dlOn = SBrowserXPrefs.isExternalDownloaderEnabled(this);
            extDlImagesSwitch.setEnabled(dlOn);
            if (extDlImagesSwitch.getParent() instanceof View) {
                ((View) extDlImagesSwitch.getParent()).setAlpha(dlOn ? 1.0f : 0.42f);
            }
        }
        if (compactBtnSummaryView != null) {
            boolean isC = SBrowserXHooks.isCompactLayoutActivePublic();
            compactBtnSummaryView.setText(isC
                    ? SBrowserXStrings.compactButtonLabel(SBrowserXPrefs.getCompactAiButton(this))
                    : SBrowserXStrings.get(SBrowserXStrings.LAYOUT_ONLY_COMPACT));
        }
        if (extDlImagesSwitch != null && extDlImagesSwitch.getParent() instanceof View) {
            boolean extOn = SBrowserXPrefs.isExternalDownloaderEnabled(this);
            ((View) extDlImagesSwitch.getParent()).setAlpha(extOn ? 1.0f : 0.45f);
        }
        setDot(extInstallDot, SBrowserXPrefs.FEATURE_EXT_INSTALLER);
        setDot(extPackDot, SBrowserXPrefs.FEATURE_EXT_PACK);
        setDot(webrtcDot, SBrowserXPrefs.FEATURE_WEBRTC);
        setDot(fingerprintDot, SBrowserXPrefs.FEATURE_FINGERPRINT);
        setDot(hideAdsDot, SBrowserXPrefs.FEATURE_HIDE_ADBLOCKERS);
        setDot(gtransDot, SBrowserXPrefs.FEATURE_GOOGLE_TRANSLATE);
        setDot(extDlDot, SBrowserXPrefs.FEATURE_EXT_DOWNLOADER);
        setDot(amoledDot, SBrowserXPrefs.FEATURE_AMOLED);
        setDot(blurDot, SBrowserXPrefs.FEATURE_BOTTOM_BLUR);
        if (blurLevelValueView != null) {
            boolean blurOn = SBrowserXPrefs.isBottomBarBlurEnabled(this);
            int pct = SBrowserXPrefs.getBottomBarTransparency(this);
            blurLevelValueView.setText(pct + "%");
            if (blurLevelRow != null) {
                blurLevelRow.setAlpha(blurOn ? 1.0f : 0.45f);
            }
        }
        if (urlBlurLevelValueView != null) {
            boolean urlBlurOn = SBrowserXPrefs.isUrlBarBlurEnabled(this);
            int pct = SBrowserXPrefs.getUrlBarTransparency(this);
            urlBlurLevelValueView.setText(pct + "%");
            if (urlBlurLevelRow != null) {
                urlBlurLevelRow.setAlpha(urlBlurOn ? 1.0f : 0.45f);
            }
        }
        if (compactBlurLevelValueView != null) {
            boolean compactOn = SBrowserXPrefs.isCompactBarBlurEnabled(this);
            int pct = SBrowserXPrefs.getCompactBarTransparency(this);
            compactBlurLevelValueView.setText(pct + "%");
            if (compactBlurLevelRow != null) {
                compactBlurLevelRow.setAlpha(compactOn ? 1.0f : 0.45f);
            }
        }
        if (daysValueView != null) {
            int days = SBrowserXPrefs.getHighlightDays(this);
            daysValueView.setText(days == 0
                    ? SBrowserXStrings.get(SBrowserXStrings.HIGHLIGHT_DAYS_OFF)
                    : String.format(SBrowserXStrings.get(SBrowserXStrings.HIGHLIGHT_DAYS_FMT), days));
        }
    }

    private void setDot(View dot, String feat) {
        if (dot != null) {
            dot.setVisibility(SBrowserXPrefs.isFeatureNew(this, feat) ? View.VISIBLE : View.GONE);
        }
    }

    private View createTealDot() {
        View dot = new View(this);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(dp(8), dp(8));
        lp.leftMargin = dp(8);
        dot.setLayoutParams(lp);
        GradientDrawable gd = new GradientDrawable();
        gd.setShape(GradientDrawable.OVAL);
        gd.setColor(TEAL_DOT_COLOR);
        dot.setBackground(gd);
        return dot;
    }

    private TextView sectionHeader(String text, int color) {
        TextView tv = new TextView(this);
        tv.setText(text);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        tv.setTypeface(Typeface.DEFAULT_BOLD);
        tv.setTextColor(color);
        tv.setPadding(dp(14), dp(14), dp(14), dp(6));
        return tv;
    }

    private LinearLayout card(int bgColor) {
        LinearLayout ll = new LinearLayout(this);
        ll.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable gd = new GradientDrawable();
        gd.setColor(bgColor);
        gd.setCornerRadius(dp(22));
        ll.setBackground(gd);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        ll.setLayoutParams(lp);
        return ll;
    }

    private View divider(boolean night) {
        View v = new View(this);
        v.setBackgroundColor(night ? 0xFF2A2A32 : 0xFFE5E5EA);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, 1);
        lp.leftMargin = dp(18);
        lp.rightMargin = dp(18);
        v.setLayoutParams(lp);
        return v;
    }

    private TextView addActionRow(
            LinearLayout parent, String title, String summary, int titleColor, int summaryColor,
            View badgeDot, View.OnClickListener onClick
    ) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(dp(18), dp(15), dp(18), dp(15));
        row.setOnClickListener(onClick);

        LinearLayout titleRow = new LinearLayout(this);
        titleRow.setOrientation(LinearLayout.HORIZONTAL);
        titleRow.setGravity(Gravity.CENTER_VERTICAL);
        TextView tvTitle = new TextView(this);
        tvTitle.setText(title);
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        tvTitle.setTextColor(titleColor);
        titleRow.addView(tvTitle);
        if (badgeDot != null) titleRow.addView(badgeDot);
        row.addView(titleRow);

        TextView tvSummary = null;
        if (summary != null) {
            tvSummary = new TextView(this);
            tvSummary.setText(summary);
            tvSummary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            tvSummary.setTextColor(summaryColor);
            tvSummary.setPadding(0, dp(3), 0, 0);
            row.addView(tvSummary);
        }

        parent.addView(row);
        return tvSummary;
    }

    private Switch addSwitchRow(
            LinearLayout parent, String title, String summary, boolean initialValue, boolean night,
            int titleColor, int summaryColor, View badgeDot,
            android.widget.CompoundButton.OnCheckedChangeListener listener
    ) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(18), dp(14), dp(14), dp(14));

        LinearLayout textCol = new LinearLayout(this);
        textCol.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams colLp = new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
        colLp.rightMargin = dp(12);
        textCol.setLayoutParams(colLp);

        LinearLayout titleRow = new LinearLayout(this);
        titleRow.setOrientation(LinearLayout.HORIZONTAL);
        titleRow.setGravity(Gravity.CENTER_VERTICAL);
        TextView tvTitle = new TextView(this);
        tvTitle.setText(title);
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        tvTitle.setTextColor(titleColor);
        titleRow.addView(tvTitle);
        if (badgeDot != null) titleRow.addView(badgeDot);
        textCol.addView(titleRow);

        TextView tvSummary = new TextView(this);
        tvSummary.setText(summary);
        tvSummary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        tvSummary.setTextColor(summaryColor);
        tvSummary.setPadding(0, dp(3), 0, 0);
        textCol.addView(tvSummary);

        Switch sw = new Switch(this);
        styleOneUiBlueSwitch(sw, night);
        sw.setChecked(initialValue);
        sw.setOnCheckedChangeListener(listener);

        row.addView(textCol);
        row.addView(sw);
        row.setOnClickListener(v -> sw.toggle());
        parent.addView(row);
        return sw;
    }

    static void applyOneUiEdgeToEdgePadding(View target, int leftPx, int extraTopPx, int rightPx, int extraBottomPx) {
        target.setPadding(leftPx, extraTopPx, rightPx, extraBottomPx);
        target.setOnApplyWindowInsetsListener((v, insets) -> {
            int topInset = 0;
            int bottomInset = 0;
            if (android.os.Build.VERSION.SDK_INT >= 30) {
                android.graphics.Insets sys = insets.getInsets(
                        android.view.WindowInsets.Type.statusBars() | android.view.WindowInsets.Type.displayCutout());
                android.graphics.Insets nav = insets.getInsets(android.view.WindowInsets.Type.navigationBars());
                topInset = sys.top;
                bottomInset = nav.bottom;
            } else {
                topInset = insets.getSystemWindowInsetTop();
                bottomInset = insets.getSystemWindowInsetBottom();
            }
            v.setPadding(leftPx, topInset + extraTopPx, rightPx, bottomInset + extraBottomPx);
            return insets;
        });
        target.requestApplyInsets();
    }

    static android.graphics.drawable.Drawable createOneUiBackChevron(float density, int color) {
        return new android.graphics.drawable.Drawable() {
            private final android.graphics.Paint paint = new android.graphics.Paint(android.graphics.Paint.ANTI_ALIAS_FLAG);
            private final android.graphics.Path path = new android.graphics.Path();
            {
                paint.setStyle(android.graphics.Paint.Style.STROKE);
                paint.setStrokeWidth(1.9f * density);
                paint.setStrokeCap(android.graphics.Paint.Cap.ROUND);
                paint.setStrokeJoin(android.graphics.Paint.Join.ROUND);
                paint.setColor(color);
            }
            @Override
            public void draw(android.graphics.Canvas canvas) {
                android.graphics.Rect b = getBounds();
                float cx = b.exactCenterX();
                float cy = b.exactCenterY();
                float halfH = 7.2f * density;
                float halfW = 3.6f * density;
                path.reset();
                path.moveTo(cx + halfW, cy - halfH);
                path.lineTo(cx - halfW, cy);
                path.lineTo(cx + halfW, cy + halfH);
                canvas.drawPath(path, paint);
            }
            @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
            @Override public void setColorFilter(android.graphics.ColorFilter cf) { paint.setColorFilter(cf); }
            @Override public int getOpacity() { return android.graphics.PixelFormat.TRANSLUCENT; }
        };
    }

    static LinearLayout buildOneUiHeader(
            Activity act, String titleText, boolean night, int textPrimary, View.OnClickListener onBack
    ) {
        float d = act.getResources().getDisplayMetrics().density;
        LinearLayout header = new LinearLayout(act);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setPadding(0, Math.round(6 * d), Math.round(4 * d), Math.round(18 * d));

        android.widget.ImageView backBtn = new android.widget.ImageView(act);
        backBtn.setImageDrawable(createOneUiBackChevron(d, textPrimary));
        backBtn.setScaleType(android.widget.ImageView.ScaleType.FIT_XY);
        TypedValue ripple = new TypedValue();
        act.getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, ripple, true);
        if (ripple.resourceId != 0) backBtn.setBackgroundResource(ripple.resourceId);
        int sz = Math.round(36 * d);
        LinearLayout.LayoutParams blp = new LinearLayout.LayoutParams(sz, sz);
        blp.rightMargin = Math.round(8 * d);
        backBtn.setLayoutParams(blp);
        backBtn.setOnClickListener(onBack);
        header.addView(backBtn);

        TextView title = new TextView(act);
        title.setText(titleText);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 21);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        title.setTextColor(textPrimary);
        title.setLayoutParams(new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        header.addView(title);
        dev.vortexnode.sbrowserx.extension.SBrowserXRestartManager.attachToCustomHeader(act, header, night);
        return header;
    }

    static void styleOneUiSeekBar(SeekBar sb, boolean night) {
        float d = sb.getResources().getDisplayMetrics().density;
        int trackH = Math.max(4, Math.round(6 * d));
        int thumbSz = Math.round(20 * d);
        int radius = Math.round(999 * d);

        GradientDrawable trackBg = new GradientDrawable();
        trackBg.setShape(GradientDrawable.RECTANGLE);
        trackBg.setCornerRadius(radius);
        trackBg.setColor(night ? 0xFF3A3B42 : 0xFFD8DCE6);
        trackBg.setSize(-1, trackH);

        GradientDrawable progGrad = new GradientDrawable(
                GradientDrawable.Orientation.LEFT_RIGHT,
                new int[] { 0xFF2962FF, 0xFF387AFF, 0xFF63A4FF });
        progGrad.setShape(GradientDrawable.RECTANGLE);
        progGrad.setCornerRadius(radius);
        progGrad.setSize(-1, trackH);

        android.graphics.drawable.ClipDrawable progClip =
                new android.graphics.drawable.ClipDrawable(progGrad, Gravity.START, android.graphics.drawable.ClipDrawable.HORIZONTAL);

        android.graphics.drawable.LayerDrawable layers =
                new android.graphics.drawable.LayerDrawable(new android.graphics.drawable.Drawable[] { trackBg, progClip });
        layers.setId(0, android.R.id.background);
        layers.setId(1, android.R.id.progress);
        if (android.os.Build.VERSION.SDK_INT >= 23) {
            layers.setLayerHeight(0, trackH);
            layers.setLayerHeight(1, trackH);
            layers.setLayerGravity(0, Gravity.CENTER_VERTICAL);
            layers.setLayerGravity(1, Gravity.CENTER_VERTICAL);
        }

        GradientDrawable thumb = new GradientDrawable();
        thumb.setShape(GradientDrawable.OVAL);
        thumb.setSize(thumbSz, thumbSz);
        thumb.setColor(0xFFFFFFFF);
        thumb.setStroke(Math.max(2, Math.round(2.5f * d)), 0xFF387AFF);

        sb.setProgressDrawable(layers);
        sb.setThumb(thumb);
        sb.setSplitTrack(false);
        sb.setThumbOffset(Math.round(thumbSz / 2f));
    }

    static void styleOneUiBlueSwitch(Switch sw, boolean night) {
        float d = sw.getResources().getDisplayMetrics().density;
        int trackW = Math.round(46 * d);
        int trackH = Math.round(26 * d);
        int trackR = Math.round(13 * d);
        int thumbSize = Math.round(24 * d);
        int strokeW = Math.round(2 * d);

        GradientDrawable trackOn = new GradientDrawable();
        trackOn.setShape(GradientDrawable.RECTANGLE);
        trackOn.setSize(trackW, trackH);
        trackOn.setCornerRadius(trackR);
        trackOn.setColor(ONEUI_BLUE);

        GradientDrawable trackOff = new GradientDrawable();
        trackOff.setShape(GradientDrawable.RECTANGLE);
        trackOff.setSize(trackW, trackH);
        trackOff.setCornerRadius(trackR);
        trackOff.setColor(night ? 0xFF555562 : 0xFFB8B8C4);

        StateListDrawable trackStates = new StateListDrawable();
        trackStates.addState(new int[] { android.R.attr.state_checked }, trackOn);
        trackStates.addState(new int[] {}, trackOff);

        GradientDrawable thumb = new GradientDrawable();
        thumb.setShape(GradientDrawable.OVAL);
        thumb.setSize(thumbSize, thumbSize);
        thumb.setColor(0xFFFFFFFF);
        thumb.setStroke(strokeW, 0x00000000);

        sw.setTrackTintList(null);
        sw.setThumbTintList(null);
        sw.setTrackDrawable(trackStates);
        sw.setThumbDrawable(thumb);
    }

    private void addBlurTransparencySliderRow(LinearLayout parent, int titleColor) {
        blurLevelRow = new LinearLayout(this);
        blurLevelRow.setOrientation(LinearLayout.VERTICAL);
        blurLevelRow.setPadding(dp(18), dp(14), dp(18), dp(14));

        LinearLayout top = new LinearLayout(this);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);

        TextView tvTitle = new TextView(this);
        tvTitle.setText(SBrowserXStrings.get(SBrowserXStrings.BOTTOM_BLUR_LEVEL_TITLE));
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        tvTitle.setTextColor(titleColor);
        tvTitle.setLayoutParams(new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        top.addView(tvTitle);

        blurLevelValueView = new TextView(this);
        blurLevelValueView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        blurLevelValueView.setTextColor(ONEUI_BLUE);
        top.addView(blurLevelValueView);
        blurLevelRow.addView(top);

        SeekBar sb = new SeekBar(this);
        styleOneUiSeekBar(sb, SBrowserXHooks.isBrowserNightMode(this));
        sb.setMax(70); // 15% .. 85%
        sb.setProgress(Math.max(0, Math.min(70, SBrowserXPrefs.getBottomBarTransparency(this) - 15)));
        sb.setPadding(0, dp(10), 0, dp(4));
        sb.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (fromUser) {
                    SBrowserXPrefs.setBottomBarTransparency(SBrowserXSettingsActivity.this, progress + 15);
                    refreshDynamicViews();
                }
            }
            @Override public void onStartTrackingTouch(SeekBar seekBar) {}
            @Override public void onStopTrackingTouch(SeekBar seekBar) {}
        });
        blurLevelRow.addView(sb);
        parent.addView(blurLevelRow);
    }

    private void addUrlBarTransparencySliderRow(LinearLayout parent, int titleColor) {
        urlBlurLevelRow = new LinearLayout(this);
        urlBlurLevelRow.setOrientation(LinearLayout.VERTICAL);
        urlBlurLevelRow.setPadding(dp(18), dp(14), dp(18), dp(14));

        LinearLayout top = new LinearLayout(this);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);

        TextView tvTitle = new TextView(this);
        tvTitle.setText(SBrowserXStrings.get(SBrowserXStrings.URL_BAR_BLUR_LEVEL_TITLE));
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        tvTitle.setTextColor(titleColor);
        tvTitle.setLayoutParams(new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        top.addView(tvTitle);

        urlBlurLevelValueView = new TextView(this);
        urlBlurLevelValueView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        urlBlurLevelValueView.setTextColor(ONEUI_BLUE);
        top.addView(urlBlurLevelValueView);
        urlBlurLevelRow.addView(top);

        SeekBar sb = new SeekBar(this);
        styleOneUiSeekBar(sb, SBrowserXHooks.isBrowserNightMode(this));
        sb.setMax(70); // 15% .. 85%
        sb.setProgress(Math.max(0, Math.min(70, SBrowserXPrefs.getUrlBarTransparency(this) - 15)));
        sb.setPadding(0, dp(10), 0, dp(4));
        sb.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (fromUser) {
                    SBrowserXPrefs.setUrlBarTransparency(SBrowserXSettingsActivity.this, progress + 15);
                    refreshDynamicViews();
                }
            }
            @Override public void onStartTrackingTouch(SeekBar seekBar) {}
            @Override public void onStopTrackingTouch(SeekBar seekBar) {}
        });
        urlBlurLevelRow.addView(sb);
        parent.addView(urlBlurLevelRow);
    }

    private void addCompactBarTransparencySliderRow(LinearLayout parent, int titleColor) {
        compactBlurLevelRow = new LinearLayout(this);
        compactBlurLevelRow.setOrientation(LinearLayout.VERTICAL);
        compactBlurLevelRow.setPadding(dp(18), dp(14), dp(18), dp(14));

        LinearLayout top = new LinearLayout(this);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);

        TextView tvTitle = new TextView(this);
        tvTitle.setText(SBrowserXStrings.get(SBrowserXStrings.COMPACT_BAR_BLUR_LEVEL_TITLE));
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        tvTitle.setTextColor(titleColor);
        tvTitle.setLayoutParams(new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        top.addView(tvTitle);

        compactBlurLevelValueView = new TextView(this);
        compactBlurLevelValueView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        compactBlurLevelValueView.setTextColor(ONEUI_BLUE);
        top.addView(compactBlurLevelValueView);
        compactBlurLevelRow.addView(top);

        SeekBar sb = new SeekBar(this);
        styleOneUiSeekBar(sb, SBrowserXHooks.isBrowserNightMode(this));
        sb.setMax(70); // 15% .. 85%
        sb.setProgress(Math.max(0, Math.min(70, SBrowserXPrefs.getCompactBarTransparency(this) - 15)));
        sb.setPadding(0, dp(10), 0, dp(4));
        sb.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (fromUser) {
                    SBrowserXPrefs.setCompactBarTransparency(SBrowserXSettingsActivity.this, progress + 15);
                    refreshDynamicViews();
                }
            }
            @Override public void onStartTrackingTouch(SeekBar seekBar) {}
            @Override public void onStopTrackingTouch(SeekBar seekBar) {}
        });
        compactBlurLevelRow.addView(sb);
        parent.addView(compactBlurLevelRow);
    }

    private void addDaysSliderRow(LinearLayout parent, int titleColor, int summaryColor) {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setPadding(dp(18), dp(14), dp(18), dp(14));

        LinearLayout top = new LinearLayout(this);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);

        TextView tvTitle = new TextView(this);
        tvTitle.setText(SBrowserXStrings.get(SBrowserXStrings.HIGHLIGHT_DAYS_TITLE));
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        tvTitle.setTextColor(titleColor);
        tvTitle.setLayoutParams(new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        top.addView(tvTitle);

        daysValueView = new TextView(this);
        daysValueView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        daysValueView.setTextColor(ONEUI_BLUE);
        top.addView(daysValueView);
        box.addView(top);

        SeekBar sb = new SeekBar(this);
        styleOneUiSeekBar(sb, SBrowserXHooks.isBrowserNightMode(this));
        sb.setMax(10);
        sb.setProgress(SBrowserXPrefs.getHighlightDays(this));
        sb.setPadding(0, dp(10), 0, dp(4));
        sb.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (fromUser) {
                    SBrowserXPrefs.setHighlightDays(SBrowserXSettingsActivity.this, progress);
                    refreshDynamicViews();
                }
            }
            @Override public void onStartTrackingTouch(SeekBar seekBar) {}
            @Override public void onStopTrackingTouch(SeekBar seekBar) {}
        });
        box.addView(sb);
        parent.addView(box);
    }

    private int dp(int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, getResources().getDisplayMetrics()));
    }
}
