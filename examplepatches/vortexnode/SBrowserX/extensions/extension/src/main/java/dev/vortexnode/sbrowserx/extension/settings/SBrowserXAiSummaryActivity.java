package dev.vortexnode.sbrowserx.extension.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.InputType;
import android.util.TypedValue;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Locale;

import dev.vortexnode.sbrowserx.extension.SBrowserXHooks;
import dev.vortexnode.sbrowserx.extension.SBrowserXPrefs;
import dev.vortexnode.sbrowserx.extension.SBrowserXStrings;

public final class SBrowserXAiSummaryActivity extends Activity {
    public static final String EXTRA_PAGE_TITLE = "page_title";
    public static final String EXTRA_PAGE_URL = "page_url";
    public static final String EXTRA_PAGE_TEXT = "page_text";

    private TextView bodyView;
    private String lastSummary = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SBrowserXPrefs.init(this);

        boolean night = SBrowserXHooks.isBrowserNightMode(this);
        int theme = night
                ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;

        String key = SBrowserXPrefs.getTranslateApiKey(this);
        if (key == null || key.trim().isEmpty()) {
            showSetupDialog(theme);
            return;
        }

        String pageTitle = getIntent().getStringExtra(EXTRA_PAGE_TITLE);
        String pageUrl = getIntent().getStringExtra(EXTRA_PAGE_URL);
        String pageText = getIntent().getStringExtra(EXTRA_PAGE_TEXT);
        if (pageText == null || pageText.trim().length() < 40) {
            Toast.makeText(this, SBrowserXStrings.get(SBrowserXStrings.AI_SUM_EMPTY), Toast.LENGTH_SHORT).show();
            finish();
            return;
        }

        ScrollView scroll = new ScrollView(this);
        bodyView = new TextView(this);
        bodyView.setPadding(dp(22), dp(14), dp(22), dp(14));
        bodyView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        bodyView.setLineSpacing(dp(4), 1f);
        bodyView.setTextIsSelectable(true);
        bodyView.setText(SBrowserXStrings.get(SBrowserXStrings.AI_SUM_LOADING));
        scroll.addView(bodyView);

        new AlertDialog.Builder(this, theme)
                .setTitle(SBrowserXStrings.get(SBrowserXStrings.ASSIST_SUMMARY_TITLE))
                .setView(scroll)
                .setPositiveButton(android.R.string.ok, (d, w) -> finish())
                .setNeutralButton(SBrowserXStrings.get(SBrowserXStrings.AI_SUM_COPY), (d, w) -> {
                    if (lastSummary != null && !lastSummary.isEmpty()) {
                        ClipboardManager cm = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
                        if (cm != null) {
                            cm.setPrimaryClip(ClipData.newPlainText("SBrowserX Summary", lastSummary));
                            Toast.makeText(this, SBrowserXStrings.get(SBrowserXStrings.AI_SUM_COPIED), Toast.LENGTH_SHORT).show();
                        }
                    }
                    finish();
                })
                .setOnCancelListener(d -> finish())
                .show();

