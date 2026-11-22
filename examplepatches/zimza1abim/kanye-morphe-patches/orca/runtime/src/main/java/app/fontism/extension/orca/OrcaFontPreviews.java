package app.fontism.extension.orca;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.os.ParcelFileDescriptor;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.LruCache;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/** Each visible row gets its own rasterized face, never the global text override. */
final class OrcaFontPreviews {
    private static final int CACHE_BYTES = 1024 * 1024;
    private static final LruCache<String, byte[]> cache = new LruCache<String, byte[]>(CACHE_BYTES) {
        @Override protected int sizeOf(String key, byte[] value) { return value.length; }
    };
    // A separate bounded queue prevents previews from delaying selection/reset.
    private static final ThreadPoolExecutor worker = new ThreadPoolExecutor(1, 1, 30, TimeUnit.SECONDS,
            new ArrayBlockingQueue<>(16), runnable -> {
                Thread thread = new Thread(runnable, "Orca-font-preview");
                thread.setDaemon(true);
                return thread;
            });
    static { worker.allowCoreThreadTimeOut(true); }

    private OrcaFontPreviews() {}

    static void clear() { cache.evictAll(); }

    static ParcelFileDescriptor open(Context context, String key, OrcaPreviewSpec spec) throws FileNotFoundException {
        try {
            // Snapshot only the inventory entry; loading/rendering stays on the worker.
            final OrcaDeviceFonts.Entry entry = OrcaFontStore.previewEntry(key, spec.generation);
            final String cacheKey = spec.cacheKey(key);
            final Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
            ParcelFileDescriptor[] pipe = ParcelFileDescriptor.createReliablePipe();
            try {
                worker.execute(() -> {
                    try (OutputStream out = new ParcelFileDescriptor.AutoCloseOutputStream(pipe[1])) {
                        byte[] png = cache.get(cacheKey);
                        if (png == null) {
                            png = render(app, key, entry, spec);
                            cache.put(cacheKey, png);
                        }
                        out.write(png);
                    } catch (IOException | RuntimeException unavailable) {
                        try { pipe[1].closeWithError("Font preview is unavailable"); }
                        catch (IOException ignored) { /* Image loader may already have cancelled. */ }
                    }
                });
            } catch (RuntimeException busy) {
                pipe[0].close(); pipe[1].close();
                throw busy;
            }
            return pipe[0];
        } catch (IOException | RuntimeException unavailable) {
            FileNotFoundException failure = new FileNotFoundException("Font preview is unavailable");
            failure.initCause(unavailable);
            throw failure;
        }
    }

    private static byte[] render(Context context, String key, OrcaDeviceFonts.Entry entry, OrcaPreviewSpec spec) throws IOException {
        Typeface face;
        if (entry != null) face = entry.preview(context);
        else if (OrcaFontStore.KEY_SYSTEM.equals(key)) face = Typeface.DEFAULT;
        else if (OrcaFontStore.KEY_BUNDLED.equals(key)) {
            OrcaFonts.Faces bundled = OrcaFonts.bundledFaces(context.getAssets());
            face = bundled == null ? null : bundled.regular;
        } else face = null;
        if (face == null) throw new IOException("Font cannot be previewed");
        Bitmap image = Bitmap.createBitmap(spec.width, spec.height, Bitmap.Config.ARGB_8888);
        try {
            TextPaint paint = new TextPaint(Paint.ANTI_ALIAS_FLAG | Paint.SUBPIXEL_TEXT_FLAG);
            paint.setTypeface(face);
            paint.setTextSize(spec.size);
            paint.setColor(spec.color);
            Canvas canvas = new Canvas(image);
            // One line sized for a wide row strip: Hangul, Latin and digits show the face at a glance.
            drawLine(canvas, paint, "가나다라마바사 Aa Bb Cc 0123", spec.width, 0, spec.height);
            ByteArrayOutputStream bytes = new ByteArrayOutputStream();
            if (!image.compress(Bitmap.CompressFormat.PNG, 100, bytes)) throw new IOException("Preview encoding failed");
            return bytes.toByteArray();
        } finally {
            // No Bitmap or Typeface is kept in a per-font registry.
            image.recycle();
        }
    }

    private static void drawLine(Canvas canvas, TextPaint paint, String text, int width, float top, float height) {
        Paint.FontMetrics metrics = paint.getFontMetrics();
        float baseline = top + (height - metrics.descent + metrics.ascent) / 2f - metrics.ascent;
        String clipped = TextUtils.ellipsize(text, paint, width - 2, TextUtils.TruncateAt.END).toString();
        int save = canvas.save();
        canvas.clipRect(0, top, width, top + height);
        canvas.drawText(clipped, 0, baseline, paint);
        canvas.restoreToCount(save);
    }
}
