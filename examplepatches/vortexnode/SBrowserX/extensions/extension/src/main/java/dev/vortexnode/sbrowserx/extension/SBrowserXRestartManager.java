package dev.vortexnode.sbrowserx.extension;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/**
 * Persistent top-right circular Restart button for both Samsung Internet's native
 * SettingsActivity (including all sub-screens like Dark Mode, Layout, Privacy) and
 * all SBrowserX settings screens.
 *
 * - Idle state: subtle neutral icon matching One UI theme.
 * - Dirty state (any stock or SBrowserX preference toggled while in Settings):
 *   lights up in One UI accent blue with a soft halo and subtle pulse animation.
 * - Tapping cleanly restarts the browser process to apply engine/theme changes.
 */
public final class SBrowserXRestartManager {
    private static final String TAG = "SBrowserXRestart";
    private static final String BTN_TAG = "sbrowserx_restart_btn";

    private static volatile boolean sInitialized = false;
    private static volatile boolean sPendingRestart = false;
    private static volatile int sSettingsForegroundCount = 0;

    private static final Handler sMain = new Handler(Looper.getMainLooper());
    private static final List<WeakReference<ImageView>> sActiveButtons = new LinkedList<>();

    private static SharedPreferences.OnSharedPreferenceChangeListener sDefaultPrefListener;
    private static SharedPreferences.OnSharedPreferenceChangeListener sCustomPrefListener;

    private SBrowserXRestartManager() {}

    public static void init(Application app) {
        if (app == null || sInitialized) return;
        sInitialized = true;
        try {
            // Track foreground state across SettingsActivity and all SBrowserX*Activity screens
            app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
                @Override
                public void onActivityCreated(Activity activity, Bundle savedInstanceState) {}

                @Override
                public void onActivityStarted(Activity activity) {}

                @Override
                public void onActivityResumed(Activity activity) {
                    if (isSettingsScreen(activity)) {
                        sSettingsForegroundCount++;
                        if (isStockSettingsActivity(activity)) {
                            attachToStockSettingsToolbar(activity);
                        }
                        refreshAllButtons(false);
                    }
                }

                @Override
                public void onActivityPaused(Activity activity) {
                    if (isSettingsScreen(activity)) {
                        sSettingsForegroundCount = Math.max(0, sSettingsForegroundCount - 1);
                    }
                }

                @Override
                public void onActivityStopped(Activity activity) {}

                @Override
                public void onActivitySaveInstanceState(Activity activity, Bundle outState) {}

                @Override
                public void onActivityDestroyed(Activity activity) {}
            });

            // Listen to SBrowserX preferences
            SharedPreferences customPrefs = app.getSharedPreferences(SBrowserXPrefs.PREFS_NAME, Context.MODE_PRIVATE);
            sCustomPrefListener = new SharedPreferences.OnSharedPreferenceChangeListener() {
                @Override
                public void onSharedPreferenceChanged(SharedPreferences sp, String key) {
                    if (sSettingsForegroundCount > 0 && !isNoisyPrefKey(key)) {
                        markDirtyInternal(true);
                    }
                }
            };
            customPrefs.registerOnSharedPreferenceChangeListener(sCustomPrefListener);

