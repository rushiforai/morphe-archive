/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 */
package app.morphe.extension.instagram.ui;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.DashPathEffect;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;

/**
 * Programmatic 24x24 vector outline icon engine matching all icons in the xboyrex UI/UX design.
 * Every icon renders with crisp anti-aliased vector strokes and scales cleanly to any density.
 */
public final class RexVectorIcons {

    public static final String IC_HEXAGON_NUT = "rex_vec_hexagon_nut";
    public static final String IC_CROWN = "rex_vec_crown";
    public static final String IC_INCOGNITO = "rex_vec_incognito";
    public static final String IC_GHOST = "rex_vec_ghost";
    public static final String IC_BELL_RING = "rex_vec_bell_ring";
    public static final String IC_BELL_OFF = "rex_vec_bell_off";
    public static final String IC_PRIVACY_FP = "rex_vec_privacy_fp";
    public static final String IC_HAND_TAP = "rex_vec_hand_tap";
    public static final String IC_HAND_SWIPE_V = "rex_vec_hand_swipe_v";
    public static final String IC_HAND_SWIPE_H = "rex_vec_hand_swipe_h";
    public static final String IC_HEART_CIRCLE = "rex_vec_heart_circle";
    public static final String IC_TOGGLES_DUAL = "rex_vec_toggles_dual";
    public static final String IC_PHONE_BAN = "rex_vec_phone_ban";
    public static final String IC_IMAGE_DOWNLOAD = "rex_vec_image_download";
    public static final String IC_DEV_BRACES = "rex_vec_dev_braces";
    public static final String IC_TRANSLATE = "rex_vec_translate";
    public static final String IC_ARROW_BACK = "rex_vec_arrow_back";
    public static final String IC_CHEVRON_RIGHT = "rex_vec_chevron_right";
    public static final String IC_LINK_CHAIN = "rex_vec_link_chain";
    public static final String IC_INSTAGRAM = "rex_vec_instagram";
    public static final String IC_INFO_CIRCLE = "rex_vec_info_circle";
    public static final String IC_GLOBE_WWW = "rex_vec_globe_www";
    public static final String IC_WHATSAPP = "rex_vec_whatsapp";
    public static final String IC_TELEGRAM = "rex_vec_telegram";
    public static final String IC_YOUTUBE = "rex_vec_youtube";
    public static final String IC_DOLLAR_CIRCLE = "rex_vec_dollar_circle";
    public static final String IC_SCISSORS = "rex_vec_scissors";
    public static final String IC_SUN = "rex_vec_sun";
    public static final String IC_REFRESH = "rex_vec_refresh";
    public static final String IC_BAN = "rex_vec_ban";
    public static final String IC_WATCH_HISTORY = "rex_vec_watch_history";
    public static final String IC_PEOPLE = "rex_vec_people";
    public static final String IC_USER_CHECK = "rex_vec_user_check";
    public static final String IC_USER_PLUS = "rex_vec_user_plus";
    public static final String IC_CHAT_DELETE = "rex_vec_chat_delete";
    public static final String IC_CLOCK_24 = "rex_vec_clock_24";
    public static final String IC_EYE = "rex_vec_eye";
    public static final String IC_EYE_OFF = "rex_vec_eye_off";
    public static final String IC_DOUBLE_CHECK = "rex_vec_double_check";
    public static final String IC_KEYBOARD_OFF = "rex_vec_keyboard_off";
    public static final String IC_PHONE_OFF = "rex_vec_phone_off";
    public static final String IC_EAR_OFF = "rex_vec_ear_off";
    public static final String IC_REPLY_ALL = "rex_vec_reply_all";
    public static final String IC_VIEW_ONCE = "rex_vec_view_once";
    public static final String IC_AD_BLOCK = "rex_vec_ad_block";
    public static final String IC_ANALYTICS = "rex_vec_analytics";
    public static final String IC_PRIVATE_SCREEN = "rex_vec_private_screen";
    public static final String IC_LOCK = "rex_vec_lock";
    public static final String IC_LIST_CHECK = "rex_vec_list_check";
    public static final String IC_CIRCLE_X = "rex_vec_circle_x";
    public static final String IC_IMAGE_OFF = "rex_vec_image_off";
    public static final String IC_REELS_OFF = "rex_vec_reels_off";
    public static final String IC_SEARCH_OFF = "rex_vec_search_off";
    public static final String IC_COMMENT_OFF = "rex_vec_comment_off";
    public static final String IC_FOLDER_CHECK = "rex_vec_folder_check";
    public static final String IC_PHONE_BELL = "rex_vec_phone_bell";
    public static final String IC_SD_CARD = "rex_vec_sd_card";
    public static final String IC_SUBFOLDERS = "rex_vec_subfolders";
    public static final String IC_DOWNLOAD_SKIP = "rex_vec_download_skip";
    public static final String IC_BROOM = "rex_vec_broom";
    public static final String IC_FILE_IMPORT = "rex_vec_file_import";
    public static final String IC_FILE_EXPORT = "rex_vec_file_export";
    public static final String IC_FILE_RESET = "rex_vec_file_reset";
    public static final String IC_EMOJI = "rex_vec_emoji";
    public static final String IC_FONT_A = "rex_vec_font_a";
    public static final String IC_FONT_CUSTOM = "rex_vec_font_custom";
    public static final String IC_FONT_CREATIVE = "rex_vec_font_creative";
    public static final String IC_HOME_TAB = "rex_vec_home_tab";
    public static final String IC_LIQUID_GLASS = "rex_vec_liquid_glass";
    public static final String IC_DOWNLOAD_TRAY = "rex_vec_download_tray";
    public static final String IC_DOC_BIO = "rex_vec_doc_bio";
    public static final String IC_USER_CIRCLE = "rex_vec_user_circle";
    public static final String IC_BOOKMARK_EDIT = "rex_vec_bookmark_edit";
    public static final String IC_AT_SIGN = "rex_vec_at_sign";
    public static final String IC_ID_CARD = "rex_vec_id_card";
    public static final String IC_DOTS_H = "rex_vec_dots_h";
    public static final String IC_TIMER_30 = "rex_vec_timer_30";
    public static final String IC_STORAGE = "rex_vec_storage";
    public static final String IC_SPACE_V = "rex_vec_space_v";
    public static final String IC_SUGGESTED_H = "rex_vec_suggested_h";
    public static final String IC_CC_BADGE = "rex_vec_cc_badge";
    public static final String IC_REPOST = "rex_vec_repost";
    public static final String IC_PLAY_PAUSE = "rex_vec_play_pause";
    public static final String IC_SPEAKER = "rex_vec_speaker";
    public static final String IC_GITHUB = "rex_vec_github";
    public static final String IC_HEART_SOLID = "rex_vec_heart_solid";
    public static final String IC_LOCK_OPEN = "rex_vec_lock_open";


