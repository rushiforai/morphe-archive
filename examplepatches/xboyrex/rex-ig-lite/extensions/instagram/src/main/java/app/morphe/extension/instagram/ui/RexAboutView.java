/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 */
package app.morphe.extension.instagram.ui;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.util.Base64;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.settings.preference.fragments.FragmentHook;
import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.shared.Utils;

/**
 * Liquid Glass About Screen matching 23424_0f7360.jpg (SakuraTunes style) with:
 * - Scalloped Hero Badge + Black Instagram Badge next to Music Flower icon
 * - xboyrex title, Liquid Glass Instagram Experience subtitle, v3.12.0 + UNIVERSAL pills
 * - Mayank (@xboyrex) developer card with scalloped anime avatar, 2x2 social pills, and Star CTA
 * - COMMUNITY & INFO section with clickable channel/profile rows & Backup/Patch status access
 */
public final class RexAboutView {

    private static final String[] AVATAR_B64_CHUNKS = new String[] {
        "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",
        "RU5ErkJggg=="
    };

    private static Bitmap cachedAvatar;

    private RexAboutView() {}

    private static int dp(Context ctx, float v) {
        return (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, v, ctx.getResources().getDisplayMetrics());
    }

    private static GradientDrawable pillBg(Context ctx, int fill, int stroke, float radiusDp) {
        GradientDrawable d = new GradientDrawable();
        d.setColor(fill);
        d.setCornerRadius(dp(ctx, radiusDp));
        if (stroke != 0) {
            d.setStroke(dp(ctx, 1f), stroke);
        }
        return d;
    }

    private static Bitmap getDeveloperAvatar() {
        if (cachedAvatar != null) return cachedAvatar;
        try {
            StringBuilder sb = new StringBuilder();
            for (String chunk : AVATAR_B64_CHUNKS) {
                sb.append(chunk);
            }
            byte[] bytes = Base64.decode(sb.toString(), Base64.DEFAULT);
            cachedAvatar = BitmapFactory.decodeByteArray(bytes, 0, bytes.length);
            return cachedAvatar;
        } catch (Throwable ignored) {
            return null;
        }
    }

