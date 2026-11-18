/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.RenderEffect;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import com.instagram.common.session.UserSession;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.Callable;

import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.patches.customise.font.CustomFont;
import app.morphe.extension.instagram.utils.IgStr;
import app.morphe.extension.instagram.db.RexMessageDb;
import app.morphe.extension.instagram.entity.MediaData;
import app.morphe.extension.instagram.entity.UserData;
import app.morphe.extension.instagram.patches.dm.SavedMessagesHook;
import app.morphe.extension.instagram.patches.download.DownloadUtils;
import app.morphe.extension.instagram.patches.download.MediaActionRegistry;
import app.morphe.extension.instagram.patches.download.MediaActionRegistry.ActionGroup;
import app.morphe.extension.instagram.patches.download.MediaActionRegistry.ActionId;
import app.morphe.extension.instagram.patches.download.MediaActionRegistry.ActionSpec;
import app.morphe.extension.instagram.patches.download.MediaContextResolver;
import app.morphe.extension.instagram.patches.download.MediaContextResolver.MediaCapabilities;
import app.morphe.extension.instagram.patches.userprofile.ProfilePictureViewer;
import app.morphe.extension.instagram.settings.ActivityHook;
import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.preference.fragments.FragmentHook;
import app.morphe.extension.instagram.theme.MaterialYouTheme;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

public final class RexDialogs {

    // Master Prompt Section 6.2 — Refined AMOLED Design Tokens
    public static final int SURFACE_CARD = 0xFF15181D;
    public static final int ELEVATED_SURFACE = 0xFF20252C;
    public static final int BORDER_STROKE = 0xFF303741;
    public static final int TEXT_PRIMARY = 0xFFF5F7FA;
    public static final int TEXT_SECONDARY = 0xFFA4ACB8;
    public static final int TEXT_MUTED = 0xFF737D8A;
    public static final int BRAND_CYAN = 0xFF23C6D8;
    public static final int ACTIVE_TEAL = 0xFF35CDBB;
    public static final int ACTION_BLUE = 0xFF3998E8;
    public static final int SUCCESS_GREEN = 0xFF35B779;
    public static final int WARNING_GOLD = 0xFFE6B450;
    public static final int DESTRUCTIVE_RED = 0xFFF06470;
    public static final int DESTRUCTIVE_CORAL = DESTRUCTIVE_RED;
    public static final int DIVIDER_COLOR = BORDER_STROKE;

    // Single modal owner tracking so popups never stack uncontrollably (Section 7.2)
    private static WeakReference<Dialog> activeModalDialog;

    private RexDialogs() {}

    /**
     * Converts any runtime exception into a short, friendly user message without leaking
     * internal Java/Instagram class names or obfuscated method names (BUG-ERROR-001).
     */
    public static String userSafeErrorMessage(Throwable error, String fallbackMessage) {
        String safeFallback = (fallbackMessage == null || fallbackMessage.trim().isEmpty())
                ? "Couldn't complete action. Try again."
                : fallbackMessage;
        if (error == null) return safeFallback;
        String msg = error.getMessage();
        if (msg == null || msg.trim().isEmpty()) return safeFallback;
        String trimmed = msg.trim();
        if (trimmed.contains("com.instagram.")
                || trimmed.contains("java.lang.")
                || trimmed.contains("app.morphe.")
                || trimmed.contains("ImageInfo")
                || trimmed.contains("NoSuchMethod")
                || trimmed.contains("NoSuchField")
                || trimmed.contains("NullPointer")
                || trimmed.contains("ClassCast")
                || trimmed.contains("[]")) {
            return safeFallback;
        }
        return trimmed.length() > 80 ? safeFallback : trimmed;
    }

    public static synchronized void dismissActiveModalIfPresent() {
        if (activeModalDialog != null) {
            Dialog prev = activeModalDialog.get();
            activeModalDialog = null;
            if (prev != null && prev.isShowing()) {
                try {
                    prev.dismiss();
                } catch (Throwable ignored) {
                }
            }
        }
    }

    public static void showFriendshipStatusSheet(
            final Context context,
            final java.util.Map<String, Boolean> map
    ) {
        try {
            final Context hostCtx = resolveActivity(context) != null ? resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            LinearLayout sheet = createDialogSheet(hostCtx, "users", "Friendship Status");

            Boolean following = map == null ? null : map.get("following");
            Boolean followedBy = map == null ? null : map.get("followed_by");
            Boolean isPrivate = map == null ? null : map.get("is_private");
            Boolean blocking = map == null ? null : map.get("blocking");
            Boolean blockingReel = map == null ? null : map.get("is_blocking_reel");
            Boolean restricted = map == null ? null : map.get("is_restricted");
            Boolean incomingReq = map == null ? null : map.get("incoming_request");
            Boolean outgoingReq = map == null ? null : map.get("outgoing_request");
            Boolean isBestie = map == null ? null : map.get("is_bestie");
            Boolean isFeedFav = map == null ? null : map.get("is_feed_favorite");
            Boolean mutingReel = map == null ? null : map.get("is_muting_reel");
            Boolean mutingNotes = map == null ? null : map.get("is_muting_notes");
            Boolean mutingMediaNotes = map == null ? null : map.get("is_muting_media_notes");
            Boolean mutingReposts = map == null ? null : map.get("is_muting_media_reposts");
            Boolean mutingQuickSnap = map == null ? null : map.get("is_muting_quick_snap");
            Boolean viewerUnconnected = map == null ? null : map.get("is_viewer_unconnected");
            Boolean eligibleSub = map == null ? null : map.get("is_eligible_to_subscribe");

            String summaryLabel;
            String summaryIcon;
            String summaryBadge;
            int summaryColor;
            if (Boolean.TRUE.equals(following) && Boolean.TRUE.equals(followedBy)) {
                summaryLabel = "You follow each other";
                summaryIcon = "users";
                summaryBadge = "Mutual";
                summaryColor = BRAND_CYAN;
            } else if (Boolean.TRUE.equals(followedBy)) {
                summaryLabel = "Follows you";
                summaryIcon = "user-check";
                summaryBadge = "Follows You";
                summaryColor = ACTIVE_TEAL;
            } else if (Boolean.TRUE.equals(following)) {
                summaryLabel = "You follow";
                summaryIcon = "user-plus";
                summaryBadge = "Following";
                summaryColor = 0xFFF5A623;
            } else if (Boolean.FALSE.equals(following) && Boolean.FALSE.equals(followedBy)) {
                summaryLabel = "Not following";
                summaryIcon = "user-x";
                summaryBadge = "None";
                summaryColor = DESTRUCTIVE_CORAL;
            } else {
                summaryLabel = "Status unavailable";
                summaryIcon = "info";
                summaryBadge = "Unavailable";
                summaryColor = TEXT_SECONDARY;
            }

            addQuickAccessSectionHeader(hostCtx, sheet, "RELATIONSHIP");
            LinearLayout relCard = createGroupedMenuCard(hostCtx);
            addStatusBadgeRow(hostCtx, relCard, summaryIcon, "Relationship Summary", summaryLabel, summaryBadge, summaryColor, true);
            addStatusBadgeRow(hostCtx, relCard, "user-plus", "Following", "Whether your account follows this user",
                    triBadge(following, "Following", "Off"), triColor(following, ACTIVE_TEAL), true);
            addStatusBadgeRow(hostCtx, relCard, "user-check", "Follows you", "Whether this user follows your account",
                    triBadge(followedBy, "Follows You", "Off"), triColor(followedBy, ACTIVE_TEAL), true);
            Boolean reqState = Boolean.TRUE.equals(incomingReq) ? Boolean.TRUE : (Boolean.TRUE.equals(outgoingReq) ? Boolean.TRUE : incomingReq);
            String reqBadge = Boolean.TRUE.equals(incomingReq) ? "Incoming"
                    : (Boolean.TRUE.equals(outgoingReq) ? "Sent" : triBadge(incomingReq, "Pending", "None"));
            addStatusBadgeRow(hostCtx, relCard, "clock", "Follow requests", "Incoming or outgoing pending follow request",
                    reqBadge, Boolean.TRUE.equals(reqState) ? 0xFFF5A623 : TEXT_SECONDARY, false);
            sheet.addView(relCard);

            addQuickAccessSectionHeader(hostCtx, sheet, "ACCOUNT & ACCESS");
            LinearLayout accCard = createGroupedMenuCard(hostCtx);
            addStatusBadgeRow(hostCtx, accCard, Boolean.TRUE.equals(isPrivate) ? "lock" : "lock-open",
                    "Account privacy", "Visibility of posts and stories",
                    triBadge(isPrivate, "Private", "Public"),
                    isPrivate == null ? TEXT_SECONDARY : (isPrivate ? 0xFFF5A623 : ACTIVE_TEAL), true);
            addStatusBadgeRow(hostCtx, accCard, "user-x", "Blocked", "Account or story blocking state",
                    (Boolean.TRUE.equals(blocking) || Boolean.TRUE.equals(blockingReel)) ? "Blocked" : triBadge(blocking, "Blocked", "Off"),
                    (Boolean.TRUE.equals(blocking) || Boolean.TRUE.equals(blockingReel)) ? DESTRUCTIVE_CORAL : TEXT_SECONDARY, true);
            addStatusBadgeRow(hostCtx, accCard, "shield-lock", "Restricted", "Limited interaction & comment visibility",
                    triBadge(restricted, "Restricted", "Off"),
                    Boolean.TRUE.equals(restricted) ? 0xFFF5A623 : TEXT_SECONDARY, true);
            addStatusBadgeRow(hostCtx, accCard, "shield-check", "Viewer connection", "Direct network connection state",
                    viewerUnconnected == null ? "Unavailable" : (viewerUnconnected ? "Unconnected" : "Connected"),
                    viewerUnconnected == null ? TEXT_SECONDARY : (viewerUnconnected ? TEXT_SECONDARY : ACTIVE_TEAL), false);
            sheet.addView(accCard);

            addQuickAccessSectionHeader(hostCtx, sheet, "CONTENT PREFERENCES");
            LinearLayout prefCard = createGroupedMenuCard(hostCtx);
            addStatusBadgeRow(hostCtx, prefCard, "star", "Close Friends (Bestie)", "Included in Close Friends story list",
                    triBadge(isBestie, "On", "Off"), triColor(isBestie, ACTIVE_TEAL), true);
            addStatusBadgeRow(hostCtx, prefCard, "heart", "Feed Favorite", "Prioritized in home feed ranking",
                    triBadge(isFeedFav, "On", "Off"), triColor(isFeedFav, BRAND_CYAN), true);
            addStatusBadgeRow(hostCtx, prefCard, "bell-off", "Muted Stories / Reels", "Stories and Reels muted from tray",
                    triBadge(mutingReel, "Muted", "Off"), Boolean.TRUE.equals(mutingReel) ? DESTRUCTIVE_CORAL : TEXT_SECONDARY, true);
            Boolean anyMutedNotes = (mutingNotes == null && mutingMediaNotes == null) ? null
                    : (Boolean.TRUE.equals(mutingNotes) || Boolean.TRUE.equals(mutingMediaNotes));
            addStatusBadgeRow(hostCtx, prefCard, "note-off", "Muted Notes & Media Notes", "Inbox and feed notes muted",
                    triBadge(anyMutedNotes, "Muted", "Off"), Boolean.TRUE.equals(anyMutedNotes) ? DESTRUCTIVE_CORAL : TEXT_SECONDARY, true);
            Boolean anyMutedReposts = (mutingReposts == null && mutingQuickSnap == null) ? null
                    : (Boolean.TRUE.equals(mutingReposts) || Boolean.TRUE.equals(mutingQuickSnap));
            addStatusBadgeRow(hostCtx, prefCard, "repeat-off", "Muted Reposts & Instants", "Media reposts and Quick Snaps muted",
                    triBadge(anyMutedReposts, "Muted", "Off"), Boolean.TRUE.equals(anyMutedReposts) ? DESTRUCTIVE_CORAL : TEXT_SECONDARY, false);
            sheet.addView(prefCard);

            if (eligibleSub != null) {
                addQuickAccessSectionHeader(hostCtx, sheet, "SUBSCRIPTION");
                LinearLayout subCard = createGroupedMenuCard(hostCtx);
                addStatusBadgeRow(hostCtx, subCard, "sparkles", "Creator Subscription", "Eligibility to subscribe to exclusive content",
                        triBadge(eligibleSub, "Eligible", "Off"), triColor(eligibleSub, BRAND_CYAN), false);
                sheet.addView(subCard);
            }

            addDialogCloseFooter(hostCtx, sheet, dialog);
            ScrollView scroll = new ScrollView(hostCtx);
            scroll.addView(sheet);
            dialog.setView(scroll);
            showBlurredDialog(hostCtx, dialog);
        } catch (Throwable e) {
            Utils.showToastShort("Relationship details unavailable");
        }
    }

    private static String triBadge(Boolean val, String trueText, String falseText) {
        if (val == null) return "Unavailable";
        return val ? trueText : falseText;
    }

    private static int triColor(Boolean val, int activeColor) {
        if (val == null) return TEXT_SECONDARY;
        return val ? activeColor : TEXT_SECONDARY;
    }

    private static void addStatusBadgeRow(
            Context context,
            LinearLayout card,
            String iconId,
            String title,
            String subtitle,
            String badgeText,
            int badgeColor,
            boolean showDivider
    ) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(RexVectorIcons.dp(context, 54));
        int hPad = RexVectorIcons.dp(context, 14);
        int vPad = RexVectorIcons.dp(context, 10);
        row.setPadding(hPad, vPad, hPad, vPad);

        ImageView icon = new ImageView(context);
        icon.setImageDrawable(RexIcon.getDrawable(context, iconId, BRAND_CYAN, 20));
        LinearLayout.LayoutParams icLp = new LinearLayout.LayoutParams(
                RexVectorIcons.dp(context, 20), RexVectorIcons.dp(context, 20));
        icLp.setMarginEnd(RexVectorIcons.dp(context, 12));
        row.addView(icon, icLp);

        LinearLayout textCol = new LinearLayout(context);
        textCol.setOrientation(LinearLayout.VERTICAL);
        TextView titleView = new TextView(context);
        titleView.setText(title);
        titleView.setTextColor(TEXT_PRIMARY);
        titleView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
        titleView.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        textCol.addView(titleView);

        if (subtitle != null && !subtitle.isEmpty()) {
            TextView subView = new TextView(context);
            subView.setText(subtitle);
            subView.setTextColor(TEXT_SECONDARY);
            subView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            textCol.addView(subView);
        }
        LinearLayout.LayoutParams tcLp = new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        tcLp.setMarginEnd(RexVectorIcons.dp(context, 8));
        row.addView(textCol, tcLp);