        fetchSummaryAsync(key.trim(), pageTitle, pageUrl, pageText);
    }

    private void showSetupDialog(int theme) {
        EditText input = new EditText(this);
        input.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD);
        input.setSingleLine(true);
        input.setHint("AQ... / AIza...");
        LinearLayout wrap = new LinearLayout(this);
        wrap.setOrientation(LinearLayout.VERTICAL);
        wrap.setPadding(dp(20), dp(8), dp(20), dp(4));
        wrap.addView(input);

        new AlertDialog.Builder(this, theme)
                .setTitle(SBrowserXStrings.get(SBrowserXStrings.ASSIST_SUMMARY_TITLE))
                .setMessage(SBrowserXStrings.get(SBrowserXStrings.ASSIST_KEY_DIALOG_MSG))
                .setView(wrap)
                .setPositiveButton(android.R.string.ok, (d, w) -> {
                    String entered = input.getText().toString().trim();
                    if (!entered.isEmpty()) {
                        SBrowserXPrefs.setTranslateApiKey(this, entered);
                        recreate();
                    } else {
                        finish();
                    }
                })
                .setNeutralButton(SBrowserXStrings.get(SBrowserXStrings.ASSIST_GET_KEY_SHORT), (d, w) -> {
                    try {
                        if (!SBrowserXHooks.openInternalUrl(this, SBrowserXBrowsingAssistActivity.AI_STUDIO_KEY_URL)) {
                            startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(SBrowserXBrowsingAssistActivity.AI_STUDIO_KEY_URL)));
                        }
                    } catch (Throwable ignored) {}
                    finish();
                })
                .setNegativeButton(android.R.string.cancel, (d, w) -> finish())
                .setOnCancelListener(d -> finish())
                .show();
    }

    private void fetchSummaryAsync(String apiKey, String title, String url, String text) {
        new Thread(() -> {
            try {
                String trimmed = text.length() > 14000 ? text.substring(0, 14000) : text;
                String lang = SBrowserXStrings.getAppLang();
                String promptLang = "ru".equals(lang) ? "Russian" : ("uk".equals(lang) ? "Ukrainian" : "English");
                String prompt = "Summarize the following web page clearly in " + promptLang
                        + " as 4-6 concise bullet points (no markdown bold/headers, plain clean bullets starting with '• ').\n"
                        + (title != null ? ("Title: " + title + "\n") : "")
                        + (url != null ? ("URL: " + url + "\n") : "")
                        + "\nContent:\n" + trimmed;

                JSONObject part = new JSONObject().put("text", prompt);
                JSONObject content = new JSONObject().put("parts", new JSONArray().put(part));
                JSONObject reqBody = new JSONObject().put("contents", new JSONArray().put(content));

                String[] endpoints = new String[] {
                        "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.5-flash-lite:generateContent",
                        "https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-lite-latest:generateContent",
                        "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.5-flash:generateContent",
                        "https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent"
                };

                StringBuilder sb = new StringBuilder();
                int lastCode = 0;
                for (String ep : endpoints) {
                    sb.setLength(0);
                    URL endpoint = new URL(ep);
                    HttpURLConnection conn = (HttpURLConnection) endpoint.openConnection();
                    conn.setRequestMethod("POST");
                    conn.setConnectTimeout(15000);
                    conn.setReadTimeout(25000);
                    conn.setDoOutput(true);
                    conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
                    conn.setRequestProperty("X-goog-api-key", apiKey);
                    try (OutputStream os = conn.getOutputStream()) {
                        os.write(reqBody.toString().getBytes(StandardCharsets.UTF_8));
                    }
                    lastCode = conn.getResponseCode();
                    InputStream is = (lastCode >= 200 && lastCode < 300) ? conn.getInputStream() : conn.getErrorStream();
                    if (is != null) {
                        try (BufferedReader br = new BufferedReader(new InputStreamReader(is, StandardCharsets.UTF_8))) {
                            String line;
                            while ((line = br.readLine()) != null) sb.append(line);
                        }
                    }
                    if (lastCode >= 200 && lastCode < 300) break;
                    if (lastCode != 404 && lastCode != 503 && lastCode != 429) break;
                }
                if (lastCode < 200 || lastCode >= 300) {
                    String errMsg = "HTTP " + lastCode;
                    try {
                        JSONObject ej = new JSONObject(sb.toString());
                        String m = ej.optJSONObject("error") != null ? ej.getJSONObject("error").optString("message", "") : "";
                        if (!m.isEmpty()) errMsg += " (" + m + ")";
                    } catch (Throwable ignored) {}
                    throw new RuntimeException(errMsg);
                }

                JSONObject resp = new JSONObject(sb.toString());
                String out = resp.getJSONArray("candidates")
                        .getJSONObject(0)
                        .getJSONObject("content")
                        .getJSONArray("parts")
                        .getJSONObject(0)
                        .getString("text")
                        .trim();

                lastSummary = out;
                runOnUiThread(() -> {
                    if (!isFinishing() && bodyView != null) {
                        bodyView.setText(out);
                    }
                });
            } catch (Throwable t) {
                runOnUiThread(() -> {
                    if (!isFinishing() && bodyView != null) {
                        bodyView.setText(SBrowserXStrings.get(SBrowserXStrings.AI_SUM_ERR) + ": " + t.getMessage());
                    }
                });
            }
        }, "SBrowserX-AiSummary").start();
    }

    private int dp(int v) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, getResources().getDisplayMetrics()));
    }
}
