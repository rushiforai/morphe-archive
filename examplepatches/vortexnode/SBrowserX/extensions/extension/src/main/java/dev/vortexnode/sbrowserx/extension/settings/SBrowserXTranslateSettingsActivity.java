package dev.vortexnode.sbrowserx.extension.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import dev.vortexnode.sbrowserx.extension.SBrowserXGoogleTranslator;
import dev.vortexnode.sbrowserx.extension.SBrowserXHooks;
import dev.vortexnode.sbrowserx.extension.SBrowserXPrefs;
import dev.vortexnode.sbrowserx.extension.SBrowserXStrings;

public final class SBrowserXTranslateSettingsActivity extends Activity {
    private static final int ONEUI_BLUE = 0xFF387AFF;

    private TextView engineSummary;
    private TextView apiKeySummary;
    private TextView targetLangSummary;
    private TextView neverLangsSummary;
    private TextView alwaysLangsSummary;
    private Switch masterSwitch;
    private Switch autoSwitch;
    private int dialogTheme;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SBrowserXPrefs.init(this);
        SBrowserXPrefs.markFeatureViewed(this, SBrowserXPrefs.FEATURE_GOOGLE_TRANSLATE);

        boolean night = SBrowserXHooks.isBrowserNightMode(this);
        boolean amoled = night && SBrowserXPrefs.isAmoledBlackEnabled(this);

        int bgColor = amoled ? 0xFF000000 : (night ? 0xFF0D0D10 : 0xFFF2F2F7);
        int cardColor = amoled ? 0xFF121216 : (night ? 0xFF1C1C22 : 0xFFFFFFFF);
        int textPrimary = night ? 0xFFF5F5F7 : 0xFF111111;
        int textSecondary = night ? 0xFFA2A2AD : 0xFF63636B;
        dialogTheme = night
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
        SBrowserXSettingsActivity.applyOneUiEdgeToEdgePadding(root, dp(16), dp(14), dp(16), dp(36));
        root.addView(SBrowserXSettingsActivity.buildOneUiHeader(
                this, SBrowserXStrings.get(SBrowserXStrings.GTRANS_SETTINGS_TITLE), night, textPrimary, v -> finish()));

        LinearLayout mainCard = card(cardColor);
        masterSwitch = addSwitchRow(mainCard,
                SBrowserXStrings.get(SBrowserXStrings.GTRANS_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.GTRANS_SUMMARY),
                SBrowserXPrefs.isGoogleTranslateEnabled(this), night, textPrimary, textSecondary,
                (btn, checked) -> SBrowserXPrefs.setGoogleTranslateEnabled(this, checked));
        mainCard.addView(divider(night));
        autoSwitch = addSwitchRow(mainCard,
                SBrowserXStrings.get(SBrowserXStrings.GTRANS_AUTO_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.GTRANS_AUTO_SUMMARY),
                SBrowserXPrefs.isTranslateAutoEnabled(this), night, textPrimary, textSecondary,
                (btn, checked) -> SBrowserXPrefs.setTranslateAutoEnabled(this, checked));
        root.addView(mainCard);

