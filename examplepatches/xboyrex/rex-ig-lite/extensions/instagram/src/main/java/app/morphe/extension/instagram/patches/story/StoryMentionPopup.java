/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */

package app.morphe.extension.instagram.patches.story;

import android.app.Activity;
import android.app.Dialog;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Outline;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.util.LruCache;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import android.view.Window;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.instagram.settings.preference.widgets.RexHaptics;
import app.morphe.extension.instagram.settings.preference.widgets.RexIcon;

@SuppressWarnings("unused")
public final class StoryMentionPopup {
    public static final int STYLE_SHEET = 0;
    public static final int STYLE_MODERN = 1;
    public static final int STYLE_MINIMAL = 2;
    public static final int STYLE_COUNT = 3;

    public static final class Mention {
        final String username;
        final String fullName;
        final String picUrl;
        final boolean verified;

        Mention(String username, String fullName, String picUrl, boolean verified) {
            this.username = username;
            this.fullName = fullName;
            this.picUrl = picUrl;
            this.verified = verified;
        }

        @Override
        public String toString() {
            return username;
        }
    }

    private static final int ACCENT = 0xFF3998E8;

    private static final ExecutorService POOL = Executors.newFixedThreadPool(3);
    private static final LruCache<String, Bitmap> AVATARS = new LruCache<>(48);

    private StoryMentionPopup() {
    }

    public static String styleName(int style, boolean pt) {
        switch (style) {
            case STYLE_MODERN:
                return pt ? "Moderno (translúcido)" : "Modern (translucent)";
            case STYLE_MINIMAL:
                return pt ? "Minimalista" : "Minimalist";
            default:
                return pt ? "Instagram (bottom sheet)" : "Instagram (bottom sheet)";
        }
    }

    public static String styleDescription(int style, boolean pt) {
        switch (style) {
            case STYLE_MODERN:
                return pt ? "Com leve transparência e efeito de vidro." : "Slightly transparent, glass effect.";
            case STYLE_MINIMAL:
                return pt ? "Simples, direto e elegante." : "Simple, direct and elegant.";
            default:
                return pt ? "Visual nativo, limpo e consistente com o app." : "Native look, clean and consistent with the app.";
        }
    }

    private static boolean pt() {
        return "pt".equals(Locale.getDefault().getLanguage());
    }

    private static final class Palette {
        int background = 0xFF1A1A1A;
        int stroke = 0xFF343840;
        int primary = 0xFFF5F5F5;
        int secondary = 0xFFA1A1AA;
        int placeholder = 0xFF25282D;
    }

    private static Palette palette(Activity activity, int style) {
        Palette p = new Palette();
        if (style == STYLE_MODERN) {
            p.background = 0xDD1A1A1A;
            p.stroke = 0xFF343840;
        } else if (style == STYLE_MINIMAL) {
            boolean dark = (activity.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
            if (!dark) {
                p.background = 0xFFFFFFFF;
                p.stroke = 0xFFE2E6EC;
                p.primary = 0xFF121417;
                p.secondary = 0xFF6B7480;
                p.placeholder = 0xFFE6EAF0;
            }
        }
        return p;
    }

    public static void show(Activity activity, List<Mention> mentions) {
        if (activity == null || activity.isFinishing()) return;
        if (mentions == null || mentions.isEmpty()) {
            PeopleCellDialogBox.showPeopleDialog(activity, new java.util.ArrayList<>(), null);
            return;
        }
        int style = StoryMentionSettings.popupStyle(activity);
        Palette p = palette(activity, style);
        boolean pt = pt();

        Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        LinearLayout content = new LinearLayout(activity);
        content.setOrientation(LinearLayout.VERTICAL);
        int pad = dp(activity, 20);
        content.setPadding(pad, dp(activity, style == STYLE_SHEET ? 12 : 20), pad, dp(activity, 20));

        if (style == STYLE_MINIMAL && mentions.size() == 1) {
            Mention only = mentions.get(0);
            content.addView(single(activity, only, p, pt, () -> {
                RexHaptics.tap(activity);
                dialog.dismiss();
                StoryMentionIcon.openProfile(activity, only.username);
            }));
        } else {
            if (style == STYLE_SHEET) {
                View handle = new View(activity);
                GradientDrawable handleBg = new GradientDrawable();
                handleBg.setColor(0xFF4A515A);
                handleBg.setCornerRadius(dp(activity, 2));
                handle.setBackground(handleBg);
                LinearLayout.LayoutParams handleLp = new LinearLayout.LayoutParams(dp(activity, 36), dp(activity, 4));
                handleLp.gravity = Gravity.CENTER_HORIZONTAL;
                handleLp.bottomMargin = dp(activity, 16);
                content.addView(handle, handleLp);
            }

            LinearLayout headerRow = new LinearLayout(activity);
            headerRow.setOrientation(LinearLayout.HORIZONTAL);
            headerRow.setGravity(Gravity.CENTER_VERTICAL);

            ImageView headerIcon = new ImageView(activity);
            headerIcon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            headerIcon.setImageDrawable(RexIcon.getDrawable(activity, "at-sign", RexDialogs.BRAND_CYAN, 22));
            LinearLayout.LayoutParams hiLp = new LinearLayout.LayoutParams(dp(activity, 22), dp(activity, 22));
            hiLp.setMarginEnd(dp(activity, 10));
            headerRow.addView(headerIcon, hiLp);

            TextView title = new TextView(activity);
            title.setText((pt ? "Menções Ocultas (" : "Hidden Mentions (") + mentions.size() + ")");
            title.setTextColor(p.primary);
            title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20.5f);
            title.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            headerRow.addView(title);
            content.addView(headerRow);

            int count = mentions.size();
            TextView subtitle = new TextView(activity);
            subtitle.setText(pt
                    ? count + (count == 1 ? " conta mencionada neste story" : " contas mencionadas neste story")
                    : count + (count == 1 ? " account mentioned in this story" : " accounts mentioned in this story"));
            subtitle.setTextColor(p.secondary);
            subtitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            subtitle.setPadding(0, dp(activity, 4), 0, dp(activity, 12));
            content.addView(subtitle);

            LinearLayout list = new LinearLayout(activity);
            list.setOrientation(LinearLayout.VERTICAL);
            for (Mention mention : mentions) {
                list.addView(row(activity, mention, p, () -> {
                    RexHaptics.tap(activity);
                    dialog.dismiss();
                    StoryMentionIcon.openProfile(activity, mention.username);
                }));
            }
            int maxHeight = Math.round(activity.getResources().getDisplayMetrics().heightPixels * 0.5f);
            MaxHeightScrollView scroll = new MaxHeightScrollView(activity, maxHeight);
            scroll.setVerticalScrollBarEnabled(false);
            scroll.addView(list);
            content.addView(scroll);

            RexDialogs.addDialogCloseFooter(activity, content, dialog);
        }

        dialog.setContentView(content);
        dialog.setCanceledOnTouchOutside(true);
        configureWindow(activity, dialog.getWindow(), style, p);
        RexDialogs.attachBlurBehind(dialog, activity);
        dialog.show();
    }

