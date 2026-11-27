package dev.vortexnode.sbrowserx.extension.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import dev.vortexnode.sbrowserx.extension.SBrowserXHooks;
import dev.vortexnode.sbrowserx.extension.SBrowserXPrefs;
import dev.vortexnode.sbrowserx.extension.SBrowserXStartPageServer;
import dev.vortexnode.sbrowserx.extension.SBrowserXStrings;

public final class SBrowserXStartPageSettingsActivity extends Activity {
    private static final int REQ_PICK_WALLPAPER = 5201;

    private TextView wallpaperModeSummary;
    private TextView wallpaperDimValue;
    private TextView weatherCitySummary;
    private TextView weatherUnitSummary;
    private TextView shortcutsCountSummary;
    private LinearLayout weatherCityRow;
    private LinearLayout weatherUnitRow;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SBrowserXPrefs.init(this);
        SBrowserXStartPageServer.ensureStarted(this);

        boolean night = SBrowserXHooks.isBrowserNightMode(this);
        boolean amoled = night && SBrowserXPrefs.isAmoledBlackEnabled(this);
        int bgColor = night ? (amoled ? 0xFF000000 : 0xFF0B0B0D) : 0xFFF2F3F7;
        int cardColor = night ? (amoled ? 0xFF101012 : 0xFF1A1A1E) : 0xFFFFFFFF;
        int textPrimary = night ? 0xFFF5F5F7 : 0xFF141416;
        int textSecondary = night ? 0xFF9EA2AD : 0xFF6B707C;

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
                this, SBrowserXStrings.get(SBrowserXStrings.SP_TITLE), night, textPrimary, v -> finish()));

        // --- Card 1: Enable & Open ---
        LinearLayout mainCard = card(cardColor);
        addSwitchRow(mainCard,
                SBrowserXStrings.get(SBrowserXStrings.SP_ENABLE_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.SP_ENABLE_SUM),
                SBrowserXPrefs.isStartPageEnabled(this), night, textPrimary, textSecondary,
                (btn, checked) -> {
                    SBrowserXPrefs.setStartPageEnabled(this, checked);
                    SBrowserXHooks.applyStartPageHomepageSetting(this, checked);
                    Toast.makeText(this,
                            checked ? SBrowserXStrings.get(SBrowserXStrings.SP_ENABLED_TOAST)
                                    : SBrowserXStrings.get(SBrowserXStrings.SP_DISABLED_TOAST),
                            Toast.LENGTH_SHORT).show();
                });
        mainCard.addView(divider(night));
        addRow(mainCard,
                SBrowserXStrings.get(SBrowserXStrings.SP_OPEN_NOW),
                SBrowserXStrings.get(SBrowserXStrings.SP_OPEN_NOW_SUM),
                textPrimary, textSecondary, v -> {
                    SBrowserXStartPageServer.ensureStarted(this);
                    SBrowserXHooks.allowStartPagePreviewBriefly();
                    SBrowserXHooks.openInternalUrl(this, SBrowserXStartPageServer.getBaseUrl());
                    finish();
                });
        root.addView(mainCard);

        // --- Card 2: Wallpaper ---
        root.addView(sectionHeader(SBrowserXStrings.get(SBrowserXStrings.SP_CAT_WALLPAPER), textSecondary));
        LinearLayout wpCard = card(cardColor);
        wallpaperModeSummary = addRow(wpCard,
                SBrowserXStrings.get(SBrowserXStrings.SP_WP_SOURCE),
                wallpaperModeLabel(SBrowserXPrefs.getStartPageWallpaperMode(this)),
                textPrimary, textSecondary, v -> showWallpaperSourceDialog(night));
        wpCard.addView(divider(night));
        addRow(wpCard,
                SBrowserXStrings.get(SBrowserXStrings.SP_WP_PICK_PHONE),
                SBrowserXStrings.get(SBrowserXStrings.SP_WP_PICK_PHONE_SUM),
                textPrimary, textSecondary, v -> launchPhoneWallpaperPicker());
        wpCard.addView(divider(night));
        addSwitchRow(wpCard,
                SBrowserXStrings.get(SBrowserXStrings.SP_WP_DAILY_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.SP_WP_DAILY_SUM),
                SBrowserXPrefs.isStartPageDailyWallpaperEnabled(this), night, textPrimary, textSecondary,
                (btn, checked) -> SBrowserXPrefs.setStartPageDailyWallpaperEnabled(this, checked));
        wpCard.addView(divider(night));
        addRow(wpCard,
                SBrowserXStrings.get(SBrowserXStrings.SP_WP_NEXT_ONLINE),
                SBrowserXStrings.get(SBrowserXStrings.SP_WP_NEXT_ONLINE_SUM),
                textPrimary, textSecondary, v -> fetchNextWallpaperAsync());
        wpCard.addView(divider(night));
        addDimSliderRow(wpCard, textPrimary, textSecondary);
        root.addView(wpCard);

        // --- Card 3: Weather (Open-Meteo, OFF by default) ---
        root.addView(sectionHeader(SBrowserXStrings.get(SBrowserXStrings.SP_CAT_WEATHER), textSecondary));
        LinearLayout wxCard = card(cardColor);
        addSwitchRow(wxCard,
                SBrowserXStrings.get(SBrowserXStrings.SP_WX_ENABLE),
                SBrowserXStrings.get(SBrowserXStrings.SP_WX_ENABLE_SUM),
                SBrowserXPrefs.isStartPageWeatherEnabled(this), night, textPrimary, textSecondary,
                (btn, checked) -> {
                    SBrowserXPrefs.setStartPageWeatherEnabled(this, checked);
                    SBrowserXStartPageServer.invalidateWeatherCache();
                    refreshState();
                });
        wxCard.addView(divider(night));
        weatherCityRow = new LinearLayout(this);
        weatherCityRow.setOrientation(LinearLayout.VERTICAL);
        weatherCitySummary = addRow(weatherCityRow,
                SBrowserXStrings.get(SBrowserXStrings.SP_WX_CITY),
                cityLabel(SBrowserXPrefs.getStartPageWeatherCity(this)),
                textPrimary, textSecondary, v -> showCityDialog(night));
        wxCard.addView(weatherCityRow);
        wxCard.addView(divider(night));
        weatherUnitRow = new LinearLayout(this);
        weatherUnitRow.setOrientation(LinearLayout.VERTICAL);
        weatherUnitSummary = addRow(weatherUnitRow,
                SBrowserXStrings.get(SBrowserXStrings.SP_WX_UNIT),
                "F".equalsIgnoreCase(SBrowserXPrefs.getStartPageWeatherUnit(this)) ? "°F (Fahrenheit)" : "°C (Celsius)",
                textPrimary, textSecondary, v -> showUnitDialog(night));
        wxCard.addView(weatherUnitRow);
        root.addView(wxCard);

        // --- Card 4: Shortcuts ---
        root.addView(sectionHeader(SBrowserXStrings.get(SBrowserXStrings.SP_CAT_SHORTCUTS), textSecondary));
        LinearLayout scCard = card(cardColor);
        addRow(scCard,
                SBrowserXStrings.get(SBrowserXStrings.SP_SC_ADD),
                SBrowserXStrings.get(SBrowserXStrings.SP_SC_ADD_SUM),
                textPrimary, textSecondary, v -> showAddShortcutDialog(night));
        scCard.addView(divider(night));
        shortcutsCountSummary = addRow(scCard,
                SBrowserXStrings.get(SBrowserXStrings.SP_SC_CLEAR),
                shortcutsLabel(),
                textPrimary, textSecondary, v -> confirmClearShortcuts(night));
        root.addView(scCard);

        scroll.addView(root);
        setContentView(scroll);
        refreshState();
    }

    private void refreshState() {
        if (wallpaperModeSummary != null) {
            wallpaperModeSummary.setText(wallpaperModeLabel(SBrowserXPrefs.getStartPageWallpaperMode(this)));
        }
        boolean wxOn = SBrowserXPrefs.isStartPageWeatherEnabled(this);
        if (weatherCityRow != null) {
            weatherCityRow.setEnabled(wxOn);
            weatherCityRow.setAlpha(wxOn ? 1.0f : 0.45f);
        }
        if (weatherUnitRow != null) {
            weatherUnitRow.setEnabled(wxOn);
            weatherUnitRow.setAlpha(wxOn ? 1.0f : 0.45f);
        }
        if (weatherCitySummary != null) {
            weatherCitySummary.setText(cityLabel(SBrowserXPrefs.getStartPageWeatherCity(this)));
        }
        if (weatherUnitSummary != null) {
            weatherUnitSummary.setText("F".equalsIgnoreCase(SBrowserXPrefs.getStartPageWeatherUnit(this)) ? "°F (Fahrenheit)" : "°C (Celsius)");
        }
        if (shortcutsCountSummary != null) {
            shortcutsCountSummary.setText(shortcutsLabel());
        }
    }

    private String wallpaperModeLabel(String mode) {
        if (SBrowserXStartPageServer.WALLPAPER_LOCAL.equals(mode)) return SBrowserXStrings.get(SBrowserXStrings.SP_WP_MODE_LOCAL);
        if (SBrowserXStartPageServer.WALLPAPER_ONLINE.equals(mode)) return SBrowserXStrings.get(SBrowserXStrings.SP_WP_MODE_ONLINE);
        return SBrowserXStrings.get(SBrowserXStrings.SP_WP_MODE_AMOLED);
    }

    private String cityLabel(String city) {
        return (city == null || city.trim().isEmpty())
                ? SBrowserXStrings.get(SBrowserXStrings.SP_WX_CITY_AUTO)
                : city.trim();
    }

    private String shortcutsLabel() {
        int count = 0;
        try {
            count = new JSONArray(SBrowserXPrefs.getStartPageShortcutsJson(this)).length();
        } catch (Throwable ignored) {}
        return SBrowserXStrings.get(SBrowserXStrings.SP_SC_COUNT) + ": " + count;
    }

    private void showWallpaperSourceDialog(boolean night) {
        int theme = night ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;
        String[] values = new String[] {
                SBrowserXStartPageServer.WALLPAPER_AMOLED,
                SBrowserXStartPageServer.WALLPAPER_LOCAL,
                SBrowserXStartPageServer.WALLPAPER_ONLINE
        };
        String[] labels = new String[] {
                SBrowserXStrings.get(SBrowserXStrings.SP_WP_MODE_AMOLED),
                SBrowserXStrings.get(SBrowserXStrings.SP_WP_MODE_LOCAL),
                SBrowserXStrings.get(SBrowserXStrings.SP_WP_MODE_ONLINE)
        };
        String cur = SBrowserXPrefs.getStartPageWallpaperMode(this);
        int sel = 0;
        for (int i = 0; i < values.length; i++) if (values[i].equals(cur)) sel = i;
        new AlertDialog.Builder(this, theme)
                .setTitle(SBrowserXStrings.get(SBrowserXStrings.SP_WP_SOURCE))
                .setSingleChoiceItems(labels, sel, (d, which) -> {
                    String chosen = values[which];
                    SBrowserXPrefs.setStartPageWallpaperMode(this, chosen);
                    SBrowserXPrefs.bumpStartPageWallpaperVersion(this);
                    d.dismiss();
                    if (SBrowserXStartPageServer.WALLPAPER_LOCAL.equals(chosen)
                            && !SBrowserXStartPageServer.getLocalWallpaperFile(this).exists()) {
                        launchPhoneWallpaperPicker();
                    } else if (SBrowserXStartPageServer.WALLPAPER_ONLINE.equals(chosen)
                            && !SBrowserXStartPageServer.getOnlineWallpaperFile(this).exists()) {
                        fetchNextWallpaperAsync();
                    }
                    refreshState();
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void launchPhoneWallpaperPicker() {
        Intent i = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        i.addCategory(Intent.CATEGORY_OPENABLE);
        i.setType("image/*");
        try {
            startActivityForResult(i, REQ_PICK_WALLPAPER);
        } catch (Throwable t) {
            Toast.makeText(this, "Picker unavailable", Toast.LENGTH_SHORT).show();
        }
    }

    private void fetchNextWallpaperAsync() {
        Toast.makeText(this, SBrowserXStrings.get(SBrowserXStrings.SP_WP_LOADING), Toast.LENGTH_SHORT).show();
        new Thread(() -> {
            SBrowserXPrefs.setStartPageWallpaperMode(this, SBrowserXStartPageServer.WALLPAPER_ONLINE);
            boolean ok = SBrowserXStartPageServer.fetchNextOnlineWallpaper(this, true);
            runOnUiThread(() -> {
                refreshState();
                Toast.makeText(this,
                        ok ? SBrowserXStrings.get(SBrowserXStrings.SP_WP_UPDATED)
                                : SBrowserXStrings.get(SBrowserXStrings.SP_WP_ERROR),
                        Toast.LENGTH_SHORT).show();
            });
        }, "SBrowserX-WpFetch").start();
    }

    private void showCityDialog(boolean night) {
        int theme = night ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;
        EditText et = new EditText(this);
        et.setHint(SBrowserXStrings.get(SBrowserXStrings.SP_WX_CITY_HINT));
        et.setText(SBrowserXPrefs.getStartPageWeatherCity(this));
        et.setSingleLine(true);
        LinearLayout wrap = new LinearLayout(this);
        wrap.setPadding(dp(22), dp(10), dp(22), 0);
        wrap.addView(et, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        new AlertDialog.Builder(this, theme)
                .setTitle(SBrowserXStrings.get(SBrowserXStrings.SP_WX_CITY))
                .setView(wrap)
                .setPositiveButton(android.R.string.ok, (d, w) -> {
                    SBrowserXPrefs.setStartPageWeatherCity(this, et.getText().toString().trim());
                    SBrowserXStartPageServer.invalidateWeatherCache();
                    refreshState();
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void showUnitDialog(boolean night) {
        int theme = night ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;
        String[] vals = new String[] { "C", "F" };
        String[] labels = new String[] { "°C (Celsius)", "°F (Fahrenheit)" };
        int sel = "F".equalsIgnoreCase(SBrowserXPrefs.getStartPageWeatherUnit(this)) ? 1 : 0;
        new AlertDialog.Builder(this, theme)
                .setTitle(SBrowserXStrings.get(SBrowserXStrings.SP_WX_UNIT))
                .setSingleChoiceItems(labels, sel, (d, which) -> {
                    SBrowserXPrefs.setStartPageWeatherUnit(this, vals[which]);
                    SBrowserXStartPageServer.invalidateWeatherCache();
                    d.dismiss();
                    refreshState();
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void showAddShortcutDialog(boolean night) {
        int theme = night ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;
        LinearLayout wrap = new LinearLayout(this);
        wrap.setOrientation(LinearLayout.VERTICAL);
        wrap.setPadding(dp(22), dp(10), dp(22), 0);
        EditText etName = new EditText(this);
        etName.setHint(SBrowserXStrings.get(SBrowserXStrings.SP_SC_NAME_HINT));
        etName.setSingleLine(true);
        EditText etUrl = new EditText(this);
        etUrl.setHint("https://example.com");
        etUrl.setSingleLine(true);
        wrap.addView(etName);
        wrap.addView(etUrl);
        new AlertDialog.Builder(this, theme)
                .setTitle(SBrowserXStrings.get(SBrowserXStrings.SP_SC_ADD))
                .setView(wrap)
                .setPositiveButton(android.R.string.ok, (d, w) -> {
                    String url = etUrl.getText().toString().trim();
                    String name = etName.getText().toString().trim();
                    if (url.isEmpty()) return;
                    if (!url.startsWith("http://") && !url.startsWith("https://")) url = "https://" + url;
                    if (name.isEmpty()) name = url;
                    try {
                        JSONArray arr = new JSONArray(SBrowserXPrefs.getStartPageShortcutsJson(this));
                        JSONObject item = new JSONObject();
                        item.put("title", name);
                        item.put("url", url);
                        arr.put(item);
                        SBrowserXPrefs.setStartPageShortcutsJson(this, arr.toString());
                        refreshState();
                    } catch (Throwable ignored) {}
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void confirmClearShortcuts(boolean night) {
        int theme = night ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;
        new AlertDialog.Builder(this, theme)
                .setTitle(SBrowserXStrings.get(SBrowserXStrings.SP_SC_CLEAR))
                .setMessage(SBrowserXStrings.get(SBrowserXStrings.SP_SC_CLEAR_CONFIRM))
                .setPositiveButton(android.R.string.ok, (d, w) -> {
                    SBrowserXPrefs.setStartPageShortcutsJson(this, "[]");
                    refreshState();
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQ_PICK_WALLPAPER && resultCode == RESULT_OK && data != null && data.getData() != null) {
            Uri uri = data.getData();
            new Thread(() -> {
                try {
                    File dst = SBrowserXStartPageServer.getLocalWallpaperFile(this);
                    try (InputStream is = getContentResolver().openInputStream(uri);
                         FileOutputStream fos = new FileOutputStream(dst)) {
                        if (is == null) throw new IllegalStateException("Cannot read image");
                        byte[] buf = new byte[8192];
                        int n;
                        while ((n = is.read(buf)) > 0) fos.write(buf, 0, n);
                        fos.flush();
                    }
                    SBrowserXPrefs.setStartPageWallpaperMode(this, SBrowserXStartPageServer.WALLPAPER_LOCAL);
                    SBrowserXPrefs.bumpStartPageWallpaperVersion(this);
                    runOnUiThread(() -> {
                        refreshState();
                        Toast.makeText(this, SBrowserXStrings.get(SBrowserXStrings.SP_WP_UPDATED), Toast.LENGTH_SHORT).show();
                    });
                } catch (Throwable t) {
                    runOnUiThread(() -> Toast.makeText(this, SBrowserXStrings.get(SBrowserXStrings.SP_WP_ERROR), Toast.LENGTH_SHORT).show());
                }
            }, "SBrowserX-WpCopy").start();
        }
    }

    private void addDimSliderRow(LinearLayout parent, int textPrimary, int textSecondary) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(dp(20), dp(14), dp(20), dp(16));

        LinearLayout hdr = new LinearLayout(this);
        hdr.setOrientation(LinearLayout.HORIZONTAL);
        TextView tvTitle = new TextView(this);
        tvTitle.setText(SBrowserXStrings.get(SBrowserXStrings.SP_WP_DIM));
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        tvTitle.setTextColor(textPrimary);
        hdr.addView(tvTitle, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        int curDim = SBrowserXPrefs.getStartPageWallpaperDim(this);
        wallpaperDimValue = new TextView(this);
        wallpaperDimValue.setText(curDim + "%");
        wallpaperDimValue.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        wallpaperDimValue.setTextColor(0xFF3E82F7);
        hdr.addView(wallpaperDimValue);
        row.addView(hdr);

        SeekBar sb = new SeekBar(this);
        sb.setMax(80);
        sb.setProgress(curDim);
        SBrowserXSettingsActivity.styleOneUiSeekBar(sb, SBrowserXHooks.isBrowserNightMode(this));
        sb.setPadding(0, dp(10), 0, 0);
        sb.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                wallpaperDimValue.setText(progress + "%");
                if (fromUser) SBrowserXPrefs.setStartPageWallpaperDim(SBrowserXStartPageSettingsActivity.this, progress);
            }
            @Override public void onStartTrackingTouch(SeekBar seekBar) {}
            @Override public void onStopTrackingTouch(SeekBar seekBar) {}
        });
        row.addView(sb);
        parent.addView(row);
    }

    private TextView sectionHeader(String title, int color) {
        TextView tv = new TextView(this);
        tv.setText(title);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        tv.setTextColor(color);
        tv.setPadding(dp(14), dp(18), dp(14), dp(8));
        return tv;
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
        if (listener != null) {
            row.setClickable(true);
            row.setFocusable(true);
            TypedValue out = new TypedValue();
            getTheme().resolveAttribute(android.R.attr.selectableItemBackground, out, true);
            row.setBackgroundResource(out.resourceId);
            row.setOnClickListener(listener);
        }
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

    private void addSwitchRow(LinearLayout parent, String title, String summary, boolean checked, boolean night,
                              int textPrimary, int textSecondary, CompoundButton.OnCheckedChangeListener listener) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(20), dp(14), dp(16), dp(14));

        LinearLayout textCol = new LinearLayout(this);
        textCol.setOrientation(LinearLayout.VERTICAL);
        TextView tvTitle = new TextView(this);
        tvTitle.setText(title);
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        tvTitle.setTextColor(textPrimary);
        textCol.addView(tvTitle);

        TextView tvSum = new TextView(this);
        tvSum.setText(summary);
        tvSum.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        tvSum.setTextColor(textSecondary);
        tvSum.setPadding(0, dp(3), dp(12), 0);
        textCol.addView(tvSum);
        row.addView(textCol, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        Switch sw = new Switch(this);
        SBrowserXSettingsActivity.styleOneUiBlueSwitch(sw, night);
        sw.setChecked(checked);
        sw.setOnCheckedChangeListener(listener);
        row.addView(sw);

        row.setOnClickListener(v -> sw.toggle());
        parent.addView(row);
    }

    private int dp(int v) {
        return Math.round(v * getResources().getDisplayMetrics().density);
    }
}