    // Alias constants used across ScreenBuilder, SettingsActivity, and widgets
    public static final String IC_DIAMOND = IC_CROWN;
    public static final String IC_SPARKLES = IC_CROWN;
    public static final String IC_BELL = IC_BELL_RING;
    public static final String IC_SHIELD_OUTLINE = IC_PRIVACY_FP;
    public static final String IC_HAND = IC_HAND_TAP;
    public static final String IC_LAYERS = IC_HEART_CIRCLE;
    public static final String IC_PALETTE = IC_TOGGLES_DUAL;
    public static final String IC_SLIDERS = IC_TOGGLES_DUAL;
    public static final String IC_DOWNLOAD = IC_IMAGE_DOWNLOAD;
    public static final String IC_WRENCH = IC_DEV_BRACES;
    public static final String IC_INFO = IC_INFO_CIRCLE;
    public static final String IC_ARROW_LEFT = IC_ARROW_BACK;
    public static final String IC_STAR = IC_CROWN;
    public static final String IC_USER = IC_USER_CIRCLE;
    public static final String IC_BROADCAST = IC_EYE_OFF;
    public static final String IC_CAMERA_OFF = IC_PRIVATE_SCREEN;
    public static final String IC_KEYBOARD = IC_KEYBOARD_OFF;
    public static final String IC_CHECKS = IC_DOUBLE_CHECK;
    public static final String IC_MAIL_CHECK = IC_LIST_CHECK;
    public static final String IC_MESSAGE_OFF = IC_REPLY_ALL;
    public static final String IC_INFINITY = IC_VIEW_ONCE;
    public static final String IC_TRASH = IC_BROOM;
    public static final String IC_FILM = IC_REELS_OFF;
    public static final String IC_HISTORY = IC_WATCH_HISTORY;
    public static final String IC_SHARE = IC_TELEGRAM;
    public static final String IC_EXTERNAL_LINK = IC_LINK_CHAIN;
    public static final String IC_GLOBE = IC_GLOBE_WWW;
    public static final String IC_CHART = IC_ANALYTICS;
    public static final String IC_HEART = IC_HEART_CIRCLE;
    public static final String IC_MESSAGE_CIRCLE = IC_CHAT_DELETE;
    public static final String IC_SEND = IC_TELEGRAM;
    public static final String IC_SWIPE_LEFT = IC_HAND_SWIPE_H;
    public static final String IC_FAST_FORWARD = IC_PLAY_PAUSE;
    public static final String IC_PAUSE_CIRCLE = IC_PLAY_PAUSE;
    public static final String IC_GAUGE = IC_TIMER_30;
    public static final String IC_ARROWS_H = IC_HAND_SWIPE_H;
    public static final String IC_VOLUME = IC_SPEAKER;
    public static final String IC_SMARTPHONE = IC_PHONE_BELL;
    public static final String IC_COPY = IC_DOC_BIO;
    public static final String IC_USERS = IC_PEOPLE;
    public static final String IC_SKIP_FORWARD = IC_PLAY_PAUSE;
    public static final String IC_HD = IC_IMAGE_DOWNLOAD;
    public static final String IC_CLOCK = IC_CLOCK_24;
    public static final String IC_REPEAT = IC_REFRESH;
    public static final String IC_CIRCLE_DASHED = IC_TIMER_30;
    public static final String IC_UPLOAD = IC_FILE_EXPORT;
    public static final String IC_SUBTITLES = IC_CC_BADGE;
    public static final String IC_HASH = IC_ID_CARD;
    public static final String IC_COMPASS = IC_HOME_TAB;
    public static final String IC_LAYOUT_TOP = IC_LIQUID_GLASS;
    public static final String IC_FILE_TEXT = IC_DOC_BIO;
    public static final String IC_BOOKMARK = IC_BOOKMARK_EDIT;
    public static final String IC_PLUS_SQUARE = IC_USER_PLUS;
    public static final String IC_HEART_OFF = IC_BELL_OFF;
    public static final String IC_USER_MINUS = IC_BAN;
    public static final String IC_IMAGE = IC_IMAGE_DOWNLOAD;
    public static final String IC_MORE_H = IC_DOTS_H;
    public static final String IC_FILTER = IC_LIST_CHECK;
    public static final String IC_CIRCLE_OFF = IC_CIRCLE_X;
    public static final String IC_STAR_OFF = IC_CIRCLE_X;
    public static final String IC_USER_X = IC_BAN;
    public static final String IC_PLAY_OFF = IC_REELS_OFF;
    public static final String IC_BOLT = IC_DOWNLOAD_SKIP;
    public static final String IC_FOLDER_USER = IC_SUBFOLDERS;
    public static final String IC_TAG = IC_BOOKMARK_EDIT;
    public static final String IC_EDIT = IC_FONT_CUSTOM;
    public static final String IC_FOLDER = IC_FOLDER_CHECK;
    public static final String IC_PACKAGE = IC_STORAGE;
    public static final String IC_CAMERA = IC_INSTAGRAM;
    public static final String IC_PLAY_CIRCLE = IC_YOUTUBE;
    public static final String IC_CHECK_CIRCLE = IC_LIST_CHECK;

    public static Drawable get(Context context, String iconName, int color, int sizeDp) {
        return create(context, iconName, color, sizeDp);
    }

    private RexVectorIcons() {}

    public static boolean isVectorIcon(String name) {
        return name != null && name.startsWith("rex_vec_");
    }

    public static Drawable create(Context context, String iconName, int color) {
        return create(context, iconName, color, 24);
    }