    public static View create(Context ctx) {
        ScrollView scroll = new ScrollView(ctx);
        scroll.setBackgroundColor(0xFF0A0E10);
        scroll.setVerticalScrollBarEnabled(false);
        scroll.setFillViewport(true);

        LinearLayout container = new LinearLayout(ctx);
        container.setOrientation(LinearLayout.VERTICAL);
        int padH = dp(ctx, 16);
        container.setPadding(padH, dp(ctx, 12), padH, dp(ctx, 32));
        scroll.addView(container, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // ===================================================================
        // CARD 1: HERO CARD (Scalloped Music Flower + Black Instagram Icon)
        // ===================================================================
        LinearLayout heroCard = new LinearLayout(ctx);
        heroCard.setOrientation(LinearLayout.HORIZONTAL);
        heroCard.setGravity(Gravity.CENTER_VERTICAL);
        heroCard.setBackground(pillBg(ctx, 0xFF19282C, 0xFF2B4248, 26f));
        heroCard.setPadding(dp(ctx, 18), dp(ctx, 20), dp(ctx, 18), dp(ctx, 20));

        // Left Dual Badge View: Scalloped Sakura Music Badge + Black Instagram Badge side-by-side
        HeroBadgeView badgeView = new HeroBadgeView(ctx);
        LinearLayout.LayoutParams badgeLp = new LinearLayout.LayoutParams(dp(ctx, 96), dp(ctx, 76));
        badgeLp.rightMargin = dp(ctx, 14);
        heroCard.addView(badgeView, badgeLp);

        // Right Column: Title + Subtitle + Pills
        LinearLayout heroTextCol = new LinearLayout(ctx);
        heroTextCol.setOrientation(LinearLayout.VERTICAL);

        TextView heroTitle = new TextView(ctx);
        heroTitle.setText("xboyrex");
        heroTitle.setTextColor(0xFFF3F8F9);
        heroTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 27);
        heroTitle.setTypeface(Typeface.create("sans-serif-black", Typeface.BOLD));
        heroTextCol.addView(heroTitle);

        TextView heroSub = new TextView(ctx);
        heroSub.setText("Liquid Glass Instagram Experience");
        heroSub.setTextColor(0xFF88C2CE);
        heroSub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
        heroSub.setPadding(0, dp(ctx, 2), 0, dp(ctx, 10));
        heroTextCol.addView(heroSub);

        LinearLayout pillRow = new LinearLayout(ctx);
        pillRow.setOrientation(LinearLayout.HORIZONTAL);

        String verStr = "v3.12.0+50c45cf";
        try {
            String igVer = Utils.getAppVersionName();
            if (igVer != null && !igVer.isEmpty()) {
                verStr = "v3.12.0 • IG " + igVer.split("\\.")[0];
            }
        } catch (Throwable ignored) {}

        TextView verPill = buildBadgePill(ctx, verStr);
        LinearLayout.LayoutParams vpLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        vpLp.rightMargin = dp(ctx, 8);
        pillRow.addView(verPill, vpLp);

        TextView uniPill = buildBadgePill(ctx, "UNIVERSAL");
        pillRow.addView(uniPill);

        heroTextCol.addView(pillRow);
        heroCard.addView(heroTextCol, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        container.addView(heroCard, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        // ===================================================================
        // CARD 2: DEVELOPER CARD (Mayank @xboyrex + 2x2 Grid + Star Button)
        // ===================================================================
        LinearLayout devCard = new LinearLayout(ctx);
        devCard.setOrientation(LinearLayout.VERTICAL);
        devCard.setBackground(pillBg(ctx, 0xFF111618, 0xFF1F292D, 26f));
        devCard.setPadding(dp(ctx, 18), dp(ctx, 20), dp(ctx, 18), dp(ctx, 20));
        LinearLayout.LayoutParams devCardLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        devCardLp.topMargin = dp(ctx, 16);

        // Top Profile Row
        LinearLayout profRow = new LinearLayout(ctx);
        profRow.setOrientation(LinearLayout.HORIZONTAL);
        profRow.setGravity(Gravity.CENTER_VERTICAL);

        ImageView avatarView = new ImageView(ctx);
        Bitmap avatarBmp = getDeveloperAvatar();
        if (avatarBmp != null) {
            avatarView.setImageBitmap(avatarBmp);
        } else {
            avatarView.setImageDrawable(RexVectorIcons.create(ctx, RexVectorIcons.IC_USER_CIRCLE, 0xFF88C2CE, 64));
        }
        avatarView.setScaleType(ImageView.ScaleType.FIT_CENTER);
        LinearLayout.LayoutParams avLp = new LinearLayout.LayoutParams(dp(ctx, 82), dp(ctx, 82));
        avLp.rightMargin = dp(ctx, 16);
        profRow.addView(avatarView, avLp);

        LinearLayout profTextCol = new LinearLayout(ctx);
        profTextCol.setOrientation(LinearLayout.VERTICAL);

        TextView devName = new TextView(ctx);
        devName.setText("ㅤᏞᴀᴢʏㅤᎷꫝʏᴀɴк まやんく");
        devName.setTextColor(Color.WHITE);
        devName.setTextSize(TypedValue.COMPLEX_UNIT_SP, 18.5f);
        devName.setTypeface(Typeface.create("sans-serif-black", Typeface.BOLD));
        profTextCol.addView(devName);

        TextView devHandle = new TextView(ctx);
        devHandle.setText("xboyrex · he/him");
        devHandle.setTextColor(0xFF88C2CE);
        devHandle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
        devHandle.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        devHandle.setPadding(0, dp(ctx, 3), 0, dp(ctx, 4));
        profTextCol.addView(devHandle);

        TextView devBio = new TextView(ctx);
        devBio.setText("Android modding - Web/ App developer");
        devBio.setTextColor(0xFF9BA8AD);
        devBio.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
        profTextCol.addView(devBio);

        profRow.addView(profTextCol, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        devCard.addView(profRow);

        // 2x2 Social Pill Grid
        LinearLayout gridRow1 = new LinearLayout(ctx);
        gridRow1.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams gr1Lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        gr1Lp.topMargin = dp(ctx, 18);

        View btnTelegram = buildSocialPillButton(ctx, RexVectorIcons.IC_TELEGRAM, "Telegram",
                () -> RexUtils.openUrl(Constants.TELEGRAM_URL, false));
        LinearLayout.LayoutParams halfLeft = new LinearLayout.LayoutParams(0, dp(ctx, 48), 1f);
        halfLeft.rightMargin = dp(ctx, 6);
        gridRow1.addView(btnTelegram, halfLeft);

        View btnGithub = buildSocialPillButton(ctx, RexVectorIcons.IC_GITHUB, "xboyrex",
                () -> RexUtils.openUrl(Constants.AUTHOR_URL, false));
        LinearLayout.LayoutParams halfRight = new LinearLayout.LayoutParams(0, dp(ctx, 48), 1f);
        halfRight.leftMargin = dp(ctx, 6);
        gridRow1.addView(btnGithub, halfRight);
        devCard.addView(gridRow1, gr1Lp);

        LinearLayout gridRow2 = new LinearLayout(ctx);
        gridRow2.setOrientation(LinearLayout.HORIZONTAL);
        LinearLayout.LayoutParams gr2Lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        gr2Lp.topMargin = dp(ctx, 10);

        View btnInsta = buildSocialPillButton(ctx, RexVectorIcons.IC_INSTAGRAM, "Instagram",
                () -> RexUtils.openUrl(Constants.INSTAGRAM_URL, false));
        LinearLayout.LayoutParams halfLeft2 = new LinearLayout.LayoutParams(0, dp(ctx, 48), 1f);
        halfLeft2.rightMargin = dp(ctx, 6);
        gridRow2.addView(btnInsta, halfLeft2);

        View btnYt = buildSocialPillButton(ctx, RexVectorIcons.IC_YOUTUBE, "YouTube",
                () -> RexUtils.openUrl(Constants.YOUTUBE_URL, false));
        LinearLayout.LayoutParams halfRight2 = new LinearLayout.LayoutParams(0, dp(ctx, 48), 1f);
        halfRight2.leftMargin = dp(ctx, 6);
        gridRow2.addView(btnYt, halfRight2);
        devCard.addView(gridRow2, gr2Lp);

        // Full-Width Bottom CTA Pill Button: ♥ Star xboyrex on GitHub
        LinearLayout starBtn = new LinearLayout(ctx);
        starBtn.setOrientation(LinearLayout.HORIZONTAL);
        starBtn.setGravity(Gravity.CENTER);
        starBtn.setBackground(pillBg(ctx, 0xFF99CDD8, 0, 25f));
        LinearLayout.LayoutParams starLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(ctx, 50));
        starLp.topMargin = dp(ctx, 12);

        ImageView heartIcon = new ImageView(ctx);
        heartIcon.setImageDrawable(RexVectorIcons.create(ctx, RexVectorIcons.IC_HEART_SOLID, 0xFF102226, 20));
        LinearLayout.LayoutParams hiLp = new LinearLayout.LayoutParams(dp(ctx, 20), dp(ctx, 20));
        hiLp.rightMargin = dp(ctx, 10);
        starBtn.addView(heartIcon, hiLp);

        TextView starTxt = new TextView(ctx);
        starTxt.setText("Star xboyrex on GitHub");
        starTxt.setTextColor(0xFF102226);
        starTxt.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
        starTxt.setTypeface(Typeface.create("sans-serif-black", Typeface.BOLD));
        starBtn.addView(starTxt);

        starBtn.setOnClickListener(v -> RexUtils.openUrl(Constants.REPO_URL, false));
        devCard.addView(starBtn, starLp);

        container.addView(devCard, devCardLp);

        // ===================================================================
        // SECTION: COMMUNITY & INFO
        // ===================================================================
        TextView commHeader = new TextView(ctx);
        commHeader.setText("COMMUNITY & INFO");
        commHeader.setTextColor(0xFF88B4BE);
        commHeader.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        commHeader.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        commHeader.setLetterSpacing(0.08f);
        commHeader.setPadding(dp(ctx, 6), dp(ctx, 22), dp(ctx, 6), dp(ctx, 10));
        container.addView(commHeader);

        container.addView(buildCommunityRow(ctx, RexVectorIcons.IC_TELEGRAM,
                "Telegram — MayankDroid7", "https://t.me/MayankDroid7",
                () -> RexUtils.openUrl(Constants.TELEGRAM_URL, false)));

        container.addView(buildCommunityRow(ctx, RexVectorIcons.IC_TELEGRAM,
                "Telegram — OnyxHub7", "https://t.me/OnyxHub7",
                () -> RexUtils.openUrl(Constants.TELEGRAM_GROUP_URL, false)));

        container.addView(buildCommunityRow(ctx, RexVectorIcons.IC_YOUTUBE,
                "YouTube — MayankDroid", "https://youtube.com/@mayankdroid",
                () -> RexUtils.openUrl(Constants.YOUTUBE_URL, false)));

        container.addView(buildCommunityRow(ctx, RexVectorIcons.IC_YOUTUBE,
                "YouTube — OnyxDroid", "https://youtube.com/@onyxdroid89",
                () -> RexUtils.openUrl(Constants.YOUTUBE_SECONDARY_URL, false)));

        container.addView(buildCommunityRow(ctx, RexVectorIcons.IC_INSTAGRAM,
                "Instagram — @mayank.zx7", "https://www.instagram.com/mayank.zx7",
                () -> RexUtils.openUrl(Constants.INSTAGRAM_URL, false)));

        container.addView(buildCommunityRow(ctx, RexVectorIcons.IC_DOC_BIO,
                "Changelogs & Release Notes", "View what's new in xboyrex v3.12.0",
                () -> RexDialogs.showChangelogsDialog(ctx)));

        container.addView(buildCommunityRow(ctx, RexVectorIcons.IC_DOLLAR_CIRCLE,
                "Support Developer", "Help keep xboyrex active & ad-free",
                () -> RexDialogs.showSupportDeveloperDialog(ctx)));

        container.addView(buildCommunityRow(ctx, RexVectorIcons.IC_STORAGE,
                "Backup, Restore & Patch Status", "Export/Import XML settings & check active patches",
                () -> FragmentHook.startFragment(Constants.REX_FRAGMENT_BACKUP)));

        return scroll;
    }

    private static TextView buildBadgePill(Context ctx, String text) {
        TextView tv = new TextView(ctx);
        tv.setText(text);
        tv.setTextColor(0xFFCDE7ED);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
        tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        tv.setBackground(pillBg(ctx, 0xFF23373C, 0xFF334E55, 9f));
        tv.setPadding(dp(ctx, 10), dp(ctx, 5), dp(ctx, 10), dp(ctx, 5));
        return tv;
    }

    private static View buildSocialPillButton(Context ctx, String iconName, String label, Runnable onClick) {
        LinearLayout btn = new LinearLayout(ctx);
        btn.setOrientation(LinearLayout.HORIZONTAL);
        btn.setGravity(Gravity.CENTER);
        btn.setBackground(pillBg(ctx, 0xFF253539, 0xFF32464B, 24f));

        ImageView icon = new ImageView(ctx);
        icon.setImageDrawable(RexVectorIcons.create(ctx, iconName, 0xFFD5E5E8, 18));
        LinearLayout.LayoutParams icLp = new LinearLayout.LayoutParams(dp(ctx, 18), dp(ctx, 18));
        icLp.rightMargin = dp(ctx, 8);
        btn.addView(icon, icLp);

        TextView txt = new TextView(ctx);
        txt.setText(label);
        txt.setTextColor(0xFFD5E5E8);
        txt.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
        txt.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        btn.addView(txt);

        btn.setOnClickListener(v -> {
            if (onClick != null) onClick.run();
        });
        return btn;
    }

    private static View buildCommunityRow(Context ctx, String iconName, String title, String sub, Runnable onClick) {
        LinearLayout card = new LinearLayout(ctx);
        card.setOrientation(LinearLayout.HORIZONTAL);
        card.setGravity(Gravity.CENTER_VERTICAL);
        card.setBackground(pillBg(ctx, 0xFF161C1F, 0xFF273237, 20f));
        card.setPadding(dp(ctx, 14), dp(ctx, 14), dp(ctx, 14), dp(ctx, 14));
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.bottomMargin = dp(ctx, 10);
        card.setLayoutParams(lp);

        FrameLayout iconCircle = new FrameLayout(ctx);
        iconCircle.setBackground(pillBg(ctx, 0xFF26373B, 0, 22f));
        ImageView icon = new ImageView(ctx);
        icon.setImageDrawable(RexVectorIcons.create(ctx, iconName, 0xFF99CDD8, 20));
        FrameLayout.LayoutParams icInLp = new FrameLayout.LayoutParams(dp(ctx, 20), dp(ctx, 20), Gravity.CENTER);
        iconCircle.addView(icon, icInLp);

        LinearLayout.LayoutParams circleLp = new LinearLayout.LayoutParams(dp(ctx, 42), dp(ctx, 42));
        circleLp.rightMargin = dp(ctx, 14);
        card.addView(iconCircle, circleLp);

        LinearLayout textCol = new LinearLayout(ctx);
        textCol.setOrientation(LinearLayout.VERTICAL);

        TextView tView = new TextView(ctx);
        tView.setText(title);
        tView.setTextColor(Color.WHITE);
        tView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15.5f);
        tView.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        textCol.addView(tView);

        TextView sView = new TextView(ctx);
        sView.setText(sub);
        sView.setTextColor(0xFF8F9EA3);
        sView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        sView.setPadding(0, dp(ctx, 2), 0, 0);
        textCol.addView(sView);

        card.addView(textCol, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        ImageView chev = new ImageView(ctx);
        chev.setImageDrawable(RexVectorIcons.create(ctx, RexVectorIcons.IC_CHEVRON_RIGHT, 0xFF8F9EA3, 18));
        card.addView(chev, new LinearLayout.LayoutParams(dp(ctx, 20), dp(ctx, 20)));

        card.setOnClickListener(v -> {
            if (onClick != null) onClick.run();
        });
        return card;
    }

    /**
     * Custom Canvas view rendering the Scalloped Sakura Music Flower badge AND
     * the Black Instagram Camera badge right beside it ("Instagram ka music wale ke side mein. Black wala").
     */
    private static final class HeroBadgeView extends View {
        private final Paint pFill = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint pStroke = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Path path = new Path();
        private final RectF rect = new RectF();

        HeroBadgeView(Context context) {
            super(context);
            pFill.setStyle(Paint.Style.FILL);
            pStroke.setStyle(Paint.Style.STROKE);
            pStroke.setStrokeCap(Paint.Cap.ROUND);
            pStroke.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        protected void onDraw(Canvas canvas) {
            super.onDraw(canvas);
            float w = getWidth();
            float h = getHeight();
            if (w <= 0 || h <= 0) return;

            float scale = h / 76f;

            // 1. Left Scalloped Badge (Sakura Music Flower from 23424_0f7360.jpg)
            float cx1 = 34f * scale;
            float cy1 = 38f * scale;
            path.reset();
            for (int deg = 0; deg < 360; deg += 2) {
                double rad = Math.toRadians(deg);
                float r = (28f + 3.2f * (float) Math.cos(6 * rad)) * scale;
                float px = cx1 + r * (float) Math.cos(rad);
                float py = cy1 + r * (float) Math.sin(rad);
                if (deg == 0) path.moveTo(px, py);
                else path.lineTo(px, py);
            }
            path.close();
            pFill.setColor(0xFF2B3E42);
            canvas.drawPath(path, pFill);
            pStroke.setColor(0xFF6B8287);
            pStroke.setStrokeWidth(1.6f * scale);
            canvas.drawPath(path, pStroke);

            // Pink 5-petal flower inside scalloped badge
            path.reset();
            for (int deg = 0; deg < 360; deg += 2) {
                double rad = Math.toRadians(deg);
                float r = (13.5f + 2.8f * (float) Math.cos(5 * rad)) * scale;
                float px = cx1 + r * (float) Math.cos(rad);
                float py = cy1 + r * (float) Math.sin(rad);
                if (deg == 0) path.moveTo(px, py);
                else path.lineTo(px, py);
            }
            path.close();
            pFill.setColor(0xFFFF6E91);
            canvas.drawPath(path, pFill);

            // White music note inside pink flower
            pStroke.setColor(Color.WHITE);
            pStroke.setStrokeWidth(1.8f * scale);
            canvas.drawLine((cx1 - 2.5f * scale), (cy1 + 3.5f * scale), (cx1 - 2.5f * scale), (cy1 - 5.5f * scale), pStroke);
            canvas.drawLine((cx1 + 4.5f * scale), (cy1 + 2.5f * scale), (cx1 + 4.5f * scale), (cy1 - 6.5f * scale), pStroke);
            canvas.drawLine((cx1 - 2.5f * scale), (cy1 - 5.5f * scale), (cx1 + 4.5f * scale), (cy1 - 6.5f * scale), pStroke);
            pFill.setColor(Color.WHITE);
            canvas.drawCircle(cx1 - 4.2f * scale, cy1 + 4.0f * scale, 2.3f * scale, pFill);
            canvas.drawCircle(cx1 + 2.8f * scale, cy1 + 3.0f * scale, 2.3f * scale, pFill);

            // 2. Right Badge: BLACK Instagram Icon Badge ("Instagram ka music wale ke side mein. Black wala")
            float cx2 = 72f * scale;
            float cy2 = 42f * scale;
            float igRadius = 20f * scale;

            // Jet-black scalloped/rounded badge with cyan-silver rim
            rect.set(cx2 - igRadius, cy2 - igRadius, cx2 + igRadius, cy2 + igRadius);
            pFill.setColor(0xFF07090A);
            canvas.drawRoundRect(rect, 12f * scale, 12f * scale, pFill);
            pStroke.setColor(0xFF88C2CE);
            pStroke.setStrokeWidth(1.6f * scale);
            canvas.drawRoundRect(rect, 12f * scale, 12f * scale, pStroke);

            // Crisp Instagram Camera glyph inside the Black badge
            float camHalf = 10.5f * scale;
            rect.set(cx2 - camHalf, cy2 - camHalf, cx2 + camHalf, cy2 + camHalf);
            pStroke.setColor(Color.WHITE);
            pStroke.setStrokeWidth(1.9f * scale);
            canvas.drawRoundRect(rect, 5.5f * scale, 5.5f * scale, pStroke);
            canvas.drawCircle(cx2, cy2, 4.6f * scale, pStroke);
            pFill.setColor(0xFF88C2CE);
            canvas.drawCircle(cx2 + 6.2f * scale, cy2 - 6.2f * scale, 1.5f * scale, pFill);
        }
    }
}
