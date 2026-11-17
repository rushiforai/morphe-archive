/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import android.content.Context;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.shared.Utils;

public final class RexAboutView {

    // Master Prompt Section 6.2 — Refined AMOLED Design Tokens
    private static final int SURFACE_CARD = 0xFF15181D;
    private static final int BORDER_STROKE = 0xFF303741;
    private static final int TEXT_WHITE = 0xFFF5F7FA;
    private static final int TEXT_SECTION = 0xFFA4ACB8;
    private static final int TEXT_BLUE = 0xFF3998E8;
    private static final int REX_CYAN = 0xFF23C6D8;

    private RexAboutView() {
    }

    private static String dynamicVersion() {
        try {
            String v = Utils.getPatchesReleaseVersion();
            if (v != null && !v.trim().isEmpty()) {
                return v.startsWith("v") || v.startsWith("V") ? v.substring(1) : v;
            }
        } catch (Throwable ignored) {}
        return "3.14.0";
    }

    public static View createAboutScreen(final Context context) {
        ScrollView scroll = new ScrollView(context);
        scroll.setBackgroundColor(Color.BLACK);
        scroll.setFillViewport(true);
        scroll.setClipToPadding(false);

        LinearLayout container = new LinearLayout(context);
        container.setOrientation(LinearLayout.VERTICAL);
        int hPad = dp(context, 14);
        container.setPadding(hPad, dp(context, 6), hPad, dp(context, 36));

        String ver = dynamicVersion();

        // 1. Minimal Top Title Card: Rex IG Lite V3.14.0 (Native Instagram AMOLED Suite)
        LinearLayout titleCard = createMinimalCard(context);
        LinearLayout titleRow = new LinearLayout(context);
        titleRow.setOrientation(LinearLayout.HORIZONTAL);
        titleRow.setGravity(Gravity.CENTER_VERTICAL);

        ImageView brandIcon = new ImageView(context);
        brandIcon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        brandIcon.setImageDrawable(RexIcon.getDrawable(context, "instagram", REX_CYAN, 28));
        LinearLayout.LayoutParams iconLp = new LinearLayout.LayoutParams(dp(context, 28), dp(context, 28));
        iconLp.setMarginEnd(dp(context, 14));
        titleRow.addView(brandIcon, iconLp);

        LinearLayout titleCol = new LinearLayout(context);
        titleCol.setOrientation(LinearLayout.VERTICAL);

        TextView titleText = new TextView(context);
        titleText.setText("Rex IG Lite V" + ver);
        titleText.setTextColor(TEXT_WHITE);
        titleText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20.5f);
        titleText.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        titleCol.addView(titleText);

