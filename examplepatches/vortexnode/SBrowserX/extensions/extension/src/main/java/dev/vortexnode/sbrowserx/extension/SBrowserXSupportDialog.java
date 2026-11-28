package dev.vortexnode.sbrowserx.extension;

import android.app.Activity;
import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.reflect.Method;

/**
 * Compact One UI frosted-glass "Support the author" dialog (Boosty + Crypto direct copy).
 */
public final class SBrowserXSupportDialog {
    public static final String BOOSTY_URL = "https://boosty.to/vortexnode/donate";
    public static final String USDT_TRC20 = "TL1dvN9DLJMgo1zoKQ682BoUNr2wVYB6rW";
    public static final String USDT_TON = "UQBy-hdr5yjVBPV8W4cz-stesuYvvHRghALfqltCEyagM-8N";
    public static final String BTC_ADDR = "17tzAY6JXuy6KzfZcDmb22DiHsxDKiNpx1";

    private SBrowserXSupportDialog() {}

    public static void show(Activity act, Runnable onViewedCallback) {
        if (act == null || act.isFinishing() || act.isDestroyed()) return;
        SBrowserXPrefs.markSupportViewed(act);
        if (onViewedCallback != null) {
            try { onViewedCallback.run(); } catch (Throwable ignored) {}
        }
        try {
            boolean night = SBrowserXHooks.isBrowserNightMode(act);
            float d = act.getResources().getDisplayMetrics().density;
            int oneUiBlue = night ? 0xFF3E82F7 : 0xFF0381FE;
            int coral = night ? 0xFFFF6B6B : 0xFFE11D48;
            int backdropTint = night ? 0x8C0D0F14 : 0x7AEEF0F5;
            int sheetBg = night ? 0xE6171A23 : 0xF2FFFFFF;
            int sheetBorder = night ? 0x26FFFFFF : 0x18000000;
            int cardBg = night ? 0x62262B38 : 0xCCF2F4F8;
            int cardBorder = night ? 0x1CFFFFFF : 0x14000000;
            int textPrimary = night ? 0xFFF8FAFC : 0xFF111827;
            int textSecondary = night ? 0xFFAAB2C0 : 0xFF4B5563;

            String lang = SBrowserXStrings.getAppLang();
            boolean ru = "ru".equals(lang);
            boolean uk = "uk".equals(lang);
            String boostySub = ru ? "Банковские карты • Разовый донат"
                    : (uk ? "Банківські картки • Разовий донат" : "Bank cards • One-time donation");
            String tapToCopy = ru ? "Нажмите, чтобы скопировать"
                    : (uk ? "Натисніть, щоб скопіювати" : "Tap to copy");

            FrameLayout backdrop = new FrameLayout(act);
            backdrop.setLayoutParams(new FrameLayout.LayoutParams(
                    FrameLayout.LayoutParams.MATCH_PARENT, FrameLayout.LayoutParams.MATCH_PARENT));
            backdrop.setBackgroundColor(backdropTint);
            applyOneUiWindowBlur(backdrop, 200, backdropTint);

            LinearLayout root = new LinearLayout(act);
            root.setOrientation(LinearLayout.VERTICAL);
            GradientDrawable rootBg = new GradientDrawable();
            rootBg.setColor(sheetBg);
            rootBg.setCornerRadius(dp(d, 28));
            rootBg.setStroke(Math.max(1, dp(d, 1)), sheetBorder);
            root.setBackground(rootBg);
            root.setPadding(dp(d, 20), dp(d, 22), dp(d, 20), dp(d, 16));

            // Title & short warm subtitle
            TextView tvTitle = new TextView(act);
            tvTitle.setText(SBrowserXStrings.getSupportTitle() + "  \u2615");
            tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20f);
            tvTitle.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            tvTitle.setTextColor(textPrimary);
            tvTitle.setPadding(dp(d, 4), 0, dp(d, 4), dp(d, 4));
            root.addView(tvTitle);

            TextView tvSub = new TextView(act);
            tvSub.setText(SBrowserXStrings.getSupportSubtitle());
            tvSub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            tvSub.setTextColor(textSecondary);
            tvSub.setPadding(dp(d, 4), 0, dp(d, 4), dp(d, 16));
            root.addView(tvSub);

            ScrollView sv = new ScrollView(act);
            sv.setVerticalScrollBarEnabled(false);
            sv.setOverScrollMode(View.OVER_SCROLL_NEVER);
            LinearLayout list = new LinearLayout(act);
            list.setOrientation(LinearLayout.VERTICAL);

            final Dialog dlg = new Dialog(act, android.R.style.Theme_Translucent_NoTitleBar);

            // 1. Boosty card (highlighted orange/coral)
            list.addView(buildActionCard(act, d, night ? 0x38F97316 : 0x18F97316,
                    night ? 0x88FB923C : 0x66EA580C, night ? 0xFFFB923C : 0xFFEA580C,
                    textPrimary, textSecondary, "Boosty", boostySub, "→", v -> {
                        try {
                            Intent i = new Intent(Intent.ACTION_VIEW, Uri.parse(BOOSTY_URL));
                            i.setPackage(act.getPackageName());
                            act.startActivity(i);
                        } catch (Throwable t) {
                            try {
                                act.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse(BOOSTY_URL)));
                            } catch (Throwable ignored) {}
                        }
                        dlg.dismiss();
                    }));

            // 2. USDT (TRC20)
            list.addView(buildCryptoCard(act, d, cardBg, cardBorder, night ? 0xFF34D399 : 0xFF059669,
                    textPrimary, textSecondary, "USDT (TRC20)", USDT_TRC20, tapToCopy));

            // 3. USDT (TON)
            list.addView(buildCryptoCard(act, d, cardBg, cardBorder, oneUiBlue,
                    textPrimary, textSecondary, "USDT (TON)", USDT_TON, tapToCopy));

            // 4. Bitcoin (BTC)
            list.addView(buildCryptoCard(act, d, cardBg, cardBorder, night ? 0xFFFBBF24 : 0xFFD97706,
                    textPrimary, textSecondary, "Bitcoin (BTC)", BTC_ADDR, tapToCopy));

            sv.addView(list);
            root.addView(sv, new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT));

            // Close pill button
            TextView closeBtn = new TextView(act);
            closeBtn.setText(SBrowserXStrings.getSupportClose());
            closeBtn.setGravity(Gravity.CENTER);
            closeBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
            closeBtn.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            closeBtn.setTextColor(textPrimary);
            closeBtn.setPadding(0, dp(d, 12), 0, dp(d, 12));
            GradientDrawable cBg = new GradientDrawable();
            cBg.setCornerRadius(dp(d, 22));
            cBg.setColor(night ? 0x3A6B7280 : 0x229CA3AF);
            closeBtn.setBackground(cBg);
            LinearLayout.LayoutParams clp = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
            clp.topMargin = dp(d, 8);
            closeBtn.setOnClickListener(v -> dlg.dismiss());
            root.addView(closeBtn, clp);

            int sheetW = Math.round(act.getResources().getDisplayMetrics().widthPixels * 0.90f);
            FrameLayout.LayoutParams sheetLp = new FrameLayout.LayoutParams(
                    sheetW, FrameLayout.LayoutParams.WRAP_CONTENT, Gravity.CENTER);
            sheetLp.topMargin = dp(d, 18);
            backdrop.addView(root, sheetLp);
            backdrop.setOnClickListener(v -> dlg.dismiss());
            root.setOnClickListener(v -> {}); // absorb clicks inside sheet

            dlg.requestWindowFeature(Window.FEATURE_NO_TITLE);
            dlg.setContentView(backdrop);
            dlg.setCancelable(true);
            dlg.setCanceledOnTouchOutside(true);

            Window win = dlg.getWindow();
            if (win != null) {
                win.setLayout(WindowManager.LayoutParams.MATCH_PARENT, WindowManager.LayoutParams.MATCH_PARENT);
                win.setStatusBarColor(0x00000000);
                win.setNavigationBarColor(0x00000000);
                win.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
                if (Build.VERSION.SDK_INT >= 31) {
                    win.addFlags(WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
                    try {
                        WindowManager.LayoutParams lp = win.getAttributes();
                        lp.setBlurBehindRadius(80);
                        win.setAttributes(lp);
                    } catch (Throwable ignored) {}
                }
            }
            dlg.show();
        } catch (Throwable ignored) {}
    }

    private static View buildActionCard(
            Activity act, float d, int bgColor, int strokeColor, int accentColor,
            int textPrimary, int textSecondary, String title, String subtitle, String trailing,
            View.OnClickListener onClick
    ) {
        LinearLayout card = new LinearLayout(act);
        card.setOrientation(LinearLayout.HORIZONTAL);
        card.setGravity(Gravity.CENTER_VERTICAL);
        GradientDrawable gd = new GradientDrawable();
        gd.setColor(bgColor);
        gd.setCornerRadius(dp(d, 18));
        gd.setStroke(Math.max(1, dp(d, 1)), strokeColor);
        card.setBackground(gd);
        card.setPadding(dp(d, 16), dp(d, 14), dp(d, 16), dp(d, 14));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        lp.bottomMargin = dp(d, 10);
        card.setLayoutParams(lp);
        card.setOnClickListener(onClick);

        LinearLayout col = new LinearLayout(act);
        col.setOrientation(LinearLayout.VERTICAL);
        TextView tvT = new TextView(act);
        tvT.setText(title);
        tvT.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
        tvT.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        tvT.setTextColor(accentColor);
        col.addView(tvT);

        TextView tvS = new TextView(act);
        tvS.setText(subtitle);
        tvS.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        tvS.setTextColor(textSecondary);
        tvS.setPadding(0, dp(d, 2), 0, 0);
        col.addView(tvS);
        card.addView(col, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        TextView tvArrow = new TextView(act);
        tvArrow.setText(trailing);
        tvArrow.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18f);
        tvArrow.setTypeface(Typeface.DEFAULT_BOLD);
        tvArrow.setTextColor(accentColor);
        card.addView(tvArrow);
        return card;
    }

    private static View buildCryptoCard(
            Activity act, float d, int bgColor, int strokeColor, int accentColor,
            int textPrimary, int textSecondary, String coin, String address, String tapHint
    ) {
        LinearLayout card = new LinearLayout(act);
        card.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable gd = new GradientDrawable();
        gd.setColor(bgColor);
        gd.setCornerRadius(dp(d, 18));
        gd.setStroke(1, strokeColor);
        card.setBackground(gd);
        card.setPadding(dp(d, 16), dp(d, 12), dp(d, 16), dp(d, 12));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        lp.bottomMargin = dp(d, 10);
        card.setLayoutParams(lp);

        LinearLayout top = new LinearLayout(act);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);

        TextView tvCoin = new TextView(act);
        tvCoin.setText(coin);
        tvCoin.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
        tvCoin.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        tvCoin.setTextColor(accentColor);
        top.addView(tvCoin, new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        TextView tvCopy = new TextView(act);
        tvCopy.setText(tapHint);
        tvCopy.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
        tvCopy.setTextColor(textSecondary);
        top.addView(tvCopy);
        card.addView(top);

        TextView tvAddr = new TextView(act);
        tvAddr.setText(address);
        tvAddr.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        tvAddr.setTypeface(Typeface.MONOSPACE);
        tvAddr.setTextColor(textPrimary);
        tvAddr.setPadding(0, dp(d, 4), 0, 0);
        card.addView(tvAddr);

        card.setOnClickListener(v -> {
            try {
                ClipboardManager cm = (ClipboardManager) act.getSystemService(Context.CLIPBOARD_SERVICE);
                if (cm != null) {
                    cm.setPrimaryClip(ClipData.newPlainText(coin, address));
                    Toast.makeText(act, SBrowserXStrings.getSupportCopied() + " (" + coin + ")", Toast.LENGTH_SHORT).show();
                }
            } catch (Throwable ignored) {}
        });
        return card;
    }

    private static void applyOneUiWindowBlur(View view, int radius, int tintColor) {
        if (view == null) return;
        try {
            Class<?> blurInfoCls = Class.forName("android.view.SemBlurInfo");
            Class<?> builderCls = Class.forName("android.view.SemBlurInfo$Builder");
            Object builder = builderCls.getConstructor(int.class).newInstance(0);
            try { builderCls.getMethod("setRadius", int.class).invoke(builder, radius); } catch (Throwable ignored) {}
            try { builderCls.getMethod("setBackgroundColor", int.class).invoke(builder, tintColor); } catch (Throwable ignored) {}
            Object info = builderCls.getMethod("build").invoke(builder);
            Method setBlur = View.class.getMethod("semSetBlurInfo", blurInfoCls);
            setBlur.invoke(view, info);
        } catch (Throwable ignored) {}
    }

    private static int dp(float d, int v) {
        return Math.round(v * d);
    }
}