            // Listen to Samsung Internet's default SharedPreferences (<pkg>_preferences)
            SharedPreferences defaultPrefs = app.getSharedPreferences(
                    app.getPackageName() + "_preferences", Context.MODE_PRIVATE);
            sDefaultPrefListener = new SharedPreferences.OnSharedPreferenceChangeListener() {
                @Override
                public void onSharedPreferenceChanged(SharedPreferences sp, String key) {
                    if (sSettingsForegroundCount > 0 && !isNoisyPrefKey(key)) {
                        markDirtyInternal(true);
                    }
                }
            };
            defaultPrefs.registerOnSharedPreferenceChangeListener(sDefaultPrefListener);
        } catch (Throwable t) {
            Log.w(TAG, "init failed", t);
        }
    }

    private static boolean isSettingsScreen(Activity act) {
        if (act == null) return false;
        String name = act.getClass().getName();
        return name.contains("SettingsActivity")
                || name.startsWith("dev.vortexnode.sbrowserx.extension.settings.");
    }

    private static boolean isStockSettingsActivity(Activity act) {
        if (act == null) return false;
        return "com.sec.android.app.sbrowser.settings.SettingsActivity".equals(act.getClass().getName());
    }

    private static boolean isNoisyPrefKey(String key) {
        if (key == null || key.isEmpty()) return true;
        String k = key.toLowerCase(java.util.Locale.ROOT);
        return k.contains("timestamp")
                || k.contains("last_ts")
                || k.contains("last_checked")
                || k.contains("search_history")
                || k.contains("recent_search")
                || k.startsWith("sa_")
                || k.contains("badge");
    }

    /** Called from bytecode hooks (e.g. Dark Mode radio/toggle) or UI listeners. */
    public static void markDirtyFromUi() {
        markDirtyInternal(true);
    }

    public static void markDirty(Context ignored) {
        markDirtyInternal(true);
    }

    public static boolean isPendingRestart() {
        return sPendingRestart;
    }

    private static void markDirtyInternal(final boolean animate) {
        sPendingRestart = true;
        sMain.post(new Runnable() {
            @Override
            public void run() {
                refreshAllButtons(animate);
            }
        });
    }

    /** Called from SettingsActivity.onResume / onConfigurationChanged bytecode hooks. */
    public static void onSettingsActivityResume(final Activity activity) {
        if (activity == null) return;
        sMain.post(new Runnable() {
            @Override
            public void run() {
                attachToStockSettingsToolbar(activity);
                refreshAllButtons(false);
            }
        });
    }

    public static void onSettingsActivityConfigChanged(final Activity activity) {
        if (activity == null) return;
        sMain.postDelayed(new Runnable() {
            @Override
            public void run() {
                attachToStockSettingsToolbar(activity);
                refreshAllButtons(false);
            }
        }, 80L);
    }

    private static void attachToStockSettingsToolbar(Activity activity) {
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) return;
        try {
            android.view.Window win = activity.getWindow();
            if (win == null) return;
            View decorObj = win.getDecorView();
            if (!(decorObj instanceof ViewGroup)) return;
            ViewGroup decor = (ViewGroup) decorObj;

            View existing = decor.findViewWithTag(BTN_TAG);
            ImageView btn;
            if (existing instanceof ImageView) {
                btn = (ImageView) existing;
            } else {
                btn = buildRestartImageView(activity);
                float d = activity.getResources().getDisplayMetrics().density;
                int size = Math.round(40 * d);
                int statusH = 0;
                int resId = activity.getResources().getIdentifier("status_bar_height", "dimen", "android");
                if (resId > 0) statusH = activity.getResources().getDimensionPixelSize(resId);
                if (statusH <= 0) statusH = Math.round(28 * d);

                android.widget.FrameLayout.LayoutParams lp = new android.widget.FrameLayout.LayoutParams(
                        size, size, Gravity.TOP | Gravity.END);
                lp.topMargin = statusH + Math.round(8 * d);
                lp.setMarginEnd(Math.round(14 * d));
                btn.setElevation(16 * d);
                decor.addView(btn, lp);
                registerButton(btn);
            }
            btn.bringToFront();
            applyButtonVisualState(btn, activity, false);
        } catch (Throwable t) {
            Log.w(TAG, "attachToStockSettingsToolbar failed", t);
        }
    }

    private static ViewGroup.LayoutParams createToolbarEndLayoutParams(ViewGroup toolbar, int size, int endMargin) {
        try {
            Class<?> lpCls = Class.forName("androidx.appcompat.widget.Toolbar$LayoutParams");
            Object lpObj = lpCls.getConstructor(int.class, int.class, int.class)
                    .newInstance(size, size, Gravity.END | Gravity.CENTER_VERTICAL);
            if (lpObj instanceof ViewGroup.MarginLayoutParams) {
                ((ViewGroup.MarginLayoutParams) lpObj).setMarginEnd(endMargin);
            }
            return (ViewGroup.LayoutParams) lpObj;
        } catch (Throwable ignored) {
            ViewGroup.MarginLayoutParams fallback = new ViewGroup.MarginLayoutParams(size, size);
            fallback.setMarginEnd(endMargin);
            return fallback;
        }
    }

    /** Attaches the same circular Restart button to the right end of any SBrowserX custom header row. */
    public static void attachToCustomHeader(Activity activity, LinearLayout header, boolean night) {
        if (activity == null || header == null) return;
        try {
            View existing = header.findViewWithTag(BTN_TAG);
            ImageView btn;
            if (existing instanceof ImageView) {
                btn = (ImageView) existing;
            } else {
                btn = buildRestartImageView(activity);
                float d = activity.getResources().getDisplayMetrics().density;
                int size = Math.round(38 * d);
                LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(size, size);
                lp.leftMargin = Math.round(6 * d);
                btn.setLayoutParams(lp);
                header.addView(btn);
                registerButton(btn);
            }
            applyButtonVisualState(btn, activity, false);
        } catch (Throwable ignored) {}
    }

    private static ImageView buildRestartImageView(final Activity activity) {
        ImageView btn = new ImageView(activity);
        btn.setTag(BTN_TAG);
        btn.setScaleType(ImageView.ScaleType.CENTER);
        btn.setClickable(true);
        btn.setFocusable(true);
        btn.setContentDescription(SBrowserXStrings.get(SBrowserXStrings.BTN_RESTART));
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                sPendingRestart = false;
                SBrowserXWebRtcManager.restartBrowser(activity);
            }
        });
        return btn;
    }

    private static void registerButton(ImageView btn) {
        synchronized (sActiveButtons) {
            Iterator<WeakReference<ImageView>> it = sActiveButtons.iterator();
            while (it.hasNext()) {
                ImageView cur = it.next().get();
                if (cur == null) {
                    it.remove();
                } else if (cur == btn) {
                    return;
                }
            }
            sActiveButtons.add(new WeakReference<>(btn));
        }
    }

    private static void refreshAllButtons(boolean animate) {
        synchronized (sActiveButtons) {
            Iterator<WeakReference<ImageView>> it = sActiveButtons.iterator();
            while (it.hasNext()) {
                ImageView btn = it.next().get();
                if (btn == null) {
                    it.remove();
                    continue;
                }
                Context ctx = btn.getContext();
                applyButtonVisualState(btn, ctx, animate);
            }
        }
    }

    private static void applyButtonVisualState(final ImageView btn, Context ctx, boolean animate) {
        if (btn == null || ctx == null) return;
        try {
            boolean night = SBrowserXHooks.isBrowserNightMode(ctx);
            boolean dirty = sPendingRestart;
            float d = ctx.getResources().getDisplayMetrics().density;

            int iconColor;
            if (dirty) {
                iconColor = night ? 0xFF4C9BFF : 0xFF2563EB;
            } else {
                iconColor = night ? 0x8AFFFFFF : 0x7A000000;
            }

            btn.setImageDrawable(new CircularRestartDrawable(d, iconColor, dirty));

            if (dirty) {
                GradientDrawable pill = new GradientDrawable();
                pill.setShape(GradientDrawable.OVAL);
                pill.setColor(night ? 0x2B4C9BFF : 0x222563EB);
                btn.setBackground(pill);
            } else {
                TypedValue ripple = new TypedValue();
                ctx.getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, ripple, true);
                if (ripple.resourceId != 0) {
                    btn.setBackgroundResource(ripple.resourceId);
                } else {
                    btn.setBackground(null);
                }
            }

            if (animate && dirty) {
                btn.animate().cancel();
                btn.setScaleX(0.92f);
                btn.setScaleY(0.92f);
                btn.animate()
                        .scaleX(1.16f)
                        .scaleY(1.16f)
                        .setDuration(140L)
                        .withEndAction(new Runnable() {
                            @Override
                            public void run() {
                                btn.animate().scaleX(1f).scaleY(1f).setDuration(140L).start();
                            }
                        })
                        .start();
            }
        } catch (Throwable ignored) {}
    }

    /** Crisp One UI-style circular restart arrow (↻) drawn natively on Canvas. */
    private static final class CircularRestartDrawable extends Drawable {
        private final float mDensity;
        private final Paint mStrokePaint;
        private final Paint mFillPaint;

        CircularRestartDrawable(float density, int color, boolean emphasized) {
            mDensity = density;
            mStrokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            mStrokePaint.setStyle(Paint.Style.STROKE);
            mStrokePaint.setStrokeWidth((emphasized ? 2.25f : 1.9f) * density);
            mStrokePaint.setStrokeCap(Paint.Cap.ROUND);
            mStrokePaint.setStrokeJoin(Paint.Join.ROUND);
            mStrokePaint.setColor(color);

            mFillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            mFillPaint.setStyle(Paint.Style.FILL);
            mFillPaint.setColor(color);
        }

        @Override
        public int getIntrinsicWidth() {
            return Math.round(22 * mDensity);
        }

        @Override
        public int getIntrinsicHeight() {
            return Math.round(22 * mDensity);
        }

        @Override
        public void draw(Canvas canvas) {
            Rect b = getBounds();
            float cx = b.exactCenterX();
            float cy = b.exactCenterY();
            float r = Math.min(b.width(), b.height()) * 0.36f;

            RectF arc = new RectF(cx - r, cy - r, cx + r, cy + r);
            // Clockwise 285-degree arc ending near 1:30 o'clock (-50 deg)
            canvas.drawArc(arc, 25f, 285f, false, mStrokePaint);

            // Clean triangular arrowhead at the end of the arc (-50 degrees)
            double endRad = Math.toRadians(-50.0);
            float tipX = (float) (cx + r * Math.cos(endRad));
            float tipY = (float) (cy + r * Math.sin(endRad));
            float headLen = 4.6f * mDensity;

            // Tangent direction for clockwise arc at -50 deg is +40 deg
            double tangRad = Math.toRadians(40.0);
            float backX = (float) (tipX - headLen * Math.cos(tangRad));
            float backY = (float) (tipY - headLen * Math.sin(tangRad));

            float perpX = (float) (-Math.sin(tangRad) * headLen * 0.62f);
            float perpY = (float) (Math.cos(tangRad) * headLen * 0.62f);

            Path head = new Path();
            head.moveTo(tipX + (float) (1.2f * mDensity * Math.cos(tangRad)),
                    tipY + (float) (1.2f * mDensity * Math.sin(tangRad)));
            head.lineTo(backX + perpX, backY + perpY);
            head.lineTo(backX - perpX, backY - perpY);
            head.close();
            canvas.drawPath(head, mFillPaint);
        }

        @Override
        public void setAlpha(int alpha) {
            mStrokePaint.setAlpha(alpha);
            mFillPaint.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            mStrokePaint.setColorFilter(colorFilter);
            mFillPaint.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            return PixelFormat.TRANSLUCENT;
        }
    }
}
