/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.download;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;

import com.instagram.common.session.UserSession;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.SettingsStatus;
import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.instagram.settings.preference.widgets.RexIcon;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/**
 * Reels UFI action column buttons (Direct Download + Reels Settings/Options).
 * Placed at the top of the right-side action rail (Download at index 0, Quick Settings at index 1
 * immediately above the native Like/Heart control) with optical icon sizing matched to the native Heart glyph.
 */
public final class ReelDownload {
    private static final String DRAWABLE_DOWNLOAD_ICON = "instagram_download_outline_44";
    private static final String ICON_TINT_ATTRIBUTE = "igds_color_primary_button_on_media";
    private static final Set<Object> COPIES = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));
    private static final Set<Object> OPTIONS_COPIES = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));

    private static final int MODE_DOWNLOAD = 1;
    private static final int MODE_OPTIONS = 2;

    private ReelDownload() {}

    public static boolean isEnabled() {
        return SettingsStatus.reelDownloadButton
                && Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.ENABLE_DOWNLOAD))
                && Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.REEL_DOWNLOAD_BUTTON));
    }

    public static boolean isOptionsEnabled() {
        return SettingsStatus.reelDownloadButton
                && (Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.REEL_OPTIONS_BUTTON)) || Pref.reelsFloatingToolbar());
    }

    public static void register(Object component) {
        if (component != null) {
            COPIES.add(component);
        }
    }

    public static void registerOptions(Object component) {
        if (component != null) {
            OPTIONS_COPIES.add(component);
        }
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    public static void addDownloadAtTop(Object collector, Object component) {
        insertIntoCollector(collector, component, 0);
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    public static void addOptionsAboveHeart(Object collector, Object component) {
        int targetIndex = isEnabled() ? 1 : 0;
        insertIntoCollector(collector, component, targetIndex);
    }

    @SuppressWarnings({"unchecked", "rawtypes"})
    private static void insertIntoCollector(Object collector, Object component, int desiredIndex) {
        if (collector == null || component == null) return;
        try {
            if (collector instanceof List) {
                List list = (List) collector;
                int idx = Math.max(0, Math.min(desiredIndex, list.size()));
                list.add(idx, component);
                return;
            }
            if (collector instanceof Collection) {
                ((Collection) collector).add(component);
                return;
            }
            for (Class<?> c = collector.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (Field f : c.getDeclaredFields()) {
                    if (List.class.isAssignableFrom(f.getType())) {
                        f.setAccessible(true);
                        Object inner = f.get(collector);
                        if (inner instanceof List) {
                            List list = (List) inner;
                            int idx = Math.max(0, Math.min(desiredIndex, list.size()));
                            list.add(idx, component);
                            return;
                        }
                    }
                }
            }
            Method addMethod = collector.getClass().getMethod("add", Object.class);
            addMethod.invoke(collector, component);
        } catch (Throwable t) {
            Logger.printException(() -> "insertIntoCollector failure", t);
        }
    }

    private static final ThreadLocal<Copy> CURRENT = new ThreadLocal<>();

    private static final class Copy {
        final Context context;
        final UserSession userSession;
        final Object component;
        final ColorFilter tint;
        final int mode;

        Copy(Context context, UserSession userSession, Object component, ColorFilter tint, int mode) {
            this.context = context;
            this.userSession = userSession;
            this.component = component;
            this.tint = tint;
            this.mode = mode;
        }
    }

    public static void begin(Object component, Object composer) {
        if (COPIES.contains(component)) {
            CURRENT.set(new Copy(context(composer), session(component), component, tint(component), MODE_DOWNLOAD));
        } else if (OPTIONS_COPIES.contains(component)) {
            CURRENT.set(new Copy(context(composer), session(component), component, tint(component), MODE_OPTIONS));
        } else {
            CURRENT.set(null);
        }
    }

    public static void end() {
        CURRENT.remove();
    }

    public static Drawable icon(Drawable original) {
        Copy copy = CURRENT.get();
        if (copy == null) return original;
        Context context = copy.context;
        ColorFilter filter = copy.tint != null ? copy.tint : safeThemeTint(context);
        if (copy.mode == MODE_OPTIONS) {
            int intrinsic = original != null && original.getIntrinsicWidth() > 0
                    ? original.getIntrinsicWidth()
                    : dp(context, 28);
            Drawable settingsDrawable = new OpticalReelIconDrawable(context, true, intrinsic);
            if (filter != null) settingsDrawable.setColorFilter(filter);
            return settingsDrawable;
        }
        int drawableId = ResourceUtils.getIdentifier(context, ResourceType.DRAWABLE, DRAWABLE_DOWNLOAD_ICON);
        if (drawableId == 0) {
            int intrinsic = original != null && original.getIntrinsicWidth() > 0
                    ? original.getIntrinsicWidth()
                    : dp(context, 28);
            Drawable fallback = new OpticalReelIconDrawable(context, false, intrinsic);
            if (filter != null) fallback.setColorFilter(filter);
            return fallback;
        }
        Drawable drawable = context.getDrawable(drawableId).mutate();
        drawable.setColorFilter(filter != null ? filter : themeTint(copy.context));
        return drawable;
    }

    /**
     * Custom vector drawable for the Reels Litho rail that preserves optical inset padding inside
     * getBounds() so Litho's FIT_CENTER/FIT_XY scaling matches the exact visual diameter and 1.9dp
     * stroke weight of Instagram's native Heart/Download icons (fixing 23115.png and 23127.png).
     */
    private static final class OpticalReelIconDrawable extends Drawable {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final boolean isOptions;
        private final int intrinsicSize;
        private final float strokePx;

        OpticalReelIconDrawable(Context context, boolean isOptions, int intrinsicSize) {
            this.isOptions = isOptions;
            this.intrinsicSize = Math.max(dp(context, 24), intrinsicSize);
            this.strokePx = TypedValue.applyDimension(
                    TypedValue.COMPLEX_UNIT_DIP, 1.9f, context.getResources().getDisplayMetrics());
            paint.setColor(Color.WHITE);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeWidth(strokePx);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
        }

        @Override
        public int getIntrinsicWidth() {
            return intrinsicSize;
        }

        @Override
        public int getIntrinsicHeight() {
            return intrinsicSize;
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            if (b.isEmpty()) return;
            float cx = b.exactCenterX();
            float cy = b.exactCenterY();
            // Match the exact optical footprint of the native Heart icon (~64% of the Litho box)
            float radius = Math.min(b.width(), b.height()) * 0.31f;

            if (isOptions) {
                // Crisp rounded hexagon nut with inner ring (matches 23086.png & 23115.png spec)
                Path hex = new Path();
                for (int i = 0; i < 6; i++) {
                    double angle = Math.toRadians(-90.0 + i * 60.0);
                    float x = cx + (float) (radius * Math.cos(angle));
                    float y = cy + (float) (radius * Math.sin(angle));
                    if (i == 0) hex.moveTo(x, y);
                    else hex.lineTo(x, y);
                }
                hex.close();
                canvas.drawPath(hex, paint);
                canvas.drawCircle(cx, cy, radius * 0.33f, paint);
            } else {
                // Crisp download arrow + tray
                float topY = cy - radius * 0.85f;
                float arrowTipY = cy + radius * 0.35f;
                float wing = radius * 0.52f;
                canvas.drawLine(cx, topY, cx, arrowTipY, paint);
                canvas.drawLine(cx - wing, arrowTipY - wing * 0.85f, cx, arrowTipY, paint);
                canvas.drawLine(cx + wing, arrowTipY - wing * 0.85f, cx, arrowTipY, paint);

                float trayY = cy + radius * 0.82f;
                float trayHalfW = radius * 0.85f;
                float trayLipY = cy + radius * 0.42f;
                Path tray = new Path();
                tray.moveTo(cx - trayHalfW, trayLipY);
                tray.lineTo(cx - trayHalfW, trayY);
                tray.lineTo(cx + trayHalfW, trayY);
                tray.lineTo(cx + trayHalfW, trayLipY);
                canvas.drawPath(tray, paint);
            }
        }

        @Override
        public void setAlpha(int alpha) {
            paint.setAlpha(alpha);
            invalidateSelf();
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            paint.setColorFilter(colorFilter);
            invalidateSelf();
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }

    private static int dp(Context context, int dp) {
        if (context == null) return dp * 3;
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, dp, context.getResources().getDisplayMetrics()));
    }

    private static ColorFilter safeThemeTint(Context context) {
        try {
            return themeTint(context);
        } catch (Throwable ignored) {
            return new PorterDuffColorFilter(Color.WHITE, PorterDuff.Mode.SRC_IN);
        }
    }

    private static ColorFilter themeTint(Context context) {
        if (context == null) throw new IllegalStateException("Reel download icon has no themed context");
        int attrId = ResourceUtils.getAttrIdentifier(ICON_TINT_ATTRIBUTE);
        TypedValue value = new TypedValue();
        if (attrId == 0 || !context.getTheme().resolveAttribute(attrId, value, true)) {
            throw new IllegalStateException("Unresolved theme attribute " + ICON_TINT_ATTRIBUTE);
        }
        int color = value.resourceId != 0 ? context.getColor(value.resourceId) : value.data;
        return new PorterDuffColorFilter(color, PorterDuff.Mode.SRC_IN);
    }

    public static boolean selected(boolean original) {
        return CURRENT.get() == null && original;
    }

    public static CharSequence description(CharSequence original) {
        Copy copy = CURRENT.get();
        if (copy == null) return original;
        return copy.mode == MODE_OPTIONS ? "InstaRex Reel Options & Settings" : str("rex_download_current_media");
    }

    public static int viewId(int original) {
        Copy copy = CURRENT.get();
        if (copy == null) return original;
        return copy.mode == MODE_OPTIONS ? -2 : -1;
    }

    public static Function1<Object, Object> click(Function1<Object, Object> original) {
        Copy copy = CURRENT.get();
        if (copy == null) return original;
        if (copy.mode == MODE_OPTIONS) {
            return new OptionsClick(copy);
        }
        return new DownloadClick(copy);
    }

    public static Function1<Object, Object> longClick(Function1<Object, Object> original) {
        Copy copy = CURRENT.get();
        if (copy == null) return original;
        if (copy.mode == MODE_OPTIONS) {
            return ignored -> {
                app.morphe.extension.instagram.settings.preference.widgets.RexHaptics.longPress(copy.context);
                RexDialogs.showSurfaceQuickSettingsDialog(copy.context, "REEL");
                return Boolean.TRUE;
            };
        }
        return ignored -> {
            app.morphe.extension.instagram.settings.preference.widgets.RexHaptics.longPress(copy.context);
            return DownloadUtils.onPostDownloadLongClick(copy.context, copy.userSession,
                    media(copy.component), currentIndex(copy.component));
        };
    }

    private static void download(Copy copy) {
        try {
            Context context = copy.context;
            UserSession userSession = copy.userSession;
            Object media = media(copy.component);
            if (context == null) throw new IllegalStateException("Reel download has no context");
            if (userSession == null) throw new IllegalStateException("Reel download has no user session");
            if (media == null) throw new IllegalStateException("Reel download has no media");
            DownloadUtils.downloadPost(context, userSession, media, currentIndex(copy.component));
        } catch (Exception e) {
            Logger.printException(() -> "Error at reel download", e);
            Utils.showToastShort("Couldn't load reel download options. Try again.");
        }
    }

    private static void openOptions(Copy copy) {
        try {
            Context context = copy.context;
            UserSession userSession = copy.userSession;
            Object media = media(copy.component);
            if (context == null) throw new IllegalStateException("Reel options has no context");
            if (media == null) {
                RexDialogs.showSurfaceQuickSettingsDialog(context, "REEL");
                return;
            }
            RexDialogs.showPostOptionsSheet(context, userSession, media, currentIndex(copy.component));
        } catch (Exception e) {
            Logger.printException(() -> "Error at reel options", e);
            Utils.showToastShort("Couldn't load reel options. Try again.");
        }
    }

    private static final class DownloadClick implements Function1<Object, Object> {
        private final Copy copy;

        DownloadClick(Copy copy) {
            this.copy = copy;
        }

        @Override
        public Object invoke(Object ignored) {
            app.morphe.extension.instagram.settings.preference.widgets.RexHaptics.tap(copy.context);
            download(copy);
            return Unit.INSTANCE;
        }
    }

    private static final class OptionsClick implements Function1<Object, Object> {
        private final Copy copy;

        OptionsClick(Copy copy) {
            this.copy = copy;
        }

        @Override
        public Object invoke(Object ignored) {
            app.morphe.extension.instagram.settings.preference.widgets.RexHaptics.tap(copy.context);
            openOptions(copy);
            return Unit.INSTANCE;
        }
    }

    static Object media(Object saveComponent) {
        return null;
    }

    static int currentIndex(Object saveComponent) {
        return 0;
    }

    static UserSession session(Object saveComponent) {
        return null;
    }

    static ColorFilter tint(Object saveComponent) {
        return null;
    }

    static Context context(Object composer) {
        return null;
    }
}