    private static void configureWindow(Activity activity, Window window, int style, Palette p) {
        if (window == null) return;
        float radius = dp(activity, 26);
        int margin = style == STYLE_SHEET ? 0 : dp(activity, style == STYLE_MODERN ? 12 : 32);

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(p.background);
        if (p.stroke != 0) bg.setStroke(Math.max(1, dp(activity, 1)), p.stroke);
        if (style == STYLE_SHEET) {
            bg.setCornerRadii(new float[]{radius, radius, radius, radius, 0, 0, 0, 0});
        } else {
            bg.setCornerRadius(radius);
        }
        window.setBackgroundDrawable(bg);

        int screenWidth = activity.getResources().getDisplayMetrics().widthPixels;
        WindowManager.LayoutParams lp = window.getAttributes();
        lp.width = screenWidth - margin * 2;
        lp.height = ViewGroup.LayoutParams.WRAP_CONTENT;
        if (style == STYLE_MINIMAL) {
            lp.gravity = Gravity.CENTER;
            lp.windowAnimations = android.R.style.Animation_Dialog;
        } else {
            lp.gravity = Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL;
            lp.y = style == STYLE_SHEET ? 0 : dp(activity, 12);
            lp.windowAnimations = android.R.style.Animation_InputMethod;
        }
        lp.dimAmount = 0.52f;
        window.setAttributes(lp);
        window.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);

