/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.customise.font;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.os.Build;
import android.os.SystemClock;
import android.text.Editable;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.Spanned;
import android.text.TextPaint;
import android.text.style.ReplacementSpan;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import java.lang.reflect.Field;

import java.lang.reflect.Constructor;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.shared.Logger;

/**
 * Replaces the typefaces the app hands out for its own interface with either a font file the
 * user added/selected in settings, or the device's own system font, while also rendering custom
 * iOS/Pack Emojis across EmojiCompat & TextViews and custom Story Fonts inside the Story Editor.
 */
@SuppressWarnings("unused")
public class CustomFont {

    private static final String[] INTERFACE_FONT_NAMES = {
            "Instagram Sans",
            "Optimistic",
            "Roboto",
            "sans-serif",
            "Aveny",
            " Cosmopolitan",
            "Cosmopolitan",
            "Neue Plak",
            "Freight",
            " Koulen",
            "Koulen",
    };

    private static final long STALE_CONTENT_REQUEST_NS = 5_000_000_000L;
    private static final long SYSTEM_FONT_CHECK_MS = 2_000L;

    private static final Map<Class<?>, Boolean> interfaceDescriptors = new ConcurrentHashMap<>();

    private static final int MAX_CACHED_TYPEFACES = 512;
    private static final Map<Typeface, Typeface> typefaceSubstitutions = new ConcurrentHashMap<>();
    private static final Set<Typeface> contentTypefaces =
            Collections.newSetFromMap(new WeakHashMap<>());
    private static final Map<Typeface, Typeface> contentCopies =
            Collections.synchronizedMap(new WeakHashMap<>());
    private static final Map<Typeface, Boolean> drawsTextCache =
            Collections.synchronizedMap(new WeakHashMap<>());

    private static final AtomicInteger resolversRunning = new AtomicInteger();

    private static final class ContentRequest {
        int depth;
        long enteredAtNs;
    }

    private static final ThreadLocal<ContentRequest> contentRequest =
            ThreadLocal.withInitial(ContentRequest::new);

    private static volatile boolean active;
    private static volatile Typeface customTypeface;
    private static volatile boolean systemFontSelected;
    private static volatile Typeface emojiTypeface;

    private static volatile Typeface systemFontFamily;
    private static volatile long systemFontCheckedAtMs;

    private static final ThreadLocal<TextPaint> EMOJI_PEN = ThreadLocal.withInitial(TextPaint::new);
    private static final ThreadLocal<Paint.FontMetrics> LINE_METRICS = ThreadLocal.withInitial(Paint.FontMetrics::new);
    private static final ThreadLocal<Paint.FontMetrics> GLYPH_METRICS = ThreadLocal.withInitial(Paint.FontMetrics::new);

    public static synchronized void reload() {
        typefaceSubstitutions.clear();
        contentTypefaces.clear();
        contentCopies.clear();
        drawsTextCache.clear();
        interfaceDescriptors.clear();
        load();
    }

    public static void load() {
        try {
            boolean appFontEnabled = Boolean.TRUE.equals(
                    app.morphe.extension.rex.sharedPreference.SharedPref.getBooleanPref(
                            app.morphe.extension.instagram.settings.Settings.ENABLE_APP_FONT));
            boolean emojiEnabled = Boolean.TRUE.equals(
                    app.morphe.extension.rex.sharedPreference.SharedPref.getBooleanPref(
                            app.morphe.extension.instagram.settings.Settings.ENABLE_EMOJI_FONT));
            if (appFontEnabled && FontStorage.hasFile()) {
                customTypeface = FontStorage.loadTypeface();
                systemFontSelected = false;
                active = customTypeface != null;
            } else if (appFontEnabled && FontStorage.useSystemFont()) {
                customTypeface = null;
                systemFontSelected = true;
                active = true;
            } else {
                customTypeface = null;
                systemFontSelected = false;
                active = false;
            }
            emojiTypeface = emojiEnabled ? FontStorage.loadEmojiTypeface() : null;
        } catch (Throwable e) {
            Logger.printException(() -> "Failed to initialize CustomFont", e);
        }
    }

    private static void ensureLoaded() {
        if (!active && customTypeface == null && !systemFontSelected && FontStorage.hasFile()) {
            load();
        }
        if (emojiTypeface == null && FontStorage.hasEmojiFile()) {
            emojiTypeface = FontStorage.loadEmojiTypeface();
        }
    }

    // --- Emoji Engine (iOS / Pack / Local Emoji Rendering) ---