        TextView badge = new TextView(context);
        badge.setText(badgeText);
        badge.setTextColor(badgeColor == TEXT_SECONDARY ? TEXT_SECONDARY : Color.WHITE);
        badge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
        badge.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        int bPadH = RexVectorIcons.dp(context, 10);
        int bPadV = RexVectorIcons.dp(context, 4);
        badge.setPadding(bPadH, bPadV, bPadH, bPadV);
        GradientDrawable badgeBg = new GradientDrawable();
        badgeBg.setCornerRadius(RexVectorIcons.dp(context, 12));
        if (badgeColor == TEXT_SECONDARY) {
            badgeBg.setColor(ELEVATED_SURFACE);
            badgeBg.setStroke(Math.max(1, RexVectorIcons.dp(context, 1)), BORDER_STROKE);
        } else {
            badgeBg.setColor(Color.argb(55, Color.red(badgeColor), Color.green(badgeColor), Color.blue(badgeColor)));
            badgeBg.setStroke(Math.max(1, RexVectorIcons.dp(context, 1)), badgeColor);
            badge.setTextColor(badgeColor);
        }
        badge.setBackground(badgeBg);
        row.addView(badge);

        card.addView(row);
        if (showDivider) {
            View div = new View(context);
            div.setBackgroundColor(DIVIDER_COLOR);
            LinearLayout.LayoutParams dLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, RexVectorIcons.dp(context, 1)));
            dLp.leftMargin = RexVectorIcons.dp(context, 46);
            card.addView(div, dLp);
        }
    }

    public static void showStoryMentionsSheet(
            final Context context,
            final List<UserData> mentions,
            final boolean resolvedOk,
            final android.content.DialogInterface.OnDismissListener onDismiss
    ) {
        try {
            final Context hostCtx = resolveActivity(context) != null ? resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            int count = mentions == null ? 0 : mentions.size();
            LinearLayout sheet = createDialogSheet(hostCtx, "at-sign", "Hidden Mentions (" + count + ")");

            // Direct inline Mention Pill toggle + Pill Style settings shortcut on the Story surface
            LinearLayout controlCard = createGroupedMenuCard(hostCtx);
            LinearLayout toggleRow = new LinearLayout(hostCtx);
            toggleRow.setOrientation(LinearLayout.HORIZONTAL);
            toggleRow.setGravity(Gravity.CENTER_VERTICAL);
            int padH = RexVectorIcons.dp(hostCtx, 14);
            int padV = RexVectorIcons.dp(hostCtx, 10);
            toggleRow.setPadding(padH, padV, padH, padV);

            ImageView pillIcon = new ImageView(hostCtx);
            pillIcon.setImageDrawable(RexIcon.getDrawable(hostCtx, "at-sign", BRAND_CYAN, 20));
            LinearLayout.LayoutParams piLp = new LinearLayout.LayoutParams(
                    RexVectorIcons.dp(hostCtx, 20), RexVectorIcons.dp(hostCtx, 20));
            piLp.setMarginEnd(RexVectorIcons.dp(hostCtx, 12));
            toggleRow.addView(pillIcon, piLp);

            LinearLayout pillTextCol = new LinearLayout(hostCtx);
            pillTextCol.setOrientation(LinearLayout.VERTICAL);
            TextView pillTitle = new TextView(hostCtx);
            pillTitle.setText("Show Mention Pill on Stories");
            pillTitle.setTextColor(TEXT_PRIMARY);
            pillTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            pillTitle.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            pillTextCol.addView(pillTitle);

            TextView pillSub = new TextView(hostCtx);
            pillSub.setText("Display interactive @mention counter badge in Story header");
            pillSub.setTextColor(TEXT_SECONDARY);
            pillSub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            pillTextCol.addView(pillSub);
            toggleRow.addView(pillTextCol, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            final android.widget.Switch pillSwitch = new android.widget.Switch(hostCtx);
            boolean pillEnabled = app.morphe.extension.instagram.patches.story.StoryMentionSettings.isEnabled(hostCtx);
            pillSwitch.setChecked(pillEnabled);
            InstagramPreferenceStyle.applySwitchTint(pillSwitch, pillEnabled);
            pillSwitch.setOnCheckedChangeListener((btn, checked) -> {
                RexHaptics.toggle(btn);
                InstagramPreferenceStyle.applySwitchTint(pillSwitch, checked);
                SharedPref.setBooleanPref(Settings.STORY_MENTION_ICON.key, checked);
                app.morphe.extension.instagram.patches.story.StoryMentionIcon.refresh();
            });
            toggleRow.addView(pillSwitch);
            controlCard.addView(toggleRow);

            View div = new View(hostCtx);
            div.setBackgroundColor(DIVIDER_COLOR);
            controlCard.addView(div, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, RexVectorIcons.dp(hostCtx, 1))));

            addGroupedMenuRow(hostCtx, controlCard, "palette", "Customize Mention Pill & Popup Style", false, () -> {
                dialog.dismiss();
                app.morphe.extension.instagram.patches.story.StoryMentionSettings.showSettings(hostCtx);
            });
            sheet.addView(controlCard);

            addQuickAccessSectionHeader(hostCtx, sheet, count > 0 ? ("MENTIONED ACCOUNTS (" + count + ")") : "MENTION STATUS");
            LinearLayout listCard = createGroupedMenuCard(hostCtx);
            if (count == 0) {
                LinearLayout emptyBox = new LinearLayout(hostCtx);
                emptyBox.setOrientation(LinearLayout.VERTICAL);
                emptyBox.setGravity(Gravity.CENTER);
                int ePad = RexVectorIcons.dp(hostCtx, 22);
                emptyBox.setPadding(ePad, ePad, ePad, ePad);

                ImageView emptySvg = new ImageView(hostCtx);
                emptySvg.setImageDrawable(RexIcon.getDrawable(hostCtx, "users", TEXT_SECONDARY, 34));
                LinearLayout.LayoutParams esLp = new LinearLayout.LayoutParams(
                        RexVectorIcons.dp(hostCtx, 34), RexVectorIcons.dp(hostCtx, 34));
                esLp.bottomMargin = RexVectorIcons.dp(hostCtx, 10);
                emptyBox.addView(emptySvg, esLp);

                TextView emptyTitle = new TextView(hostCtx);
                emptyTitle.setText(resolvedOk ? "No Hidden Mentions in This Story" : "Mention Metadata Unavailable");
                emptyTitle.setTextColor(TEXT_PRIMARY);
                emptyTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
                emptyTitle.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
                emptyTitle.setGravity(Gravity.CENTER);
                emptyBox.addView(emptyTitle);

                TextView emptyDesc = new TextView(hostCtx);
                emptyDesc.setText(resolvedOk
                        ? "This story does not contain any hidden or visible @mentioned accounts."
                        : "Could not read mention tags for this story item.");
                emptyDesc.setTextColor(TEXT_SECONDARY);
                emptyDesc.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.8f);
                emptyDesc.setGravity(Gravity.CENTER);
                emptyDesc.setPadding(0, RexVectorIcons.dp(hostCtx, 4), 0, 0);
                emptyBox.addView(emptyDesc);

                listCard.addView(emptyBox);
            } else {
                final StringBuilder allHandles = new StringBuilder();
                for (int i = 0; i < count; i++) {
                    UserData u = mentions.get(i);
                    final String uname = safeCall(() -> u.getUsername(), "");
                    final String fname = safeCall(() -> u.getFullName(), uname);
                    final String picUrl = safeCall(() -> u.getProfilePictureUrl(), "");
                    final boolean verified = safeBool(() -> u.isVerified(), false);
                    if (!uname.isEmpty()) {
                        if (allHandles.length() > 0) allHandles.append(" ");
                        allHandles.append("@").append(uname);
                    }

                    LinearLayout uRow = new LinearLayout(hostCtx);
                    uRow.setOrientation(LinearLayout.HORIZONTAL);
                    uRow.setGravity(Gravity.CENTER_VERTICAL);
                    uRow.setMinimumHeight(RexVectorIcons.dp(hostCtx, 56));
                    uRow.setPadding(padH, padV, padH, padV);

                    FrameLayout avatarCircle = new FrameLayout(hostCtx);
                    GradientDrawable avBg = new GradientDrawable();
                    avBg.setShape(GradientDrawable.OVAL);
                    avBg.setColor(ELEVATED_SURFACE);
                    avBg.setStroke(Math.max(1, RexVectorIcons.dp(hostCtx, 1)), InstagramPreferenceStyle.accentColor());
                    avatarCircle.setBackground(avBg);
                    TextView avInit = new TextView(hostCtx);
                    avInit.setText(uname.isEmpty() ? "@" : uname.substring(0, 1).toUpperCase(Locale.ROOT));
                    avInit.setTextColor(InstagramPreferenceStyle.accentColor());
                    avInit.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
                    avInit.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
                    avInit.setGravity(Gravity.CENTER);
                    avatarCircle.addView(avInit, new FrameLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

                    ImageView avatarImg = new ImageView(hostCtx);
                    avatarImg.setScaleType(ImageView.ScaleType.CENTER_CROP);
                    avatarImg.setOutlineProvider(new android.view.ViewOutlineProvider() {
                        @Override
                        public void getOutline(View view, android.graphics.Outline outline) {
                            outline.setOval(0, 0, view.getWidth(), view.getHeight());
                        }
                    });
                    avatarImg.setClipToOutline(true);
                    avatarCircle.addView(avatarImg, new FrameLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
                    app.morphe.extension.instagram.patches.story.StoryMentionPopup.loadAvatarInto(picUrl, avatarImg, avInit);

                    LinearLayout.LayoutParams avLp = new LinearLayout.LayoutParams(
                            RexVectorIcons.dp(hostCtx, 42), RexVectorIcons.dp(hostCtx, 42));
                    avLp.setMarginEnd(RexVectorIcons.dp(hostCtx, 12));
                    uRow.addView(avatarCircle, avLp);

                    LinearLayout uTexts = new LinearLayout(hostCtx);
                    uTexts.setOrientation(LinearLayout.VERTICAL);
                    LinearLayout handleLine = new LinearLayout(hostCtx);
                    handleLine.setOrientation(LinearLayout.HORIZONTAL);
                    handleLine.setGravity(Gravity.CENTER_VERTICAL);
                    TextView handleTv = new TextView(hostCtx);
                    handleTv.setText(uname.isEmpty() ? "Unknown User" : ("@" + uname));
                    handleTv.setTextColor(TEXT_PRIMARY);
                    handleTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.8f);
                    handleTv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
                    handleLine.addView(handleTv);
                    if (verified) {
                        ImageView vBadge = new ImageView(hostCtx);
                        vBadge.setImageDrawable(RexIcon.getDrawable(hostCtx, "badge-check", BRAND_CYAN, 15, true));
                        LinearLayout.LayoutParams vbLp = new LinearLayout.LayoutParams(
                                RexVectorIcons.dp(hostCtx, 15), RexVectorIcons.dp(hostCtx, 15));
                        vbLp.setMarginStart(RexVectorIcons.dp(hostCtx, 5));
                        handleLine.addView(vBadge, vbLp);
                    }
                    uTexts.addView(handleLine);

                    if (fname != null && !fname.isEmpty() && !fname.equals(uname)) {
                        TextView fullTv = new TextView(hostCtx);
                        fullTv.setText(fname);
                        fullTv.setTextColor(TEXT_SECONDARY);
                        fullTv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.2f);
                        uTexts.addView(fullTv);
                    }
                    uRow.addView(uTexts, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

                    ImageView copyBtn = new ImageView(hostCtx);
                    copyBtn.setImageDrawable(RexIcon.getDrawable(hostCtx, "copy", TEXT_SECONDARY, 18));
                    int cPad = RexVectorIcons.dp(hostCtx, 6);
                    copyBtn.setPadding(cPad, cPad, cPad, cPad);
                    copyBtn.setOnClickListener(v -> {
                        RexHaptics.tap(v);
                        if (!uname.isEmpty()) {
                            Utils.setClipboard("@" + uname);
                            Utils.showToastShort("Copied @" + uname);
                        }
                    });
                    LinearLayout.LayoutParams cpLp = new LinearLayout.LayoutParams(
                            RexVectorIcons.dp(hostCtx, 32), RexVectorIcons.dp(hostCtx, 32));
                    cpLp.setMarginEnd(RexVectorIcons.dp(hostCtx, 4));
                    uRow.addView(copyBtn, cpLp);

                    ImageView openChevron = new ImageView(hostCtx);
                    openChevron.setImageDrawable(RexIcon.getDrawable(hostCtx, "chevron-right", BRAND_CYAN, 18));
                    uRow.addView(openChevron, new LinearLayout.LayoutParams(
                            RexVectorIcons.dp(hostCtx, 18), RexVectorIcons.dp(hostCtx, 18)));

                    uRow.setOnClickListener(v -> {
                        RexHaptics.tap(v);
                        dialog.dismiss();
                        if (!uname.isEmpty()) {
                            app.morphe.extension.rex.RexUtils.openUrl("instagram://user?username=" + uname, true);
                        }
                    });
                    listCard.addView(uRow);

                    if (i < count - 1) {
                        View uDiv = new View(hostCtx);
                        uDiv.setBackgroundColor(DIVIDER_COLOR);
                        LinearLayout.LayoutParams udLp = new LinearLayout.LayoutParams(
                                ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, RexVectorIcons.dp(hostCtx, 1)));
                        udLp.leftMargin = RexVectorIcons.dp(hostCtx, 66);
                        listCard.addView(uDiv, udLp);
                    }
                }
                if (allHandles.length() > 0) {
                    View bDiv = new View(hostCtx);
                    bDiv.setBackgroundColor(DIVIDER_COLOR);
                    listCard.addView(bDiv, new LinearLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, RexVectorIcons.dp(hostCtx, 1))));
                    addGroupedMenuRow(hostCtx, listCard, "copy", "Copy All Mentioned @Usernames", false, () -> {
                        Utils.setClipboard(allHandles.toString());
                        Utils.showToastShort("Copied " + count + " mentioned usernames");
                    });
                }
            }
            sheet.addView(listCard);

            addDialogCloseFooter(hostCtx, sheet, dialog);
            if (onDismiss != null) {
                dialog.setOnDismissListener(onDismiss);
            }
            ScrollView scroll = new ScrollView(hostCtx);
            scroll.addView(sheet);
            dialog.setView(scroll);
            showBlurredDialog(hostCtx, dialog);
        } catch (Throwable e) {
            if (onDismiss != null) onDismiss.onDismiss(null);
        }
    }

    public static void showNotificationCenterDialog(final Context context) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();
            LinearLayout sheet = createDialogSheet(context, "bell-cog", "Notification Center");

            addQuickAccessSectionHeader(context, sheet, "PUSH NOTIFICATION FILTERS");
            LinearLayout card = createGroupedMenuCard(context);
            addGroupedMenuRow(context, card, "bell-ringing", "Filter by Notification Type", true, () -> {
                dialog.dismiss();
                RexRuntimeFeatures.showNotificationTypeFilterDialog(context);
            });
            addGroupedMenuRow(context, card, "filter", "Filter by Keywords", false, () -> {
                dialog.dismiss();
                RexRuntimeFeatures.showNotificationKeywordFilterDialog(context);
            });
            sheet.addView(card);

            addDialogCloseFooter(context, sheet, dialog);
            dialog.setView(sheet);
            showBlurredDialog(context, dialog);
        } catch (Throwable e) {
            RexRuntimeFeatures.showNotificationTypeFilterDialog(context);
        }
    }

    public static void showAppLanguagePicker(final Context context) {
        try {
            final Context hostCtx = resolveActivity(context) != null ? resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            LinearLayout sheet = createDialogSheet(hostCtx, "globe", "Select Language");

            final String[] languages = {
                    "English",
                    "Arabic",
                    "Hindi",
                    "Turkish",
                    "Portuguese (Brazil)",
                    "Indonesian",
                    "Russian",
                    "Spanish",
                    "French",
                    "German",
                    "Japanese",
                    "Korean"
            };
            String currentTrans = app.morphe.extension.instagram.utils.IgStr.getAppUiLanguageName();
            if (currentTrans == null || currentTrans.trim().isEmpty()) currentTrans = "English";

            ScrollView scroll = new ScrollView(hostCtx);
            LinearLayout list = new LinearLayout(hostCtx);
            list.setOrientation(LinearLayout.VERTICAL);
            int p = RexVectorIcons.dp(hostCtx, 12);

            for (final String lang : languages) {
                LinearLayout row = new LinearLayout(hostCtx);
                row.setOrientation(LinearLayout.HORIZONTAL);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setMinimumHeight(RexVectorIcons.dp(hostCtx, 48));
                row.setPadding(p, p, p, p);

                boolean selected = lang.equalsIgnoreCase(currentTrans)
                        || (lang.startsWith("Portuguese") && currentTrans.toLowerCase().startsWith("portuguese"));
                final ImageView radio = new ImageView(hostCtx);
                radio.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
                RexIcon.bindOrAnimateState(
                        radio,
                        selected ? "circle-check" : "circle",
                        selected,
                        TEXT_SECONDARY,
                        InstagramPreferenceStyle.accentColor(),
                        22,
                        false
                );
                LinearLayout.LayoutParams rLp = new LinearLayout.LayoutParams(
                        RexVectorIcons.dp(hostCtx, 22), RexVectorIcons.dp(hostCtx, 22));
                rLp.setMarginEnd(RexVectorIcons.dp(hostCtx, 16));
                row.addView(radio, rLp);

                TextView label = new TextView(hostCtx);
                label.setText(lang);
                label.setTextColor(selected ? InstagramPreferenceStyle.accentColor() : TEXT_PRIMARY);
                label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16f);
                if (selected) label.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
                row.addView(label, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

                row.setOnClickListener(v -> {
                    RexHaptics.tap(v);
                    app.morphe.extension.instagram.utils.IgStr.setAppUiLanguageName(lang);
                    IgStr.refreshLocale();
                    IgStr.applyLocaleToContext(hostCtx);
                    Utils.showToastShort("Language & Translator set to " + lang);
                    dialog.dismiss();
                    Activity act = resolveActivity(hostCtx);
                    if (act != null && !act.isFinishing()) {
                        try { act.recreate(); } catch (Throwable ignored) {}
                    }
                });
                list.addView(row);
            }
            scroll.addView(list);
            LinearLayout.LayoutParams sLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
            sheet.addView(scroll, sLp);

            LinearLayout footer = new LinearLayout(hostCtx);
            footer.setOrientation(LinearLayout.HORIZONTAL);
            footer.setGravity(Gravity.CENTER_VERTICAL);
            footer.setPadding(RexVectorIcons.dp(hostCtx, 4), RexVectorIcons.dp(hostCtx, 12), RexVectorIcons.dp(hostCtx, 4), 0);

            TextView translatorsBtn = new TextView(hostCtx);
            translatorsBtn.setText("Translators");
            translatorsBtn.setTextColor(InstagramPreferenceStyle.accentColor());
            translatorsBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            translatorsBtn.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            translatorsBtn.setPadding(p, p, p, p);
            translatorsBtn.setOnClickListener(v -> {
                RexHaptics.tap(v);
                dialog.dismiss();
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                    try {
                        Intent intent = new Intent(android.provider.Settings.ACTION_APP_LOCALE_SETTINGS);
                        intent.setData(Uri.fromParts("package", hostCtx.getPackageName(), null));
                        if (!(hostCtx instanceof Activity)) intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                        hostCtx.startActivity(intent);
                        return;
                    } catch (Throwable ignored) {}
                }
                Utils.showToastShort("4-Tier InstaRex Translator Engine Active (" + SharedPref.getStringPref(Settings.TRANSLATOR_LANGUAGE) + ")");
            });
            footer.addView(translatorsBtn, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

            TextView cancelBtn = new TextView(hostCtx);
            cancelBtn.setText("Cancel");
            cancelBtn.setTextColor(InstagramPreferenceStyle.accentColor());
            cancelBtn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            cancelBtn.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            cancelBtn.setPadding(p, p, p, p);
            cancelBtn.setOnClickListener(v -> {
                RexHaptics.tap(v);
                dialog.dismiss();
            });
            footer.addView(cancelBtn);
            sheet.addView(footer);

            dialog.setView(sheet);
            showBlurredDialog(hostCtx, dialog);
        } catch (Throwable e) {
            RexRuntimeFeatures.showTranslatorLanguagePicker(context, null);
        }
    }

    /**
     * Screenshot 23076.png — DM Chat Toolkit Popup (Mark as Read, Deleted Messages,
     * Send Audio, Video to Audio, Hide this chat, and Always Mark as Read live switch).
     */
    public static void showChatToolkitPopup(final Context context, final View anchorView) {
        try {
            final Context hostCtx = resolveActivity(context) != null ? resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            LinearLayout sheet = createDialogSheet(hostCtx, "message-dots", "Chat Toolkit");

            LinearLayout card = createGroupedMenuCard(hostCtx);
            addGroupedMenuRow(hostCtx, card, "checks", "Mark as Read", true, () -> {
                dialog.dismiss();
                SharedPref.setBooleanPref(Settings.ENABLE_MARK_CHAT_AS_READ.key, true);
                Utils.showToastShort("Marked chat as read");
            });
            addGroupedMenuRow(hostCtx, card, "trash-2", "Deleted Messages", true, () -> {
                dialog.dismiss();
                SavedMessagesHook.openDeletedMessages(hostCtx);
            });
            addGroupedMenuRow(hostCtx, card, "microphone-off", "Send Audio", true, () -> {
                dialog.dismiss();
                try {
                    Intent pick = new Intent(Intent.ACTION_GET_CONTENT);
                    pick.setType("audio/*");
                    Intent chooser = Intent.createChooser(pick, "Select Audio to Send in Chat");
                    if (!(hostCtx instanceof Activity)) chooser.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    hostCtx.startActivity(chooser);
                } catch (Throwable err) {
                    Utils.showToastShort("Couldn't open audio picker");
                }
            });
            addGroupedMenuRow(hostCtx, card, "music", "Video to Audio", true, () -> {
                dialog.dismiss();
                try {
                    Intent pick = new Intent(Intent.ACTION_PICK, android.provider.MediaStore.Video.Media.EXTERNAL_CONTENT_URI);
                    pick.setType("video/*");
                    Intent chooser = Intent.createChooser(pick, "Select Video to Extract Audio (.mp3)");
                    if (!(hostCtx instanceof Activity)) chooser.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    hostCtx.startActivity(chooser);
                } catch (Throwable err) {
                    Utils.showToastShort("Couldn't open video picker");
                }
            });
            addGroupedMenuRow(hostCtx, card, "eye-off", "Hide this chat", true, () -> {
                dialog.dismiss();
                SharedPref.setBooleanPref(Settings.HIDDEN_CHATS.key, true);
                RexRuntimeFeatures.showHiddenChatsListDialog(hostCtx);
            });
            addQuickBooleanToggle(
                    hostCtx,
                    card,
                    "checks",
                    "Always Mark as Read",
                    Settings.MARK_AS_READ_AFTER_REPLY,
                    InstagramPreferenceStyle.activeSwitchColor(),
                    false
            );
            sheet.addView(card);

            addDialogCloseFooter(hostCtx, sheet, dialog);
            dialog.setView(sheet);
            showBlurredDialog(hostCtx, dialog);
        } catch (Throwable e) {
            Logger.printException(() -> "showChatToolkitPopup error", e);
            showHomeQuickMenu(context);
        }
    }

    /**
     * Morphe Patch Bundle (.mpp) Update Dialog (Audit P1-02 remediation).
     */
    public static void showPatchBundleUpdateDialog(
            final Context context,
            final String installedBundleVer,
            final String remoteBundleVer,
            final String mppDownloadUrl,
            final String releaseNotes,
            final boolean isNewer
    ) {
        try {
            final Context hostCtx = resolveActivity(context) != null ? resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            String title = isNewer
                    ? ("Patch Bundle Update Available (v" + remoteBundleVer + ")")
                    : ("Patch Bundle Up to Date (v" + installedBundleVer + ")");
            LinearLayout sheet = createDialogSheet(hostCtx, "package", title);

            TextView status = new TextView(hostCtx);
            status.setText("Installed Bundle: v" + installedBundleVer + "  •  Latest GitHub .mpp: v" + remoteBundleVer);
            status.setTextColor(InstagramPreferenceStyle.accentColor());
            status.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            status.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            status.setPadding(RexVectorIcons.dp(hostCtx, 4), 0, RexVectorIcons.dp(hostCtx, 4), RexVectorIcons.dp(hostCtx, 10));
            sheet.addView(status);

            TextView notesView = new TextView(hostCtx);
            notesView.setText(releaseNotes);
            notesView.setTextColor(TEXT_SECONDARY);
            notesView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            notesView.setLineSpacing(RexVectorIcons.dp(hostCtx, 2), 1.05f);
            int pad = RexVectorIcons.dp(hostCtx, 12);
            notesView.setPadding(pad, pad, pad, pad);
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(ELEVATED_SURFACE);
            bg.setCornerRadius(RexVectorIcons.dp(hostCtx, 16));
            bg.setStroke(Math.max(1, RexVectorIcons.dp(hostCtx, 1)), BORDER_STROKE);
            notesView.setBackground(bg);
            LinearLayout.LayoutParams nLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            nLp.bottomMargin = RexVectorIcons.dp(hostCtx, 12);
            sheet.addView(notesView, nLp);

            LinearLayout card = createGroupedMenuCard(hostCtx);
            addGroupedMenuRow(hostCtx, card, "copy", "Copy Morphe .mpp Bundle URL", true, () -> {
                dialog.dismiss();
                Utils.setClipboard(mppDownloadUrl);
                Utils.showToastShort("Copied .mpp URL to clipboard");
            });
            addGroupedMenuRow(hostCtx, card, "download-cloud", "Download .mpp Bundle in Browser", true, () -> {
                dialog.dismiss();
                RexUtils.openUrl(mppDownloadUrl, false);
            });
            addGroupedMenuRow(hostCtx, card, "github", "Open GitHub Releases Page", false, () -> {
                dialog.dismiss();
                RexUtils.openUrl("https://github.com/xboyrex/rex-ig-lite/releases", false);
            });
            sheet.addView(card);

            addDialogCloseFooter(hostCtx, sheet, dialog);
            ScrollView scroll = new ScrollView(hostCtx);
            scroll.addView(sheet);
            dialog.setView(scroll);
            showBlurredDialog(hostCtx, dialog);
        } catch (Throwable ignored) {}
    }

    public static Activity resolveActivity(Context context) {
        Context c = context;
        while (c instanceof ContextWrapper) {
            if (c instanceof Activity) return (Activity) c;
            Context base = ((ContextWrapper) c).getBaseContext();
            if (base == c) break;
            c = base;
        }
        return Utils.getActivity();
    }

    /**
     * Attaches real-time Gaussian background blur (RenderEffect on underlying Activity decorView +
     * WindowManager FLAG_BLUR_BEHIND) on Android 12+ (API 31+) with a clean dim-scrim fallback
     * on older Android versions or reduced-motion/low-power configurations.
     */
    public static void showTextInputDialog(
            final Context context,
            final String iconId,
            final String title,
            final String subtitle,
            final String initialValue,
            final String hint,
            final boolean numericOnly,
            final String confirmLabel,
            final java.util.function.Consumer<String> onConfirm
    ) {
        try {
            final Context hostCtx = resolveActivity(context) != null ? resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            LinearLayout sheet = createDialogSheet(hostCtx, iconId, title);

            if (subtitle != null && !subtitle.isEmpty()) {
                TextView sub = new TextView(hostCtx);
                sub.setText(subtitle);
                sub.setTextColor(TEXT_SECONDARY);
                sub.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
                sub.setPadding(0, 0, 0, RexVectorIcons.dp(hostCtx, 10));
                sheet.addView(sub);
            }

            final EditText input = new EditText(hostCtx);
            input.setText(initialValue == null ? "" : initialValue);
            input.setHint(hint == null ? "" : hint);
            input.setHintTextColor(0xFF6E7685);
            input.setTextColor(TEXT_PRIMARY);
            input.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
            if (numericOnly) {
                input.setInputType(android.text.InputType.TYPE_CLASS_NUMBER | android.text.InputType.TYPE_NUMBER_FLAG_SIGNED);
            } else {
                input.setInputType(android.text.InputType.TYPE_CLASS_TEXT);
            }
            int pad = RexVectorIcons.dp(hostCtx, 12);
            input.setPadding(pad, pad, pad, pad);
            GradientDrawable inBg = new GradientDrawable();
            inBg.setColor(0xFF0E1117);
            inBg.setCornerRadius(RexVectorIcons.dp(hostCtx, 12));
            inBg.setStroke(Math.max(1, RexVectorIcons.dp(hostCtx, 1)), 0xFF2B3240);
            input.setBackground(inBg);
            sheet.addView(input, new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT
            ));

            TextView btn = new TextView(hostCtx);
            btn.setText(confirmLabel == null || confirmLabel.isEmpty() ? "Apply" : confirmLabel);
            btn.setGravity(Gravity.CENTER);
            btn.setTextColor(Color.WHITE);
            btn.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            btn.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            btn.setPadding(pad, pad, pad, pad);
            GradientDrawable btnBg = new GradientDrawable();
            btnBg.setColor(InstagramPreferenceStyle.accentColor());
            btnBg.setCornerRadius(RexVectorIcons.dp(hostCtx, 14));
            btn.setBackground(btnBg);
            LinearLayout.LayoutParams bLp = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.MATCH_PARENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT
            );
            bLp.topMargin = RexVectorIcons.dp(hostCtx, 12);
            btn.setOnClickListener(v -> {
                RexHaptics.tap(v);
                String val = input.getText() == null ? "" : input.getText().toString();
                dialog.dismiss();
                if (onConfirm != null) onConfirm.accept(val);
            });
            sheet.addView(btn, bLp);

            dialog.setView(sheet);
            showBlurredDialog(hostCtx, dialog);
        } catch (Throwable ignored) {}
    }

    public static void clearActivityBlur(Context context) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return;
        try {
            Activity host = resolveActivity(context);
            if (host != null && host.getWindow() != null && host.getWindow().getDecorView() != null) {
                host.getWindow().getDecorView().setRenderEffect(null);
            }
        } catch (Throwable ignored) {}
    }

    public static void attachBlurBehind(final Dialog dialog, Context context) {
        if (dialog == null) return;
        final Activity host = resolveActivity(context);
        final boolean reducedMotion = RexIcon.isReducedMotionEnabled(context);
        try {
            Window w = dialog.getWindow();
            if (w != null) {
                w.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                w.addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
                WindowManager.LayoutParams lp = w.getAttributes();
                lp.dimAmount = reducedMotion ? 0.72f : 0.58f;
                if (!reducedMotion && Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                    w.addFlags(WindowManager.LayoutParams.FLAG_BLUR_BEHIND);
                    lp.setBlurBehindRadius(46);
                }
                w.setAttributes(lp);
            }
            // Ensure any residual Activity decorView RenderEffect is cleared; rely on Window FLAG_BLUR_BEHIND
            // so activity.recreate() or dialog replacement can never leave the Activity window permanently blurred (23487.png).
            clearActivityBlur(host);
            dialog.setOnDismissListener(d -> clearActivityBlur(host));
        } catch (Throwable ignored) {}
    }

    public static void styleSystemPreferenceDialog(final Dialog dialog, final Context context) {
        if (dialog == null) return;
        attachBlurBehind(dialog, context);
        try {
            Window w = dialog.getWindow();
            if (w != null) {
                InstagramPreferenceStyle.ColorPalette pal = InstagramPreferenceStyle.currentPalette();
                GradientDrawable bg = new GradientDrawable();
                bg.setColor(pal.cardSurface);
                bg.setCornerRadius(RexVectorIcons.dp(context, 26));
                bg.setStroke(Math.max(2, RexVectorIcons.dp(context, 1)), pal.borderStroke);
                w.setBackgroundDrawable(bg);
            }
        } catch (Throwable ignored) {}
    }

    public static void showBlurredDialog(Context context, Dialog dialog) {
        if (dialog == null) return;
        dismissActiveModalIfPresent();
        synchronized (RexDialogs.class) {
            activeModalDialog = new WeakReference<>(dialog);
        }
        attachBlurBehind(dialog, context);
        dialog.show();
        if (dialog.getWindow() != null && dialog.getWindow().getDecorView() != null) {
            CustomFont.applyToViewTree(dialog.getWindow().getDecorView());
        }
    }

    public static LinearLayout createDialogSheet(Context context, String headerIconId, String titleText) {
        LinearLayout sheet = new LinearLayout(context);
        sheet.setOrientation(LinearLayout.VERTICAL);
        int pad = RexVectorIcons.dp(context, 18);
        sheet.setPadding(pad, RexVectorIcons.dp(context, 20), pad, pad);
        InstagramPreferenceStyle.ColorPalette pal = InstagramPreferenceStyle.currentPalette();
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(pal.cardSurface);
        bg.setCornerRadius(RexVectorIcons.dp(context, 26));
        bg.setStroke(Math.max(2, RexVectorIcons.dp(context, 1)), pal.borderStroke);
        sheet.setBackground(bg);

        LinearLayout headerRow = new LinearLayout(context);
        headerRow.setOrientation(LinearLayout.HORIZONTAL);
        headerRow.setGravity(Gravity.CENTER_VERTICAL);
        headerRow.setPadding(RexVectorIcons.dp(context, 4), 0, RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 12));

        if (headerIconId != null && !headerIconId.isEmpty()) {
            ImageView icon = new ImageView(context);
            icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            icon.setImageDrawable(RexIcon.getDrawable(context, headerIconId, InstagramPreferenceStyle.accentColor(), 23));
            LinearLayout.LayoutParams iLp = new LinearLayout.LayoutParams(
                    RexVectorIcons.dp(context, 23), RexVectorIcons.dp(context, 23));
            iLp.setMarginEnd(RexVectorIcons.dp(context, 10));
            headerRow.addView(icon, iLp);
        }

        TextView header = new TextView(context);
        header.setText(titleText);
        header.setTextColor(TEXT_PRIMARY);
        header.setTextSize(TypedValue.COMPLEX_UNIT_SP, 19.5f);
        header.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        headerRow.addView(header, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        sheet.addView(headerRow);
        return sheet;
    }

    public static void addDialogCloseFooter(Context context, LinearLayout sheet, final Dialog dialog) {
        LinearLayout footer = new LinearLayout(context);
        footer.setOrientation(LinearLayout.HORIZONTAL);
        footer.setGravity(Gravity.END);
        footer.setPadding(0, RexVectorIcons.dp(context, 10), 0, 0);

        TextView close = new TextView(context);
        close.setText("Close");
        close.setTextColor(InstagramPreferenceStyle.accentColor());
        close.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
        close.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        int p = RexVectorIcons.dp(context, 10);
        close.setPadding(p, p, p, p);
        close.setOnClickListener(v -> {
            RexHaptics.tap(v);
            dialog.dismiss();
        });
        footer.addView(close);
        sheet.addView(footer);
    }

    // -------------------------------------------------------------------------
    // 1. Quick Access Menu (SETTINGS & FEATURES)
    // -------------------------------------------------------------------------
    public static void showHomeQuickMenu(final Context context) {
        try {
            final Context hostCtx = resolveActivity(context) != null ? resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();

            LinearLayout sheet = new LinearLayout(hostCtx);
            sheet.setOrientation(LinearLayout.VERTICAL);
            int pad = RexVectorIcons.dp(hostCtx, 18);
            sheet.setPadding(pad, RexVectorIcons.dp(hostCtx, 20), pad, pad);
            GradientDrawable bg = new GradientDrawable();
            bg.setColor(SURFACE_CARD);
            bg.setCornerRadius(RexVectorIcons.dp(hostCtx, 26));
            bg.setStroke(Math.max(2, RexVectorIcons.dp(hostCtx, 1)), BORDER_STROKE);
            sheet.setBackground(bg);

            TextView header = new TextView(hostCtx);
            header.setText("Quick Access");
            header.setTextColor(TEXT_PRIMARY);
            header.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20f);
            header.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            header.setGravity(Gravity.CENTER);
            header.setPadding(0, 0, 0, RexVectorIcons.dp(hostCtx, 14));
            sheet.addView(header);

            boolean ghostOn = Pref.getTurnOnAllGhostModes();
            boolean darkOn = Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.AMOLED_THEME)) || MaterialYouTheme.isAmoledEnabled();
            boolean dndOn = Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.DND_MODE_ENABLED));
            int deletedCount = getDeletedMessagesCount(hostCtx);

            // Section 1: SETTINGS
            addQuickAccessSectionHeader(hostCtx, sheet, "SETTINGS");
            LinearLayout settingsCard = createGroupedMenuCard(hostCtx);
            addGroupedMenuRow(hostCtx, settingsCard, "settings", "InstaRex • Rex IG Lite Settings", true, () -> {
                dialog.dismiss();
                FragmentHook.startSettings();
            });
            addGroupedMenuRow(hostCtx, settingsCard, "code-2", "Developer Options", true, () -> {
                dialog.dismiss();
                showDevWarningDialog(hostCtx, () -> FragmentHook.startFragment(Constants.REX_FRAGMENT_DEV_OPTIONS));
            });
            addGroupedMenuRow(hostCtx, settingsCard, "refresh-cw", "Restart App", false, () -> {
                dialog.dismiss();
                Utils.restartApp(hostCtx);
            });
            sheet.addView(settingsCard);

            // Section 2: FEATURES
            addQuickAccessSectionHeader(hostCtx, sheet, "FEATURES");
            LinearLayout featuresCard = createGroupedMenuCard(hostCtx);
            addGroupedToggleMenuRow(hostCtx, featuresCard, "ghost", "Ghost Mode", ghostOn, true, (iconView, labelView) -> {
                boolean next = !Pref.getTurnOnAllGhostModes();
                Pref.setTurnOnAllGhostModes(next);
                labelView.setText("Ghost Mode: (" + (next ? "Enabled" : "Disabled") + ")");
                RexIcon.bindOrAnimateState(iconView, "ghost", next, TEXT_PRIMARY, ACTIVE_TEAL, 22, true);
                Utils.showToastShort("Ghost Mode: " + (next ? "Enabled" : "Disabled"));
            });
            addGroupedToggleMenuRow(hostCtx, featuresCard, "bell-off", "DND Mode", dndOn, true, (iconView, labelView) -> {
                boolean next = !Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.DND_MODE_ENABLED));
                SharedPref.setBooleanPref(Settings.DND_MODE_ENABLED.key, next);
                labelView.setText("DND Mode: (" + (next ? "Enabled" : "Disabled") + ")");
                RexIcon.bindOrAnimateState(iconView, "bell-off", next, TEXT_PRIMARY, ACTIVE_TEAL, 22, true);
                Utils.showToastShort("DND Mode: " + (next ? "Enabled" : "Disabled"));
            });
            addGroupedMenuRow(hostCtx, featuresCard, "history", "Activity & Watch History", true, () -> {
                dialog.dismiss();
                RexVault.showWatchHistoryDialog(hostCtx);
            });
            addGroupedMenuRow(hostCtx, featuresCard, "bookmarks", "Saved Copies (Bios, Captions & Profiles)", true, () -> {
                dialog.dismiss();
                showSavedCopiesDialog(hostCtx);
            });
            addGroupedMenuRow(hostCtx, featuresCard, "trash-2", "Deleted Messages (" + deletedCount + ")", true, () -> {
                dialog.dismiss();
                SavedMessagesHook.openDeletedMessages(hostCtx);
            });
            addGroupedMenuRow(hostCtx, featuresCard, "scissors", "Long Video Splitter", true, () -> {
                dialog.dismiss();
                RexRuntimeFeatures.showVideoSplitterDialog(hostCtx);
            });
            addGroupedMenuRow(hostCtx, featuresCard, "palette", "Color Mode (" + Pref.rexColorMode() + ")", true, () -> {
                dialog.dismiss();
                RexRuntimeFeatures.showColorModePicker(hostCtx, null);
            });
            addGroupedMenuRow(hostCtx, featuresCard, "database-import", "Apply InstaRex Pro Config V6", true, () -> {
                dialog.dismiss();
                RexRuntimeFeatures.applyBuiltInProConfigV6(hostCtx);
            });
            addGroupedToggleMenuRow(hostCtx, featuresCard, "moon", "Dark Mode", darkOn, false, (iconView, labelView) -> {
                boolean next = !Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.AMOLED_THEME));
                SharedPref.setBooleanPref(Settings.AMOLED_THEME.key, next);
                labelView.setText("Dark Mode: (" + (next ? "Enabled" : "Disabled") + ")");
                RexIcon.bindOrAnimateState(iconView, "moon", next, TEXT_PRIMARY, InstagramPreferenceStyle.activeSwitchColor(), 22, true);
                Utils.showToastShort("AMOLED Dark Mode: " + (next ? "Enabled" : "Disabled"));
            });
            sheet.addView(featuresCard);

            ScrollView scroll = new ScrollView(hostCtx);
            scroll.addView(sheet);
            dialog.setView(scroll);
            showBlurredDialog(hostCtx, dialog);
        } catch (Throwable e) {
            Logger.printException(() -> "showHomeQuickMenu failure", e);
            FragmentHook.startSettings();
        }
    }

    public static void showSavedCopiesDialog(final Context context) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();
            LinearLayout sheet = createDialogSheet(context, "bookmarks", "Saved Copies");

            addQuickAccessSectionHeader(context, sheet, "SAVED DATA");
            LinearLayout card = createGroupedMenuCard(context);
            addGroupedMenuRow(context, card, "file-text", "Saved Bio", true, () -> {
                dialog.dismiss();
                RexVault.showSavedBiosDialog(context);
            });
            addGroupedMenuRow(context, card, "scroll-text", "Saved Captions", true, () -> {
                dialog.dismiss();
                RexVault.showSavedCaptionsDialog(context);
            });
            addGroupedMenuRow(context, card, "users", "Saved Profiles", false, () -> {
                dialog.dismiss();
                RexVault.showSavedProfilesDialog(context);
            });
            sheet.addView(card);

            addDialogCloseFooter(context, sheet, dialog);
            dialog.setView(sheet);
            showBlurredDialog(context, dialog);
        } catch (Throwable e) {
            RexVault.showSavedCaptionsDialog(context);
        }
    }

    private interface ToggleRowCallback {
        void onToggle(ImageView iconView, TextView labelView);
    }

    private static void addQuickAccessSectionHeader(Context context, LinearLayout parent, String text) {
        TextView label = new TextView(context);
        label.setText(text);
        label.setTextColor(InstagramPreferenceStyle.accentColor());
        label.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
        label.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        label.setLetterSpacing(0.06f);
        label.setPadding(RexVectorIcons.dp(context, 6), RexVectorIcons.dp(context, 10), 0, RexVectorIcons.dp(context, 6));
        parent.addView(label);
    }

    public static LinearLayout createGroupedMenuCard(Context context) {
        LinearLayout card = new LinearLayout(context);
        card.setOrientation(LinearLayout.VERTICAL);
        InstagramPreferenceStyle.ColorPalette pal = InstagramPreferenceStyle.currentPalette();
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(pal.elevatedSurface);
        bg.setCornerRadius(RexVectorIcons.dp(context, 20));
        bg.setStroke(Math.max(2, RexVectorIcons.dp(context, 1)), pal.borderStroke);
        card.setBackground(bg);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        );
        lp.bottomMargin = RexVectorIcons.dp(context, 6);
        card.setLayoutParams(lp);
        return card;
    }

    public static void addGroupedMenuRow(
            Context context,
            LinearLayout card,
            String iconType,
            String label,
            boolean showDividerBelow,
            Runnable onClick
    ) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(RexVectorIcons.dp(context, 48));
        int hPad = RexVectorIcons.dp(context, 16);
        int vPad = RexVectorIcons.dp(context, 13);
        row.setPadding(hPad, vPad, hPad, vPad);

        final ImageView icon = new ImageView(context);
        icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        int iconPx = RexVectorIcons.dp(context, 22);
        icon.setImageDrawable(RexIcon.getDrawable(context, iconType, TEXT_PRIMARY, 22));
        LinearLayout.LayoutParams iLp = new LinearLayout.LayoutParams(iconPx, iconPx);
        iLp.setMarginEnd(RexVectorIcons.dp(context, 14));
        row.addView(icon, iLp);

        TextView text = new TextView(context);
        text.setText(label);
        text.setTextColor(TEXT_PRIMARY);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        text.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        row.addView(text, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        final ImageView chevron = new ImageView(context);
        chevron.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        chevron.setImageDrawable(RexIcon.getDrawable(context, "chevron-right", TEXT_SECONDARY, 18));
        LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams(
                RexVectorIcons.dp(context, 18),
                RexVectorIcons.dp(context, 18)
        );
        row.addView(chevron, cLp);

        row.setOnClickListener(v -> {
            RexHaptics.tap(v);
            RexIcon.pulseIcon(icon);
            RexIcon.nudgeChevron(chevron);
            if (onClick != null) onClick.run();
        });
        card.addView(row, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        if (showDividerBelow) {
            View div = new View(context);
            div.setBackgroundColor(BORDER_STROKE);
            LinearLayout.LayoutParams dLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    Math.max(1, RexVectorIcons.dp(context, 1))
            );
            card.addView(div, dLp);
        }
    }

    private static void addGroupedToggleMenuRow(
            Context context,
            LinearLayout card,
            String iconType,
            String baseLabel,
            boolean initialActive,
            boolean showDividerBelow,
            ToggleRowCallback callback
    ) {
        LinearLayout row = new LinearLayout(context);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setMinimumHeight(RexVectorIcons.dp(context, 48));
        int hPad = RexVectorIcons.dp(context, 16);
        int vPad = RexVectorIcons.dp(context, 13);
        row.setPadding(hPad, vPad, hPad, vPad);

        final ImageView icon = new ImageView(context);
        icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        int iconPx = RexVectorIcons.dp(context, 22);
        RexIcon.bindOrAnimateState(icon, iconType, initialActive, TEXT_PRIMARY, ACTIVE_TEAL, 22, false);
        LinearLayout.LayoutParams iLp = new LinearLayout.LayoutParams(iconPx, iconPx);
        iLp.setMarginEnd(RexVectorIcons.dp(context, 14));
        row.addView(icon, iLp);

        final TextView text = new TextView(context);
        text.setText(baseLabel + ": (" + (initialActive ? "Enabled" : "Disabled") + ")");
        text.setTextColor(TEXT_PRIMARY);
        text.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f);
        text.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        row.addView(text, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        final ImageView chevron = new ImageView(context);
        chevron.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        chevron.setImageDrawable(RexIcon.getDrawable(context, "chevron-right", TEXT_SECONDARY, 18));
        LinearLayout.LayoutParams cLp = new LinearLayout.LayoutParams(
                RexVectorIcons.dp(context, 18),
                RexVectorIcons.dp(context, 18)
        );
        row.addView(chevron, cLp);

        row.setOnClickListener(v -> {
            RexHaptics.toggle(v);
            if (callback != null) callback.onToggle(icon, text);
        });
        card.addView(row, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT
        ));

        if (showDividerBelow) {
            View div = new View(context);
            div.setBackgroundColor(BORDER_STROKE);
            LinearLayout.LayoutParams dLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    Math.max(1, RexVectorIcons.dp(context, 1))
            );
            card.addView(div, dLp);
        }
    }

    private static int getDeletedMessagesCount(Context context) {
        try {
            return RexMessageDb.getInstance(context).getDeletedMessages().size();
        } catch (Throwable ignored) {
            return 0;
        }
    }

    // -------------------------------------------------------------------------
    // 2. Interactive Bio, Caption & Comment Hold/Edit/Copy Studio
    // -------------------------------------------------------------------------
    public static void showTextStudioDialog(
            final Context context,
            final String studioTitle,
            final String authorUsername,
            final String initialText,
            final String sourceLink
    ) {
        try {
            final Context hostCtx = resolveActivity(context) != null ? resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            final String rawOriginal = initialText == null ? "" : initialText;
            final String safeUser = (authorUsername == null || authorUsername.isEmpty()) ? "instagram" : authorUsername;

            LinearLayout sheet = createDialogSheet(
                    hostCtx,
                    "edit",
                    studioTitle + (safeUser.isEmpty() ? "" : " (@" + safeUser + ")")
            );

            final TextView statsView = new TextView(hostCtx);
            statsView.setTextColor(BRAND_CYAN);
            statsView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f);
            statsView.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
            statsView.setPadding(RexVectorIcons.dp(hostCtx, 4), 0, 0, RexVectorIcons.dp(hostCtx, 8));
            sheet.addView(statsView);

            final EditText editor = new EditText(hostCtx);
            editor.setText(rawOriginal);
            editor.setHint("Text is empty — type or paste to edit & copy...");
            editor.setHintTextColor(TEXT_SECONDARY);
            editor.setTextColor(TEXT_PRIMARY);
            editor.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.8f);
            editor.setMinLines(3);
            editor.setMaxLines(7);
            editor.setGravity(Gravity.TOP | Gravity.START);
            editor.setTextIsSelectable(true);
            int ePad = RexVectorIcons.dp(hostCtx, 14);
            editor.setPadding(ePad, ePad, ePad, ePad);
            GradientDrawable edBg = new GradientDrawable();
            edBg.setColor(ELEVATED_SURFACE);
            edBg.setCornerRadius(RexVectorIcons.dp(hostCtx, 16));
            edBg.setStroke(Math.max(2, RexVectorIcons.dp(hostCtx, 1)), BORDER_STROKE);
            editor.setBackground(edBg);
            LinearLayout.LayoutParams edLp = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
            );
            edLp.bottomMargin = RexVectorIcons.dp(hostCtx, 10);
            sheet.addView(editor, edLp);

            Runnable updateStats = () -> {
                String current = editor.getText() == null ? "" : editor.getText().toString();
                int chars = current.length();
                String trimmed = current.trim();
                int words = trimmed.isEmpty() ? 0 : trimmed.split("\\s+").length;
                statsView.setText("Editable Studio • " + chars + " chars • " + words + " words");
            };
            updateStats.run();
            editor.addTextChangedListener(new TextWatcher() {
                @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
                @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                    updateStats.run();
                }
                @Override public void afterTextChanged(Editable s) {}
            });

            HorizontalScrollView chipScroll = new HorizontalScrollView(hostCtx);
            chipScroll.setHorizontalScrollBarEnabled(false);
            LinearLayout chipRow = new LinearLayout(hostCtx);
            chipRow.setOrientation(LinearLayout.HORIZONTAL);
            chipRow.setPadding(0, 0, 0, RexVectorIcons.dp(hostCtx, 10));

            addTransformChip(hostCtx, chipRow, "hash", "Strip #Tags", () -> {
                String cur = editor.getText().toString();
                editor.setText(cur.replaceAll("#\\S+", "").replaceAll("\\s{2,}", " ").trim());
                editor.setSelection(editor.getText().length());
            });
            addTransformChip(hostCtx, chipRow, "at-sign", "Strip @Mentions", () -> {
                String cur = editor.getText().toString();
                editor.setText(cur.replaceAll("@[\\w.]+", "").replaceAll("\\s{2,}", " ").trim());
                editor.setSelection(editor.getText().length());
            });
            addTransformChip(hostCtx, chipRow, "wand", "Bold Unicode", () -> {
                String cur = editor.getText().toString();
                editor.setText(RexRuntimeFeatures.toStyledUnicode(cur, "𝐁𝐨𝐥𝐝 (Bold Serif)"));
                editor.setSelection(editor.getText().length());
            });
            addTransformChip(hostCtx, chipRow, "refresh-cw", "Reset Text", () -> {
                editor.setText(rawOriginal);
                editor.setSelection(editor.getText().length());
            });
            chipScroll.addView(chipRow);
            sheet.addView(chipScroll);

            LinearLayout actionsCard = createGroupedMenuCard(hostCtx);
            addGroupedMenuRow(hostCtx, actionsCard, "copy", "Copy Current / Edited Text", true, () -> {
                String val = editor.getText().toString();
                if (val.isEmpty()) {
                    Utils.showToastShort("Text is empty");
                } else {
                    Utils.setClipboard(val);
                    Utils.showToastShort("Copied edited text to clipboard");
                    dialog.dismiss();
                }
            });
            addGroupedMenuRow(hostCtx, actionsCard, "sparkles", "Copy Clean (Without #Hashtags)", true, () -> {
                String val = editor.getText().toString().replaceAll("#\\S+", "").replaceAll("\\s{2,}", " ").trim();
                if (val.isEmpty()) {
                    Utils.showToastShort("Text is empty");
                } else {
                    Utils.setClipboard(val);
                    Utils.showToastShort("Copied clean text without hashtags");
                    dialog.dismiss();
                }
            });
            addGroupedMenuRow(hostCtx, actionsCard, "language", "Translate Text", true, () -> {
                String val = editor.getText().toString();
                dialog.dismiss();
                RexRuntimeFeatures.translateText(hostCtx, val, studioTitle);
            });
            addGroupedMenuRow(hostCtx, actionsCard, "bookmark", "Save to xboyrex Vault", true, () -> {
                String val = editor.getText().toString();
                if (studioTitle.toLowerCase().contains("bio")) {
                    RexVault.saveBio(hostCtx, safeUser, val);
                } else {
                    RexVault.saveCaption(hostCtx, safeUser, val, sourceLink);
                }
                dialog.dismiss();
            });
            addGroupedMenuRow(hostCtx, actionsCard, "share-2", "Share Text Externally", true, () -> {
                String val = editor.getText().toString();
                dialog.dismiss();
                shareText(hostCtx, val);
            });
            addGroupedMenuRow(hostCtx, actionsCard, "search", "Search Text on Web", false, () -> {
                String val = editor.getText().toString().trim();
                dialog.dismiss();
                if (!val.isEmpty()) {
                    try {
                        RexUtils.openUrl("https://www.google.com/search?q=" + Uri.encode(val), true);
                    } catch (Throwable ignored) {}
                }
            });
            sheet.addView(actionsCard);

            addDialogCloseFooter(hostCtx, sheet, dialog);
            ScrollView scroll = new ScrollView(hostCtx);
            scroll.addView(sheet);
            dialog.setView(scroll);
            showBlurredDialog(hostCtx, dialog);
        } catch (Throwable e) {
            if (initialText != null && !initialText.isEmpty()) {
                Utils.setClipboard(initialText);
                Utils.showToastShort("Copied to clipboard");
            }
        }
    }

    private static void addTransformChip(
            Context context,
            LinearLayout parent,
            String iconId,
            String label,
            Runnable onClick
    ) {
        LinearLayout chip = new LinearLayout(context);
        chip.setOrientation(LinearLayout.HORIZONTAL);
        chip.setGravity(Gravity.CENTER_VERTICAL);
        int hPad = RexVectorIcons.dp(context, 12);
        int vPad = RexVectorIcons.dp(context, 8);
        chip.setPadding(hPad, vPad, hPad, vPad);

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(ELEVATED_SURFACE);
        bg.setCornerRadius(RexVectorIcons.dp(context, 14));
        bg.setStroke(Math.max(1, RexVectorIcons.dp(context, 1)), BORDER_STROKE);
        chip.setBackground(bg);

        final ImageView icon = new ImageView(context);
        icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        icon.setImageDrawable(RexIcon.getDrawable(context, iconId, BRAND_CYAN, 16));
        LinearLayout.LayoutParams iLp = new LinearLayout.LayoutParams(
                RexVectorIcons.dp(context, 16), RexVectorIcons.dp(context, 16));
        iLp.setMarginEnd(RexVectorIcons.dp(context, 6));
        chip.addView(icon, iLp);

        TextView tv = new TextView(context);
        tv.setText(label);
        tv.setTextColor(TEXT_PRIMARY);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f);
        tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        chip.addView(tv);

        chip.setOnClickListener(v -> {
            RexHaptics.tap(v);
            RexIcon.pulseIcon(icon);
            if (onClick != null) onClick.run();
        });

        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.setMarginEnd(RexVectorIcons.dp(context, 8));
        parent.addView(chip, lp);
    }

    // -------------------------------------------------------------------------
    // 3. Profile Smart More Options Popup (Grouped + Bio Studio)
    // -------------------------------------------------------------------------
    public static void showProfilePopup(final Context context, final UserData userData, final Callable<String> refreshUrl) {
        try {
            final Context hostCtx = resolveActivity(context) != null ? resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();

            final String username = safeCall(() -> userData.getUsername(), "");
            final String fullName = safeCall(() -> userData.getFullName(), "");
            final String userId = safeCall(() -> userData.getUserId(), "");
            final String bio = safeCall(() -> userData.getBio(), "");
            final boolean isPrivate = safeBool(() -> userData.isPrivate(), false);
            String[] counts = extractFollowerFollowingCounts(hostCtx, userData);
            final String followersStr = counts[0];
            final String followingStr = counts[1];
            final String cleanProfileLink = "https://www.instagram.com/" + username + "/";

            LinearLayout sheet = createDialogSheet(
                    hostCtx,
                    "user-round",
                    username.isEmpty() ? "Profile Options" : ("@" + username)
            );

            addQuickAccessSectionHeader(hostCtx, sheet, "AVATAR & BIO");
            LinearLayout mediaCard = createGroupedMenuCard(hostCtx);
            addGroupedMenuRow(hostCtx, mediaCard, "download", "Download Profile Picture (HD)", true, () -> {
                dialog.dismiss();
                downloadProfilePictureHd(hostCtx, userData, refreshUrl, username);
            });
            addGroupedMenuRow(hostCtx, mediaCard, "eye", "View Profile Picture", true, () -> {
                dialog.dismiss();
                ProfilePictureViewer.show(hostCtx, userData, refreshUrl);
            });
            addGroupedMenuRow(hostCtx, mediaCard, "edit", "View, Edit & Copy Bio", true, () -> {
                dialog.dismiss();
                showTextStudioDialog(hostCtx, "Profile Bio Studio", username, bio, cleanProfileLink);
            });
            addGroupedMenuRow(hostCtx, mediaCard, "copy", "Copy Bio", true, () -> {
                dialog.dismiss();
                if (bio != null && !bio.isEmpty()) {
                    Utils.setClipboard(bio);
                    Utils.showToastShort("Bio copied to clipboard");
                } else {
                    Utils.showToastShort("Bio is empty");
                }
            });
            addGroupedMenuRow(hostCtx, mediaCard, "bookmark", "Save Bio", true, () -> {
                dialog.dismiss();
                RexVault.saveBio(hostCtx, username, bio);
            });
            addGroupedMenuRow(hostCtx, mediaCard, "language", "Translate Bio", false, () -> {
                dialog.dismiss();
                RexRuntimeFeatures.translateText(hostCtx, bio, "Bio");
            });
            sheet.addView(mediaCard);

            addQuickAccessSectionHeader(hostCtx, sheet, "IDENTITY & LINKS");
            LinearLayout idCard = createGroupedMenuCard(hostCtx);
            addGroupedMenuRow(hostCtx, idCard, "at-sign", "Copy Username", true, () -> {
                dialog.dismiss();
                if (username != null && !username.isEmpty()) {
                    Utils.setClipboard(username);
                    Utils.showToastShort("Copied @" + username);
                }
            });
            if (fullName != null && !fullName.isEmpty()) {
                addGroupedMenuRow(hostCtx, idCard, "user-round", "Copy Full Name", true, () -> {
                    dialog.dismiss();
                    Utils.setClipboard(fullName);
                    Utils.showToastShort("Copied full name: " + fullName);
                });
            }
            addGroupedMenuRow(hostCtx, idCard, "link", "Copy Profile Link", true, () -> {
                dialog.dismiss();
                Utils.setClipboard(cleanProfileLink);
                Utils.showToastShort("Copied clean profile link");
            });
            addGroupedMenuRow(hostCtx, idCard, "share-2", "Share Profile Link", true, () -> {
                dialog.dismiss();
                shareText(hostCtx, cleanProfileLink);
            });
            addGroupedMenuRow(hostCtx, idCard, "id-badge", "Copy User ID", true, () -> {
                dialog.dismiss();
                if (userId != null && !userId.isEmpty()) {
                    Utils.setClipboard(userId);
                    Utils.showToastShort("Copied User ID: " + userId);
                }
            });
            addGroupedMenuRow(hostCtx, idCard, isPrivate ? "lock" : "lock-open", isPrivate ? "Private Profile" : "Public Profile", true, () -> {
                dialog.dismiss();
                Utils.setClipboard(cleanProfileLink);
                Utils.showToastShort((isPrivate ? "Private Profile" : "Public Profile") + " • Link copied");
            });
            addGroupedMenuRow(hostCtx, idCard, "heart-handshake", "Friendship & Relationship Status", true, () -> {
                dialog.dismiss();
                java.util.Map<String, Boolean> fMap = null;
                try {
                    app.morphe.extension.instagram.entity.UserFriendshipStatus ufs = userData.getUserFriendshipStatus();
                    if (ufs != null) fMap = ufs.getMappings();
                } catch (Throwable ignored) {}
                showFriendshipStatusSheet(hostCtx, fMap);
            });
            addGroupedMenuRow(hostCtx, idCard, "users", "Followers: " + followersStr, true, () -> {
                dialog.dismiss();
                Utils.setClipboard(followersStr);
                Utils.showToastShort("Followers: " + followersStr + " (Copied)");
            });
            addGroupedMenuRow(hostCtx, idCard, "user-check", "Following: " + followingStr, true, () -> {
                dialog.dismiss();
                Utils.setClipboard(followingStr);
                Utils.showToastShort("Following: " + followingStr + " (Copied)");
            });
            addGroupedMenuRow(hostCtx, idCard, "user-plus", "Add to Saved Profiles", false, () -> {
                dialog.dismiss();
                RexVault.saveProfile(hostCtx, username, fullName, userId);
            });
            sheet.addView(idCard);

            addDialogCloseFooter(hostCtx, sheet, dialog);
            ScrollView scroll = new ScrollView(hostCtx);
            scroll.addView(sheet);
            dialog.setView(scroll);
            showBlurredDialog(hostCtx, dialog);
        } catch (Throwable e) {
            Logger.printException(() -> "showProfilePopup failure", e);
            Utils.showToastShort(userSafeErrorMessage(e, "Couldn't load profile options. Try again."));
        }
    }

    private static void downloadProfilePictureHd(
            final Context context,
            final UserData userData,
            final Callable<String> refreshUrl,
            final String username
    ) {
        Utils.runOnBackgroundThread(() -> {
            String hdUrl = null;
            try {
                if (refreshUrl != null) {
                    hdUrl = refreshUrl.call();
                }
            } catch (Throwable ignored) {}
            if (hdUrl == null || hdUrl.isEmpty()) {
                try {
                    hdUrl = userData.getProfilePictureUrl();
                } catch (Throwable ignored) {}
            }
            final String finalUrl = hdUrl;
            Utils.runOnMainThread(() -> {
                if (finalUrl == null || finalUrl.isEmpty()) {
                    Utils.showToastShort("Unable to resolve profile picture URL");
                    return;
                }
                try {
                    String safeUser = (username == null || username.isEmpty()) ? "profile" : username;
                    String fileName = safeUser + "_profile_hd_" + (System.currentTimeMillis() / 1000L) + ".jpg";
                    DownloadUtils.downloadMediaUrl(context, finalUrl, DownloadUtils.getSubfolderName(safeUser), fileName);
                } catch (Throwable e) {
                    Utils.showToastShort(userSafeErrorMessage(e, "Profile picture download failed. Try again."));
                }
            });
        });
    }

    private static void shareText(Context context, String text) {
        try {
            Intent sendIntent = new Intent(Intent.ACTION_SEND);
            sendIntent.setType("text/plain");
            sendIntent.putExtra(Intent.EXTRA_TEXT, text);
            Intent chooser = Intent.createChooser(sendIntent, "Share via");
            if (!(context instanceof Activity)) {
                chooser.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            }
            context.startActivity(chooser);
        } catch (Throwable e) {
            Utils.setClipboard(text);
            Utils.showToastShort("Link copied to clipboard");
        }
    }

    private static String[] extractFollowerFollowingCounts(Context context, UserData userData) {
        String followers = "—";
        String following = "—";
        try {
            Activity act = resolveActivity(context);
            if (act != null && act.getWindow() != null) {
                View decor = act.getWindow().getDecorView();
                List<String> texts = new ArrayList<>();
                collectVisibleTexts(decor, texts);
                for (int i = 0; i < texts.size(); i++) {
                    String t = texts.get(i).trim();
                    String lower = t.toLowerCase();
                    if ((lower.equals("followers") || lower.equals("follower")) && i > 0 && "—".equals(followers)) {
                        String prev = texts.get(i - 1).trim();
                        if (prev.matches("^[0-9][0-9.,\\s]*[KMBkmb]?$")) followers = prev;
                    } else if ((lower.endsWith(" followers") || lower.endsWith(" follower")) && "—".equals(followers)) {
                        String cand = t.replaceAll("(?i)\\s*followers?$", "").trim();
                        if (cand.matches("^[0-9][0-9.,\\s]*[KMBkmb]?$")) followers = cand;
                    }
                    if (lower.equals("following") && i > 0 && "—".equals(following)) {
                        String prev = texts.get(i - 1).trim();
                        if (prev.matches("^[0-9][0-9.,\\s]*[KMBkmb]?$")) following = prev;
                    } else if (lower.endsWith(" following") && "—".equals(following)) {
                        String cand = t.replaceAll("(?i)\\s*following$", "").trim();
                        if (cand.matches("^[0-9][0-9.,\\s]*[KMBkmb]?$")) following = cand;
                    }
                }
            }
        } catch (Throwable ignored) {}
        return new String[]{followers, following};
    }

    private static void collectVisibleTexts(View view, List<String> out) {
        if (view == null || view.getVisibility() != View.VISIBLE) return;
        if (view instanceof TextView) {
            CharSequence cs = ((TextView) view).getText();
            if (cs != null && cs.length() > 0 && cs.length() < 40) {
                out.add(cs.toString());
            }
        } else if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            for (int i = 0; i < vg.getChildCount(); i++) {
                collectVisibleTexts(vg.getChildAt(i), out);
            }
        }
    }

    // -------------------------------------------------------------------------
    // 4. Capability-Aware Post / Reel / Carousel Smart Options Sheet
    //    (Uses MediaContextResolver + MediaActionRegistry across 4 clean groups)
    // -------------------------------------------------------------------------
    public static void showPostOptionsSheet(
            final Context context,
            final UserSession userSession,
            final Object mediaObject,
            final int currentMediaIndex
    ) {
        try {
            final Context hostCtx = resolveActivity(context) != null ? resolveActivity(context) : context;
            final MediaCapabilities caps = MediaContextResolver.resolveForPost(mediaObject, userSession, currentMediaIndex);
            final List<ActionSpec> actions = MediaActionRegistry.buildActions(caps, false);

            RexVault.recordWatchedMedia(
                    hostCtx,
                    caps.username,
                    caps.rawCaption.isEmpty() ? ("Post @" + caps.username) : caps.rawCaption,
                    caps.postLink
            );

            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            String sheetTitle = caps.isCarousel && caps.totalCount > 1
                    ? "Post Options (Slide " + caps.displayIndex + " of " + caps.totalCount + ")"
                    : (caps.currentItemIsVideo ? "Video & Reel Options" : "Post Options");
            LinearLayout sheet = createDialogSheet(hostCtx, "hexagon", sheetTitle);

            for (ActionGroup group : ActionGroup.values()) {
                List<ActionSpec> groupActions = new ArrayList<>();
                for (ActionSpec spec : actions) {
                    if (spec.group == group) groupActions.add(spec);
                }
                if (groupActions.isEmpty()) continue;

                addQuickAccessSectionHeader(hostCtx, sheet, group.headerTitle);
                LinearLayout groupCard = createGroupedMenuCard(hostCtx);
                for (int i = 0; i < groupActions.size(); i++) {
                    final ActionSpec spec = groupActions.get(i);
                    boolean hasDivider = i < groupActions.size() - 1;
                    addGroupedMenuRow(hostCtx, groupCard, spec.iconId, spec.label, hasDivider, () -> {
                        dialog.dismiss();
                        dispatchMediaAction(hostCtx, caps, spec.id);
                    });
                }
                sheet.addView(groupCard);
            }

            // Direct Enable/Disable switches inline on every Post / Reel / Carousel Options sheet
            addQuickAccessSectionHeader(hostCtx, sheet, "DIRECT ENABLE / DISABLE TOGGLES");
            LinearLayout inlineTogglesCard = createGroupedMenuCard(hostCtx);
            int activeTint = InstagramPreferenceStyle.activeSwitchColor();
            addQuickBooleanToggle(hostCtx, inlineTogglesCard, "bolt", "Zero-Prompt Direct Download", Settings.ENABLE_DIRECT_DOWNLOAD, activeTint, true);
            addQuickBooleanToggle(hostCtx, inlineTogglesCard, "play", "Disable Auto Play Video", Settings.DISABLE_VIDEO_AUTOPLAY, activeTint, true);
            addQuickBooleanToggle(hostCtx, inlineTogglesCard, "volume-off", "Start Videos Muted", Settings.START_FEED_VIDEOS_MUTED, activeTint, true);
            addQuickBooleanToggle(hostCtx, inlineTogglesCard, "hash", "Copy Caption Without Hashtags", Settings.COPY_CAPTION_WITHOUT_HASHTAGS, activeTint, true);
            addQuickBooleanToggle(hostCtx, inlineTogglesCard, "download", "Disable 'Download' Icon", Settings.DISABLE_FEED_DOWNLOAD_ICON, activeTint, true);
            addQuickBooleanToggle(hostCtx, inlineTogglesCard, "hexagon", "Disable 'InstaRex Options' Icon", Settings.DISABLE_FEED_OPTIONS_ICON, activeTint, false);
            sheet.addView(inlineTogglesCard);

            addDialogCloseFooter(hostCtx, sheet, dialog);
            ScrollView scroll = new ScrollView(hostCtx);
            scroll.addView(sheet);
            dialog.setView(scroll);
            showBlurredDialog(hostCtx, dialog);
        } catch (Throwable e) {
            Logger.printException(() -> "showPostOptionsSheet failure", e);
            Utils.showToastShort(userSafeErrorMessage(e, "Couldn't load media options. Try again."));
        }
    }

    private static void dispatchMediaAction(
            Context context,
            MediaCapabilities caps,
            ActionId actionId
    ) {
        try {
            final int filenameIndex = caps.group.currentFilenameIndex(caps.currentIndex);
            switch (actionId) {
                case DOWNLOAD_CURRENT:
                case DOWNLOAD_ALL_CAROUSEL:
                case DOWNLOAD_FIRST_10:
                case SELECT_SLIDES:
                case IMAGE_VARIANTS:
                case VIDEO_VARIANTS:
                case DOWNLOAD_AUDIO:
                case DOWNLOAD_COVER:
                case COPY_CLEAN_LINK:
                case OPEN_EXTERNAL_APP:
                    DownloadUtils.executeMediaAction(
                            context,
                            caps,
                            actionId,
                            filenameIndex,
                            null,
                            null
                    );
                    break;
                case COPY_AUTHOR_USERNAME:
                    if (caps.username != null && !caps.username.isEmpty()) {
                        Utils.setClipboard(caps.username);
                        Utils.showToastShort("Copied @" + caps.username);
                    }
                    break;
                case CAPTION_STUDIO:
                    showTextStudioDialog(context, "Caption Studio", caps.username, caps.rawCaption, caps.postLink);
                    break;
                case COPY_CAPTION: {
                    String cleaned = RexRuntimeFeatures.stripHashtagsIfConfigured(caps.rawCaption);
                    if (cleaned == null || cleaned.isEmpty()) {
                        Utils.showToastShort("Caption is empty");
                    } else {
                        Utils.setClipboard(cleaned);
                        Utils.showToastShort("Caption copied to clipboard");
                    }
                    break;
                }
                case SAVE_CAPTION:
                    RexVault.saveCaption(context, caps.username, caps.rawCaption, caps.postLink);
                    break;
                case TRANSLATE_CAPTION:
                    RexRuntimeFeatures.translateText(context, caps.rawCaption, "Caption");
                    break;
                case COPY_HASHTAGS: {
                    String tags = RexRuntimeFeatures.extractHashtags(caps.rawCaption);
                    if (tags.isEmpty()) {
                        Utils.showToastShort("No hashtags found in caption");
                    } else {
                        Utils.setClipboard(tags);
                        Utils.showToastShort("Copied hashtags: " + tags);
                    }
                    break;
                }
                case OCR_COVER_TEXT:
                    RexRuntimeFeatures.extractOcrFromMedia(context, caps.rootMedia, caps.currentIndex);
                    break;
                case VIEW_STORY_MENTIONS:
                    app.morphe.extension.instagram.patches.story.ViewStoryMentionsPatch.viewMentions(
                            context, caps.rootMedia != null ? caps.rootMedia : caps.currentMedia, null);
                    break;
                case STORY_MEDIA_INFO:
                    RexRuntimeFeatures.showStoryMediaInfoDialog(context, caps);
                    break;
                case REPOST_IG_POST:
                    RexRuntimeFeatures.repostMedia(context, caps.rootMedia, caps.currentIndex, "IG_POST");
                    break;
                case REPOST_IG_STORY:
                    RexRuntimeFeatures.repostMedia(context, caps.rootMedia, caps.currentIndex, "IG_STORY");
                    break;
                case REPOST_WHATSAPP_STORY:
                    RexRuntimeFeatures.repostMedia(context, caps.rootMedia, caps.currentIndex, "WHATSAPP");
                    break;
                case REPOST_ALL_IG_POST:
                    RexRuntimeFeatures.repostAllCarouselMedia(context, caps.rootMedia, caps.totalCount, "IG_POST");
                    break;
                case REPOST_ALL_IG_STORY:
                    RexRuntimeFeatures.repostAllCarouselMedia(context, caps.rootMedia, caps.totalCount, "IG_STORY");
                    break;
                case REPOST_ALL_WHATSAPP_STORY:
                    RexRuntimeFeatures.repostAllCarouselMedia(context, caps.rootMedia, caps.totalCount, "WHATSAPP");
                    break;
                case SURFACE_QUICK_SETTINGS:
                    String surf = caps.isStory ? "STORY"
                            : (caps.surfaceType == MediaContextResolver.SurfaceType.REEL ? "REEL" : "FEED");
                    showSurfaceQuickSettingsDialog(context, surf);
                    break;
            }
        } catch (Throwable e) {
            Logger.printException(() -> "handlePostOptionClick error", e);
            Utils.showToastShort(userSafeErrorMessage(e, "Couldn't complete media action. Try again."));
        }
    }

    // -------------------------------------------------------------------------
    // 5. Semantic Icon Menu Dialog (Used by DownloadUtils, DeletedMessages, InstantsVault)
    // -------------------------------------------------------------------------
    public static void showSemanticMenuDialog(
            final Context context,
            final String headerIconId,
            final String titleText,
            final List<String> labels,
            final List<String> iconIds,
            final DialogInterface.OnClickListener onItemClick,
            final DialogInterface.OnDismissListener onDismiss
    ) {
        try {
            final Context hostCtx = resolveActivity(context) != null ? resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            LinearLayout sheet = createDialogSheet(hostCtx, headerIconId, titleText);

            LinearLayout card = createGroupedMenuCard(hostCtx);
            int count = labels.size();
            for (int i = 0; i < count; i++) {
                final int which = i;
                String lbl = labels.get(i);
                String ic = (iconIds != null && i < iconIds.size()) ? iconIds.get(i) : "download";
                addGroupedMenuRow(hostCtx, card, ic, lbl, i < count - 1, () -> {
                    dialog.dismiss();
                    if (onItemClick != null) {
                        onItemClick.onClick(dialog, which);
                    }
                });
            }
            sheet.addView(card);
            addDialogCloseFooter(hostCtx, sheet, dialog);

            ScrollView scroll = new ScrollView(hostCtx);
            scroll.addView(sheet);
            dialog.setView(scroll);
            if (onDismiss != null) {
                dialog.setOnDismissListener(onDismiss);
            }
            showBlurredDialog(hostCtx, dialog);
        } catch (Throwable e) {
            Logger.printException(() -> "showSemanticMenuDialog error", e);
            if (onDismiss != null) onDismiss.onDismiss(null);
        }
    }

    // -------------------------------------------------------------------------
    // 6. Changelogs Dialog
    // -------------------------------------------------------------------------
    public static void showChangelogDialog(final Context context) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();

            LinearLayout root = createDialogSheet(context, "scroll-text", "Changelogs");

            TextView meta = new TextView(context);
            meta.setText("Release Date: 17/11/2026\n" +
                    "Base: 453.0.0.57.79 & 452.1.0.53.64 / Universal\n" +
                    "Version: 3.16.0 (InstaRex • Rex IG Lite AMOLED Suite)");
            meta.setTextColor(TEXT_SECONDARY);
            meta.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            meta.setPadding(RexVectorIcons.dp(context, 4), 0, RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 12));
            root.addView(meta);

            ScrollView scroll = new ScrollView(context);
            TextView body = new TextView(context);
            body.setText(
                    "Fixed: ImageInfoImpl and ImmutablePandoImageInfo variant resolution across Instagram v452–v453 (BUG-DL-001 & BUG-DL-002).\n" +
                    "Fixed: Automatic Carousel item count and slide detection (Download All (N), Download First 10, and Select Slides).\n" +
                    "Fixed: Root Settings category icons and subpage preference icons so every option displays its unique semantic Tabler icon.\n" +
                    "Added: Capability-aware MediaContextResolver & MediaActionRegistry across 4 clean groups (Download, Copy & Caption, Tools, Share).\n" +
                    "Added: Upgraded AMOLED #15181D / #20252C / #23C6D8 palette, Reduced Motion support, and Legal & Open-Source Licences screen."
            );
            body.setTextColor(TEXT_PRIMARY);
            body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.8f);
            body.setLineSpacing(RexVectorIcons.dp(context, 3), 1.05f);
            body.setPadding(RexVectorIcons.dp(context, 4), 0, RexVectorIcons.dp(context, 4), 0);
            scroll.addView(body);
            root.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

            addDialogCloseFooter(context, root, dialog);
            dialog.setView(root);
            showBlurredDialog(context, dialog);
        } catch (Throwable ignored) {}
    }

    // -------------------------------------------------------------------------
    // 7. Legal & Open-Source Licences Dialog (Master Prompt Section 5.1)
    // -------------------------------------------------------------------------
    public static void showLegalLicensesDialog(final Context context) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();
            LinearLayout root = createDialogSheet(context, "file-text", "Legal & Open-Source Licences");

            ScrollView scroll = new ScrollView(context);
            TextView body = new TextView(context);
            body.setText(
                    "1. Rex IG Lite — GNU General Public License v3.0 (GPLv3)\n" +
                    "Copyright (C) 2026 xboyrex (https://github.com/xboyrex/rex-ig-lite).\n" +
                    "Licensed under GNU GPLv3 with Section 7(b) attribution preservation.\n\n" +
                    "2. Tabler Icons — MIT License\n" +
                    "Copyright (c) 2020-2026 Paweł Kuna (https://tablericons.com/ • https://github.com/tabler/tabler-icons).\n" +
                    "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files to deal in the Software without restriction, subject to the MIT License notice.\n\n" +
                    "3. Brand Marks (GitHub, YouTube, Telegram, Instagram, WhatsApp)\n" +
                    "Official brand marks are trademarks of their respective owners and are used solely to identify official community links and share targets."
            );
            body.setTextColor(TEXT_SECONDARY);
            body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            body.setLineSpacing(RexVectorIcons.dp(context, 3), 1.06f);
            body.setPadding(RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 12));
            scroll.addView(body);
            root.addView(scroll, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

            addDialogCloseFooter(context, root, dialog);
            dialog.setView(root);
            showBlurredDialog(context, dialog);
        } catch (Throwable ignored) {}
    }

    // -------------------------------------------------------------------------
    // 8. Support Developer Dialog
    // -------------------------------------------------------------------------
    public static void showSupportDialog(final Context context) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();

            LinearLayout root = createDialogSheet(context, "heart-handshake", "Support Developer");

            TextView body = new TextView(context);
            body.setText(
                    "We're dedicated to providing a high-quality, reliable, and continuously improving AMOLED Instagram experience through xboyrex.\n\n" +
                    "Your support helps us maintain updates, implement new features, fix bugs, and ensure long-term development.\n\n" +
                    "If you've found value in Rex IG Lite, please consider starring our repository on GitHub or joining our community channels.\n\n" +
                    "Thank you for being part of our journey."
            );
            body.setTextColor(TEXT_SECONDARY);
            body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            body.setLineSpacing(RexVectorIcons.dp(context, 2), 1.05f);
            body.setPadding(RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 6), RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 16));
            root.addView(body);

            LinearLayout footer = new LinearLayout(context);
            footer.setOrientation(LinearLayout.HORIZONTAL);
            footer.setGravity(Gravity.END);
            footer.setLayoutParams(new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

            int p = RexVectorIcons.dp(context, 12);
            TextView close = new TextView(context);
            close.setText("Close");
            close.setTextColor(TEXT_SECONDARY);
            close.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            close.setTypeface(Typeface.DEFAULT_BOLD);
            close.setPadding(p, p, p, p);
            close.setOnClickListener(v -> {
                RexHaptics.tap(v);
                dialog.dismiss();
            });
            footer.addView(close);

            TextView star = new TextView(context);
            star.setText("Star on GitHub");
            star.setTextColor(ACTION_BLUE);
            star.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            star.setTypeface(Typeface.DEFAULT_BOLD);
            star.setPadding(p, p, p, p);
            star.setOnClickListener(v -> {
                RexHaptics.tap(v);
                dialog.dismiss();
                RexUtils.openUrl("https://github.com/xboyrex/rex-ig-lite", false);
            });
            footer.addView(star);
            root.addView(footer);

            dialog.setView(root);
            showBlurredDialog(context, dialog);
        } catch (Throwable ignored) {}
    }

    // -------------------------------------------------------------------------
    // 9. Developer Options Warning Dialog
    // -------------------------------------------------------------------------
    public static void showDevWarningDialog(final Context context, final Runnable onProceed) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();

            LinearLayout root = createDialogSheet(context, "code-2", "Developer Options Warning");

            TextView body = new TextView(context);
            body.setText(
                    "You are about to enter Developer Options. Changing internal MetaConfig flags without proper knowledge may cause unexpected behavior.\n\n" +
                    "• Proceed only if you know what you are modifying.\n" +
                    "• You can export or reset overrides at any time."
            );
            body.setTextColor(TEXT_SECONDARY);
            body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f);
            body.setLineSpacing(RexVectorIcons.dp(context, 2), 1.05f);
            body.setPadding(RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 6), RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 16));
            root.addView(body);

            LinearLayout footer = new LinearLayout(context);
            footer.setOrientation(LinearLayout.HORIZONTAL);
            footer.setGravity(Gravity.END);

            int p = RexVectorIcons.dp(context, 12);
            TextView cancel = new TextView(context);
            cancel.setText("Cancel");
            cancel.setTextColor(TEXT_SECONDARY);
            cancel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            cancel.setTypeface(Typeface.DEFAULT_BOLD);
            cancel.setPadding(p, p, p, p);
            cancel.setOnClickListener(v -> {
                RexHaptics.tap(v);
                dialog.dismiss();
            });
            footer.addView(cancel);

            TextView proceed = new TextView(context);
            proceed.setText("Proceed");
            proceed.setTextColor(ACTION_BLUE);
            proceed.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            proceed.setTypeface(Typeface.DEFAULT_BOLD);
            proceed.setPadding(p, p, p, p);
            proceed.setOnClickListener(v -> {
                RexHaptics.tap(v);
                dialog.dismiss();
                if (onProceed != null) onProceed.run();
            });
            footer.addView(proceed);
            root.addView(footer);

            dialog.setView(root);
            showBlurredDialog(context, dialog);
        } catch (Throwable e) {
            if (onProceed != null) onProceed.run();
        }
    }

    private static String safeCall(Callable<String> c, String fallback) {
        try {
            String r = c.call();
            return r != null ? r : fallback;
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    private static boolean safeBool(Callable<Boolean> c, boolean fallback) {
        try {
            Boolean r = c.call();
            return r != null ? r : fallback;
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    public static void showConfirmDialog(
            final Context context,
            final String titleText,
            final String messageText,
            final String confirmLabel,
            final boolean destructive,
            final Runnable onConfirm
    ) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();
            LinearLayout root = createDialogSheet(context, destructive ? "trash-2" : "info", titleText);

            TextView body = new TextView(context);
            body.setText(messageText);
            body.setTextColor(TEXT_SECONDARY);
            body.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            body.setLineSpacing(RexVectorIcons.dp(context, 2), 1.05f);
            body.setPadding(RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 6), RexVectorIcons.dp(context, 4), RexVectorIcons.dp(context, 18));
            root.addView(body);

            LinearLayout footer = new LinearLayout(context);
            footer.setOrientation(LinearLayout.HORIZONTAL);
            footer.setGravity(Gravity.END);

            int p = RexVectorIcons.dp(context, 12);
            TextView cancel = new TextView(context);
            cancel.setText("Cancel");
            cancel.setTextColor(TEXT_SECONDARY);
            cancel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            cancel.setTypeface(Typeface.DEFAULT_BOLD);
            cancel.setPadding(p, p, p, p);
            cancel.setOnClickListener(v -> {
                RexHaptics.tap(v);
                dialog.dismiss();
            });
            footer.addView(cancel);

            TextView confirm = new TextView(context);
            confirm.setText(confirmLabel);
            confirm.setTextColor(destructive ? DESTRUCTIVE_RED : ACTION_BLUE);
            confirm.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
            confirm.setTypeface(Typeface.DEFAULT_BOLD);
            confirm.setPadding(p, p, p, p);
            confirm.setOnClickListener(v -> {
                RexHaptics.tap(v);
                dialog.dismiss();
                if (onConfirm != null) onConfirm.run();
            });
            footer.addView(confirm);
            root.addView(footer);

            dialog.setView(root);
            showBlurredDialog(context, dialog);
        } catch (Throwable e) {
            if (onConfirm != null) onConfirm.run();
        }
    }

    public static void showStoryOptionsSheet(
            final Context context,
            final UserSession userSession,
            final Object mediaObject,
            final Object reelObject
    ) {
        try {
            final Context hostCtx = resolveActivity(context) != null ? resolveActivity(context) : context;
            final MediaCapabilities caps = MediaContextResolver.resolveForStory(mediaObject, reelObject, userSession);
            final MediaData resolvedStoryMediaData = caps.currentMedia != null ? caps.currentMedia : caps.rootMedia;
            final Object resolvedStoryMediaObj = (resolvedStoryMediaData != null && resolvedStoryMediaData.getObject() != null)
                    ? resolvedStoryMediaData.getObject()
                    : mediaObject;
            int resolvedMentionCount = 0;
            try {
                if (resolvedStoryMediaData != null && resolvedStoryMediaData.getMentionSet() != null) {
                    resolvedMentionCount = resolvedStoryMediaData.getMentionSet().size();
                }
            } catch (Throwable ignored) {
            }

            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            String sheetTitle = caps.totalCount > 1
                    ? "Story Quick Menu (" + caps.displayIndex + " of " + caps.totalCount + ")"
                    : "Story Quick Menu";
            LinearLayout sheet = createDialogSheet(hostCtx, "circle-dashed", sheetTitle);

            addQuickAccessSectionHeader(hostCtx, sheet, "STORY ACTIONS");
            LinearLayout storyActionsCard = createGroupedMenuCard(hostCtx);

            addGroupedMenuRow(hostCtx, storyActionsCard, "download", "Download Story", true, () -> {
                dialog.dismiss();
                DownloadUtils.downloadStory(null, userSession, resolvedStoryMediaObj, reelObject, false);
            });
            addGroupedMenuRow(hostCtx, storyActionsCard, "folder-down", "Download Options", true, () -> {
                dialog.dismiss();
                DownloadUtils.showStoryDownloadOptions(hostCtx, userSession, resolvedStoryMediaObj, reelObject, null);
            });
            String mentionsLabel = "View Story Mentions (" + resolvedMentionCount + ")";
            addGroupedMenuRow(hostCtx, storyActionsCard, "at-sign", mentionsLabel, true, () -> {
                dialog.dismiss();
                app.morphe.extension.instagram.patches.story.ViewStoryMentionsPatch.viewMentions(
                        hostCtx,
                        resolvedStoryMediaData != null ? resolvedStoryMediaData : resolvedStoryMediaObj,
                        null
                );
            });
            addGroupedMenuRow(hostCtx, storyActionsCard, "adjustments", "Mention Pill Settings", true, () -> {
                dialog.dismiss();
                app.morphe.extension.instagram.patches.story.StoryMentionSettings.showSettings(hostCtx);
            });
            addGroupedMenuRow(hostCtx, storyActionsCard, "heart-spark", "Story Likes History", true, () -> {
                dialog.dismiss();
                app.morphe.extension.instagram.patches.story.StoryLikeHistoryActivity.open(hostCtx);
            });
            addGroupedMenuRow(hostCtx, storyActionsCard, "language", "Translate Story Text / Caption", true, () -> {
                dialog.dismiss();
                if (caps.hasCaption && caps.rawCaption != null && !caps.rawCaption.trim().isEmpty()) {
                    RexRuntimeFeatures.translateText(hostCtx, caps.rawCaption, "Story Caption");
                } else if (resolvedStoryMediaData != null) {
                    RexRuntimeFeatures.extractOcrFromMedia(hostCtx, resolvedStoryMediaData, caps.currentIndex);
                } else {
                    Utils.showToastShort("No story text found to translate");
                }
            });
            String extPkg = app.morphe.extension.instagram.utils.Pref.getExternalDownloaderPackageName();
            boolean hasExtDownloader = app.morphe.extension.instagram.utils.Pref.downloadWithExternalDownloader()
                    && extPkg != null && !extPkg.trim().isEmpty();
            addGroupedMenuRow(hostCtx, storyActionsCard, "sliders-horizontal", "Story Quick Settings", hasExtDownloader, () -> {
                dialog.dismiss();
                showSurfaceQuickSettingsDialog(hostCtx, "STORY");
            });
            if (hasExtDownloader) {
                addGroupedMenuRow(hostCtx, storyActionsCard, "external-link", "Download with External Downloader", false, () -> {
                    dialog.dismiss();
                    DownloadUtils.externalDownloader(resolvedStoryMediaObj, caps.currentIndex);
                });
            }
            sheet.addView(storyActionsCard);

            // Direct Enable/Disable switches inline on every Story Options sheet
            addQuickAccessSectionHeader(hostCtx, sheet, "DIRECT ENABLE / DISABLE TOGGLES");
            LinearLayout storyTogglesCard = createGroupedMenuCard(hostCtx);
            int storyTint = InstagramPreferenceStyle.activeSwitchColor();
            addQuickBooleanToggle(hostCtx, storyTogglesCard, "ghost", "Ghost Story Viewing", Settings.VIEW_STORIES_ANONYMOUSLY, storyTint, true);
            addQuickBooleanToggle(hostCtx, storyTogglesCard, "skip-forward", "Disable Auto Play Next Story", Settings.DISABLE_STORY_FLIPPING, storyTint, true);
            addQuickBooleanToggle(hostCtx, storyTogglesCard, "repeat-once", "Enable Replay Story", Settings.LOOP_STORY, storyTint, true);
            addQuickBooleanToggle(hostCtx, storyTogglesCard, "volume", "Force to Play Sound in Stories", Settings.PLAY_STORY_SOUND_AUTOMATICALLY, storyTint, true);
            addQuickBooleanToggle(hostCtx, storyTogglesCard, "badge-hd", "Enhance Story Upload Quality", Settings.HIGH_QUALITY_UPLOAD, storyTint, false);
            sheet.addView(storyTogglesCard);

            addDialogCloseFooter(hostCtx, sheet, dialog);
            ScrollView scroll = new ScrollView(hostCtx);
            scroll.addView(sheet);
            dialog.setView(scroll);
            showBlurredDialog(hostCtx, dialog);
        } catch (Throwable e) {
            Logger.printException(() -> "showStoryOptionsSheet failure", e);
            showSurfaceQuickSettingsDialog(context, "STORY");
        }
    }

    public static void showSurfaceQuickSettingsDialog(final Context context, final String surfaceType) {
        try {
            final Context hostCtx = resolveActivity(context) != null ? resolveActivity(context) : context;
            final AlertDialog dialog = new AlertDialog.Builder(hostCtx).create();
            final String mode = surfaceType == null ? "FEED" : surfaceType.toUpperCase();
            final int activeTint = InstagramPreferenceStyle.activeSwitchColor();

            String title = "STORY".equals(mode)
                    ? "Story Quick Settings"
                    : ("REEL".equals(mode) ? "Reels Quick Settings" : "Feed & Carousel Quick Settings");
            String iconId = "STORY".equals(mode)
                    ? "circle-dashed"
                    : ("REEL".equals(mode) ? "film" : "layout-grid");

            LinearLayout sheet = createDialogSheet(hostCtx, iconId, title);

            if ("STORY".equals(mode)) {
                addQuickAccessSectionHeader(hostCtx, sheet, "STORY PRIVACY & PLAYBACK");
                LinearLayout card = createGroupedMenuCard(hostCtx);
                addQuickBooleanToggle(hostCtx, card, "ghost", "Ghost Story Viewing", Settings.VIEW_STORIES_ANONYMOUSLY, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "pause", "Disable Story Auto-Flipping", Settings.DISABLE_STORY_FLIPPING, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "repeat", "Replay / Loop Current Story", Settings.LOOP_STORY, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "volume", "Play Story Sound Automatically", Settings.PLAY_STORY_SOUND_AUTOMATICALLY, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "at-sign", "Show Hidden Mentions (@) Button", Settings.VIEW_STORY_MENTIONS, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "badge-cc", "Show Header @Mention Pill", Settings.STORY_MENTION_ICON, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "badge-hd", "Upload Stories in Highest Quality", Settings.HIGH_QUALITY_UPLOAD, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "gauge", "60 FPS Story Video Encoding", Settings.UPLOAD_60FPS_STORIES, activeTint, false);
                sheet.addView(card);

                addQuickAccessSectionHeader(hostCtx, sheet, "STORY TOOLS");
                LinearLayout toolsCard = createGroupedMenuCard(hostCtx);
                addGroupedMenuRow(hostCtx, toolsCard, "palette", "Mention Pill Style & Popup", true, () -> {
                    dialog.dismiss();
                    app.morphe.extension.instagram.patches.story.StoryMentionSettings.showSettings(hostCtx);
                });
                addGroupedMenuRow(hostCtx, toolsCard, "heart", "Story Likes History Vault", false, () -> {
                    dialog.dismiss();
                    app.morphe.extension.instagram.patches.story.StoryLikeHistoryActivity.open(hostCtx);
                });
                sheet.addView(toolsCard);
            } else if ("REEL".equals(mode)) {
                addQuickAccessSectionHeader(hostCtx, sheet, "REELS PLAYBACK & CONTROLS");
                LinearLayout card = createGroupedMenuCard(hostCtx);
                addQuickBooleanToggle(hostCtx, card, "bolt", "Zero-Prompt Direct Download", Settings.ENABLE_DIRECT_DOWNLOAD, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "play", "Resume Reels After Scrolling", Settings.RESUME_REELS_AFTER_SCROLLING, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "repeat-off", "Disable Reels Auto-Looping", Settings.DISABLE_REELS_LOOPING, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "fast-forward", "Hold Video for 2x Fast-Forward", Settings.HOLD_VIDEO_FAST_FORWARD, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "user-minus", "Hide Reels Follow Button", Settings.HIDE_REELS_FOLLOW_BUTTON, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "heart-off", "Disable Double-Tap Like on Reels", Settings.DISABLE_DOUBLE_TAP_LIKE_REEL, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "download", "Show Reels Download Icon", Settings.REEL_DOWNLOAD_BUTTON, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "settings-2", "Show Reels Options Icon", Settings.REEL_OPTIONS_BUTTON, activeTint, false);
                sheet.addView(card);
            } else {
                addQuickAccessSectionHeader(hostCtx, sheet, "FEED & CAROUSEL CONTROLS");
                LinearLayout card = createGroupedMenuCard(hostCtx);
                addQuickBooleanToggle(hostCtx, card, "bolt", "Zero-Prompt Direct Download", Settings.ENABLE_DIRECT_DOWNLOAD, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "movie-off", "Disable Feed Video Autoplay", Settings.DISABLE_VIDEO_AUTOPLAY, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "volume-off", "Start Feed Videos Muted", Settings.START_FEED_VIDEOS_MUTED, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "fast-forward", "Hold Video for 2x Fast-Forward", Settings.HOLD_VIDEO_FAST_FORWARD, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "zoom-in", "Triple-Tap / Hold Photo to Zoom", Settings.IMPROVE_IMAGE_VIEWING, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "hand-click", "Long-Press Post for Options", Settings.LONG_PRESS_POST_OPTIONS, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "download", "Disable Feed 'Download' Icon", Settings.DISABLE_FEED_DOWNLOAD_ICON, activeTint, true);
                addQuickBooleanToggle(hostCtx, card, "hexagon", "Disable Feed 'InstaRex Options' Icon", Settings.DISABLE_FEED_OPTIONS_ICON, activeTint, false);
                sheet.addView(card);
            }

            addDialogCloseFooter(hostCtx, sheet, dialog);
            ScrollView scroll = new ScrollView(hostCtx);
            scroll.addView(sheet);
            dialog.setView(scroll);
            showBlurredDialog(hostCtx, dialog);
        } catch (Throwable e) {
            Logger.printException(() -> "showSurfaceQuickSettingsDialog error", e);
        }
    }

    private static void addQuickBooleanToggle(
            final Context context,
            final LinearLayout card,
            final String iconId,
            final String label,
            final app.morphe.extension.instagram.settings.BooleanSetting setting,
            final int activeTint,
            final boolean showDivider
    ) {
        boolean initial = Boolean.TRUE.equals(SharedPref.getBooleanPref(setting));
        addGroupedToggleMenuRow(context, card, iconId, label, initial, showDivider, (iconView, labelView) -> {
            boolean next = !Boolean.TRUE.equals(SharedPref.getBooleanPref(setting));
            SharedPref.setBooleanPref(setting.key, next);
            labelView.setText(label + ": (" + (next ? "Enabled" : "Disabled") + ")");
            RexIcon.bindOrAnimateState(iconView, iconId, next, TEXT_PRIMARY, activeTint, 22, true);
            Utils.showToastShort(label + ": " + (next ? "Enabled" : "Disabled"));
        });
    }

    public static void showBackupRestoreDialog(final Context context) {
        try {
            final AlertDialog dialog = new AlertDialog.Builder(context).create();
            LinearLayout root = createDialogSheet(context, "database", "Backup, Restore & Pro Config V6");

            Activity act = resolveActivity(context);
            addQuickAccessSectionHeader(context, root, "INSTAREX PRO CONFIG V6 (3,796 FLAGS)");
            LinearLayout proCard = createGroupedMenuCard(context);
            addGroupedMenuRow(context, proCard, "database-import", "Apply InstaRex Pro Config V6 (Built-In)", true, () -> {
                dialog.dismiss();
                RexRuntimeFeatures.applyBuiltInProConfigV6(context);
            });
            addGroupedMenuRow(context, proCard, "file-export", "Export InstaRex Pro Config V6 (.json)", false, () -> {
                dialog.dismiss();
                RexRuntimeFeatures.exportBuiltInProConfigV6(context);
            });
            root.addView(proCard);

            addQuickAccessSectionHeader(context, root, "SETTINGS BACKUP & RESET");
            LinearLayout card = createGroupedMenuCard(context);
            addGroupedMenuRow(context, card, "file-upload", "Export Settings Backup (.json)", true, () -> {
                dialog.dismiss();
                if (act != null) ActivityHook.launchFragment(act, "rex_export_pref");
            });
            addGroupedMenuRow(context, card, "file-download", "Import Settings Backup (.json)", true, () -> {
                dialog.dismiss();
                if (act != null) ActivityHook.launchFragment(act, "rex_import_pref");
            });
            addGroupedMenuRow(context, card, "trash-2", "Reset All Settings to Default", false, () -> {
                dialog.dismiss();
                app.morphe.extension.instagram.utils.InstaUtils.showResetSettingsDialog(context);
            });
            root.addView(card);
            addDialogCloseFooter(context, root, dialog);

            dialog.setView(root);
            showBlurredDialog(context, dialog);
        } catch (Throwable e) {
            Utils.showToastShort(userSafeErrorMessage(e, "Backup dialog unavailable. Try again."));
        }
    }
}
