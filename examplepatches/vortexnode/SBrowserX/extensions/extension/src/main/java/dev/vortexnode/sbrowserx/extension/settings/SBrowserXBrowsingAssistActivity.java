package dev.vortexnode.sbrowserx.extension.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.text.InputType;
import android.util.TypedValue;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import dev.vortexnode.sbrowserx.extension.SBrowserXGoogleTranslator;
import dev.vortexnode.sbrowserx.extension.SBrowserXHooks;
import dev.vortexnode.sbrowserx.extension.SBrowserXPrefs;
import dev.vortexnode.sbrowserx.extension.SBrowserXStrings;

public final class SBrowserXBrowsingAssistActivity extends Activity {
    public static final String AI_STUDIO_KEY_URL = "https://aistudio.google.com/apikey";

    private TextView summaryStatusView;
    private TextView translateStatusView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SBrowserXPrefs.init(this);

        boolean night = SBrowserXHooks.isBrowserNightMode(this);
        boolean amoled = night && SBrowserXPrefs.isAmoledBlackEnabled(this);
        int bgColor = night ? (amoled ? 0xFF000000 : 0xFF0B0B0D) : 0xFFF2F3F7;
        int cardColor = night ? (amoled ? 0xFF101012 : 0xFF1A1A1E) : 0xFFFFFFFF;
        int textPrimary = night ? 0xFFF5F5F7 : 0xFF141416;
        int textSecondary = night ? 0xFF9EA2AD : 0xFF6B707C;
        int accent = 0xFF387AFF;

        getWindow().setStatusBarColor(bgColor);
        getWindow().setNavigationBarColor(bgColor);
        if (!night) {
            getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
        }

        ScrollView scroll = new ScrollView(this);
        scroll.setBackgroundColor(bgColor);
        scroll.setFillViewport(true);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        SBrowserXSettingsActivity.applyOneUiEdgeToEdgePadding(root, dp(16), dp(14), dp(16), dp(36));

        root.addView(SBrowserXSettingsActivity.buildOneUiHeader(
                this, SBrowserXStrings.get(SBrowserXStrings.ASSIST_TITLE), night, textPrimary, v -> finish()));

        // Intuitive info card explaining how Summary (Gemini API) & Translate work
        LinearLayout infoCard = card(cardColor);
        infoCard.setPadding(dp(20), dp(18), dp(20), dp(18));

        TextView tvLead = new TextView(this);
        tvLead.setText(SBrowserXStrings.get(SBrowserXStrings.ASSIST_INFO_LEAD));
        tvLead.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        tvLead.setLineSpacing(dp(3), 1f);
        tvLead.setTextColor(textPrimary);
        infoCard.addView(tvLead);

        TextView tvDetails = new TextView(this);
        tvDetails.setText(SBrowserXStrings.get(SBrowserXStrings.ASSIST_INFO_BODY));
        tvDetails.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
        tvDetails.setLineSpacing(dp(3), 1f);
        tvDetails.setTextColor(textSecondary);
        tvDetails.setPadding(0, dp(10), 0, dp(12));
        infoCard.addView(tvDetails);

        TextView tvLink = new TextView(this);
        tvLink.setText(SBrowserXStrings.get(SBrowserXStrings.ASSIST_GET_KEY_BTN));
        tvLink.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        tvLink.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        tvLink.setTextColor(accent);
        tvLink.setPadding(0, dp(4), 0, dp(2));
        tvLink.setOnClickListener(v -> openAiStudio());
        infoCard.addView(tvLink);

        LinearLayout.LayoutParams infoLp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        infoLp.topMargin = dp(8);
        infoCard.setLayoutParams(infoLp);
        root.addView(infoCard);

        // Functions section (matching Samsung's native layout without Galaxy AI system link)
        TextView sec = new TextView(this);
        sec.setText(SBrowserXStrings.get(SBrowserXStrings.ASSIST_CAT_FEATURES));
        sec.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        sec.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        sec.setTextColor(textSecondary);
        sec.setPadding(dp(14), dp(20), dp(14), dp(8));
        root.addView(sec);

        LinearLayout featCard = card(cardColor);
        summaryStatusView = addRow(featCard,
                SBrowserXStrings.get(SBrowserXStrings.ASSIST_SUMMARY_TITLE),
                getSummaryStatus(),
                textPrimary, textSecondary, v -> showGeminiKeyDialog(night));
        featCard.addView(divider(night));
        translateStatusView = addRow(featCard,
                SBrowserXStrings.get(SBrowserXStrings.ASSIST_TRANSLATE_TITLE),
                getTranslateStatus(),
                textPrimary, textSecondary,
                v -> startActivity(new Intent(this, SBrowserXTranslateSettingsActivity.class)));
        root.addView(featCard);