    public static Drawable create(Context context, String iconName, int color, int sizeDp) {
        int sizePx = (int) TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, sizeDp, context.getResources().getDisplayMetrics());
        return new VectorDrawable24(iconName, color, sizePx);
    }

    private static final class VectorDrawable24 extends Drawable {
        private final String name;
        private final int sizePx;
        private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint textPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

        VectorDrawable24(String name, int color, int sizePx) {
            this.name = name != null ? name : IC_HEXAGON_NUT;
            this.sizePx = sizePx;

            strokePaint.setStyle(Paint.Style.STROKE);
            strokePaint.setStrokeWidth(1.9f);
            strokePaint.setStrokeCap(Paint.Cap.ROUND);
            strokePaint.setStrokeJoin(Paint.Join.ROUND);
            strokePaint.setColor(color);

            fillPaint.setStyle(Paint.Style.FILL);
            fillPaint.setColor(color);

            textPaint.setStyle(Paint.Style.FILL);
            textPaint.setColor(color);
            textPaint.setTypeface(Typeface.create(Typeface.DEFAULT, Typeface.BOLD));
            textPaint.setTextAlign(Paint.Align.CENTER);
        }

        @Override
        public int getIntrinsicWidth() {
            return sizePx;
        }

        @Override
        public int getIntrinsicHeight() {
            return sizePx;
        }

        @Override
        public void setAlpha(int alpha) {
            strokePaint.setAlpha(alpha);
            fillPaint.setAlpha(alpha);
            textPaint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            strokePaint.setColorFilter(colorFilter);
            fillPaint.setColorFilter(colorFilter);
            textPaint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) return;
            int save = canvas.save();
            canvas.translate(b.left, b.top);
            float sx = b.width() / 24f;
            float sy = b.height() / 24f;
            canvas.scale(sx, sy);

            drawIcon(canvas);
            canvas.restoreToCount(save);
        }

        private void drawSlash(Canvas c) {
            c.drawLine(3.5f, 3.5f, 20.5f, 20.5f, strokePaint);
        }

        private void drawIcon(Canvas c) {
            Path p = new Path();
            RectF r = new RectF();
            switch (name) {
                case IC_HEXAGON_NUT:
                    p.moveTo(12f, 2.5f);
                    p.lineTo(20.2f, 7.25f);
                    p.lineTo(20.2f, 16.75f);
                    p.lineTo(12f, 21.5f);
                    p.lineTo(3.8f, 16.75f);
                    p.lineTo(3.8f, 7.25f);
                    p.close();
                    c.drawPath(p, strokePaint);
                    c.drawCircle(12f, 12f, 3.0f, strokePaint);
                    break;

                case IC_CROWN:
                    p.moveTo(3f, 18f);
                    p.lineTo(21f, 18f);
                    p.lineTo(19.5f, 7.5f);
                    p.lineTo(15f, 12f);
                    p.lineTo(12f, 5.5f);
                    p.lineTo(9f, 12f);
                    p.lineTo(4.5f, 7.5f);
                    p.close();
                    c.drawPath(p, strokePaint);
                    break;

                case IC_INCOGNITO:
                    c.drawLine(2.5f, 11.5f, 21.5f, 11.5f, strokePaint);
                    p.moveTo(5.5f, 11.5f);
                    p.lineTo(7.5f, 5f);
                    p.lineTo(16.5f, 5f);
                    p.lineTo(18.5f, 11.5f);
                    c.drawPath(p, strokePaint);
                    c.drawCircle(8.5f, 16.5f, 2.8f, strokePaint);
                    c.drawCircle(15.5f, 16.5f, 2.8f, strokePaint);
                    c.drawLine(11.3f, 16.5f, 12.7f, 16.5f, strokePaint);
                    break;

                case IC_GHOST:
                    p.moveTo(5f, 11f);
                    r.set(5f, 4f, 19f, 18f);
                    p.arcTo(r, 180f, 180f, false);
                    p.lineTo(19f, 19.5f);
                    p.lineTo(16.5f, 17.5f);
                    p.lineTo(14.2f, 19.5f);
                    p.lineTo(12f, 17.5f);
                    p.lineTo(9.8f, 19.5f);
                    p.lineTo(7.5f, 17.5f);
                    p.lineTo(5f, 19.5f);
                    p.close();
                    c.drawPath(p, strokePaint);
                    c.drawCircle(9.5f, 10.5f, 1.2f, fillPaint);
                    c.drawCircle(14.5f, 10.5f, 1.2f, fillPaint);
                    break;

                case IC_BELL_RING:
                case IC_BELL_OFF:
                    p.moveTo(6f, 16.5f);
                    p.lineTo(18f, 16.5f);
                    p.lineTo(16.8f, 10f);
                    r.set(7.2f, 5f, 16.8f, 14.6f);
                    p.arcTo(r, 0f, -180f, false);
                    p.close();
                    c.drawPath(p, strokePaint);
                    c.drawLine(10f, 19.5f, 14f, 19.5f, strokePaint);
                    r.set(3.5f, 3.5f, 8.5f, 8.5f);
                    c.drawArc(r, 195f, 65f, false, strokePaint);
                    r.set(15.5f, 3.5f, 20.5f, 8.5f);
                    c.drawArc(r, 280f, 65f, false, strokePaint);
                    if (IC_BELL_OFF.equals(name)) drawSlash(c);
                    break;

                case IC_PRIVACY_FP:
                    r.set(6f, 3.5f, 18f, 15.5f);
                    c.drawArc(r, 180f, 180f, false, strokePaint);
                    r.set(8.5f, 6f, 15.5f, 13f);
                    c.drawArc(r, 180f, 180f, false, strokePaint);
                    c.drawLine(12f, 8.5f, 12f, 12.5f, strokePaint);
                    textPaint.setTextSize(9.5f);
                    c.drawText("* * *", 12f, 20.5f, textPaint);
                    break;

                case IC_HAND_TAP:
                    c.drawLine(10f, 7f, 10f, 15f, strokePaint);
                    r.set(8.2f, 5.2f, 11.8f, 8.8f);
                    c.drawArc(r, 180f, 180f, false, strokePaint);
                    p.moveTo(11.8f, 11.5f);
                    p.lineTo(17.5f, 12.8f);
                    p.lineTo(17.5f, 18.5f);
                    p.lineTo(9.5f, 20.5f);
                    p.lineTo(6.2f, 15.5f);
                    p.lineTo(7.8f, 13.8f);
                    p.lineTo(10f, 15f);
                    c.drawPath(p, strokePaint);
                    c.drawLine(10f, 2.5f, 10f, 4f, strokePaint);
                    c.drawLine(6.5f, 4f, 7.7f, 5.2f, strokePaint);
                    c.drawLine(13.5f, 4f, 12.3f, 5.2f, strokePaint);
                    break;

                case IC_HAND_SWIPE_V:
                    c.drawLine(6f, 4.5f, 6f, 14.5f, strokePaint);
                    c.drawLine(4f, 6.8f, 6f, 4.5f, strokePaint);
                    c.drawLine(8f, 6.8f, 6f, 4.5f, strokePaint);
                    r.set(10f, 7.5f, 19.5f, 20f);
                    c.drawRoundRect(r, 3.5f, 3.5f, strokePaint);
                    break;

                case IC_HAND_SWIPE_H:
                    c.drawLine(5f, 6f, 19f, 6f, strokePaint);
                    c.drawLine(7.5f, 4f, 5f, 6f, strokePaint);
                    c.drawLine(7.5f, 8f, 5f, 6f, strokePaint);
                    c.drawLine(16.5f, 4f, 19f, 6f, strokePaint);
                    c.drawLine(16.5f, 8f, 19f, 6f, strokePaint);
                    r.set(7.5f, 10.5f, 16.5f, 20.5f);
                    c.drawRoundRect(r, 3.5f, 3.5f, strokePaint);
                    break;

                case IC_HEART_CIRCLE:
                    Paint dashed = new Paint(strokePaint);
                    dashed.setPathEffect(new DashPathEffect(new float[]{3.2f, 2.4f}, 0f));
                    c.drawCircle(12f, 12f, 9f, dashed);
                    p.moveTo(12f, 15.8f);
                    p.cubicTo(8f, 13f, 7.5f, 9.2f, 9.8f, 8.8f);
                    p.cubicTo(11f, 8.6f, 12f, 9.8f, 12f, 10.3f);
                    p.cubicTo(12f, 9.8f, 13f, 8.6f, 14.2f, 8.8f);
                    p.cubicTo(16.5f, 9.2f, 16f, 13f, 12f, 15.8f);
                    c.drawPath(p, strokePaint);
                    break;

                case IC_TOGGLES_DUAL:
                    r.set(3.5f, 4.5f, 20.5f, 10.5f);
                    c.drawRoundRect(r, 3f, 3f, strokePaint);
                    c.drawCircle(8f, 7.5f, 1.6f, fillPaint);
                    r.set(3.5f, 13.5f, 20.5f, 19.5f);
                    c.drawRoundRect(r, 3f, 3f, strokePaint);
                    c.drawCircle(16f, 16.5f, 1.6f, fillPaint);
                    break;

                case IC_PHONE_BAN:
                    r.set(5f, 3f, 16f, 21f);
                    c.drawRoundRect(r, 2.2f, 2.2f, strokePaint);
                    c.drawCircle(17.5f, 17.5f, 3.2f, strokePaint);
                    c.drawLine(15.3f, 15.3f, 19.7f, 19.7f, strokePaint);
                    break;

                case IC_IMAGE_DOWNLOAD:
                    r.set(3.5f, 4f, 17.5f, 18f);
                    c.drawRoundRect(r, 2.5f, 2.5f, strokePaint);
                    c.drawCircle(8f, 8.5f, 1.3f, fillPaint);
                    p.moveTo(4f, 16f);
                    p.lineTo(8.5f, 11.5f);
                    p.lineTo(13.5f, 15.5f);
                    c.drawPath(p, strokePaint);
                    c.drawLine(18.5f, 13f, 18.5f, 20.5f, strokePaint);
                    c.drawLine(16f, 18f, 18.5f, 20.5f, strokePaint);
                    c.drawLine(21f, 18f, 18.5f, 20.5f, strokePaint);
                    break;

                case IC_DEV_BRACES:
                    textPaint.setTextSize(13.5f);
                    c.drawText("{*}", 12f, 16.5f, textPaint);
                    break;

                case IC_TRANSLATE:
                    textPaint.setTextSize(12.5f);
                    c.drawText("文A", 12f, 16.5f, textPaint);
                    break;

                case IC_ARROW_BACK:
                    c.drawLine(19f, 12f, 5f, 12f, strokePaint);
                    c.drawLine(11f, 6f, 5f, 12f, strokePaint);
                    c.drawLine(11f, 18f, 5f, 12f, strokePaint);
                    break;

                case IC_CHEVRON_RIGHT:
                    c.drawLine(9f, 6f, 15f, 12f, strokePaint);
                    c.drawLine(9f, 18f, 15f, 12f, strokePaint);
                    break;

                case IC_LINK_CHAIN:
                    r.set(4.5f, 9f, 13.5f, 15f);
                    c.drawRoundRect(r, 3f, 3f, strokePaint);
                    r.set(10.5f, 9f, 19.5f, 15f);
                    c.drawRoundRect(r, 3f, 3f, strokePaint);
                    break;

                case IC_INSTAGRAM:
                    r.set(3.5f, 3.5f, 20.5f, 20.5f);
                    c.drawRoundRect(r, 5f, 5f, strokePaint);
                    c.drawCircle(12f, 12f, 3.8f, strokePaint);
                    c.drawCircle(17f, 7f, 1.1f, fillPaint);
                    break;

                case IC_INFO_CIRCLE:
                    c.drawCircle(12f, 12f, 9f, strokePaint);
                    c.drawLine(12f, 11f, 12f, 16.5f, strokePaint);
                    c.drawCircle(12f, 7.8f, 1.1f, fillPaint);
                    break;

                case IC_GLOBE_WWW:
                    c.drawCircle(12f, 12f, 9f, strokePaint);
                    c.drawLine(3.2f, 12f, 20.8f, 12f, strokePaint);
                    r.set(7.5f, 3f, 16.5f, 21f);
                    c.drawOval(r, strokePaint);
                    break;

                case IC_WHATSAPP:
                    c.drawCircle(12f, 11.5f, 8.2f, strokePaint);
                    p.moveTo(6.2f, 17.2f);
                    p.lineTo(4f, 20.5f);
                    p.lineTo(8.2f, 19f);
                    c.drawPath(p, strokePaint);
                    textPaint.setTextSize(8.5f);
                    c.drawText("WA", 12f, 14.5f, textPaint);
                    break;

                case IC_TELEGRAM:
                    p.moveTo(21f, 4f);
                    p.lineTo(3f, 11f);
                    p.lineTo(9.5f, 13.5f);
                    p.lineTo(12f, 20f);
                    p.lineTo(21f, 4f);
                    p.close();
                    c.drawPath(p, strokePaint);
                    c.drawLine(9.5f, 13.5f, 21f, 4f, strokePaint);
                    break;

                case IC_YOUTUBE:
                    r.set(3f, 5.5f, 21f, 18.5f);
                    c.drawRoundRect(r, 4f, 4f, strokePaint);
                    p.moveTo(10f, 9f);
                    p.lineTo(15.5f, 12f);
                    p.lineTo(10f, 15f);
                    p.close();
                    c.drawPath(p, fillPaint);
                    break;

                case IC_DOLLAR_CIRCLE:
                    c.drawCircle(12f, 12f, 9f, strokePaint);
                    textPaint.setTextSize(12.5f);
                    c.drawText("$", 12f, 16.2f, textPaint);
                    break;

                case IC_SCISSORS:
                    c.drawCircle(6.5f, 7.5f, 2.5f, strokePaint);
                    c.drawCircle(6.5f, 16.5f, 2.5f, strokePaint);
                    c.drawLine(8.8f, 8.8f, 19.5f, 17.5f, strokePaint);
                    c.drawLine(8.8f, 15.2f, 19.5f, 6.5f, strokePaint);
                    break;

                case IC_SUN:
                    c.drawCircle(12f, 12f, 4.2f, strokePaint);
                    for (int i = 0; i < 8; i++) {
                        double a = Math.toRadians(i * 45);
                        float x1 = 12f + (float) Math.cos(a) * 6.8f;
                        float y1 = 12f + (float) Math.sin(a) * 6.8f;
                        float x2 = 12f + (float) Math.cos(a) * 9.2f;
                        float y2 = 12f + (float) Math.sin(a) * 9.2f;
                        c.drawLine(x1, y1, x2, y2, strokePaint);
                    }
                    break;

                case IC_REFRESH:
                    r.set(4.5f, 4.5f, 19.5f, 19.5f);
                    c.drawArc(r, -30f, 290f, false, strokePaint);
                    c.drawLine(16.5f, 3.8f, 19.5f, 7.5f, strokePaint);
                    c.drawLine(14.5f, 7.5f, 19.5f, 7.5f, strokePaint);
                    break;

                case IC_BAN:
                    c.drawCircle(12f, 12f, 8.8f, strokePaint);
                    c.drawLine(5.8f, 5.8f, 18.2f, 18.2f, strokePaint);
                    break;

                case IC_WATCH_HISTORY:
                    r.set(3.5f, 4.5f, 15.5f, 15.5f);
                    c.drawRoundRect(r, 2.2f, 2.2f, strokePaint);
                    r.set(8.5f, 9f, 20.5f, 20f);
                    c.drawRoundRect(r, 2.2f, 2.2f, strokePaint);
                    p.moveTo(13f, 12.2f);
                    p.lineTo(17f, 14.5f);
                    p.lineTo(13f, 16.8f);
                    p.close();
                    c.drawPath(p, fillPaint);
                    break;

                case IC_PEOPLE:
                    c.drawCircle(9f, 8.5f, 3f, strokePaint);
                    r.set(3.5f, 13.5f, 14.5f, 20.5f);
                    c.drawArc(r, 180f, 180f, false, strokePaint);
                    c.drawCircle(16f, 9.2f, 2.4f, strokePaint);
                    r.set(12.5f, 14f, 20.5f, 20f);
                    c.drawArc(r, 200f, 160f, false, strokePaint);
                    break;

                case IC_USER_CHECK:
                    c.drawCircle(9.5f, 8.5f, 3.2f, strokePaint);
                    r.set(3.5f, 14f, 15.5f, 21f);
                    c.drawArc(r, 180f, 180f, false, strokePaint);
                    c.drawLine(15.5f, 15.5f, 17.5f, 17.5f, strokePaint);
                    c.drawLine(17.5f, 17.5f, 21f, 13.5f, strokePaint);
                    break;

                case IC_USER_PLUS:
                    c.drawCircle(13.5f, 8.5f, 3.2f, strokePaint);
                    r.set(7.5f, 14f, 19.5f, 21f);
                    c.drawArc(r, 180f, 180f, false, strokePaint);
                    c.drawLine(5.5f, 9f, 5.5f, 15f, strokePaint);
                    c.drawLine(2.5f, 12f, 8.5f, 12f, strokePaint);
                    break;

                case IC_CHAT_DELETE:
                case IC_COMMENT_OFF:
                    r.set(3.5f, 4f, 19.5f, 17.5f);
                    c.drawRoundRect(r, 3.5f, 3.5f, strokePaint);
                    c.drawLine(7f, 8.5f, 14.5f, 8.5f, strokePaint);
                    c.drawLine(7f, 12.5f, 12.5f, 12.5f, strokePaint);
                    c.drawLine(16f, 16f, 20.5f, 20.5f, strokePaint);
                    c.drawLine(20.5f, 16f, 16f, 20.5f, strokePaint);
                    break;

                case IC_CLOCK_24:
                    c.drawCircle(12f, 12f, 8.8f, strokePaint);
                    c.drawLine(12f, 7f, 12f, 12f, strokePaint);
                    c.drawLine(12f, 12f, 15.5f, 12f, strokePaint);
                    textPaint.setTextSize(7.5f);
                    c.drawText("24", 15f, 19.5f, textPaint);
                    break;

                case IC_EYE:
                case IC_EYE_OFF:
                    p.moveTo(2.5f, 12f);
                    p.quadTo(12f, 4.5f, 21.5f, 12f);
                    p.quadTo(12f, 19.5f, 2.5f, 12f);
                    c.drawPath(p, strokePaint);
                    c.drawCircle(12f, 12f, 2.6f, strokePaint);
                    if (IC_EYE_OFF.equals(name)) drawSlash(c);
                    break;

                case IC_DOUBLE_CHECK:
                    c.drawLine(3f, 12.5f, 7f, 16.5f, strokePaint);
                    c.drawLine(7f, 16.5f, 15f, 8.5f, strokePaint);
                    c.drawLine(9f, 12.5f, 13f, 16.5f, strokePaint);
                    c.drawLine(13f, 16.5f, 21f, 8.5f, strokePaint);
                    drawSlash(c);
                    break;

                case IC_KEYBOARD_OFF:
                    r.set(3f, 6f, 21f, 18f);
                    c.drawRoundRect(r, 2.2f, 2.2f, strokePaint);
                    c.drawLine(7f, 14.5f, 17f, 14.5f, strokePaint);
                    c.drawCircle(7.5f, 10f, 0.9f, fillPaint);
                    c.drawCircle(12f, 10f, 0.9f, fillPaint);
                    c.drawCircle(16.5f, 10f, 0.9f, fillPaint);
                    drawSlash(c);
                    break;

                case IC_PHONE_OFF:
                    r.set(6.5f, 3.5f, 17.5f, 20.5f);
                    c.drawRoundRect(r, 2.2f, 2.2f, strokePaint);
                    drawSlash(c);
                    break;

                case IC_EAR_OFF:
                    r.set(6.5f, 4f, 17.5f, 15f);
                    c.drawArc(r, 180f, 210f, false, strokePaint);
                    c.drawLine(12f, 15f, 9.5f, 19.5f, strokePaint);
                    drawSlash(c);
                    break;

                case IC_REPLY_ALL:
                    c.drawLine(9.5f, 7f, 4.5f, 12f, strokePaint);
                    c.drawLine(4.5f, 12f, 9.5f, 17f, strokePaint);
                    c.drawLine(13.5f, 7f, 8.5f, 12f, strokePaint);
                    c.drawLine(8.5f, 12f, 13.5f, 17f, strokePaint);
                    r.set(8.5f, 12f, 20f, 19f);
                    c.drawArc(r, 270f, 90f, false, strokePaint);
                    break;

                case IC_VIEW_ONCE:
                    Paint d1 = new Paint(strokePaint);
                    d1.setPathEffect(new DashPathEffect(new float[]{3.2f, 2.4f}, 0f));
                    c.drawCircle(12f, 12f, 8.5f, d1);
                    textPaint.setTextSize(10.5f);
                    c.drawText("1", 12f, 15.5f, textPaint);
                    drawSlash(c);
                    break;

                case IC_AD_BLOCK:
                    c.drawCircle(12f, 12f, 9f, strokePaint);
                    textPaint.setTextSize(8.8f);
                    c.drawText("AD", 12f, 15f, textPaint);
                    break;

                case IC_ANALYTICS:
                    r.set(4.5f, 12f, 8.5f, 19.5f);
                    c.drawRect(r, strokePaint);
                    r.set(10f, 6f, 14f, 19.5f);
                    c.drawRect(r, strokePaint);
                    r.set(15.5f, 10f, 19.5f, 19.5f);
                    c.drawRect(r, strokePaint);
                    break;

                case IC_PRIVATE_SCREEN:
                    r.set(6f, 9f, 18f, 21f);
                    c.drawArc(r, 180f, 180f, false, strokePaint);
                    c.drawLine(3.5f, 16.5f, 20.5f, 16.5f, strokePaint);
                    c.drawCircle(15f, 16.5f, 1.8f, fillPaint);
                    c.drawLine(12f, 5.5f, 12f, 7.2f, strokePaint);
                    c.drawLine(7f, 7.2f, 8.2f, 8.5f, strokePaint);
                    c.drawLine(17f, 7.2f, 15.8f, 8.5f, strokePaint);
                    break;

                case IC_LOCK:
                    r.set(5.5f, 10.5f, 18.5f, 20f);
                    c.drawRoundRect(r, 2.2f, 2.2f, strokePaint);
                    r.set(8f, 4.5f, 16f, 12.5f);
                    c.drawArc(r, 180f, 180f, false, strokePaint);
                    break;

                case IC_LIST_CHECK:
                    r.set(4f, 5.5f, 8f, 9.5f);
                    c.drawRoundRect(r, 1f, 1f, strokePaint);
                    c.drawLine(11f, 7.5f, 20f, 7.5f, strokePaint);
                    r.set(4f, 14.5f, 8f, 18.5f);
                    c.drawRoundRect(r, 1f, 1f, strokePaint);
                    c.drawLine(11f, 16.5f, 20f, 16.5f, strokePaint);
                    break;

                case IC_CIRCLE_X:
                    Paint dx = new Paint(strokePaint);
                    dx.setPathEffect(new DashPathEffect(new float[]{3.5f, 2.5f}, 0f));
                    c.drawCircle(12f, 12f, 8.8f, dx);
                    c.drawLine(9.5f, 9.5f, 14.5f, 14.5f, strokePaint);
                    c.drawLine(14.5f, 9.5f, 9.5f, 14.5f, strokePaint);
                    break;

                case IC_IMAGE_OFF:
                    r.set(4f, 4f, 20f, 20f);
                    c.drawRoundRect(r, 2.5f, 2.5f, strokePaint);
                    drawSlash(c);
                    break;

                case IC_REELS_OFF:
                    r.set(4f, 5f, 20f, 19.5f);
                    c.drawRoundRect(r, 2.5f, 2.5f, strokePaint);
                    c.drawLine(4f, 9.5f, 20f, 9.5f, strokePaint);
                    drawSlash(c);
                    break;

                case IC_SEARCH_OFF:
                    c.drawCircle(11f, 11f, 6.2f, strokePaint);
                    c.drawLine(15.5f, 15.5f, 20.5f, 20.5f, strokePaint);
                    drawSlash(c);
                    break;

                case IC_FOLDER_CHECK:
                    p.moveTo(3.5f, 6.5f);
                    p.lineTo(9.5f, 6.5f);
                    p.lineTo(11.5f, 8.8f);
                    p.lineTo(20.5f, 8.8f);
                    p.lineTo(20.5f, 18.5f);
                    p.lineTo(3.5f, 18.5f);
                    p.close();
                    c.drawPath(p, strokePaint);
                    c.drawLine(14.5f, 14.5f, 16.5f, 16.5f, strokePaint);
                    c.drawLine(16.5f, 16.5f, 20f, 12.5f, strokePaint);
                    break;

                case IC_PHONE_BELL:
                    r.set(4.5f, 3.5f, 15f, 20.5f);
                    c.drawRoundRect(r, 2.2f, 2.2f, strokePaint);
                    c.drawCircle(16.5f, 11f, 3.2f, strokePaint);
                    break;

                case IC_SD_CARD:
                    p.moveTo(6f, 3.5f);
                    p.lineTo(15f, 3.5f);
                    p.lineTo(18.5f, 7f);
                    p.lineTo(18.5f, 20.5f);
                    p.lineTo(6f, 20.5f);
                    p.close();
                    c.drawPath(p, strokePaint);
                    c.drawLine(9.5f, 6.5f, 9.5f, 9.5f, strokePaint);
                    c.drawLine(12f, 6.5f, 12f, 9.5f, strokePaint);
                    c.drawLine(14.5f, 6.5f, 14.5f, 9.5f, strokePaint);
                    break;

                case IC_SUBFOLDERS:
                    r.set(3.5f, 4f, 9.5f, 8.5f);
                    c.drawRoundRect(r, 1f, 1f, strokePaint);
                    r.set(14.5f, 4f, 20.5f, 8.5f);
                    c.drawRoundRect(r, 1f, 1f, strokePaint);
                    r.set(9f, 15.5f, 15f, 20f);
                    c.drawRoundRect(r, 1f, 1f, strokePaint);
                    c.drawLine(6.5f, 8.5f, 6.5f, 12f, strokePaint);
                    c.drawLine(17.5f, 8.5f, 17.5f, 12f, strokePaint);
                    c.drawLine(6.5f, 12f, 17.5f, 12f, strokePaint);
                    c.drawLine(12f, 12f, 12f, 15.5f, strokePaint);
                    break;

                case IC_DOWNLOAD_SKIP:
                    c.drawLine(11f, 4f, 11f, 14.5f, strokePaint);
                    c.drawLine(7.5f, 11f, 11f, 14.5f, strokePaint);
                    c.drawLine(14.5f, 11f, 11f, 14.5f, strokePaint);
                    c.drawLine(4.5f, 18.5f, 13.5f, 18.5f, strokePaint);
                    c.drawCircle(17.5f, 17.5f, 3f, strokePaint);
                    break;

                case IC_BROOM:
                    c.drawLine(19.5f, 4.5f, 12f, 12f, strokePaint);
                    p.moveTo(12f, 12f);
                    p.lineTo(15.5f, 15.5f);
                    p.lineTo(10.5f, 20.5f);
                    p.lineTo(4.5f, 14.5f);
                    p.close();
                    c.drawPath(p, strokePaint);
                    break;

                case IC_FILE_IMPORT:
                case IC_FILE_EXPORT:
                case IC_FILE_RESET:
                    p.moveTo(6f, 3.5f);
                    p.lineTo(14.5f, 3.5f);
                    p.lineTo(18.5f, 7.5f);
                    p.lineTo(18.5f, 20.5f);
                    p.lineTo(6f, 20.5f);
                    p.close();
                    c.drawPath(p, strokePaint);
                    if (IC_FILE_RESET.equals(name)) {
                        c.drawLine(9.8f, 11.5f, 14.2f, 15.9f, strokePaint);
                        c.drawLine(14.2f, 11.5f, 9.8f, 15.9f, strokePaint);
                    } else {
                        c.drawLine(9f, 14f, 15.5f, 14f, strokePaint);
                        c.drawLine(13f, 11.5f, 15.5f, 14f, strokePaint);
                        c.drawLine(13f, 16.5f, 15.5f, 14f, strokePaint);
                    }
                    break;

                case IC_EMOJI:
                    c.drawCircle(12f, 12f, 9f, strokePaint);
                    c.drawCircle(9f, 9.8f, 1.1f, fillPaint);
                    c.drawCircle(15f, 9.8f, 1.1f, fillPaint);
                    r.set(8f, 10.5f, 16f, 17f);
                    c.drawArc(r, 15f, 150f, false, strokePaint);
                    break;

                case IC_FONT_A:
                    textPaint.setTextSize(15.5f);
                    c.drawText("A", 12f, 17.5f, textPaint);
                    break;

                case IC_FONT_CUSTOM:
                    textPaint.setTextSize(11.5f);
                    c.drawText("Aa|", 12f, 16f, textPaint);
                    break;

                case IC_FONT_CREATIVE:
                    r.set(4f, 4.5f, 18.5f, 19f);
                    c.drawRoundRect(r, 3f, 3f, strokePaint);
                    textPaint.setTextSize(10f);
                    c.drawText("T", 11f, 15f, textPaint);
                    break;

                case IC_HOME_TAB:
                    p.moveTo(4f, 11f);
                    p.lineTo(12f, 4f);
                    p.lineTo(20f, 11f);
                    p.lineTo(20f, 20f);
                    p.lineTo(4f, 20f);
                    p.close();
                    c.drawPath(p, strokePaint);
                    break;

                case IC_LIQUID_GLASS:
                    r.set(3.5f, 5.5f, 20.5f, 18.5f);
                    c.drawRoundRect(r, 3f, 3f, strokePaint);
                    c.drawLine(7f, 15.5f, 17f, 15.5f, strokePaint);
                    break;

                case IC_DOWNLOAD_TRAY:
                    c.drawLine(12f, 4f, 12f, 15.5f, strokePaint);
                    c.drawLine(8f, 11.5f, 12f, 15.5f, strokePaint);
                    c.drawLine(16f, 11.5f, 12f, 15.5f, strokePaint);
                    p.moveTo(4.5f, 14.5f);
                    p.lineTo(4.5f, 19.5f);
                    p.lineTo(19.5f, 19.5f);
                    p.lineTo(19.5f, 14.5f);
                    c.drawPath(p, strokePaint);
                    break;

                case IC_DOC_BIO:
                    r.set(5f, 3.5f, 19f, 20.5f);
                    c.drawRoundRect(r, 2f, 2f, strokePaint);
                    c.drawLine(8.5f, 8.5f, 15.5f, 8.5f, strokePaint);
                    c.drawLine(8.5f, 12f, 15.5f, 12f, strokePaint);
                    c.drawLine(8.5f, 15.5f, 13.5f, 15.5f, strokePaint);
                    break;

                case IC_USER_CIRCLE:
                    c.drawCircle(12f, 12f, 9f, strokePaint);
                    c.drawCircle(12f, 9.5f, 2.8f, strokePaint);
                    r.set(6.8f, 14f, 17.2f, 20.5f);
                    c.drawArc(r, 195f, 150f, false, strokePaint);
                    break;

                case IC_BOOKMARK_EDIT:
                    p.moveTo(6f, 4f);
                    p.lineTo(16f, 4f);
                    p.lineTo(16f, 19.5f);
                    p.lineTo(11f, 15.5f);
                    p.lineTo(6f, 19.5f);
                    p.close();
                    c.drawPath(p, strokePaint);
                    break;

                case IC_AT_SIGN:
                    textPaint.setTextSize(15f);
                    c.drawText("@", 12f, 17f, textPaint);
                    break;

                case IC_ID_CARD:
                    r.set(3.5f, 5.5f, 20.5f, 18.5f);
                    c.drawRoundRect(r, 2.2f, 2.2f, strokePaint);
                    c.drawCircle(8.5f, 11f, 2f, strokePaint);
                    c.drawLine(13.5f, 9.5f, 17.8f, 9.5f, strokePaint);
                    c.drawLine(13.5f, 13.5f, 17.8f, 13.5f, strokePaint);
                    break;

                case IC_DOTS_H:
                    c.drawCircle(6f, 12f, 1.5f, fillPaint);
                    c.drawCircle(12f, 12f, 1.5f, fillPaint);
                    c.drawCircle(18f, 12f, 1.5f, fillPaint);
                    break;

                case IC_TIMER_30:
                    Paint d30 = new Paint(strokePaint);
                    d30.setPathEffect(new DashPathEffect(new float[]{3.2f, 2.4f}, 0f));
                    c.drawCircle(12f, 12f, 9f, d30);
                    textPaint.setTextSize(9.5f);
                    c.drawText("30", 12f, 15.5f, textPaint);
                    break;

                case IC_STORAGE:
                    r.set(4f, 5f, 20f, 11f);
                    c.drawRoundRect(r, 2f, 2f, strokePaint);
                    r.set(4f, 13f, 20f, 19f);
                    c.drawRoundRect(r, 2f, 2f, strokePaint);
                    c.drawCircle(8f, 8f, 1f, fillPaint);
                    c.drawCircle(8f, 16f, 1f, fillPaint);
                    break;

                case IC_SPACE_V:
                    c.drawLine(12f, 5f, 12f, 19f, strokePaint);
                    c.drawLine(9.5f, 7.5f, 12f, 5f, strokePaint);
                    c.drawLine(14.5f, 7.5f, 12f, 5f, strokePaint);
                    c.drawLine(9.5f, 16.5f, 12f, 19f, strokePaint);
                    c.drawLine(14.5f, 16.5f, 12f, 19f, strokePaint);
                    break;

                case IC_SUGGESTED_H:
                    r.set(3.5f, 5.5f, 20.5f, 18.5f);
                    c.drawRoundRect(r, 2.5f, 2.5f, strokePaint);
                    c.drawLine(7f, 12f, 17f, 12f, strokePaint);
                    break;

                case IC_CC_BADGE:
                    r.set(3.5f, 5.5f, 20.5f, 18.5f);
                    c.drawRoundRect(r, 2.5f, 2.5f, strokePaint);
                    textPaint.setTextSize(9.5f);
                    c.drawText("CC", 12f, 15.2f, textPaint);
                    break;

                case IC_REPOST:
                    c.drawLine(6f, 7f, 18f, 7f, strokePaint);
                    c.drawLine(15f, 4.5f, 18f, 7f, strokePaint);
                    c.drawLine(15f, 9.5f, 18f, 7f, strokePaint);
                    c.drawLine(18f, 17f, 6f, 17f, strokePaint);
                    c.drawLine(9f, 14.5f, 6f, 17f, strokePaint);
                    c.drawLine(9f, 19.5f, 6f, 17f, strokePaint);
                    break;

                case IC_PLAY_PAUSE:
                    p.moveTo(4.5f, 7f);
                    p.lineTo(12f, 12f);
                    p.lineTo(4.5f, 17f);
                    p.close();
                    c.drawPath(p, strokePaint);
                    c.drawLine(15.5f, 7f, 15.5f, 17f, strokePaint);
                    c.drawLine(19f, 7f, 19f, 17f, strokePaint);
                    break;

                case IC_SPEAKER:
                    p.moveTo(4.5f, 9.5f);
                    p.lineTo(8.5f, 9.5f);
                    p.lineTo(13.5f, 5.5f);
                    p.lineTo(13.5f, 18.5f);
                    p.lineTo(8.5f, 14.5f);
                    p.lineTo(4.5f, 14.5f);
                    p.close();
                    c.drawPath(p, strokePaint);
                    r.set(13.5f, 8f, 19.5f, 16f);
                    c.drawArc(r, -50f, 100f, false, strokePaint);
                    break;

                case IC_GITHUB:
                    c.drawCircle(12f, 11.5f, 8.2f, strokePaint);
                    p.moveTo(8.5f, 19.5f);
                    p.lineTo(8.5f, 16.2f);
                    p.lineTo(15.5f, 16.2f);
                    p.lineTo(15.5f, 19.5f);
                    c.drawPath(p, strokePaint);
                    c.drawCircle(9.5f, 11f, 1.1f, fillPaint);
                    c.drawCircle(14.5f, 11f, 1.1f, fillPaint);
                    break;

                case IC_HEART_SOLID:
                    p.moveTo(12f, 19.2f);
                    p.cubicTo(5.5f, 14.5f, 4f, 8.5f, 7.8f, 6.2f);
                    p.cubicTo(9.8f, 5.2f, 11.4f, 6.8f, 12f, 8.0f);
                    p.cubicTo(12.6f, 6.8f, 14.2f, 5.2f, 16.2f, 6.2f);
                    p.cubicTo(20f, 8.5f, 18.5f, 14.5f, 12f, 19.2f);
                    p.close();
                    c.drawPath(p, fillPaint);
                    break;

                case IC_LOCK_OPEN:
                    r.set(5.5f, 10.5f, 18.5f, 20f);
                    c.drawRoundRect(r, 2.2f, 2.2f, strokePaint);
                    r.set(8f, 4.0f, 16f, 12.0f);
                    c.drawArc(r, 180f, 135f, false, strokePaint);
                    break;

                default:
                    c.drawCircle(12f, 12f, 8f, strokePaint);
                    break;
            }
        }
    }
}
