/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;

public final class RexVectorIcons {

    private RexVectorIcons() {}

    public static int dp(Context context, float value) {
        if (context == null) return Math.round(value * 2.75f);
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics()));
    }

    /** Resolves the logical rex_vec_* icon names used by preference and patch entry points. */
    public static Drawable create(Context context, String iconName, int color, int sizeDp) {
        String type = iconName == null ? "hexagon" : iconName;
        if (type.startsWith("rex_vec_")) type = type.substring("rex_vec_".length());
        switch (type) {
            case "feed": type = "instagram"; break;
            case "ui": type = "sliders"; break;
            case "dev": type = "code"; break;
            case "info": type = "doc"; break;
            case "download": type = "download_tray"; break;
            default: break;
        }
        return createMenuIcon(context, type, sizeDp, color);
    }

    public static Drawable createHexagonIcon(Context context, int sizeDp, int color) {
        return createMenuIcon(context, "hexagon", sizeDp, color);
    }

    public static Drawable createDownloadIcon(Context context, int sizeDp, int color) {
        return createMenuIcon(context, "download_tray", sizeDp, color);
    }

    public static Drawable createTranslateIcon(Context context, int sizeDp, int color) {
        return createMenuIcon(context, "translate", sizeDp, color);
    }

    /**
     * Scalloped 12-lobe flower Path used for the Sakura Music badge and Developer Avatar in About.
     */
    public static Path buildScallopedPath(float cx, float cy, float baseRadius, float waveAmp, int lobes) {
        Path path = new Path();
        int steps = 180;
        for (int i = 0; i <= steps; i++) {
            double theta = (2.0 * Math.PI * i) / steps;
            float r = (float) (baseRadius + waveAmp * Math.cos(lobes * theta));
            float x = (float) (cx + r * Math.cos(theta));
            float y = (float) (cy + r * Math.sin(theta));
            if (i == 0) {
                path.moveTo(x, y);
            } else {
                path.lineTo(x, y);
            }
        }
        path.close();
        return path;
    }

    public static Drawable createScallopedAvatar(final Context context, final Bitmap bitmap, final int sizeDp) {
        final int px = dp(context, sizeDp);
        return new Drawable() {
            private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
            private final Paint borderPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

            @Override
            public void draw(Canvas canvas) {
                Rect b = getBounds();
                float w = b.width() > 0 ? b.width() : px;
                float h = b.height() > 0 ? b.height() : px;
                float cx = b.left + w / 2f;
                float cy = b.top + h / 2f;
                float r = Math.min(w, h) * 0.44f;
                float amp = Math.min(w, h) * 0.042f;
                Path scallop = buildScallopedPath(cx, cy, r, amp, 12);

                if (bitmap != null && !bitmap.isRecycled()) {
                    BitmapShader shader = new BitmapShader(bitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
                    Matrix m = new Matrix();
                    float scale = Math.max(w / (float) bitmap.getWidth(), h / (float) bitmap.getHeight());
                    m.setScale(scale, scale);
                    m.postTranslate(b.left + (w - bitmap.getWidth() * scale) / 2f,
                            b.top + (h - bitmap.getHeight() * scale) / 2f);
                    shader.setLocalMatrix(m);
                    paint.setShader(shader);
                    canvas.drawPath(scallop, paint);
                } else {
                    paint.setShader(null);
                    paint.setColor(0xFF223036);
                    canvas.drawPath(scallop, paint);
                }

                borderPaint.setStyle(Paint.Style.STROKE);
                borderPaint.setStrokeWidth(Math.max(2f, w * 0.02f));
                borderPaint.setColor(0x4488C2CE);
                canvas.drawPath(scallop, borderPaint);
            }

            @Override public int getIntrinsicWidth() { return px; }
            @Override public int getIntrinsicHeight() { return px; }
            @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
            @Override public void setColorFilter(ColorFilter cf) { paint.setColorFilter(cf); }
            @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
        };
    }

    /**
     * Scalloped Sakura Music badge (matching 23424_0f7360.jpg).
     */
    public static Drawable createSakuraBadge(final Context context, final int sizeDp) {
        final int px = dp(context, sizeDp);
        return new Drawable() {
            private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

            @Override
            public void draw(Canvas canvas) {
                Rect b = getBounds();
                float w = b.width() > 0 ? b.width() : px;
                float h = b.height() > 0 ? b.height() : px;
                float cx = b.left + w / 2f;
                float cy = b.top + h / 2f;

                // Outer scalloped dark-teal glass shell
                Path outer = buildScallopedPath(cx, cy, w * 0.43f, w * 0.045f, 7);
                paint.setStyle(Paint.Style.FILL);
                paint.setColor(0xFF2B3B3E);
                canvas.drawPath(outer, paint);

                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(Math.max(2f, w * 0.028f));
                paint.setColor(0xFF6B8488);
                canvas.drawPath(outer, paint);

                // Inner pink 5-petal sakura blossom
                Path blossom = buildScallopedPath(cx, cy, w * 0.21f, w * 0.038f, 5);
                paint.setStyle(Paint.Style.FILL);
                paint.setColor(0xFFFF5C8D);
                canvas.drawPath(blossom, paint);

                // Crisp white beamed music note inside the blossom
                paint.setColor(Color.WHITE);
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(Math.max(2f, w * 0.036f));
                paint.setStrokeCap(Paint.Cap.ROUND);
                paint.setStrokeJoin(Paint.Join.ROUND);

                float nx1 = cx - w * 0.055f;
                float nx2 = cx + w * 0.065f;
                float nyTop = cy - w * 0.085f;
                float nyBot1 = cy + w * 0.055f;
                float nyBot2 = cy + w * 0.035f;

                canvas.drawLine(nx1, nyBot1, nx1, nyTop + w * 0.02f, paint);
                canvas.drawLine(nx2, nyBot2, nx2, nyTop, paint);
                canvas.drawLine(nx1, nyTop + w * 0.02f, nx2, nyTop, paint);

                paint.setStyle(Paint.Style.FILL);
                canvas.drawCircle(nx1 - w * 0.02f, nyBot1, w * 0.038f, paint);
                canvas.drawCircle(nx2 - w * 0.02f, nyBot2, w * 0.038f, paint);
            }

            @Override public int getIntrinsicWidth() { return px; }
            @Override public int getIntrinsicHeight() { return px; }
            @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
            @Override public void setColorFilter(ColorFilter cf) { paint.setColorFilter(cf); }
            @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
        };
    }

    /**
     * Black Instagram Camera badge placed right beside the Sakura Music badge in About.
     */
    public static Drawable createBlackInstagramBadge(final Context context, final int sizeDp) {
        final int px = dp(context, sizeDp);
        return new Drawable() {
            private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);

            @Override
            public void draw(Canvas canvas) {
                Rect b = getBounds();
                float w = b.width() > 0 ? b.width() : px;
                float h = b.height() > 0 ? b.height() : px;
                float cx = b.left + w / 2f;
                float cy = b.top + h / 2f;

                // Outer scalloped pure black shell with Liquid Glass border
                Path outer = buildScallopedPath(cx, cy, w * 0.43f, w * 0.045f, 7);
                paint.setStyle(Paint.Style.FILL);
                paint.setColor(0xFF0A0C0E);
                canvas.drawPath(outer, paint);

                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(Math.max(2f, w * 0.028f));
                paint.setColor(0xFF88C2CE);
                canvas.drawPath(outer, paint);

                // Instagram camera rounded square outline inside
                float half = w * 0.21f;
                RectF camRect = new RectF(cx - half, cy - half, cx + half, cy + half);
                paint.setColor(Color.WHITE);
                paint.setStrokeWidth(Math.max(2.2f, w * 0.042f));
                canvas.drawRoundRect(camRect, w * 0.11f, w * 0.11f, paint);

                // Camera lens circle
                canvas.drawCircle(cx, cy, w * 0.095f, paint);

                // Camera flash dot
                paint.setStyle(Paint.Style.FILL);
                canvas.drawCircle(cx + w * 0.115f, cy - w * 0.115f, w * 0.028f, paint);
            }

            @Override public int getIntrinsicWidth() { return px; }
            @Override public int getIntrinsicHeight() { return px; }
            @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
            @Override public void setColorFilter(ColorFilter cf) { paint.setColorFilter(cf); }
            @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
        };
    }

    public static Drawable createMenuIcon(final Context context, final String type, final int sizeDp, final int defaultColor) {
        final int px = dp(context, sizeDp);
        return new Drawable() {
            private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            private int tintColor = defaultColor;

            @Override
            public void draw(Canvas canvas) {
                Rect b = getBounds();
                float w = b.width() > 0 ? b.width() : px;
                float h = b.height() > 0 ? b.height() : px;
                float cx = b.left + w / 2f;
                float cy = b.top + h / 2f;
                float r = Math.min(w, h) * 0.36f;

                paint.setColor(tintColor);
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(Math.max(2f, Math.min(w, h) * 0.085f));
                paint.setStrokeCap(Paint.Cap.ROUND);
                paint.setStrokeJoin(Paint.Join.ROUND);

                String t = type == null ? "hexagon" : type;
                switch (t) {
                    case "hexagon":
                    case "misc": {
                        Path hex = new Path();
                        for (int i = 0; i < 6; i++) {
                            double a = Math.toRadians(60 * i - 30);
                            float x = (float) (cx + r * Math.cos(a));
                            float y = (float) (cy + r * Math.sin(a));
                            if (i == 0) hex.moveTo(x, y);
                            else hex.lineTo(x, y);
                        }
                        hex.close();
                        canvas.drawPath(hex, paint);
                        canvas.drawCircle(cx, cy, r * 0.36f, paint);
                        break;
                    }
                    case "download":
                    case "download_tray": {
                        canvas.drawLine(cx, cy - r * 0.85f, cx, cy + r * 0.35f, paint);
                        canvas.drawLine(cx - r * 0.45f, cy - r * 0.05f, cx, cy + r * 0.4f, paint);
                        canvas.drawLine(cx + r * 0.45f, cy - r * 0.05f, cx, cy + r * 0.4f, paint);
                        canvas.drawLine(cx - r * 0.75f, cy + r * 0.8f, cx + r * 0.75f, cy + r * 0.8f, paint);
                        break;
                    }
                    case "ghost": {
                        RectF head = new RectF(cx - r * 0.75f, cy - r * 0.85f, cx + r * 0.75f, cy + r * 0.5f);
                        Path p = new Path();
                        p.addArc(head, 180, 180);
                        p.lineTo(cx + r * 0.75f, cy + r * 0.85f);
                        p.lineTo(cx + r * 0.25f, cy + r * 0.55f);
                        p.lineTo(cx - r * 0.25f, cy + r * 0.85f);
                        p.lineTo(cx - r * 0.75f, cy + r * 0.55f);
                        p.close();
                        canvas.drawPath(p, paint);
                        paint.setStyle(Paint.Style.FILL);
                        canvas.drawCircle(cx - r * 0.28f, cy - r * 0.15f, r * 0.12f, paint);
                        canvas.drawCircle(cx + r * 0.28f, cy - r * 0.15f, r * 0.12f, paint);
                        break;
                    }
                    case "bell":
                    case "bell_off": {
                        RectF bell = new RectF(cx - r * 0.65f, cy - r * 0.75f, cx + r * 0.65f, cy + r * 0.35f);
                        canvas.drawArc(bell, 180, 180, false, paint);
                        canvas.drawLine(cx - r * 0.65f, cy - r * 0.2f, cx - r * 0.8f, cy + r * 0.45f, paint);
                        canvas.drawLine(cx + r * 0.65f, cy - r * 0.2f, cx + r * 0.8f, cy + r * 0.45f, paint);
                        canvas.drawLine(cx - r * 0.85f, cy + r * 0.45f, cx + r * 0.85f, cy + r * 0.45f, paint);
                        canvas.drawCircle(cx, cy + r * 0.72f, r * 0.14f, paint);
                        if ("bell_off".equals(t)) {
                            canvas.drawLine(cx - r * 0.85f, cy - r * 0.85f, cx + r * 0.85f, cy + r * 0.85f, paint);
                        }
                        break;
                    }
                    case "shield":
                    case "lock": {
                        RectF body = new RectF(cx - r * 0.7f, cy - r * 0.1f, cx + r * 0.7f, cy + r * 0.85f);
                        canvas.drawRoundRect(body, r * 0.2f, r * 0.2f, paint);
                        RectF shackle = new RectF(cx - r * 0.42f, cy - r * 0.85f, cx + r * 0.42f, cy - r * 0.05f);
                        canvas.drawArc(shackle, 180, 180, false, paint);
                        break;
                    }
                    case "gesture": {
                        canvas.drawCircle(cx, cy - r * 0.55f, r * 0.32f, paint);
                        canvas.drawLine(cx, cy - r * 0.35f, cx, cy + r * 0.75f, paint);
                        canvas.drawLine(cx - r * 0.45f, cy + r * 0.2f, cx + r * 0.45f, cy + r * 0.2f, paint);
                        break;
                    }
                    case "heart":
                    case "heart_filled": {
                        if ("heart_filled".equals(t)) paint.setStyle(Paint.Style.FILL);
                        Path hp = new Path();
                        hp.moveTo(cx, cy + r * 0.75f);
                        hp.cubicTo(cx - r * 1.1f, cy + r * 0.1f, cx - r * 0.9f, cy - r * 0.85f, cx, cy - r * 0.3f);
                        hp.cubicTo(cx + r * 0.9f, cy - r * 0.85f, cx + r * 1.1f, cy + r * 0.1f, cx, cy + r * 0.75f);
                        canvas.drawPath(hp, paint);
                        break;
                    }
                    case "sliders": {
                        canvas.drawLine(cx - r * 0.8f, cy - r * 0.45f, cx + r * 0.8f, cy - r * 0.45f, paint);
                        canvas.drawLine(cx - r * 0.8f, cy + r * 0.45f, cx + r * 0.8f, cy + r * 0.45f, paint);
                        paint.setStyle(Paint.Style.FILL);
                        canvas.drawCircle(cx - r * 0.25f, cy - r * 0.45f, r * 0.24f, paint);
                        canvas.drawCircle(cx + r * 0.3f, cy + r * 0.45f, r * 0.24f, paint);
                        break;
                    }
                    case "focus": {
                        RectF phone = new RectF(cx - r * 0.55f, cy - r * 0.88f, cx + r * 0.55f, cy + r * 0.88f);
                        canvas.drawRoundRect(phone, r * 0.18f, r * 0.18f, paint);
                        canvas.drawCircle(cx, cy + r * 0.58f, r * 0.08f, paint);
                        break;
                    }
                    case "code": {
                        paint.setStyle(Paint.Style.FILL);
                        paint.setTextAlign(Paint.Align.CENTER);
                        paint.setTypeface(Typeface.create(Typeface.MONOSPACE, Typeface.BOLD));
                        paint.setTextSize(r * 1.15f);
                        Paint.FontMetrics fm = paint.getFontMetrics();
                        canvas.drawText("{*}", cx, cy - (fm.ascent + fm.descent) / 2f, paint);
                        break;
                    }
                    case "translate": {
                        paint.setStyle(Paint.Style.FILL);
                        paint.setTextAlign(Paint.Align.CENTER);
                        paint.setTypeface(Typeface.DEFAULT_BOLD);
                        paint.setTextSize(r * 1.12f);
                        Paint.FontMetrics fm = paint.getFontMetrics();
                        canvas.drawText("文A", cx, cy - (fm.ascent + fm.descent) / 2f, paint);
                        break;
                    }
                    case "at": {
                        paint.setStyle(Paint.Style.FILL);
                        paint.setTextAlign(Paint.Align.CENTER);
                        paint.setTypeface(Typeface.DEFAULT_BOLD);
                        paint.setTextSize(r * 1.45f);
                        Paint.FontMetrics fm = paint.getFontMetrics();
                        canvas.drawText("@", cx, cy - (fm.ascent + fm.descent) / 2f, paint);
                        break;
                    }
                    case "doc": {
                        RectF doc = new RectF(cx - r * 0.65f, cy - r * 0.85f, cx + r * 0.65f, cy + r * 0.85f);
                        canvas.drawRoundRect(doc, r * 0.15f, r * 0.15f, paint);
                        canvas.drawLine(cx - r * 0.35f, cy - r * 0.3f, cx + r * 0.35f, cy - r * 0.3f, paint);
                        canvas.drawLine(cx - r * 0.35f, cy + r * 0.05f, cx + r * 0.35f, cy + r * 0.05f, paint);
                        canvas.drawLine(cx - r * 0.35f, cy + r * 0.4f, cx + r * 0.15f, cy + r * 0.4f, paint);
                        break;
                    }
                    case "user":
                    case "people":
                    case "user_plus": {
                        canvas.drawCircle(cx, cy - r * 0.35f, r * 0.36f, paint);
                        RectF arc = new RectF(cx - r * 0.75f, cy + r * 0.12f, cx + r * 0.75f, cy + r * 1.1f);
                        canvas.drawArc(arc, 195, 150, false, paint);
                        if ("user_plus".equals(t)) {
                            canvas.drawLine(cx + r * 0.65f, cy - r * 0.55f, cx + r * 0.65f, cy - r * 0.05f, paint);
                            canvas.drawLine(cx + r * 0.4f, cy - r * 0.3f, cx + r * 0.9f, cy - r * 0.3f, paint);
                        }
                        break;
                    }
                    case "bookmark": {
                        Path bm = new Path();
                        bm.moveTo(cx - r * 0.6f, cy - r * 0.85f);
                        bm.lineTo(cx + r * 0.6f, cy - r * 0.85f);
                        bm.lineTo(cx + r * 0.6f, cy + r * 0.85f);
                        bm.lineTo(cx, cy + r * 0.38f);
                        bm.lineTo(cx - r * 0.6f, cy + r * 0.85f);
                        bm.close();
                        canvas.drawPath(bm, paint);
                        break;
                    }
                    case "id_card": {
                        RectF card = new RectF(cx - r * 0.85f, cy - r * 0.6f, cx + r * 0.85f, cy + r * 0.6f);
                        canvas.drawRoundRect(card, r * 0.16f, r * 0.16f, paint);
                        canvas.drawCircle(cx - r * 0.38f, cy, r * 0.22f, paint);
                        canvas.drawLine(cx + r * 0.05f, cy - r * 0.2f, cx + r * 0.55f, cy - r * 0.2f, paint);
                        canvas.drawLine(cx + r * 0.05f, cy + r * 0.2f, cx + r * 0.45f, cy + r * 0.2f, paint);
                        break;
                    }
                    case "scissors": {
                        canvas.drawCircle(cx - r * 0.45f, cy + r * 0.45f, r * 0.28f, paint);
                        canvas.drawCircle(cx - r * 0.45f, cy - r * 0.45f, r * 0.28f, paint);
                        canvas.drawLine(cx - r * 0.22f, cy - r * 0.3f, cx + r * 0.8f, cy + r * 0.55f, paint);
                        canvas.drawLine(cx - r * 0.22f, cy + r * 0.3f, cx + r * 0.8f, cy - r * 0.55f, paint);
                        break;
                    }
                    case "sun": {
                        canvas.drawCircle(cx, cy, r * 0.42f, paint);
                        for (int i = 0; i < 8; i++) {
                            double a = Math.toRadians(i * 45);
                            canvas.drawLine(
                                    (float) (cx + r * 0.62f * Math.cos(a)),
                                    (float) (cy + r * 0.62f * Math.sin(a)),
                                    (float) (cx + r * 0.88f * Math.cos(a)),
                                    (float) (cy + r * 0.88f * Math.sin(a)),
                                    paint);
                        }
                        break;
                    }
                    case "refresh": {
                        RectF rf = new RectF(cx - r * 0.75f, cy - r * 0.75f, cx + r * 0.75f, cy + r * 0.75f);
                        canvas.drawArc(rf, -40, 290, false, paint);
                        canvas.drawLine(cx + r * 0.3f, cy - r * 0.8f, cx + r * 0.72f, cy - r * 0.45f, paint);
                        canvas.drawLine(cx + r * 0.72f, cy - r * 0.45f, cx + r * 0.28f, cy - r * 0.3f, paint);
                        break;
                    }
                    case "history": {
                        canvas.drawCircle(cx, cy, r * 0.82f, paint);
                        canvas.drawLine(cx, cy - r * 0.45f, cx, cy, paint);
                        canvas.drawLine(cx, cy, cx + r * 0.38f, cy + r * 0.22f, paint);
                        break;
                    }
                    case "chat_x": {
                        RectF msg = new RectF(cx - r * 0.82f, cy - r * 0.72f, cx + r * 0.82f, cy + r * 0.55f);
                        canvas.drawRoundRect(msg, r * 0.22f, r * 0.22f, paint);
                        canvas.drawLine(cx - r * 0.25f, cy - r * 0.32f, cx + r * 0.25f, cy + r * 0.18f, paint);
                        canvas.drawLine(cx + r * 0.25f, cy - r * 0.32f, cx - r * 0.25f, cy + r * 0.18f, paint);
                        break;
                    }
                    case "folder": {
                        RectF fld = new RectF(cx - r * 0.85f, cy - r * 0.45f, cx + r * 0.85f, cy + r * 0.75f);
                        canvas.drawRoundRect(fld, r * 0.16f, r * 0.16f, paint);
                        canvas.drawLine(cx - r * 0.75f, cy - r * 0.68f, cx - r * 0.1f, cy - r * 0.68f, paint);
                        break;
                    }
                    case "telegram": {
                        Path tg = new Path();
                        tg.moveTo(cx - r * 0.8f, cy + r * 0.05f);
                        tg.lineTo(cx + r * 0.78f, cy - r * 0.68f);
                        tg.lineTo(cx + r * 0.35f, cy + r * 0.75f);
                        tg.lineTo(cx - r * 0.08f, cy + r * 0.25f);
                        tg.close();
                        canvas.drawPath(tg, paint);
                        break;
                    }
                    case "youtube": {
                        paint.setStyle(Paint.Style.FILL);
                        Path play = new Path();
                        play.moveTo(cx - r * 0.45f, cy - r * 0.65f);
                        play.lineTo(cx + r * 0.68f, cy);
                        play.lineTo(cx - r * 0.45f, cy + r * 0.65f);
                        play.close();
                        canvas.drawPath(play, paint);
                        break;
                    }
                    case "github": {
                        canvas.drawCircle(cx, cy, r * 0.78f, paint);
                        canvas.drawCircle(cx, cy - r * 0.05f, r * 0.32f, paint);
                        break;
                    }
                    case "instagram": {
                        RectF ig = new RectF(cx - r * 0.78f, cy - r * 0.78f, cx + r * 0.78f, cy + r * 0.78f);
                        canvas.drawRoundRect(ig, r * 0.38f, r * 0.38f, paint);
                        canvas.drawCircle(cx, cy, r * 0.36f, paint);
                        paint.setStyle(Paint.Style.FILL);
                        canvas.drawCircle(cx + r * 0.44f, cy - r * 0.44f, r * 0.1f, paint);
                        break;
                    }
                    case "chevron_right": {
                        canvas.drawLine(cx - r * 0.25f, cy - r * 0.5f, cx + r * 0.28f, cy, paint);
                        canvas.drawLine(cx + r * 0.28f, cy, cx - r * 0.25f, cy + r * 0.5f, paint);
                        break;
                    }
                    default: {
                        canvas.drawCircle(cx, cy, r * 0.75f, paint);
                        canvas.drawLine(cx, cy - r * 0.25f, cx, cy + r * 0.35f, paint);
                        paint.setStyle(Paint.Style.FILL);
                        canvas.drawCircle(cx, cy - r * 0.45f, r * 0.09f, paint);
                        break;
                    }
                }
            }

            @Override public int getIntrinsicWidth() { return px; }
            @Override public int getIntrinsicHeight() { return px; }
            @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
            @Override public void setColorFilter(ColorFilter cf) { paint.setColorFilter(cf); }
            @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
        };
    }
}