        scroll.addView(root);
        setContentView(scroll);
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (summaryStatusView != null) summaryStatusView.setText(getSummaryStatus());
        if (translateStatusView != null) translateStatusView.setText(getTranslateStatus());
    }

    private String getSummaryStatus() {
        String key = SBrowserXPrefs.getTranslateApiKey(this);
        if (key != null && !key.trim().isEmpty()) {
            return SBrowserXStrings.get(SBrowserXStrings.ASSIST_KEY_SET);
        }
        return SBrowserXStrings.get(SBrowserXStrings.ASSIST_KEY_MISSING);
    }

    private String getTranslateStatus() {
        String onOff = SBrowserXPrefs.isGoogleTranslateEnabled(this)
                ? SBrowserXStrings.get(SBrowserXStrings.BTN_ENABLE)
                : SBrowserXStrings.get(SBrowserXStrings.BTN_DISABLE);
        return onOff + " • " + SBrowserXGoogleTranslator.getLanguageDisplayName(
                SBrowserXPrefs.getTranslateTargetLang(this));
    }

    private void openAiStudio() {
        try {
            if (!SBrowserXHooks.openInternalUrl(this, AI_STUDIO_KEY_URL)) {
                startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(AI_STUDIO_KEY_URL)));
            }
        } catch (Throwable t) {
            Toast.makeText(this, AI_STUDIO_KEY_URL, Toast.LENGTH_LONG).show();
        }
    }

    private void showGeminiKeyDialog(boolean night) {
        int theme = night ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;
        EditText input = new EditText(this);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD);
        input.setSingleLine(true);
        input.setHint("AQ... / AIza...");
        input.setText(SBrowserXPrefs.getTranslateApiKey(this));
        int pad = dp(20);
        LinearLayout wrap = new LinearLayout(this);
        wrap.setOrientation(LinearLayout.VERTICAL);
        wrap.setPadding(pad, dp(10), pad, dp(4));
        wrap.addView(input);

        new AlertDialog.Builder(this, theme)
                .setTitle(SBrowserXStrings.get(SBrowserXStrings.ASSIST_SUMMARY_TITLE))
                .setMessage(SBrowserXStrings.get(SBrowserXStrings.ASSIST_KEY_DIALOG_MSG))
                .setView(wrap)
                .setPositiveButton(android.R.string.ok, (d, w) -> {
                    SBrowserXPrefs.setTranslateApiKey(this, input.getText().toString().trim());
                    if (summaryStatusView != null) summaryStatusView.setText(getSummaryStatus());
                })
                .setNeutralButton(SBrowserXStrings.get(SBrowserXStrings.ASSIST_GET_KEY_SHORT), (d, w) -> openAiStudio())
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private LinearLayout card(int bgColor) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(bgColor);
        bg.setCornerRadius(dp(26));
        card.setBackground(bg);
        card.setClipToOutline(true);
        return card;
    }

    private View divider(boolean night) {
        View d = new View(this);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, 1);
        lp.leftMargin = dp(20);
        lp.rightMargin = dp(20);
        d.setLayoutParams(lp);
        d.setBackgroundColor(night ? 0xFF2B2B30 : 0xFFE5E6EB);
        return d;
    }

    private TextView addRow(LinearLayout parent, String title, String summary, int textPrimary, int textSecondary, View.OnClickListener listener) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(dp(20), dp(15), dp(20), dp(15));
        row.setClickable(true);
        row.setFocusable(true);
        TypedValue out = new TypedValue();
        getTheme().resolveAttribute(android.R.attr.selectableItemBackground, out, true);
        row.setBackgroundResource(out.resourceId);
        row.setOnClickListener(listener);

        TextView tvTitle = new TextView(this);
        tvTitle.setText(title);
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        tvTitle.setTextColor(textPrimary);
        row.addView(tvTitle);

        TextView tvSum = new TextView(this);
        tvSum.setText(summary);
        tvSum.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        tvSum.setTextColor(textSecondary);
        tvSum.setPadding(0, dp(3), 0, 0);
        row.addView(tvSum);

        parent.addView(row);
        return tvSum;
    }

    private int dp(int v) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, getResources().getDisplayMetrics()));
    }
}
