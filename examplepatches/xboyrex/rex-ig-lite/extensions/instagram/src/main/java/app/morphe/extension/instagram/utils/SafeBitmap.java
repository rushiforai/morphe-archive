/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.utils;

import android.graphics.Bitmap;

/**
 * Prevents IllegalArgumentException ("y + height must be <= bitmap.height()") when Instagram's
 * image pipeline calls Bitmap.getPixels with out-of-bounds dimensions on scaled/recycled bitmaps.
 */
public final class SafeBitmap {

    private SafeBitmap() {}

    public static void getPixels(
            Bitmap bitmap,
            int[] pixels,
            int offset,
            int stride,
            int x,
            int y,
            int width,
            int height
    ) {
        if (bitmap == null || bitmap.isRecycled() || pixels == null || width <= 0 || height <= 0) {
            return;
        }
        try {
            int bw = bitmap.getWidth();
            int bh = bitmap.getHeight();
            if (bw <= 0 || bh <= 0) return;

            int safeX = Math.max(0, Math.min(x, bw - 1));
            int safeY = Math.max(0, Math.min(y, bh - 1));
            int safeW = Math.min(width, bw - safeX);
            int safeH = Math.min(height, bh - safeY);
            if (safeW <= 0 || safeH <= 0) return;

            int safeStride = Math.abs(stride) < safeW ? (stride < 0 ? -safeW : safeW) : stride;
            int maxNeeded = offset + (safeH - 1) * Math.abs(safeStride) + safeW;
            if (offset < 0 || maxNeeded > pixels.length) {
                safeH = Math.max(1, (pixels.length - Math.max(0, offset) - safeW) / Math.max(1, Math.abs(safeStride)) + 1);
                safeH = Math.min(safeH, bh - safeY);
                if (safeH <= 0 || Math.max(0, offset) + safeW > pixels.length) return;
                offset = Math.max(0, offset);
            }

            bitmap.getPixels(pixels, offset, safeStride, safeX, safeY, safeW, safeH);
        } catch (Throwable ignored) {
        }
    }
}
