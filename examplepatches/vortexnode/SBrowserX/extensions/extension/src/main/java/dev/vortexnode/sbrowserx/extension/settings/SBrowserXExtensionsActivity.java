package dev.vortexnode.sbrowserx.extension.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import dev.vortexnode.sbrowserx.extension.SBrowserXHooks;
import dev.vortexnode.sbrowserx.extension.SBrowserXPrefs;
import dev.vortexnode.sbrowserx.extension.SBrowserXStrings;

/**
 * Fast, native One UI extensions manager backed directly by TerraceExtensionsLoader,
 * TerraceExtensionsManager & TerraceExtensionUtil.
 * Shows ALL installed extensions (both enabled and disabled) with master ON/OFF switch,
 * native Secret Mode toggle, Options, WebUI shortcut, and Uninstall.
 */
public final class SBrowserXExtensionsActivity extends Activity {
    private static final int ONEUI_BLUE = 0xFF387AFF;
    private static final int DANGER_RED = 0xFFFF4D4F;
    private static final String BUILTIN_TRANS_ID = "khmmfcceknncifmkiimjnnjldibgajpl";

    private LinearLayout listContainer;
    private boolean night;
    private int cardColor, textPrimary, textSecondary, dialogTheme;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SBrowserXPrefs.init(this);

        night = SBrowserXHooks.isBrowserNightMode(this);
        boolean amoled = night && SBrowserXPrefs.isAmoledBlackEnabled(this);

        int bgColor = amoled ? 0xFF000000 : (night ? 0xFF0D0D10 : 0xFFF2F2F7);
        cardColor = amoled ? 0xFF121216 : (night ? 0xFF1C1C22 : 0xFFFFFFFF);
        textPrimary = night ? 0xFFF5F5F7 : 0xFF111111;
        textSecondary = night ? 0xFFA2A2AD : 0xFF63636B;
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

        LinearLayout header = SBrowserXSettingsActivity.buildOneUiHeader(
                this, SBrowserXStrings.get(SBrowserXStrings.CAT_EXTENSIONS), night, textPrimary, v -> finish());

        TextView cwsBtn = new TextView(this);
        cwsBtn.setText("+ Chrome Web Store");
        cwsBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        cwsBtn.setTypeface(Typeface.DEFAULT_BOLD);
        cwsBtn.setTextColor(ONEUI_BLUE);
        cwsBtn.setPadding(dp(10), dp(6), dp(6), dp(6));
        cwsBtn.setOnClickListener(v -> openUrl("https://chromewebstore.google.com/category/extensions"));
        header.addView(cwsBtn);
        root.addView(header);

        listContainer = new LinearLayout(this);
        listContainer.setOrientation(LinearLayout.VERTICAL);
        root.addView(listContainer);