        TextView subText = new TextView(context);
        subText.setText("by xboyrex • Instagram AMOLED Suite");
        subText.setTextColor(TEXT_SECTION);
        subText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13f);
        subText.setPadding(0, dp(context, 2), 0, 0);
        titleCol.addView(subText);

        titleRow.addView(titleCol, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        titleCard.addView(titleRow);
        container.addView(titleCard, createCardLayoutParams(context));

        // 2. Team Card
        LinearLayout teamCard = createMinimalCard(context);
        addSectionTitle(context, teamCard, "Team");
        addIconLinkRow(
                context,
                teamCard,
                "user-round",
                "Owner & Lead Developer",
                "xboyrex (Mayank)",
                "external-link",
                true,
                false,
                () -> RexUtils.openUrl("https://github.com/xboyrex", false)
        );
        container.addView(teamCard, createCardLayoutParams(context));

        // 3. Project & Updates Card
        LinearLayout projectCard = createMinimalCard(context);
        addSectionTitle(context, projectCard, "Project & Updates");
        addIconLinkRow(
                context,
                projectCard,
                "github",
                "GitHub Repository",
                "xboyrex/rex-ig-lite",
                "external-link",
                true,
                true,
                () -> RexUtils.openUrl("https://github.com/xboyrex/rex-ig-lite", false)
        );
        addIconLinkRow(
                context,
                projectCard,
                "refresh-cw",
                "Latest Releases",
                "Check for updates (v" + ver + ")",
                "external-link",
                false,
                true,
                () -> RexUtils.openUrl("https://github.com/xboyrex/rex-ig-lite/releases", false)
        );
        addIconLinkRow(
                context,
                projectCard,
                "scroll-text",
                "Changelog",
                "View v" + ver + " release notes",
                "chevron-right",
                false,
                true,
                () -> RexDialogs.showChangelogDialog(context)
        );
        addIconLinkRow(
                context,
                projectCard,
                "database",
                "Backup & Restore",
                "Export, import or reset settings",
                "chevron-right",
                false,
                true,
                () -> RexDialogs.showBackupRestoreDialog(context)
        );
        addIconLinkRow(
                context,
                projectCard,
                "file-text",
                "Legal & Open-Source Licences",
                "Tabler Icons (MIT), Simple Icons & GPLv3",
                "chevron-right",
                false,
                false,
                () -> RexDialogs.showLegalLicensesDialog(context)
        );
        container.addView(projectCard, createCardLayoutParams(context));

        // 4. Support Us Card
        LinearLayout supportCard = createMinimalCard(context);
        addSectionTitle(context, supportCard, "Support Us");
        addIconLinkRow(
                context,
                supportCard,
                "star",
                "Star on GitHub",
                "xboyrex/rex-ig-lite",
                "external-link",
                true,
                true,
                () -> RexUtils.openUrl("https://github.com/xboyrex/rex-ig-lite", false)
        );
        addIconLinkRow(
                context,
                supportCard,
                "heart-handshake",
                "Support Developer",
                "xboyrex community & project support",
                "chevron-right",
                false,
                false,
                () -> RexDialogs.showSupportDialog(context)
        );
        container.addView(supportCard, createCardLayoutParams(context));

        // 5. Official Channels Card
        LinearLayout channelsCard = createMinimalCard(context);
        addSectionTitle(context, channelsCard, "Official Channels");
        addIconLinkRow(
                context,
                channelsCard,
                "youtube",
                "YouTube",
                "Subscribe for tutorials (@mayankdroid)",
                "external-link",
                true,
                true,
                () -> RexUtils.openUrl("https://youtube.com/@mayankdroid", false)
        );
        addIconLinkRow(
                context,
                channelsCard,
                "video",
                "YouTube (OnyxDroid)",
                "Subscribe for updates (@onyxdroid89)",
                "external-link",
                false,
                true,
                () -> RexUtils.openUrl("https://youtube.com/@onyxdroid89", false)
        );
        addIconLinkRow(
                context,
                channelsCard,
                "telegram",
                "Telegram",
                "Join for latest updates (@MayankDroid7)",
                "external-link",
                false,
                true,
                () -> RexUtils.openUrl("https://t.me/MayankDroid7", false)
        );
        addIconLinkRow(
                context,
                channelsCard,
                "share-2",
                "Telegram Hub",
                "Join OnyxHub7 (@OnyxHub7)",
                "external-link",
                false,
                true,
                () -> RexUtils.openUrl("https://t.me/OnyxHub7", false)
        );
        addIconLinkRow(
                context,
                channelsCard,
                "instagram",
                "Instagram",
                "Follow @mayank.zx7",
                "external-link",
                false,
                false,
                () -> RexUtils.openUrl("https://www.instagram.com/mayank.zx7", false)
        );
        container.addView(channelsCard, createCardLayoutParams(context));

        scroll.addView(container);
        return scroll;
    }

    private static LinearLayout createMinimalCard(Context context) {
        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        int hPad = dp(context, 18);
        int vPad = dp(context, 16);
        card.setPadding(hPad, vPad, hPad, vPad);

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(SURFACE_CARD);
        bg.setCornerRadius(dp(context, 22));
        bg.setStroke(Math.max(2, dp(context, 1)), BORDER_STROKE);
        card.setBackground(bg);
        return card;
    }

    private static LinearLayout.LayoutParams createCardLayoutParams(Context context) {
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        lp.bottomMargin = dp(context, 12);
        return lp;
    }

    private static void addSectionTitle(Context context, LinearLayout card, String text) {
        TextView header = new TextView(context);
        header.setText(text);
        header.setTextColor(REX_CYAN);
        header.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        header.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        header.setLetterSpacing(0.03f);
        header.setPadding(0, 0, 0, dp(context, 8));
        card.addView(header);
    }

    private static void addIconLinkRow(
            Context context,
            LinearLayout card,
            String iconId,
            String roleLabel,
            String valueLabel,
            String trailingIconId,
            boolean firstRow,
            boolean showDivider,
            Runnable onClick
    ) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(dp(context, 48));
        int topPad = firstRow ? dp(context, 4) : dp(context, 11);
        int botPad = showDivider ? dp(context, 11) : dp(context, 4);
        row.setPadding(0, topPad, 0, botPad);

        final ImageView leadingIcon = new ImageView(context);
        leadingIcon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        leadingIcon.setImageDrawable(RexIcon.getDrawable(context, iconId, TEXT_WHITE, 21));
        LinearLayout.LayoutParams lLp = new LinearLayout.LayoutParams(dp(context, 21), dp(context, 21));
        lLp.setMarginEnd(dp(context, 14));
        row.addView(leadingIcon, lLp);

        TextView text = new TextView(context);
        String prefix = roleLabel + " - ";
        SpannableStringBuilder ssb = new SpannableStringBuilder(prefix + valueLabel);
        ssb.setSpan(new ForegroundColorSpan(TEXT_WHITE), 0, prefix.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        ssb.setSpan(new StyleSpan(Typeface.BOLD), 0, roleLabel.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        ssb.setSpan(new ForegroundColorSpan(TEXT_BLUE), prefix.length(), ssb.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        text.setText(ssb);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.8f);
        text.setGravity(Gravity.START | Gravity.CENTER_VERTICAL);
        row.addView(text, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        final ImageView trailingIcon = new ImageView(context);
        trailingIcon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        trailingIcon.setImageDrawable(RexIcon.getDrawable(context, trailingIconId, TEXT_SECTION, 17));
        LinearLayout.LayoutParams tLp = new LinearLayout.LayoutParams(dp(context, 18), dp(context, 18));
        tLp.setMarginStart(dp(context, 10));
        row.addView(trailingIcon, tLp);

        if (onClick != null) {
            row.setOnClickListener(v -> {
                RexHaptics.tap(v);
                RexIcon.pulseIcon(leadingIcon);
                RexIcon.nudgeChevron(trailingIcon);
                onClick.run();
            });
        }
        card.addView(row, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        if (showDivider) {
            View div = new View(context);
            div.setBackgroundColor(BORDER_STROKE);
            LinearLayout.LayoutParams dLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    Math.max(1, dp(context, 1))
            );
            card.addView(div, dLp);
        }
    }

    private static int dp(Context context, float value) {
        return RexVectorIcons.dp(context, value);
    }
}