    public static int emojiReplaceStrategy(int defaultStrategy) {
        try {
            ensureLoaded();
            if (emojiTypeface != null) {
                return 1; // EmojiCompat.REPLACE_STRATEGY_ALL
            }
        } catch (Throwable ignored) {
        }
        return defaultStrategy;
    }

    public static boolean drawEmojiSpan(
            Object span,
            Canvas canvas,
            CharSequence text,
            int start,
            int end,
            float x,
            int top,
            int y,
            int bottom,
            Paint paint
    ) {
        try {
            ensureLoaded();
            Typeface emoji = emojiTypeface;
            if (emoji == null || canvas == null || text == null || paint == null) return false;
            if (!(span instanceof ReplacementSpan)) return false;
            if (start < 0 || end > text.length() || start >= end) return false;
            int width = ((ReplacementSpan) span).getSize(paint, text, start, end, null);
            String clean = stripVariationSelector(text, start, end);
            return drawEmojiGlyph(canvas, clean, x, y, width, paint, emoji);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean drawEmojiGlyph(
            Canvas canvas,
            String emojiStr,
            float x,
            int y,
            int width,
            Paint paint,
            Typeface font
    ) {
        if (emojiStr == null || emojiStr.isEmpty() || width <= 0) return false;
        TextPaint pen = EMOJI_PEN.get();
        pen.set(paint);
        pen.setTypeface(font);
        float advance = pen.measureText(emojiStr);
        if (!(advance > 0)) return false;
        Paint.FontMetrics line = LINE_METRICS.get();
        paint.getFontMetrics(line);
        Paint.FontMetrics glyph = GLYPH_METRICS.get();
        pen.getFontMetrics(glyph);
        float lineHeight = line.descent - line.ascent;
        float glyphHeight = glyph.descent - glyph.ascent;
        float scale = width / advance;
        if (lineHeight > 0 && glyphHeight > 0) {
            scale = Math.min(scale, lineHeight / glyphHeight);
        }
        pen.setTextSize(paint.getTextSize() * scale);
        pen.getFontMetrics(glyph);
        float left = x + (width - pen.measureText(emojiStr)) / 2f;
        float baseline = y + (line.ascent + line.descent) / 2f - (glyph.ascent + glyph.descent) / 2f;
        canvas.drawText(emojiStr, left, baseline, pen);
        return true;
    }

    public static String stripVariationSelector(CharSequence text, int start, int end) {
        StringBuilder sb = new StringBuilder(end - start);
        for (int i = start; i < end; i++) {
            char ch = text.charAt(i);
            if (ch != (char) 0xfe0f) sb.append(ch);
        }
        return sb.toString();
    }

    public static final class CustomEmojiSpan extends ReplacementSpan {
        private final Typeface font;
        private final TextPaint work = new TextPaint();

        public CustomEmojiSpan(Typeface font) {
            this.font = font;
        }

        private TextPaint styled(Paint paint) {
            work.set(paint);
            work.setTypeface(font);
            return work;
        }

        @Override
        public int getSize(Paint paint, CharSequence text, int start, int end, Paint.FontMetricsInt fm) {
            if (fm != null) paint.getFontMetricsInt(fm);
            return (int) Math.ceil(styled(paint).measureText(stripVariationSelector(text, start, end)));
        }

        @Override
        public void draw(Canvas canvas, CharSequence text, int start, int end, float x, int top, int y, int bottom, Paint paint) {
            canvas.drawText(stripVariationSelector(text, start, end), x, y, styled(paint));
        }
    }

    public static CharSequence applyEmojiSpans(CharSequence text) {
        try {
            ensureLoaded();
            Typeface emoji = emojiTypeface;
            if (emoji == null || text == null || text.length() == 0) return text;
            if (!containsEmojiCandidate(text)) return text;

            if (text instanceof Editable) {
                layEmojiSpans((Editable) text, emoji);
                return text;
            }
            SpannableString copy = new SpannableString(text);
            return layEmojiSpans(copy, emoji) ? copy : text;
        } catch (Throwable ignored) {
            return text;
        }
    }

    private static boolean containsEmojiCandidate(CharSequence text) {
        int len = text.length();
        for (int i = 0; i < len; i++) {
            char c = text.charAt(i);
            if (c >= 0x203c) return true;
        }
        return false;
    }

    private static boolean layEmojiSpans(Spannable text, Typeface emoji) {
        for (CustomEmojiSpan old : text.getSpans(0, text.length(), CustomEmojiSpan.class)) {
            text.removeSpan(old);
        }
        boolean appliedAny = false;
        int at = 0;
        int len = text.length();
        while (at < len) {
            int end = emojiSequenceEnd(text, at);
            if (end > at) {
                ReplacementSpan[] existing = text.getSpans(at, end, ReplacementSpan.class);
                if (existing == null || existing.length == 0) {
                    text.setSpan(new CustomEmojiSpan(emoji), at, end, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
                    appliedAny = true;
                }
                at = end;
            } else {
                at += Character.charCount(Character.codePointAt(text, at));
            }
        }
        return appliedAny;
    }

    private static int emojiSequenceEnd(CharSequence text, int start) {
        int length = text.length();
        int point = Character.codePointAt(text, start);
        int at = start + Character.charCount(point);
        int after = at < length ? Character.codePointAt(text, at) : -1;
        if (point >= 0x1f1e6 && point <= 0x1f1ff) {
            if (after >= 0x1f1e6 && after <= 0x1f1ff) at += Character.charCount(after);
        } else if ((point >= '0' && point <= '9') || point == '#' || point == '*') {
            boolean marked = after == 0x20e3 || (after == 0xfe0f && at + 1 < length && text.charAt(at + 1) == 0x20e3);
            if (!marked) return start;
        } else if (!isEmojiCodePoint(point) && !(after == 0xfe0f && isVariationEmoji(point))) {
            return start;
        }
        while (at < length) {
            int next = Character.codePointAt(text, at);
            if (next == 0xfe0f || next == 0x20e3 || (next >= 0x1f3fb && next <= 0x1f3ff) || (next >= 0xe0020 && next <= 0xe007f)) {
                at += Character.charCount(next);
            } else if (next == 0x200d && at + 1 < length) {
                int joined = Character.codePointAt(text, at + 1);
                if (!isEmojiCodePoint(joined) && !isVariationEmoji(joined)) break;
                at += 1 + Character.charCount(joined);
            } else {
                break;
            }
        }
        return at;
    }

    private static boolean isEmojiCodePoint(int point) {
        if (point >= 0x1f000 && point <= 0x1faff) return true;
        return (point >= 0x231a && point <= 0x27bf) || (point >= 0x2b1b && point <= 0x2b55);
    }

    private static boolean isVariationEmoji(int point) {
        return point == 0x00a9 || point == 0x00ae || point == 0x203c || point == 0x2049 || point == 0x2122
                || point == 0x2139 || (point >= 0x2194 && point <= 0x21aa) || (point >= 0x2300 && point <= 0x27bf)
                || (point >= 0x2934 && point <= 0x2b55) || point == 0x3030 || point == 0x303d || point == 0x3297 || point == 0x3299;
    }

    // --- Typeface & Story Font Engine ---

    public static String extractDescriptorFontName(Object descriptor) {
        if (descriptor == null) return "";
        if (descriptor instanceof CharSequence) return descriptor.toString();
        if (descriptor instanceof Enum<?>) return ((Enum<?>) descriptor).name();
        StringBuilder sb = new StringBuilder();
        String strVal = String.valueOf(descriptor);
        if (!strVal.contains("@")) {
            sb.append(strVal).append(' ');
        }
        try {
            for (Class<?> c = descriptor.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (Field f : c.getDeclaredFields()) {
                    if (java.lang.reflect.Modifier.isStatic(f.getModifiers())) continue;
                    Class<?> ft = f.getType();
                    if (ft == String.class || CharSequence.class.isAssignableFrom(ft) || ft.isEnum()) {
                        try {
                            f.setAccessible(true);
                            Object v = f.get(descriptor);
                            if (v != null) {
                                sb.append(v instanceof Enum<?> ? ((Enum<?>) v).name() : v.toString()).append(' ');
                            }
                        } catch (Throwable ignored) {}
                    }
                }
            }
        } catch (Throwable ignored) {}
        return sb.toString().trim();
    }

    public static void applyToViewTree(View root) {
        if (root == null) return;
        try {
            ensureLoaded();
            if (!active) return;
            if (root instanceof TextView) {
                TextView tv = (TextView) root;
                Typeface current = tv.getTypeface();
                Typeface replaced = assignToOwnView(current);
                if (replaced != null && replaced != current) {
                    tv.setTypeface(replaced);
                }
            }
            if (root instanceof ViewGroup) {
                ViewGroup vg = (ViewGroup) root;
                int count = vg.getChildCount();
                for (int i = 0; i < count; i++) {
                    applyToViewTree(vg.getChildAt(i));
                }
            }
        } catch (Throwable ignored) {}
    }

    public static Typeface apply(Object descriptor, Typeface original) {
        ensureLoaded();
        if (original == null) {
            return null;
        }
        try {
            String descriptorName = extractDescriptorFontName(descriptor);
            if (!isResolvingContent() && !descriptorName.isEmpty()) {
                if (isInterfaceFontName(descriptorName) && !FontStorage.isStoryFontDescriptorName(descriptorName)) {
                    return active ? replacementFor(original) : original;
                }
            }

            // Story Editor & content font descriptors: map to bundled/installed Story Fonts and mark as content
            Typeface storyMapped = !descriptorName.isEmpty()
                    ? FontStorage.resolveStoryDescriptorTypeface(descriptorName)
                    : null;
            if (storyMapped != null) {
                Typeface derived = deriveStoryTypeface(storyMapped, original);
                return keepAsContent(derived != null ? derived : storyMapped);
            }
            if (active && !isResolvingContent()) {
                return replacementFor(original);
            }
            return keepAsContent(original);
        } catch (Exception e) {
            Logger.printException(() -> "Failed to apply the custom font", e);
            return original;
        }
    }

    private static Typeface deriveStoryTypeface(Typeface base, Typeface original) {
        if (base == null) return null;
        if (original == null) return base;
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                return Typeface.create(base, original.getWeight(), original.isItalic());
            }
            return Typeface.create(base, original.getStyle());
        } catch (Throwable ignored) {
            return base;
        }
    }

    public static Typeface apply(Typeface original) {
        ensureLoaded();
        if (!active || original == null) {
            return original;
        }
        try {
            if (isResolvingContent() || isContent(original)) {
                return original;
            }
            return replacementFor(original);
        } catch (Exception e) {
            Logger.printException(() -> "Failed to apply the custom font", e);
            return original;
        }
    }

    public static Object applyWrappedTypeface(Object candidate) {
        return candidate instanceof Typeface ? apply((Typeface) candidate) : candidate;
    }

    private static boolean isContent(Typeface typeface) {
        synchronized (contentTypefaces) {
            return contentTypefaces.contains(typeface);
        }
    }

    private static Typeface keepAsContent(Typeface typeface) {
        if (typeface == null) return null;
        synchronized (contentTypefaces) {
            if (contentTypefaces.contains(typeface)) {
                return typeface;
            }
        }
        Typeface copy = contentCopies.get(typeface);
        if (copy == null) {
            copy = distinctCopyOf(typeface);
            synchronized (contentTypefaces) {
                contentTypefaces.add(copy);
            }
            contentCopies.put(typeface, copy);
        }
        return copy;
    }

    public static Typeface assign(Typeface original) {
        ensureLoaded();
        if (!active) {
            return original;
        }
        if (original == null) {
            return replacementFor(Typeface.DEFAULT);
        }
        return apply(original);
    }

    public static boolean isActive() {
        ensureLoaded();
        return active;
    }

    public static Typeface forRexView(Typeface original) {
        return assignToOwnView(original);
    }

    public static Typeface assignToOwnView(Typeface original) {
        ensureLoaded();
        if (!active) {
            return original;
        }
        try {
            return replacementFor(original != null ? original : Typeface.DEFAULT);
        } catch (Exception e) {
            Logger.printException(() -> "Failed to apply the custom font", e);
            return original;
        }
    }

    public static void beginContentFontRequest() {
        ContentRequest current = contentRequest.get();
        if (current.depth > 0 && SystemClock.elapsedRealtimeNanos() - current.enteredAtNs > STALE_CONTENT_REQUEST_NS) {
            resolversRunning.addAndGet(-current.depth);
            current.depth = 0;
        }
        if (current.depth == 0) {
            current.enteredAtNs = SystemClock.elapsedRealtimeNanos();
        }
        current.depth++;
        resolversRunning.incrementAndGet();
    }

    public static Typeface endContentFontRequest(Typeface returned) {
        return endContentFontRequest(null, returned);
    }

    public static Typeface endContentFontRequest(Object source, Typeface returned) {
        ContentRequest current = contentRequest.get();
        if (current.depth > 0) {
            current.depth--;
            resolversRunning.decrementAndGet();
        }
        if (returned == null) return null;
        if (source != null) {
            try {
                String name = extractDescriptorFontName(source);
                if (!name.isEmpty()) {
                    Typeface storyMapped = FontStorage.resolveStoryDescriptorTypeface(name);
                    if (storyMapped != null) {
                        Typeface derived = deriveStoryTypeface(storyMapped, returned);
                        return keepAsContent(derived != null ? derived : storyMapped);
                    }
                }
            } catch (Throwable ignored) {}
        }
        return keepAsContent(returned);
    }

    private static boolean isResolvingContent() {
        if (resolversRunning.get() <= 0) {
            return false;
        }
        ContentRequest current = contentRequest.get();
        if (current.depth <= 0) {
            return false;
        }
        if (SystemClock.elapsedRealtimeNanos() - current.enteredAtNs > STALE_CONTENT_REQUEST_NS) {
            resolversRunning.addAndGet(-current.depth);
            current.depth = 0;
            return false;
        }
        return true;
    }

    private static Typeface distinctCopyOf(Typeface typeface) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            int weight = typeface.getWeight();
            int nudged = weight < 1000 ? weight + 1 : weight - 1;
            Typeface viaNudge = Typeface.create(
                    Typeface.create(typeface, nudged, typeface.isItalic()),
                    weight,
                    typeface.isItalic()
            );
            if (viaNudge != null && viaNudge != typeface) {
                return viaNudge;
            }
        }
        try {
            Constructor<Typeface> constructor = Typeface.class.getDeclaredConstructor(long.class);
            constructor.setAccessible(true);
            long nativeInstance = Typeface.class.getDeclaredField("native_instance").getLong(typeface);
            return constructor.newInstance(nativeInstance);
        } catch (Exception ignored) {
            return typeface;
        }
    }

    private static Typeface derive(Typeface original) {
        if (systemFontSelected) {
            return Build.VERSION.SDK_INT >= Build.VERSION_CODES.P
                    ? Typeface.create(
                    Typeface.create(FontStorage.SYSTEM_FONT_FAMILY, Typeface.NORMAL),
                    original.getWeight(),
                    original.isItalic())
                    : Typeface.create(FontStorage.SYSTEM_FONT_FAMILY, original.getStyle());
        }
        return Build.VERSION.SDK_INT >= Build.VERSION_CODES.P
                ? Typeface.create(customTypeface, original.getWeight(), original.isItalic())
                : Typeface.create(customTypeface, original.getStyle());
    }

    private static Typeface replacementFor(Typeface original) {
        if (systemFontSelected) {
            refreshSystemFontCacheIfNeeded();
        }
        Typeface cached = typefaceSubstitutions.get(original);
        if (cached != null) {
            return cached;
        }
        if (!drawsText(original)) {
            return cacheSubstitution(original, original);
        }
        try {
            Typeface derived = derive(original);
            if (derived != null) {
                typefaceSubstitutions.put(derived, derived);
                return cacheSubstitution(original, derived);
            }
        } catch (Exception e) {
            Logger.printException(() -> "Failed to derive the custom font", e);
        }
        return original;
    }

    private static Typeface cacheSubstitution(Typeface original, Typeface replacement) {
        if (typefaceSubstitutions.size() < MAX_CACHED_TYPEFACES) {
            typefaceSubstitutions.put(original, replacement);
        }
        return replacement;
    }

    private static void refreshSystemFontCacheIfNeeded() {
        long now = SystemClock.uptimeMillis();
        if (now - systemFontCheckedAtMs < SYSTEM_FONT_CHECK_MS) {
            return;
        }
        systemFontCheckedAtMs = now;
        Typeface family = Typeface.create(FontStorage.SYSTEM_FONT_FAMILY, Typeface.NORMAL);
        if (family != systemFontFamily) {
            systemFontFamily = family;
            typefaceSubstitutions.clear();
        }
    }

    private static boolean isInterfaceFontName(String fontName) {
        for (String name : INTERFACE_FONT_NAMES) {
            if (fontName.startsWith(name)) {
                return true;
            }
        }
        return false;
    }

    private static boolean drawsText(Typeface typeface) {
        Boolean cached = drawsTextCache.get(typeface);
        if (cached != null) {
            return cached;
        }
        boolean result = drawsAlphabetOrDigits(typeface);
        drawsTextCache.put(typeface, result);
        return result;
    }

    static boolean drawsAlphabetOrDigits(Typeface typeface) {
        Paint paint = new Paint();
        paint.setTypeface(typeface);
        return paint.hasGlyph("a") && paint.hasGlyph("z")
                || paint.hasGlyph("A") && paint.hasGlyph("Z")
                || paint.hasGlyph("0") && paint.hasGlyph("9");
    }
}