        scroll.addView(root);
        setContentView(scroll);
        reloadExtensions();
    }

    @Override
    protected void onResume() {
        super.onResume();
        reloadExtensions();
    }

    private void reloadExtensions() {
        listContainer.removeAllViews();
        List<ExtItem> items = loadAllInstalledExtensions();
        if (items.isEmpty()) {
            LinearLayout emptyCard = card();
            TextView tv = new TextView(this);
            tv.setText(isRu()
                    ? "Нет установленных расширений (или сначала откройте любую веб-страницу, чтобы движок расширений запустился)."
                    : "No extensions found (open any webpage first if the extensions engine has not initialized yet).");
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            tv.setTextColor(textSecondary);
            tv.setPadding(dp(18), dp(20), dp(18), dp(20));
            emptyCard.addView(tv);
            listContainer.addView(emptyCard);
            return;
        }

        for (ExtItem item : items) {
            listContainer.addView(buildExtensionCard(item));
        }
    }

    private View buildExtensionCard(ExtItem item) {
        LinearLayout c = card();
        LinearLayout.LayoutParams clp = (LinearLayout.LayoutParams) c.getLayoutParams();
        clp.bottomMargin = dp(12);

        // Top row: Icon + Name/Version/Description + Master ON/OFF Switch
        LinearLayout top = new LinearLayout(this);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);
        top.setPadding(dp(16), dp(14), dp(14), dp(10));

        if (item.icon != null) {
            ImageView iv = new ImageView(this);
            LinearLayout.LayoutParams ilp = new LinearLayout.LayoutParams(dp(36), dp(36));
            ilp.rightMargin = dp(12);
            iv.setLayoutParams(ilp);
            iv.setImageBitmap(item.icon);
            iv.setAlpha(item.enabled ? 1f : 0.45f);
            top.addView(iv);
        } else {
            TextView mono = new TextView(this);
            String letter = item.name.isEmpty() ? "?" : item.name.substring(0, 1).toUpperCase(Locale.US);
            mono.setText(letter);
            mono.setTypeface(Typeface.DEFAULT_BOLD);
            mono.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
            mono.setTextColor(item.enabled ? 0xFFFFFFFF : textSecondary);
            mono.setGravity(Gravity.CENTER);
            GradientDrawable mb = new GradientDrawable();
            mb.setColor(item.enabled ? ONEUI_BLUE : (night ? 0xFF2C2C36 : 0xFFE2E2EA));
            mb.setCornerRadius(dp(10));
            mono.setBackground(mb);
            LinearLayout.LayoutParams mlp = new LinearLayout.LayoutParams(dp(36), dp(36));
            mlp.rightMargin = dp(12);
            mono.setLayoutParams(mlp);
            top.addView(mono);
        }

        LinearLayout infoCol = new LinearLayout(this);
        infoCol.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams ilp = new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f);
        ilp.rightMargin = dp(10);
        infoCol.setLayoutParams(ilp);

        TextView nameTv = new TextView(this);
        nameTv.setText(item.name);
        nameTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        nameTv.setTypeface(Typeface.DEFAULT_BOLD);
        nameTv.setTextColor(item.enabled ? textPrimary : textSecondary);
        infoCol.addView(nameTv);

        String ver = (item.version != null && !item.version.isEmpty()) ? ("v" + item.version) : "";
        String subText = !ver.isEmpty() ? ver : item.id;
        if (item.description != null && !item.description.isEmpty()) {
            subText = (!ver.isEmpty() ? (ver + " • ") : "") + item.description;
        }
        TextView metaTv = new TextView(this);
        metaTv.setText(subText);
        metaTv.setMaxLines(2);
        metaTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
        metaTv.setTextColor(textSecondary);
        metaTv.setPadding(0, dp(2), 0, 0);
        infoCol.addView(metaTv);

        top.addView(infoCol);

        // Master ON/OFF switch
        Switch masterSw = new Switch(this);
        SBrowserXSettingsActivity.styleOneUiBlueSwitch(masterSw, night);
        masterSw.setChecked(item.enabled);
        masterSw.setOnCheckedChangeListener((btn, checked) -> {
            item.enabled = checked;
            setExtensionEnabled(item.id, checked);
            listContainer.postDelayed(this::reloadExtensions, 350);
        });
        top.addView(masterSw);
        c.addView(top);

        // Secret mode native toggle (shown when extension is enabled and supports Secret Mode)
        if (item.enabled && item.canSecretMode) {
            c.addView(divider());
            LinearLayout secretRow = new LinearLayout(this);
            secretRow.setOrientation(LinearLayout.HORIZONTAL);
            secretRow.setGravity(Gravity.CENTER_VERTICAL);
            secretRow.setPadding(dp(16), dp(10), dp(14), dp(10));

            TextView label = new TextView(this);
            label.setText(isRu() ? "Разрешить в секретном режиме" : "Allow in Secret mode");
            label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            label.setTextColor(textPrimary);
            label.setLayoutParams(new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
            secretRow.addView(label);

            Switch sw = new Switch(this);
            SBrowserXSettingsActivity.styleOneUiBlueSwitch(sw, night);
            sw.setChecked(item.secretModeEnabled);
            sw.setOnCheckedChangeListener((btn, checked) -> setSecretMode(item.id, checked));
            secretRow.addView(sw);
            secretRow.setOnClickListener(v -> sw.toggle());
            c.addView(secretRow);
        }

        // Action buttons row: Options | WebUI | Remove
        c.addView(divider());
        LinearLayout actions = new LinearLayout(this);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setPadding(dp(12), dp(8), dp(12), dp(10));

        if (item.enabled && item.optionsUrl != null && !item.optionsUrl.isEmpty()) {
            actions.addView(actionChip(isRu() ? "Настройки" : "Options", ONEUI_BLUE,
                    v -> openInternalOrWebUrl(item.optionsUrl)));
        }
        actions.addView(actionChip("WebUI", ONEUI_BLUE,
                v -> {
                    if (SBrowserXHooks.openInternalUrl(this, "internet://extensions/?id=" + item.id)) {
                        finish();
                    }
                }));
        actions.addView(actionChip(isRu() ? "Удалить" : "Remove", DANGER_RED,
                v -> confirmUninstall(item)));

        c.addView(actions);
        return c;
    }

    private TextView actionChip(String text, int color, View.OnClickListener onClick) {
        TextView tv = new TextView(this);
        tv.setText(text);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        tv.setTypeface(Typeface.DEFAULT_BOLD);
        tv.setTextColor(color);
        tv.setPadding(dp(12), dp(6), dp(12), dp(6));
        tv.setOnClickListener(onClick);
        return tv;
    }

    private void confirmUninstall(ExtItem item) {
        new AlertDialog.Builder(this, dialogTheme)
                .setTitle(item.name)
                .setMessage(isRu() ? "Удалить это расширение?" : "Uninstall this extension?")
                .setPositiveButton(isRu() ? "Удалить" : "Remove", (d, w) -> {
                    try {
                        Class<?> loader = Class.forName("com.sec.terrace.browser.extensions.TerraceExtensionsLoader");
                        Object inst = loader.getMethod("getInstance").invoke(null);
                        loader.getMethod("launchUninstallCrx", String.class).invoke(inst, item.id);
                        listContainer.postDelayed(this::reloadExtensions, 600);
                    } catch (Throwable t) {
                        Toast.makeText(this, String.valueOf(t.getMessage()), Toast.LENGTH_SHORT).show();
                    }
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void setExtensionEnabled(String extId, boolean enabled) {
        try {
            Class<?> loader = Class.forName("com.sec.terrace.browser.extensions.TerraceExtensionsLoader");
            Object inst = loader.getMethod("getInstance").invoke(null);
            loader.getMethod("changeExtensionStatus", String.class, boolean.class).invoke(inst, extId, enabled);
        } catch (Throwable t) {
            Toast.makeText(this, String.valueOf(t.getMessage()), Toast.LENGTH_SHORT).show();
        }
    }

    private void setSecretMode(String extId, boolean enabled) {
        try {
            Class<?> utilCls = Class.forName("com.sec.terrace.browser.extensions.TerraceExtensionUtil");
            Object util = utilCls.getMethod("getInstance").invoke(null);
            utilCls.getMethod("updateSecretModeState", String.class, boolean.class).invoke(util, extId, enabled);
        } catch (Throwable t) {
            Toast.makeText(this, String.valueOf(t.getMessage()), Toast.LENGTH_SHORT).show();
        }
    }

    /**
     * Combines TerraceExtensionsLoader.getInstalledExtensionsProperties() (ALL extensions: enabled + disabled)
     * with TerraceExtensionsManager.getActionList() (live Bitmap icons) and TerraceExtensionUtil (native states).
     */
    private static boolean isHiddenSystemExt(String id, String name) {
        if (id != null) {
            String lowId = id.toLowerCase(Locale.US);
            if (lowId.contains("web-agent") || lowId.contains("web_agent") || lowId.contains("webagent")) {
                return true;
            }
        }
        if (name != null) {
            String lowName = name.toLowerCase(Locale.US).trim();
            if ("web-agent".equals(lowName) || "web agent".equals(lowName) || lowName.contains("web-agent")) {
                return true;
            }
        }
        return false;
    }

    private static void disableHiddenSystemExtQuietly(String id) {
        if (id == null || id.isEmpty()) return;
        try {
            Class<?> loader = Class.forName("com.sec.terrace.browser.extensions.TerraceExtensionsLoader");
            Object inst = loader.getMethod("getInstance").invoke(null);
            loader.getMethod("changeExtensionStatus", String.class, boolean.class).invoke(inst, id, false);
        } catch (Throwable ignored) {}
    }

    private List<ExtItem> loadAllInstalledExtensions() {
        Map<String, ExtItem> byId = new LinkedHashMap<>();
        Map<String, Bitmap> icons = new HashMap<>();

        // 1. Collect live icons & active action items from TerraceExtensionsManager
        try {
            Class<?> mgrCls = Class.forName("com.sec.terrace.browser.extensions.TerraceExtensionsManager");
            Object mgr = mgrCls.getMethod("getInstance").invoke(null);
            List<?> actions = (List<?>) mgrCls.getMethod("getActionList").invoke(mgr);
            if (actions != null) {
                for (Object obj : actions) {
                    if (obj == null) continue;
                    String id = (String) obj.getClass().getMethod("getId").invoke(obj);
                    if (id == null || id.isEmpty() || BUILTIN_TRANS_ID.equals(id) || isHiddenSystemExt(id, null)) continue;
                    try {
                        Bitmap bmp = (Bitmap) obj.getClass().getMethod("getIcon").invoke(obj);
                        if (bmp != null) icons.put(id, bmp);
                    } catch (Throwable ignored) {}
                    String name = (String) obj.getClass().getMethod("getName").invoke(obj);
                    if (isHiddenSystemExt(id, name)) { disableHiddenSystemExtQuietly(id); continue; }
                    ExtItem item = new ExtItem();
                    item.id = id;
                    item.name = (name != null && !name.isEmpty()) ? name : id;
                    item.enabled = true;
                    byId.put(id, item);
                }
            }
        } catch (Throwable ignored) {}

        // 2. Collect ALL installed extensions (enabled AND disabled!) from TerraceExtensionsLoader
        try {
            Class<?> loaderCls = Class.forName("com.sec.terrace.browser.extensions.TerraceExtensionsLoader");
            Object loader = loaderCls.getMethod("getInstance").invoke(null);
            List<?> props = (List<?>) loaderCls.getMethod("getInstalledExtensionsProperties").invoke(loader);
            if (props != null) {
                for (Object p : props) {
                    if (p == null) continue;
                    String id = (String) p.getClass().getMethod("getExtId").invoke(p);
                    if (id == null || id.isEmpty() || BUILTIN_TRANS_ID.equals(id) || isHiddenSystemExt(id, null)) continue;
                    ExtItem item = byId.get(id);
                    if (item == null) {
                        item = new ExtItem();
                        item.id = id;
                        byId.put(id, item);
                    }
                    String name = (String) p.getClass().getMethod("getExtName").invoke(p);
                    String desc = (String) p.getClass().getMethod("getExtDesc").invoke(p);
                    String ver = (String) p.getClass().getMethod("getExtVer").invoke(p);
                    if (name != null && !name.isEmpty()) item.name = name;
                    if (desc != null && !desc.isEmpty()) item.description = desc;
                    if (ver != null && !ver.isEmpty()) item.version = ver;
                }
            }
        } catch (Throwable ignored) {}

        // 3. Populate exact native enabled state, version, options page, and Secret Mode state from TerraceExtensionUtil
        try {
            Class<?> utilCls = Class.forName("com.sec.terrace.browser.extensions.TerraceExtensionUtil");
            Object util = utilCls.getMethod("getInstance").invoke(null);
            for (ExtItem item : byId.values()) {
                item.icon = icons.get(item.id);
                if (item.name == null || item.name.isEmpty()) item.name = item.id;
                try {
                    Boolean en = (Boolean) utilCls.getMethod("isEnabledInNative", String.class).invoke(util, item.id);
                    if (en != null) item.enabled = en;
                } catch (Throwable ignored) {}
                if (item.version == null || item.version.isEmpty()) {
                    try {
                        item.version = (String) utilCls.getMethod("getInstalledExtVersion", String.class).invoke(util, item.id);
                    } catch (Throwable ignored) {}
                }
                try {
                    item.optionsUrl = (String) utilCls.getMethod("getExtensionOptionPage", String.class).invoke(util, item.id);
                } catch (Throwable ignored) {}
                try {
                    Boolean can = (Boolean) utilCls.getMethod("canBeSecretModeEnabled", String.class).invoke(util, item.id);
                    item.canSecretMode = can != null && can;
                    if (item.canSecretMode) {
                        Boolean st = (Boolean) utilCls.getMethod("getSecretModeState", String.class).invoke(util, item.id);
                        item.secretModeEnabled = st != null && st;
                    }
                } catch (Throwable ignored) {}
            }
        } catch (Throwable ignored) {}

        List<ExtItem> out = new ArrayList<>();
        for (ExtItem it : byId.values()) {
            if (isHiddenSystemExt(it.id, it.name)) {
                if (it.enabled) disableHiddenSystemExtQuietly(it.id);
                continue;
            }
            out.add(it);
        }
        Collections.sort(out, (a, b) -> a.name.compareToIgnoreCase(b.name));
        return out;
    }

    private void openInternalOrWebUrl(String url) {
        if (SBrowserXHooks.openInternalUrl(this, url)) {
            finish();
        }
    }

    private void openUrl(String url) {
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
            intent.setPackage(getPackageName());
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(intent);
            finish();
        } catch (Throwable t) {
            Toast.makeText(this, String.valueOf(t.getMessage()), Toast.LENGTH_SHORT).show();
        }
    }

    private LinearLayout card() {
        LinearLayout ll = new LinearLayout(this);
        ll.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable gd = new GradientDrawable();
        gd.setColor(cardColor);
        gd.setCornerRadius(dp(20));
        ll.setBackground(gd);
        ll.setLayoutParams(new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));
        return ll;
    }

    private View divider() {
        View v = new View(this);
        v.setBackgroundColor(night ? 0xFF2A2A32 : 0xFFE5E5EA);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, 1);
        lp.leftMargin = dp(16);
        lp.rightMargin = dp(16);
        v.setLayoutParams(lp);
        return v;
    }

    private boolean isRu() {
        String l = Locale.getDefault().getLanguage();
        return "ru".equals(l) || "uk".equals(l);
    }

    private int dp(int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, getResources().getDisplayMetrics()));
    }

    private static final class ExtItem {
        String id;
        String name;
        String description;
        String version;
        String optionsUrl;
        Bitmap icon;
        boolean enabled;
        boolean canSecretMode;
        boolean secretModeEnabled;
    }
}