        if (style == STYLE_MODERN && Build.VERSION.SDK_INT >= 31) {
            try {
                Window.class.getMethod("setBackgroundBlurRadius", int.class).invoke(window, dp(activity, 24));
            } catch (Throwable ignored) {
            }
        }
    }

    private static View single(Activity activity, Mention mention, Palette p, boolean pt, Runnable open) {
        LinearLayout box = new LinearLayout(activity);
        box.setOrientation(LinearLayout.VERTICAL);
        box.setGravity(Gravity.CENTER_HORIZONTAL);

        box.addView(avatar(activity, mention, p, 28), new LinearLayout.LayoutParams(dp(activity, 88), dp(activity, 88)));

        LinearLayout nameLine = nameLine(activity, mention, p, 20);
        LinearLayout.LayoutParams nameLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        nameLp.topMargin = dp(activity, 14);
        box.addView(nameLine, nameLp);

        if (!mention.fullName.isEmpty()) {
            TextView full = new TextView(activity);
            full.setText(mention.fullName);
            full.setTextColor(p.secondary);
            full.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
            full.setGravity(Gravity.CENTER);
            box.addView(full);
        }

        TextView button = new TextView(activity);
        button.setText(pt ? "Ver perfil" : "View profile");
        button.setTextColor(Color.WHITE);
        button.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        button.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        button.setGravity(Gravity.CENTER);
        GradientDrawable buttonBg = new GradientDrawable();
        buttonBg.setColor(ACCENT);
        buttonBg.setCornerRadius(dp(activity, 24));
        button.setBackground(buttonBg);
        button.setOnClickListener(v -> open.run());
        LinearLayout.LayoutParams buttonLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(activity, 48));
        buttonLp.topMargin = dp(activity, 22);
        box.addView(button, buttonLp);
        return box;
    }

    private static View row(Activity activity, Mention mention, Palette p, Runnable onClick) {
        LinearLayout row = new LinearLayout(activity);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(activity, 56));
        row.setPadding(0, dp(activity, 8), 0, dp(activity, 8));

        row.addView(avatar(activity, mention, p, 18), new LinearLayout.LayoutParams(dp(activity, 48), dp(activity, 48)));

        LinearLayout texts = new LinearLayout(activity);
        texts.setOrientation(LinearLayout.VERTICAL);
        texts.addView(nameLine(activity, mention, p, 16));
        if (!mention.fullName.isEmpty()) {
            TextView full = new TextView(activity);
            full.setText(mention.fullName);
            full.setTextColor(p.secondary);
            full.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
            full.setSingleLine(true);
            full.setEllipsize(android.text.TextUtils.TruncateAt.END);
            texts.addView(full);
        }
        LinearLayout.LayoutParams textsLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        textsLp.setMarginStart(dp(activity, 14));
        row.addView(texts, textsLp);

        final ImageView chevron = new ImageView(activity);
        chevron.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        chevron.setImageDrawable(RexIcon.getDrawable(activity, "chevron-right", p.secondary, 19));
        row.addView(chevron, new LinearLayout.LayoutParams(dp(activity, 20), dp(activity, 20)));

        row.setOnClickListener(v -> {
            RexIcon.nudgeChevron(chevron);
            onClick.run();
        });
        return row;
    }

    private static LinearLayout nameLine(Activity activity, Mention mention, Palette p, int sp) {
        LinearLayout line = new LinearLayout(activity);
        line.setOrientation(LinearLayout.HORIZONTAL);
        line.setGravity(Gravity.CENTER_VERTICAL);
        TextView handle = new TextView(activity);
        handle.setText("@" + mention.username);
        handle.setTextColor(p.primary);
        handle.setTextSize(TypedValue.COMPLEX_UNIT_SP, sp);
        handle.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        handle.setSingleLine(true);
        handle.setEllipsize(android.text.TextUtils.TruncateAt.END);
        line.addView(handle, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        if (mention.verified) {
            ImageView badge = new ImageView(activity);
            badge.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            badge.setImageDrawable(RexIcon.getDrawable(activity, "badge-check", ACCENT, 16, true));
            LinearLayout.LayoutParams badgeLp = new LinearLayout.LayoutParams(dp(activity, 16), dp(activity, 16));
            badgeLp.setMarginStart(dp(activity, 6));
            line.addView(badge, badgeLp);
        }
        return line;
    }

    private static View avatar(Activity activity, Mention mention, Palette p, int initialSp) {
        FrameLayout frame = new FrameLayout(activity);
        GradientDrawable circle = new GradientDrawable();
        circle.setShape(GradientDrawable.OVAL);
        circle.setColor(p.placeholder);
        frame.setBackground(circle);

        TextView initial = new TextView(activity);
        initial.setText(mention.username.isEmpty() ? "" : mention.username.substring(0, 1).toUpperCase(Locale.ROOT));
        initial.setTextColor(p.secondary);
        initial.setTextSize(TypedValue.COMPLEX_UNIT_SP, initialSp);
        initial.setGravity(Gravity.CENTER);
        frame.addView(initial, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        ImageView picture = new ImageView(activity);
        picture.setScaleType(ImageView.ScaleType.CENTER_CROP);
        picture.setOutlineProvider(new ViewOutlineProvider() {
            @Override
            public void getOutline(View view, Outline outline) {
                outline.setOval(0, 0, view.getWidth(), view.getHeight());
            }
        });
        picture.setClipToOutline(true);
        frame.addView(picture, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        loadAvatar(mention.picUrl, picture);
        return frame;
    }

    private static void loadAvatar(String url, ImageView target) {
        if (url == null || url.isEmpty()) return;
        Bitmap cached = AVATARS.get(url);
        if (cached != null) {
            target.setImageBitmap(cached);
            return;
        }
        target.setTag(url);
        POOL.execute(() -> {
            Bitmap bitmap = download(url);
            if (bitmap == null) return;
            AVATARS.put(url, bitmap);
            target.post(() -> {
                if (url.equals(target.getTag())) target.setImageBitmap(bitmap);
            });
        });
    }

    private static Bitmap download(String url) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setConnectTimeout(5000);
            connection.setReadTimeout(5000);
            try (InputStream in = connection.getInputStream()) {
                return BitmapFactory.decodeStream(in);
            }
        } catch (Throwable t) {
            android.util.Log.w("StoryMentionIcon", "avatar download failed", t);
            return null;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    private static final class MaxHeightScrollView extends ScrollView {
        private final int maxHeight;

        MaxHeightScrollView(Activity activity, int maxHeight) {
            super(activity);
            this.maxHeight = maxHeight;
        }

        @Override
        protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
            super.onMeasure(widthMeasureSpec, MeasureSpec.makeMeasureSpec(maxHeight, MeasureSpec.AT_MOST));
        }
    }

    private static int dp(Activity activity, int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, activity.getResources().getDisplayMetrics()));
    }
}
