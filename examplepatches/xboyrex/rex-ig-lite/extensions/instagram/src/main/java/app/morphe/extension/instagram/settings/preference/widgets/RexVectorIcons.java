/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;

/**
 * Unified facade delegating all vector icon rendering to {@link RexIcon} (Tabler Icons 24x24
 * outline & filled library) while preserving scalloped avatar rendering.
 */
public final class RexVectorIcons {

    private RexVectorIcons() {}

    public static int dp(Context context, float value) {
        if (context == null) return Math.round(value * 2.75f);
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, context.getResources().getDisplayMetrics()));
    }

    public static Drawable create(Context context, String iconName, int color, int sizeDp) {
        return RexIcon.getDrawable(context, iconName, color, sizeDp, false);
    }

    public static Drawable create(Context context, String iconName, int color, int sizeDp, boolean preferFilled) {
        return RexIcon.getDrawable(context, iconName, color, sizeDp, preferFilled);
    }

    public static Drawable createMenuIcon(final Context context, final String type, final int sizeDp, final int color) {
        return RexIcon.getDrawable(context, type, color, sizeDp, false);
    }

    public static Drawable createMenuIcon(final Context context, final String type, final int sizeDp, final int color, final boolean preferFilled) {
        return RexIcon.getDrawable(context, type, color, sizeDp, preferFilled);
    }

    public static Drawable createHexagonIcon(Context context, int sizeDp, int color) {
        return RexIcon.getDrawable(context, "hexagon", color, sizeDp, false);
    }

    public static Drawable createDownloadIcon(Context context, int sizeDp, int color) {
        return RexIcon.getDrawable(context, "download", color, sizeDp, false);
    }

    public static Drawable createTranslateIcon(Context context, int sizeDp, int color) {
        return RexIcon.getDrawable(context, "language", color, sizeDp, false);
    }

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
                borderPaint.setColor(0x4486C5CE);
                canvas.drawPath(scallop, borderPaint);
            }

            @Override public int getIntrinsicWidth() { return px; }
            @Override public int getIntrinsicHeight() { return px; }
            @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
            @Override public void setColorFilter(ColorFilter colorFilter) { paint.setColorFilter(colorFilter); }
            @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
        };
    }
}