        LinearLayout langCard = card(cardColor);
        LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) langCard.getLayoutParams();
        lp.topMargin = dp(16);

        engineSummary = addActionRow(langCard,
                isRu() ? "Движок перевода" : "Translation engine",
                "", textPrimary, textSecondary, v -> showEnginePicker());
        langCard.addView(divider(night));
        apiKeySummary = addActionRow(langCard,
                isRu() ? "API-ключ (DeepL / Gemini, опционально)" : "API Key (DeepL / Gemini, optional)",
                "", textPrimary, textSecondary, v -> showApiKeyDialog());
        langCard.addView(divider(night));
        targetLangSummary = addActionRow(langCard,
                SBrowserXStrings.get(SBrowserXStrings.GTRANS_TARGET_LANG),
                "", textPrimary, textSecondary, v -> showTargetLangPicker());
        langCard.addView(divider(night));
        neverLangsSummary = addActionRow(langCard,
                SBrowserXStrings.get(SBrowserXStrings.GTRANS_NEVER_LANGS),
                "", textPrimary, textSecondary, v -> showMultiLangPicker(true));
        langCard.addView(divider(night));
        alwaysLangsSummary = addActionRow(langCard,
                SBrowserXStrings.get(SBrowserXStrings.GTRANS_ALWAYS_LANGS),
                "", textPrimary, textSecondary, v -> showMultiLangPicker(false));
        langCard.addView(divider(night));
        addActionRow(langCard,
                SBrowserXStrings.get(SBrowserXStrings.GTRANS_RESET),
                null, ONEUI_BLUE, textSecondary, v -> {
                    SBrowserXPrefs.resetTranslateSettings(this);
                    refresh();
                    Toast.makeText(this, SBrowserXStrings.get(SBrowserXStrings.GTRANS_RESET_DONE), Toast.LENGTH_SHORT).show();
                });
        root.addView(langCard);

        scroll.addView(root);
        setContentView(scroll);
        refresh();
    }

    @Override
    protected void onResume() {
        super.onResume();
        refresh();
        showTranslateGuideDialogIfNeeded(this);
    }

    public static void showTranslateGuideDialogIfNeeded(Activity act) {
        if (act == null || act.isFinishing() || SBrowserXPrefs.isTranslateGuideAcked(act)) return;
        boolean night = SBrowserXHooks.isBrowserNightMode(act);
        int theme = night ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;
        float dens = act.getResources().getDisplayMetrics().density;
        int padH = Math.round(24 * dens);
        int padV = Math.round(12 * dens);

        android.widget.ScrollView sv = new android.widget.ScrollView(act);
        android.widget.LinearLayout box = new android.widget.LinearLayout(act);
        box.setOrientation(android.widget.LinearLayout.VERTICAL);
        box.setPadding(padH, padV, padH, Math.round(6 * dens));

        android.widget.TextView tv = new android.widget.TextView(act);
        tv.setText(SBrowserXStrings.getTransGuideBody());
        tv.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP, 15.8f);
        tv.setLineSpacing(Math.round(4 * dens), 1.05f);
        tv.setTextColor(night ? 0xFFF1F3F5 : 0xFF18181B);
        box.addView(tv);

        int oneUiBlue = night ? 0xFF3E82F7 : 0xFF0381FE;
        int uncheckedCol = night ? 0xFF6B7280 : 0xFF9CA3AF;
        android.content.res.ColorStateList cbTint = new android.content.res.ColorStateList(
                new int[][] { new int[] { android.R.attr.state_checked }, new int[] {} },
                new int[] { oneUiBlue, uncheckedCol });
        android.widget.CheckBox cb = new android.widget.CheckBox(act);
        cb.setText(SBrowserXStrings.getTransGuideCheck());
        cb.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP, 16f);
        cb.setTypeface(android.graphics.Typeface.create("sans-serif-medium", android.graphics.Typeface.NORMAL));
        cb.setTextColor(night ? 0xFFFFFFFF : 0xFF111827);
        cb.setButtonTintList(cbTint);
        cb.setPadding(Math.round(8 * dens), Math.round(18 * dens), 0, Math.round(8 * dens));
        box.addView(cb);

        sv.addView(box);

        android.app.AlertDialog dlg = new android.app.AlertDialog.Builder(act, theme)
                .setTitle(SBrowserXStrings.getTransGuideTitle())
                .setView(sv)
                .setCancelable(false)
                .setPositiveButton(android.R.string.ok, (d, w) -> {
                    SBrowserXPrefs.setTranslateGuideAcked(act, true);
                })
                .create();
        dlg.setCanceledOnTouchOutside(false);
        dlg.setOnShowListener(di -> {
            android.widget.Button okBtn = dlg.getButton(android.app.AlertDialog.BUTTON_POSITIVE);
            if (okBtn != null) {
                okBtn.setEnabled(false);
                okBtn.setAlpha(0.4f);
                okBtn.setTextSize(android.util.TypedValue.COMPLEX_UNIT_SP, 16f);
                cb.setOnCheckedChangeListener((btn, checked) -> {
                    okBtn.setEnabled(checked);
                    okBtn.setAlpha(checked ? 1.0f : 0.4f);
                    okBtn.setTextColor(checked ? oneUiBlue : uncheckedCol);
                });
            }
        });
        dlg.show();
    }


    private void refresh() {
        masterSwitch.setChecked(SBrowserXPrefs.isGoogleTranslateEnabled(this));
        autoSwitch.setChecked(SBrowserXPrefs.isTranslateAutoEnabled(this));
        engineSummary.setText(getEngineLabel(SBrowserXPrefs.getTranslateEngine(this)));
        apiKeySummary.setText(formatApiKeySummary(SBrowserXPrefs.getTranslateApiKey(this)));
        targetLangSummary.setText(SBrowserXGoogleTranslator.getLanguageDisplayName(
                SBrowserXPrefs.getTranslateTargetLang(this)));
        neverLangsSummary.setText(formatLangSet(SBrowserXPrefs.getTranslateNeverLangs(this)));
        alwaysLangsSummary.setText(formatLangSet(SBrowserXPrefs.getTranslateAlwaysLangs(this)));
    }

    private String formatLangSet(Set<String> codes) {
        if (codes == null || codes.isEmpty()) {
            return SBrowserXStrings.get(SBrowserXStrings.GTRANS_NONE);
        }
        List<String> names = new ArrayList<>();
        for (String[] pair : SBrowserXGoogleTranslator.SUPPORTED_LANGUAGES) {
            if (codes.contains(pair[0])) {
                names.add(pair[1]);
            }
        }
        if (names.isEmpty()) return SBrowserXStrings.get(SBrowserXStrings.GTRANS_NONE);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < names.size(); i++) {
            if (i > 0) sb.append(", ");
            sb.append(names.get(i));
        }
        return sb.toString();
    }

    private void showTargetLangPicker() {
        String[][] langs = SBrowserXGoogleTranslator.SUPPORTED_LANGUAGES;
        String[] labels = new String[langs.length];
        String current = SBrowserXPrefs.getTranslateTargetLang(this);
        int selected = 0;
        for (int i = 0; i < langs.length; i++) {
            labels[i] = langs[i][1];
            if (langs[i][0].equalsIgnoreCase(current)) selected = i;
        }
        new AlertDialog.Builder(this, dialogTheme)
                .setTitle(SBrowserXStrings.get(SBrowserXStrings.GTRANS_TARGET_LANG))
                .setSingleChoiceItems(labels, selected, (dialog, which) -> {
                    SBrowserXPrefs.setTranslateTargetLang(this, langs[which][0]);
                    refresh();
                    dialog.dismiss();
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void showMultiLangPicker(boolean isNever) {
        String[][] langs = SBrowserXGoogleTranslator.SUPPORTED_LANGUAGES;
        String[] labels = new String[langs.length];
        boolean[] checked = new boolean[langs.length];
        Set<String> current = isNever
                ? SBrowserXPrefs.getTranslateNeverLangs(this)
                : SBrowserXPrefs.getTranslateAlwaysLangs(this);
        for (int i = 0; i < langs.length; i++) {
            labels[i] = langs[i][1];
            checked[i] = current.contains(langs[i][0]);
        }
        new AlertDialog.Builder(this, dialogTheme)
                .setTitle(SBrowserXStrings.get(isNever ? SBrowserXStrings.GTRANS_NEVER_LANGS : SBrowserXStrings.GTRANS_ALWAYS_LANGS))
                .setMultiChoiceItems(labels, checked, (dialog, which, isChecked) -> checked[which] = isChecked)
                .setPositiveButton(android.R.string.ok, (dialog, which) -> {
                    java.util.HashSet<String> out = new java.util.HashSet<>();
                    for (int i = 0; i < langs.length; i++) {
                        if (checked[i]) out.add(langs[i][0]);
                    }
                    if (isNever) {
                        SBrowserXPrefs.setTranslateNeverLangs(this, out);
                    } else {
                        SBrowserXPrefs.setTranslateAlwaysLangs(this, out);
                    }
                    refresh();
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private LinearLayout card(int bgColor) {
        LinearLayout ll = new LinearLayout(this);
        ll.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable gd = new GradientDrawable();
        gd.setColor(bgColor);
        gd.setCornerRadius(dp(22));
        ll.setBackground(gd);
        ll.setLayoutParams(new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
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
            View.OnClickListener onClick
    ) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(dp(18), dp(15), dp(18), dp(15));
        row.setOnClickListener(onClick);

        TextView tvTitle = new TextView(this);
        tvTitle.setText(title);
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        tvTitle.setTextColor(titleColor);
        row.addView(tvTitle);

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
            int titleColor, int summaryColor,
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

        TextView tvTitle = new TextView(this);
        tvTitle.setText(title);
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        tvTitle.setTextColor(titleColor);
        textCol.addView(tvTitle);

        TextView tvSummary = new TextView(this);
        tvSummary.setText(summary);
        tvSummary.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        tvSummary.setTextColor(summaryColor);
        tvSummary.setPadding(0, dp(3), 0, 0);
        textCol.addView(tvSummary);

        Switch sw = new Switch(this);
        SBrowserXSettingsActivity.styleOneUiBlueSwitch(sw, night);
        sw.setChecked(initialValue);
        sw.setOnCheckedChangeListener(listener);

        row.addView(textCol);
        row.addView(sw);
        row.setOnClickListener(v -> sw.toggle());
        parent.addView(row);
        return sw;
    }

    private int dp(int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, getResources().getDisplayMetrics()));
    }

    private boolean isRu() {
        String l = SBrowserXStrings.getAppLang();
        return "ru".equals(l) || "uk".equals(l);
    }

    private String getEngineLabel(String engine) {
        if ("bing".equalsIgnoreCase(engine) || "microsoft".equalsIgnoreCase(engine)) return "Bing Translator (Web NMT)";
        if ("yandex".equalsIgnoreCase(engine)) return "Yandex Translate (Web NMT)";
        if ("deepl".equalsIgnoreCase(engine)) return "DeepL API (Free / Pro)";
        if ("gemini".equalsIgnoreCase(engine)) return "Gemini 3.5 Flash-Lite (AI ★)";
        return "Google Translate (Chrome NMT)";
    }

    private String formatApiKeySummary(String key) {
        if (key == null || key.isEmpty()) {
            return isRu() ? "Не задан (нужен только для DeepL / Gemini)" : "Not set (only needed for DeepL / Gemini)";
        }
        int len = key.length();
        String tail = len > 4 ? key.substring(len - 4) : key;
        return (isRu() ? "Установлен ••••" : "Configured ••••") + tail;
    }

    private void showEnginePicker() {
        String[] labels = new String[] {
                "Google Translate (Chrome NMT)",
                "Bing Translator (Web NMT)",
                "Yandex Translate (Web NMT)",
                "DeepL API (Free / Pro)",
                "Gemini 3.5 Flash-Lite (AI ★)"
        };
        String[] values = new String[] {"google", "bing", "yandex", "deepl", "gemini"};
        String cur = SBrowserXPrefs.getTranslateEngine(this);
        int sel = 0;
        for (int i = 0; i < values.length; i++) {
            if (values[i].equalsIgnoreCase(cur)) sel = i;
        }
        new AlertDialog.Builder(this, dialogTheme)
                .setTitle(isRu() ? "Движок перевода" : "Translation engine")
                .setSingleChoiceItems(labels, sel, (dialog, which) -> {
                    SBrowserXPrefs.setTranslateEngine(this, values[which]);
                    refresh();
                    dialog.dismiss();
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void showApiKeyDialog() {
        android.widget.EditText input = new android.widget.EditText(this);
        input.setSingleLine(true);
        input.setText(SBrowserXPrefs.getTranslateApiKey(this));
        input.setHint(isRu() ? "Вставьте ключ DeepL или Gemini AI Studio" : "Paste DeepL or Gemini AI Studio API key");
        int pad = dp(18);
        LinearLayout wrap = new LinearLayout(this);
        wrap.setPadding(pad, dp(8), pad, 0);
        wrap.addView(input, new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        new AlertDialog.Builder(this, dialogTheme)
                .setTitle(isRu() ? "API-ключ (опционально)" : "API Key (optional)")
                .setView(wrap)
                .setPositiveButton(android.R.string.ok, (d, w) -> {
                    SBrowserXPrefs.setTranslateApiKey(this, input.getText().toString());
                    refresh();
                })
                .setNeutralButton(isRu() ? "Очистить" : "Clear", (d, w) -> {
                    SBrowserXPrefs.setTranslateApiKey(this, "");
                    refresh();
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }
}
