package dev.vortexnode.sbrowserx.extension;

import android.app.Activity;
import android.app.Dialog;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import java.lang.reflect.Proxy;
import android.widget.TextView;
import android.widget.ImageView;
import android.view.ViewGroup;
import android.view.MenuItem;
import android.view.Menu;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.content.res.Configuration;
import android.graphics.Shader;
import android.graphics.Paint;
import android.graphics.LinearGradient;
import android.graphics.Color;
import android.graphics.Canvas;
import android.graphics.Bitmap;
import android.os.Process;
import android.util.Log;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;

import dev.vortexnode.sbrowserx.extension.settings.SBrowserXTranslateSettingsActivity;
import dev.vortexnode.sbrowserx.extension.settings.SBrowserXExtensionsActivity;

public final class SBrowserXHooks {
    private static final String TAG = "SBrowserXHooks";

    // --- v1.0.0: Hot-path Reflection Caches (Zero per-frame Class.forName / getMethod overhead) ---
    private static volatile Object sDmuInstance;
    private static volatile Method sDmuIsDarkMode;
    private static volatile Method sDmuIsNightMode;
    private static volatile Method sDmuIsHighContrast;
    private static volatile Method sDmuIsApplyDefaultDark;
    private static volatile boolean sDmuInitDone;

    private static volatile Object sDfuInstance;
    private static volatile Method sDfuIsCompact;
    private static volatile boolean sDfuInitDone;

    private static volatile Method sDluIsFocus;
    private static volatile Method sDluIsLandscapeOrTablet;
    private static volatile boolean sDluInitDone;

    private static volatile Field sCompactFieldOffset;
    private static volatile Field sCompactFieldTopBar;
    private static volatile Method sCompactMethodShowTopBar;
    private static volatile Object sBitmapLayerBottom;
    private static volatile Class<?> sBitmapLayerEnumCls;
    private static volatile Method sTabMethodUpdateBitmapLayer;
    private static volatile Method sTabMethodIsFullScreen;
    private static volatile Method sTabMethodIsLoading;
    private static volatile Class<?> sCachedTabDelegateCls;

    private static volatile Field sFieldTabWebDarkHandler;
    private static volatile Method sMethodWebDarkEvalJs;

    private static volatile Method sActGetCurrentTab;
    private static volatile Method sTabIsNewQuickAccess;
    private static volatile Method sTabGetUrl;
    private static volatile String sCachedBackdropKey;
    private static volatile Bitmap sCachedBackdropBitmap;
    private static volatile boolean sStartPageBackdropActive;

    private static volatile boolean sSemBlurInitDone;
    private static volatile boolean sSemBlurUnsupported;
    private static volatile int sSemBlurModeWindow;
    private static volatile java.lang.reflect.Constructor<?> sSemBlurBuilderCtor;
    private static volatile Method sSemBlurSetRadius;
    private static volatile Method sSemBlurSetBgColor;
    private static volatile Method sSemBlurSetCornerRadius;
    private static volatile Method sSemBlurBuild;
    private static volatile Method sMajoSetBlurInfo;
    private static volatile Method sViewUtilClearBlur;
    private static volatile boolean sViewUtilClearBlurInitDone;

    private static void ensureDarkModeUtilsCache() {
        if (sDmuInitDone) return;
        sDmuInitDone = true;
        try {
            Class<?> dmu = Class.forName("com.sec.android.app.sbrowser.common.device.DarkModeUtils");
            sDmuInstance = dmu.getMethod("getInstance").invoke(null);
            sDmuIsDarkMode = dmu.getMethod("isDarkModeEnabled");
            sDmuIsNightMode = dmu.getMethod("isNightModeEnabled");
            sDmuIsHighContrast = dmu.getMethod("isHighContrastModeEnabled");
            sDmuIsApplyDefaultDark = dmu.getMethod("isApplyDefaultDarkModeEnabled");
        } catch (Throwable ignored) {}
    }
    private static volatile Object sActiveTransService;
    private static volatile WeakReference<Activity> sMainActivityRef = new WeakReference<>(null);

    private SBrowserXHooks() {}

    private static boolean isMainBrowserProcess() {
        try {
            if (Process.isIsolated()) return false;
            String processName = Application.getProcessName();
            return processName == null || !processName.contains(":");
        } catch (Throwable t) {
            return false;
        }
    }

    public static void onApplicationCreate(Application app) {
        if (app == null || !isMainBrowserProcess()) return;
        try {
            SBrowserXPrefs.init(app);
            SBrowserXRestartManager.init(app);
            SBrowserXWebRtcManager.applyToProfile(app);
            SBrowserXBackupManager.runAutoBackupIfDue(app);
            SBrowserXStartPageServer.ensureStarted(app);
        } catch (Throwable t) {
            Log.e(TAG, "onApplicationCreate failed", t);
        }
    }

    private static final String COMPACT_STATUS_SCRIM_TAG = "sbrowserx_compact_status_scrim";
    private static volatile boolean sInCommandLineInit = false;
    private static int sLastMainWindowBgColor = 0;

    public static void onMainActivityResume(Activity activity) {
        if (activity != null) {
            sMainActivityRef = new WeakReference<>(activity);
            applyCompactSystemBarPolish(activity);
            ensureTerraceAutofillEnabled(activity);
        }
    }

    public static boolean tryOpenNativeExtensionsManager(Activity activity, String extensionId) {
        // Only intercept the Extensions popup gear icon (null/empty extensionId); keep specific ?id=... WebUI intact
        if (activity == null || (extensionId != null && !extensionId.isEmpty())) return false;
        try {
            Intent intent = new Intent(activity, dev.vortexnode.sbrowserx.extension.settings.SBrowserXExtensionsActivity.class);
            activity.startActivity(intent);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    private static boolean isWindowOnQuickAccess(android.view.Window window) {
        try {
            Activity act = sMainActivityRef.get();
            if (act == null || act.isFinishing() || act.isDestroyed()) return false;
            if (window != null && act.getWindow() != window) return false;
            Method getTab = sActGetCurrentTab;
            if (getTab == null || !getTab.getDeclaringClass().isInstance(act)) {
                getTab = act.getClass().getMethod("getCurrentTab");
                sActGetCurrentTab = getTab;
            }
            Object tab = getTab.invoke(act);
            if (tab == null) return false;
            Method isQa = sTabIsNewQuickAccess;
            if (isQa == null || !isQa.getDeclaringClass().isInstance(tab)) {
                isQa = tab.getClass().getMethod("isNewQuickAccessPage");
                sTabIsNewQuickAccess = isQa;
            }
            if (Boolean.TRUE.equals(isQa.invoke(tab))) return true;
            Method getUrl = sTabGetUrl;
            if (getUrl == null || !getUrl.getDeclaringClass().isInstance(tab)) {
                getUrl = tab.getClass().getMethod("getUrl");
                sTabGetUrl = getUrl;
            }
            Object urlObj = getUrl.invoke(tab);
            return urlObj instanceof String && isStartPageOmniboxUrl((String) urlObj);
        } catch (Throwable ignored) {}
        return false;
    }

    private static void syncMainWindowBackground(android.view.Window window, int color) {
        if (window == null || color == 0) return;
        if (sStartPageBackdropActive) return;
        try {
            if (sLastMainWindowBgColor != color) {
                sLastMainWindowBgColor = color;
                window.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(color));
            }
        } catch (Throwable ignored) {}
    }

    private static final class CenterCropWallpaperDrawable extends android.graphics.drawable.Drawable {
        private final Bitmap bmp;
        private final int dimAlpha;
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);

        CenterCropWallpaperDrawable(Bitmap bmp, int dimPercent) {
            this.bmp = bmp;
            this.dimAlpha = Math.max(0, Math.min(255, Math.round(dimPercent * 2.55f)));
        }

        @Override
        public void draw(Canvas canvas) {
            android.graphics.Rect b = getBounds();
            if (b.width() <= 0 || b.height() <= 0) return;
            if (bmp != null && !bmp.isRecycled()) {
                int bw = bmp.getWidth();
                int bh = bmp.getHeight();
                if (bw > 0 && bh > 0) {
                    float scale = Math.max((float) b.width() / bw, (float) b.height() / bh);
                    float dw = bw * scale;
                    float dh = bh * scale;
                    float left = b.left + (b.width() - dw) * 0.5f;
                    float top = b.top + (b.height() - dh) * 0.5f;
                    android.graphics.RectF dst = new android.graphics.RectF(left, top, left + dw, top + dh);
                    canvas.drawBitmap(bmp, null, dst, paint);
                }
            } else {
                canvas.drawColor(0xFF000000);
            }
            if (dimAlpha > 0) {
                canvas.drawColor(Color.argb(dimAlpha, 0, 0, 0));
            }
        }

        @Override public void setAlpha(int alpha) { paint.setAlpha(alpha); }
        @Override public void setColorFilter(android.graphics.ColorFilter cf) { paint.setColorFilter(cf); }
        @Override public int getOpacity() { return android.graphics.PixelFormat.OPAQUE; }
    }

    private static Bitmap loadStartPageBackdropBitmap(Context ctx, java.io.File file) {
        try {
            String key = file.getAbsolutePath() + ":" + file.lastModified() + ":" + file.length();
            if (key.equals(sCachedBackdropKey) && sCachedBackdropBitmap != null && !sCachedBackdropBitmap.isRecycled()) {
                return sCachedBackdropBitmap;
            }
            android.graphics.BitmapFactory.Options opts = new android.graphics.BitmapFactory.Options();
            opts.inJustDecodeBounds = true;
            android.graphics.BitmapFactory.decodeFile(file.getAbsolutePath(), opts);
            int maxDim = 1440;
            int sample = 1;
            while (opts.outWidth / sample > maxDim || opts.outHeight / sample > maxDim) {
                sample *= 2;
            }
            android.graphics.BitmapFactory.Options dec = new android.graphics.BitmapFactory.Options();
            dec.inSampleSize = sample;
            dec.inPreferredConfig = Bitmap.Config.RGB_565;
            Bitmap bmp = android.graphics.BitmapFactory.decodeFile(file.getAbsolutePath(), dec);
            if (bmp != null) {
                sCachedBackdropKey = key;
                sCachedBackdropBitmap = bmp;
            }
            return bmp;
        } catch (Throwable ignored) {
            return null;
        }
    }

    public static void syncStartPageWindowBackdrop(final boolean onStartPage) {
        try {
            final Activity act = sMainActivityRef.get();
            if (act == null || act.isFinishing() || act.isDestroyed()) return;
            act.runOnUiThread(() -> {
                try {
                    android.view.Window win = act.getWindow();
                    if (win == null) return;
                    if (onStartPage) {
                        String mode = SBrowserXPrefs.getStartPageWallpaperMode(act);
                        java.io.File wpFile = null;
                        if (SBrowserXStartPageServer.WALLPAPER_LOCAL.equals(mode)) {
                            wpFile = SBrowserXStartPageServer.getLocalWallpaperFile(act);
                        } else if (SBrowserXStartPageServer.WALLPAPER_ONLINE.equals(mode)) {
                            wpFile = SBrowserXStartPageServer.getOnlineWallpaperFile(act);
                        }
                        if (wpFile != null && wpFile.exists() && wpFile.length() > 0L) {
                            Bitmap bmp = loadStartPageBackdropBitmap(act, wpFile);
                            if (bmp != null) {
                                int dim = SBrowserXPrefs.getStartPageWallpaperDim(act);
                                sStartPageBackdropActive = true;
                                sLastMainWindowBgColor = 0;
                                win.setBackgroundDrawable(new CenterCropWallpaperDrawable(bmp, dim));
                                win.setNavigationBarColor(0x00000000);
                                win.setStatusBarColor(0x00000000);
                                return;
                            }
                        }
                    }
                    if (sStartPageBackdropActive) {
                        sStartPageBackdropActive = false;
                        sLastMainWindowBgColor = 0;
                        boolean night = isBrowserNightMode(act);
                        int c = night ? (isAmoledBlackEnabled() ? 0xFF000000 : 0xFF121212) : 0xFFFFFFFF;
                        win.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(c));
                        sLastMainWindowBgColor = c;
                    }
                } catch (Throwable ignored) {}
            });
        } catch (Throwable ignored) {}
    }

    private static void syncSystemBarIconAppearance(android.view.Window window, boolean darkBg) {
        if (window == null) return;
        try {
            if (android.os.Build.VERSION.SDK_INT >= 30) {
                android.view.WindowInsetsController wic = window.getInsetsController();
                if (wic != null) {
                    int mask = android.view.WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                    wic.setSystemBarsAppearance(darkBg ? 0 : mask, mask);
                }
            }
        } catch (Throwable ignored) {}
    }

    public static int adjustApi35NavBarColor(android.view.Window window, int stockColor) {
        try {
            if (window != null) {
                if (android.os.Build.VERSION.SDK_INT >= 28) {
                    window.setNavigationBarDividerColor(0x00000000);
                }
                if (android.os.Build.VERSION.SDK_INT >= 29) {
                    window.setNavigationBarContrastEnforced(false);
                }
            }
            Context ctx = window != null ? window.getContext() : SBrowserXPrefs.getAppContext();
            boolean night = isBrowserNightMode(ctx);
            if (isCompactLayoutActive()) {
                syncSystemBarIconAppearance(window, night);
                clearSystemBarFadeWindow(window);
                if (window != null && window.getDecorView() != null) {
                    final android.view.Window wRef = window;
                    window.getDecorView().post(() -> clearSystemBarFadeWindow(wRef));
                }
                if (isWindowOnQuickAccess(window)) {
                    return 0x00000000;
                }
                int c = night
                        ? (isAmoledBlackEnabled() ? 0xFF000000 : 0xFF121212)
                        : 0xFFFFFFFF;
                syncMainWindowBackground(window, c);
                return c;
            }
            if (night) {
                return isAmoledBlackEnabled() ? 0xFF000000 : 0xFF141418;
            }
        } catch (Throwable ignored) {}
        return stockColor;
    }

    public static boolean adjustApi35NavBarDarkIconFlag(boolean stockDarkIcon) {
        try {
            if (isCompactLayoutActive()) {
                Context ctx = SBrowserXPrefs.getAppContext();
                return !isBrowserNightMode(ctx);
            }
        } catch (Throwable ignored) {}
        return stockDarkIcon;
    }

    public static int adjustApi35StatusBarColor(android.view.Window window, int stockColor) {
        try {
            if (window != null && android.os.Build.VERSION.SDK_INT >= 29) {
                window.setStatusBarContrastEnforced(false);
            }
            Context ctx = window != null ? window.getContext() : SBrowserXPrefs.getAppContext();
            if (isCompactLayoutActive()) {
                clearSystemBarFadeWindow(window);
                if (window != null && window.getDecorView() != null) {
                    final android.view.Window wRef = window;
                    window.getDecorView().post(() -> clearSystemBarFadeWindow(wRef));
                }
                if (isWindowOnQuickAccess(window)) {
                    return 0x00000000;
                }
                int c = isBrowserNightMode(ctx)
                        ? (isAmoledBlackEnabled() ? 0xFF000000 : 0xFF121212)
                        : 0xFFFFFFFF;
                syncMainWindowBackground(window, c);
                return c;
            }
            if (isBrowserNightMode(ctx)) {
                return isAmoledBlackEnabled() ? 0xFF000000 : 0xFF141418;
            }
        } catch (Throwable ignored) {}
        return stockColor;
    }

    public static void clearSystemBarFadeContext(Context ctx) {
        if (ctx == null) return;
        try {
            Activity act = null;
            if (ctx instanceof Activity) {
                act = (Activity) ctx;
            } else {
                Class<?> au = Class.forName("com.sec.android.app.sbrowser.common.device.ActivityUtil");
                Object a = au.getMethod("getActivity", Context.class).invoke(null, ctx);
                if (a instanceof Activity) act = (Activity) a;
            }
            if (act != null) {
                clearSystemBarFadeWindow(act.getWindow());
            }
        } catch (Throwable ignored) {}
    }

    public static void clearSystemBarFadeWindow(android.view.Window win) {
        if (win == null) return;
        try {
            if (android.os.Build.VERSION.SDK_INT >= 28) {
                win.setNavigationBarDividerColor(0x00000000);
            }
            if (android.os.Build.VERSION.SDK_INT >= 29) {
                win.setNavigationBarContrastEnforced(false);
                win.setStatusBarContrastEnforced(false);
            }
            View decor = win.getDecorView();
            if (decor == null) return;
            Context ctx = win.getContext();
            String pkg = ctx != null ? ctx.getPackageName() : null;
            if (pkg == null) return;
            for (String idName : new String[] {
                    "navigation_bar_background_for_multi_tab",
                    "status_bar_background_for_multi_tab",
                    "toolbar_shadow"
            }) {
                int id = ctx.getResources().getIdentifier(idName, "id", pkg);
                if (id != 0) {
                    View barView = decor.findViewById(id);
                    if (barView != null) {
                        barView.setBackgroundColor(0x00000000);
                        barView.setVisibility(View.GONE);
                    }
                }
            }
            if (decor instanceof android.view.ViewGroup && isCompactLayoutActive()) {
                sweepCompactBarOverlays(decor, ctx, pkg);
            }
        } catch (Throwable ignored) {}
    }

    private static void sweepCompactBarOverlays(View root, Context ctx, String pkg) {
        if (!(root instanceof android.view.ViewGroup) || ctx == null || pkg == null) return;
        android.view.ViewGroup decor = (android.view.ViewGroup) root;
        int decorW = decor.getWidth();
        int decorH = decor.getHeight();
        float density = ctx.getResources().getDisplayMetrics().density;
        int maxBarH = Math.round(120f * density);
        int edgeTol = Math.round(12f * density);
        int navId = ctx.getResources().getIdentifier("navigation_bar_background", "id", pkg);
        int statusId = ctx.getResources().getIdentifier("status_bar_background", "id", pkg);
        int mainLayoutId = ctx.getResources().getIdentifier("main_layout", "id", pkg);
        int contentLayoutId = ctx.getResources().getIdentifier("content_layout", "id", pkg);
        int tabHolderId = ctx.getResources().getIdentifier("sbrowser_tab_holder", "id", pkg);
        int toolbarId = ctx.getResources().getIdentifier("toolbar_main_layout", "id", pkg);
        int bottombarId = ctx.getResources().getIdentifier("bottombar_layout", "id", pkg);
        int bottombarMainId = ctx.getResources().getIdentifier("bottombar_main_layout", "id", pkg);
        int toolbarCompactId = ctx.getResources().getIdentifier("toolbar_compact", "id", pkg);

        java.util.ArrayDeque<View> queue = new java.util.ArrayDeque<>();
        queue.add(decor);
        while (!queue.isEmpty()) {
            View v = queue.poll();
            if (v == null) continue;
            if (v != decor) {
                int vid = v.getId();
                boolean protectedId = (vid == android.R.id.content || vid == navId || vid == statusId
                        || vid == mainLayoutId || vid == contentLayoutId || vid == tabHolderId
                        || vid == toolbarCompactId);
                if (vid == android.R.id.navigationBarBackground || vid == android.R.id.statusBarBackground) {
                    v.setBackgroundColor(0x00000000);
                    v.setVisibility(View.GONE);
                } else if (!protectedId) {
                    android.graphics.drawable.Drawable bg = v.getBackground();
                    android.graphics.drawable.Drawable fg = v.getForeground();
                    boolean isOverlayBg = isSuspiciousOverlayDrawable(bg);
                    boolean isOverlayFg = isSuspiciousOverlayDrawable(fg);
                    if (isOverlayBg || isOverlayFg) {
                        int vw = v.getWidth();
                        int vh = v.getHeight();
                        int[] loc = new int[2];
                        v.getLocationInWindow(loc);
                        int bottom = loc[1] + vh;
                        boolean isDecorDirect = (v.getParent() == decor && !(v instanceof android.view.ViewGroup));
                        boolean isBottomStrip = (decorW > 0 && decorH > 0
                                && vw >= (decorW * 9) / 10
                                && vh > 0 && vh <= maxBarH
                                && (bottom >= decorH - edgeTol || loc[1] <= edgeTol));
                        if (isDecorDirect || isBottomStrip) {
                            if (isOverlayBg) v.setBackgroundColor(0x00000000);
                            if (isOverlayFg) v.setForeground(null);
                            if (!(v instanceof android.view.ViewGroup)) {
                                v.setVisibility(View.GONE);
                            }
                        }
                    }
                }
            }
            if (v instanceof android.view.ViewGroup) {
                android.view.ViewGroup vg = (android.view.ViewGroup) v;
                int cnt = vg.getChildCount();
                for (int i = 0; i < cnt; i++) {
                    queue.add(vg.getChildAt(i));
                }
            }
        }
    }

    private static boolean isSuspiciousOverlayDrawable(android.graphics.drawable.Drawable d) {
        if (d == null) return false;
        return (d instanceof android.graphics.drawable.GradientDrawable
                || d instanceof android.graphics.drawable.BitmapDrawable
                || d instanceof android.graphics.drawable.LayerDrawable
                || d instanceof android.graphics.drawable.NinePatchDrawable
                || d instanceof android.graphics.drawable.InsetDrawable
                || d instanceof android.graphics.drawable.StateListDrawable
                || d instanceof android.graphics.drawable.DrawableWrapper);
    }

    private static boolean hasActiveSystemAutofillService(Context ctx) {
        Context[] candidates = new Context[] { ctx, sMainActivityRef.get(), SBrowserXPrefs.getAppContext() };
        for (Context c : candidates) {
            if (c == null) continue;
            try {
                android.view.autofill.AutofillManager afm = c.getSystemService(android.view.autofill.AutofillManager.class);
                if (afm != null && afm.isEnabled()) {
                    return true;
                }
            } catch (Throwable ignored) {}
        }
        return false;
    }

    public static boolean shouldUseTerraceAutofill(View view, boolean stockPersonalDataSyncFlag) {
        if (!sTerracePersonalDataSyncSynced) {
            ensureTerraceAutofillEnabled(view != null ? view.getContext() : null);
        }
        if (stockPersonalDataSyncFlag) return true;
        return hasActiveSystemAutofillService(view != null ? view.getContext() : null);
    }

    public static boolean adjustImportantForAutofill(View view, boolean stockImportant) {
        if (stockImportant) return true;
        return hasActiveSystemAutofillService(view != null ? view.getContext() : null);
    }

    public static boolean shouldHideMultiTabNavFade(View view, boolean forMultiTab) {
        return forMultiTab && isCompactLayoutActive();
    }

    private static volatile boolean sTerracePersonalDataSyncSynced = false;
    private static volatile boolean sTerraceAutofillRetryPosted = false;

    private static boolean isTerraceInitialized() {
        try {
            Class<?> helperCls = Class.forName("com.sec.terrace.TerraceHelper");
            Object helper = helperCls.getMethod("getInstance").invoke(null);
            if (helper == null) return false;
            return Boolean.TRUE.equals(helperCls.getMethod("isInitialized").invoke(helper));
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static void ensureTerraceAutofillEnabled(Context ctx) {
        if (sTerracePersonalDataSyncSynced) return;
        if (!hasActiveSystemAutofillService(ctx)) return;
        if (!isTerraceInitialized()) {
            if (!sTerraceAutofillRetryPosted) {
                sTerraceAutofillRetryPosted = true;
                try {
                    new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(() -> {
                        sTerraceAutofillRetryPosted = false;
                        ensureTerraceAutofillEnabled(null);
                    }, 800L);
                } catch (Throwable ignored) {
                    sTerraceAutofillRetryPosted = false;
                }
            }
            return;
        }
        try {
            Class<?> bridge = Class.forName("com.sec.terrace.browser.prefs.TerracePrefServiceBridge");
            Method setSyncFlag = bridge.getMethod("setPersonalDataSyncSetFlag", boolean.class);
            setSyncFlag.invoke(null, true);
            sTerracePersonalDataSyncSynced = true;
        } catch (Throwable ignored) {}
    }

    public static boolean adjustPersonalDataSyncSetFlag(boolean stockValue) {
        if (stockValue) return true;
        return hasActiveSystemAutofillService(null);
    }

    public static boolean shouldSuppressSamsungPasswordUi(Context ctx) {
        return hasActiveSystemAutofillService(ctx);
    }

    public static boolean adjustSuggestPasswordStore(boolean stockSuggest) {
        if (hasActiveSystemAutofillService(null)) return false;
        return stockSuggest;
    }

    private static void applyCompactSystemBarPolish(Activity activity) {
        try {
            android.view.Window win = activity.getWindow();
            if (win == null) return;
            if (android.os.Build.VERSION.SDK_INT >= 29) {
                // Eliminates Android 15/16 translucent white/grey contrast scrims at top & bottom bars
                win.setNavigationBarContrastEnforced(false);
                win.setStatusBarContrastEnforced(false);
            }
            boolean compact = isCompactLayoutActive();
            if (compact) {
                boolean qa = isWindowOnQuickAccess(win);
                boolean night = isBrowserNightMode(activity);
                int themeColor = night
                        ? (isAmoledBlackEnabled() ? 0xFF000000 : 0xFF121212)
                        : 0xFFFFFFFF;
                int barColor = qa ? 0x00000000 : themeColor;
                syncSystemBarIconAppearance(win, night);
                syncMainWindowBackground(win, themeColor);
                win.setNavigationBarColor(barColor);
                win.setStatusBarColor(barColor);
                clearSystemBarFadeWindow(win);
                View decor = win.getDecorView();
                String pkg = activity.getPackageName();
                if (decor != null && pkg != null) {
                    int navId = activity.getResources().getIdentifier("navigation_bar_background", "id", pkg);
                    if (navId != 0) {
                        View navView = decor.findViewById(navId);
                        if (navView != null) navView.setBackgroundColor(barColor);
                    }
                    int stId = activity.getResources().getIdentifier("status_bar_background", "id", pkg);
                    if (stId != 0) {
                        View stView = decor.findViewById(stId);
                        if (stView != null) stView.setBackgroundColor(barColor);
                    }
                    decor.post(() -> clearSystemBarFadeWindow(win));
                }
            }
            View decorObj = win.getDecorView();
            if (decorObj instanceof android.view.ViewGroup) {
                View existing = ((android.view.ViewGroup) decorObj).findViewWithTag(COMPACT_STATUS_SCRIM_TAG);
                if (existing != null && existing.getParent() instanceof android.view.ViewGroup) {
                    ((android.view.ViewGroup) existing.getParent()).removeView(existing);
                }
            }
        } catch (Throwable ignored) {}
    }

    public static boolean openInternalUrl(Context context, String url) {
        if (context == null || url == null) return false;
        try {
            Activity main = sMainActivityRef.get();
            if (main != null && !main.isFinishing() && !main.isDestroyed()) {
                try {
                    Method loadNew = main.getClass().getMethod("loadUrlInNewTab", String.class);
                    loadNew.invoke(main, url);
                    Intent bringFront = new Intent(context, main.getClass());
                    bringFront.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT | Intent.FLAG_ACTIVITY_SINGLE_TOP);
                    if (!(context instanceof Activity)) {
                        bringFront.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    }
                    context.startActivity(bringFront);
                    return true;
                } catch (Throwable t) {
                    Log.w(TAG, "Direct loadUrlInNewTab failed, using explicit MainActivity intent", t);
                }
            }
            Class<?> mainCls = Class.forName("com.sec.android.app.sbrowser.SBrowserMainActivity");
            Intent intent = new Intent(context, mainCls);
            intent.putExtra("create_new_tab", true);
            intent.putExtra("com.android.browser.application_id", context.getPackageName());
            intent.setData(Uri.parse(url));
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_SINGLE_TOP);
            context.startActivity(intent);
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "openInternalUrl failed for " + url, t);
            return false;
        }
    }

    public static void onCommandLineCustomFeatures() {
        if (!isMainBrowserProcess()) return;
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            if (ctx == null) return;

            Class<?> cmdClass = Class.forName("com.sec.android.app.sbrowser.init.SBrowserCommandLine");
            Method appendFeature = cmdClass.getMethod("appendEnableFeature", String.class);

            if (SBrowserXPrefs.isFingerprintProtectionEnabled(ctx)) {
                appendFeature.invoke(null, "WebAudioAntiFingerprint");
                appendFeature.invoke(null, "ScreenAntiFingerprint");
                appendFeature.invoke(null, "EnableScreenAntiFingerprintingV2");
                Log.i(TAG, "Enabled native anti-fingerprint features");
            }
            // v1.0.0: Verified native Chromium smoothness & download performance flags
            try {
                appendFeature.invoke(null, "ParallelDownloading");
                appendFeature.invoke(null, "BackForwardCache");
                Class<?> tcl = Class.forName("com.sec.terrace.TerraceCommandLine");
                Method appendSwitch = tcl.getMethod("appendSwitch", String.class);
                appendSwitch.invoke(null, "enable-gpu-rasterization");
                appendSwitch.invoke(null, "enable-zero-copy");
                appendSwitch.invoke(null, "enable-smooth-scrolling");
            } catch (Throwable ignored) {}
            boolean darkActive = isBrowserNightModeAtStartup(ctx);
            boolean forceLightSites = isApplyDefaultDarkSitesAtStartup(ctx);
            sInCommandLineInit = true;
            try {
                if (darkActive && forceLightSites) {
                    syncChromiumForceDarkSwitches(true);
                    Log.i(TAG, "Enabled native Chromium Blink force-dark-mode (CIELAB)");
                }
            } finally {
                sInCommandLineInit = false;
            }
        } catch (Throwable t) {
            Log.e(TAG, "onCommandLineCustomFeatures failed", t);
        }
    }

    public static boolean isToolbarBlurAllowed(boolean stockSupported) {
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            if (ctx == null) return stockSupported;
            return SBrowserXPrefs.isBottomBarBlurEnabled(ctx);
        } catch (Throwable t) {
            return stockSupported;
        }
    }

    public static boolean isBottomBarBlurEnabled() {
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            return ctx == null || SBrowserXPrefs.isBottomBarBlurEnabled(ctx);
        } catch (Throwable t) {
            return true;
        }
    }

    public static boolean isAmoledBlackEnabled() {
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            if (ctx == null) return false;
            return SBrowserXPrefs.isAmoledBlackEnabled(ctx);
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * Checks Samsung Internet's actual active dark mode (honoring BOTH system dark theme
     * AND the in-browser "Dark mode -> On/Off" override in DarkModeUtils).
     */
    public static boolean isBrowserNightMode(Context ctx) {
        try {
            ensureDarkModeUtilsCache();
            if (sDmuInstance != null && sDmuIsDarkMode != null) {
                Object res = sDmuIsDarkMode.invoke(sDmuInstance);
                if (res instanceof Boolean) return (Boolean) res;
            }
        } catch (Throwable ignored) {}
        if (ctx != null) {
            try {
                return (ctx.getResources().getConfiguration().uiMode
                        & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES;
            } catch (Throwable ignored) {}
        }
        return false;
    }

    private static int getGlassBaseAlpha() {
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            int transparency = ctx != null ? SBrowserXPrefs.getBottomBarTransparency(ctx) : 50;
            int opacity = 100 - transparency; // 15..85
            return clampByte(Math.round(255f * opacity / 100f));
        } catch (Throwable t) {
            return 0x80;
        }
    }

    private static int clampByte(int v) {
        return Math.max(0, Math.min(255, v));
    }

    private static int withAlpha(int color, int alpha) {
        return (color & 0x00FFFFFF) | (clampByte(alpha) << 24);
    }

    private static boolean isDarkColor(int color) {
        int r = Color.red(color);
        int g = Color.green(color);
        int b = Color.blue(color);
        // Perceived luminance < 96
        return (r * 299 + g * 587 + b * 114) < 96000;
    }

    private static int normalizeGlassBaseRgb(int baseColor) {
        Context ctx = SBrowserXPrefs.getAppContext();
        if (isBrowserNightMode(ctx)) {
            return isAmoledBlackEnabled() ? 0xFF000000 : 0xFF141418;
        }
        if (isAmoledBlackEnabled() && isDarkColor(baseColor)) {
            return 0xFF000000;
        }
        return baseColor | 0xFF000000;
    }

    private static boolean isFocusLayout(Context ctx) {
        if (ctx == null) return false;
        try {
            if (!sDluInitDone) {
                sDluInitDone = true;
                Class<?> cls = Class.forName("com.sec.android.app.sbrowser.common.device.DeviceLayoutUtil");
                sDluIsFocus = cls.getMethod("isFocusLayoutType", Context.class);
                sDluIsLandscapeOrTablet = cls.getMethod("isLandscapeOrTabletStyle", Context.class);
            }
            if (sDluIsFocus == null || !Boolean.TRUE.equals(sDluIsFocus.invoke(null, ctx))) return false;
            return sDluIsLandscapeOrTablet == null || !Boolean.TRUE.equals(sDluIsLandscapeOrTablet.invoke(null, ctx));
        } catch (Throwable t) {
            return false;
        }
    }

    public static int getAmoledBottomBarColor() {
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            boolean blurOn = ctx == null || SBrowserXPrefs.isBottomBarBlurEnabled(ctx);
            return blurOn ? withAlpha(0x000000, getGlassBaseAlpha()) : 0xFF000000;
        } catch (Throwable t) {
            return 0x80000000;
        }
    }

    public static GradientDrawable createToolbarGlassDrawable(Context ctx, int baseColor) {
        if (isCompactLayoutActive()) {
            GradientDrawable clear = new GradientDrawable();
            clear.setColor(0x00000000);
            return clear;
        }
        if (!isBottomBarBlurEnabled()) return null;
        try {
            int rgb = normalizeGlassBaseRgb(baseColor);
            int baseAlpha = getGlassBaseAlpha();
            int edgeAlpha = clampByte(Math.round(baseAlpha * 0.62f));
            int midAlpha = clampByte(Math.round(baseAlpha * 0.88f));
            int solidAlpha = clampByte(Math.round(baseAlpha * 1.06f));

            GradientDrawable gd = new GradientDrawable();
            gd.setOrientation(GradientDrawable.Orientation.TOP_BOTTOM);
            if (isFocusLayout(ctx)) {
                // Address bar is at bottom directly above Bottombar: soft fade from page into bar
                gd.setColors(new int[] { withAlpha(rgb, edgeAlpha), withAlpha(rgb, midAlpha) });
            } else {
                // Address bar is at top: denser near status bar, softer toward page
                gd.setColors(new int[] { withAlpha(rgb, solidAlpha), withAlpha(rgb, edgeAlpha) });
            }
            return gd;
        } catch (Throwable t) {
            return null;
        }
    }

    public static GradientDrawable createBottombarGlassDrawable(Context ctx, int baseColor) {
        if (isCompactLayoutActive()) {
            GradientDrawable clear = new GradientDrawable();
            clear.setColor(0x00000000);
            return clear;
        }
        try {
            int rgb = normalizeGlassBaseRgb(baseColor);
            GradientDrawable gd = new GradientDrawable();
            gd.setOrientation(GradientDrawable.Orientation.TOP_BOTTOM);
            if (!isBottomBarBlurEnabled()) {
                gd.setColors(new int[] { withAlpha(rgb, 0xFF), withAlpha(rgb, 0xFF) });
                return gd;
            }
            int baseAlpha = getGlassBaseAlpha();
            int edgeAlpha = clampByte(Math.round(baseAlpha * 0.62f));
            int midAlpha = clampByte(Math.round(baseAlpha * 0.88f));
            int botAlpha = clampByte(Math.round(baseAlpha * 1.08f));
            if (isFocusLayout(ctx)) {
                // Seamless continuation from Focus Toolbar above it down to system navbar
                gd.setColors(new int[] { withAlpha(rgb, midAlpha), withAlpha(rgb, botAlpha) });
            } else {
                // Standalone bottom navigation bar: soft edge at top, slightly denser at bottom
                gd.setColors(new int[] { withAlpha(rgb, edgeAlpha), withAlpha(rgb, botAlpha) });
            }
            return gd;
        } catch (Throwable t) {
            GradientDrawable fallback = new GradientDrawable();
            fallback.setColor(baseColor);
            return fallback;
        }
    }

    public static Bitmap createGlassGradientBitmapOrNull(int baseColor, int width, int height, boolean fadeToBottom) {
        if (width <= 0 || height <= 0) return null;
        if (isCompactLayoutActive()) {
            return Bitmap.createBitmap(1, 1, Bitmap.Config.ARGB_8888);
        }
        if (!isBottomBarBlurEnabled()) return null;
        try {
            int rgb = normalizeGlassBaseRgb(baseColor);
            int baseAlpha = getGlassBaseAlpha();
            int softAlpha = clampByte(Math.round(baseAlpha * 0.65f));
            int denseAlpha = clampByte(Math.round(baseAlpha * 1.04f));
            int cTop = fadeToBottom ? withAlpha(rgb, denseAlpha) : withAlpha(rgb, softAlpha);
            int cBot = fadeToBottom ? withAlpha(rgb, softAlpha) : withAlpha(rgb, denseAlpha);

            Bitmap bmp = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bmp);
            Paint paint = new Paint();
            paint.setShader(new LinearGradient(0f, 0f, 0f, height, cTop, cBot, Shader.TileMode.CLAMP));
            canvas.drawRect(0f, 0f, width, height, paint);
            return bmp;
        } catch (Throwable t) {
            return null;
        }
    }

    public static boolean isCompactLayoutActivePublic() {
        return isCompactLayoutActive();
    }

    public static boolean isNativePageBlurAllowed(Object nativePageToolbarBlur) {
        if (isCompactLayoutActive()) return false;
        try {
            if (nativePageToolbarBlur != null) {
                Field f = nativePageToolbarBlur.getClass().getDeclaredField("mDelegate");
                f.setAccessible(true);
                Object del = f.get(nativePageToolbarBlur);
                if (del != null) {
                    Object res = del.getClass().getMethod("isBlurEffectEnabled").invoke(del);
                    return Boolean.TRUE.equals(res);
                }
            }
        } catch (Throwable ignored) {}
        return false;
    }

    public static int adjustMaxTabCount(int stockMax) {
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            if (ctx != null && SBrowserXPrefs.isUnlimitedTabsEnabled(ctx)) {
                return 9999;
            }
        } catch (Throwable ignored) {}
        return stockMax;
    }

    private static boolean isBlockedRussianEngineText(String raw) {
        if (raw == null || raw.isEmpty()) return false;
        String s = raw.toLowerCase(java.util.Locale.ROOT);
        return s.contains("yandex") || s.contains("\u044f\u043d\u0434\u0435\u043a\u0441")
                || s.contains("mail.ru") || s.contains("mail_ru") || s.contains("mailru") || s.contains("@mail")
                || s.contains("rambler") || s.contains("\u0440\u0430\u043c\u0431\u043b\u0435\u0440")
                || s.contains("sputnik") || s.contains("dzen.ru") || s.contains("vk.com") || s.contains("rutube");
    }

    public static void filterBlockedSearchEngines(List<?> list) {
        if (list == null || list.isEmpty()) return;
        try {
            java.util.Iterator<?> it = list.iterator();
            while (it.hasNext()) {
                Object item = it.next();
                if (item == null) continue;
                boolean blocked = false;
                if (item instanceof String) {
                    blocked = isBlockedRussianEngineText((String) item);
                } else {
                    if (isBlockedRussianEngineText(item.toString())) {
                        blocked = true;
                    } else {
                        String[] fieldNames = new String[] {"mName", "mTitle", "mKeyword", "mSearchUrl", "mLabel"};
                        for (String fn : fieldNames) {
                            try {
                                Field f = item.getClass().getDeclaredField(fn);
                                f.setAccessible(true);
                                Object v = f.get(item);
                                if (v != null && isBlockedRussianEngineText(String.valueOf(v))) {
                                    blocked = true;
                                    break;
                                }
                            } catch (Throwable ignored) {}
                        }
                        if (!blocked) {
                            String[] getters = new String[] {"getTitle", "getName", "getKeyword", "getSearchUrl", "getLabel"};
                            for (String gn : getters) {
                                try {
                                    Object v = item.getClass().getMethod(gn).invoke(item);
                                    if (v != null && isBlockedRussianEngineText(String.valueOf(v))) {
                                        blocked = true;
                                        break;
                                    }
                                } catch (Throwable ignored) {}
                            }
                        }
                    }
                }
                if (blocked) {
                    it.remove();
                }
            }
        } catch (Throwable ignored) {}
    }

    public static void recordPrivacyFragment(Object fragment) {
        sPrivacyFragmentTL.set(fragment);
    }

    public static void localizePrivacyFragmentFromTL() {
        Object fragment = sPrivacyFragmentTL.get();
        sPrivacyFragmentTL.remove();
        if (fragment != null) {
            localizeCustomPreferences(fragment);
        }
    }

    public static boolean handleBrowsingAssistClick(Object appMenuHandler) {
        try {
            Activity act = sMainActivityRef.get();
            Context ctx = act != null ? act : SBrowserXPrefs.getAppContext();
            if (ctx == null) return false;

            String key = SBrowserXPrefs.getTranslateApiKey(ctx);
            if (key == null || key.trim().isEmpty()) {
                Intent i = new Intent(ctx, dev.vortexnode.sbrowserx.extension.settings.SBrowserXAiSummaryActivity.class);
                if (!(ctx instanceof Activity)) i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                ctx.startActivity(i);
                return true;
            }

            Object terrace = null;
            String pageUrl = "";
            if (appMenuHandler != null) {
                try {
                    Field fTd = appMenuHandler.getClass().getDeclaredField("mTabDelegate");
                    fTd.setAccessible(true);
                    Object td = fTd.get(appMenuHandler);
                    if (td != null) {
                        terrace = td.getClass().getMethod("getTerrace").invoke(td);
                        try {
                            Object u = td.getClass().getMethod("getCurrentUrl").invoke(td);
                            if (u != null) pageUrl = String.valueOf(u);
                        } catch (Throwable ignored) {}
                    }
                } catch (Throwable ignored) {}
            }

            if (terrace != null) {
                String pageTitle = "";
                try {
                    Object tObj = terrace.getClass().getMethod("getTitle").invoke(terrace);
                    if (tObj != null) pageTitle = String.valueOf(tObj);
                } catch (Throwable ignored) {}

                final String fTitle = pageTitle;
                final String fUrl = pageUrl;
                final Context launchCtx = ctx;
                Class<?> cbCls = Class.forName("com.sec.terrace.TerraceJavaScriptCallback");
                Object proxyCb = Proxy.newProxyInstance(
                        cbCls.getClassLoader(),
                        new Class<?>[] { cbCls },
                        (proxy, method, args) -> {
                            if (args != null && args.length == 1) {
                                String jsonText = args[0] != null ? String.valueOf(args[0]) : "";
                                String extracted = "";
                                try {
                                    if (!jsonText.isEmpty() && !"null".equals(jsonText)) {
                                        extracted = new org.json.JSONArray("[" + jsonText + "]").optString(0, "");
                                    }
                                } catch (Throwable ignored) {
                                    extracted = jsonText;
                                }
                                Intent i = new Intent(launchCtx, dev.vortexnode.sbrowserx.extension.settings.SBrowserXAiSummaryActivity.class);
                                i.putExtra(dev.vortexnode.sbrowserx.extension.settings.SBrowserXAiSummaryActivity.EXTRA_PAGE_TITLE, fTitle);
                                i.putExtra(dev.vortexnode.sbrowserx.extension.settings.SBrowserXAiSummaryActivity.EXTRA_PAGE_URL, fUrl);
                                i.putExtra(dev.vortexnode.sbrowserx.extension.settings.SBrowserXAiSummaryActivity.EXTRA_PAGE_TEXT, extracted);
                                if (!(launchCtx instanceof Activity)) i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                                launchCtx.startActivity(i);
                            }
                            return null;
                        });
                String js = "(function(){var el=document.querySelector('article,main')||document.body;return el?(el.innerText||'').slice(0,14000):'';})()";
                terrace.getClass().getMethod("evaluateJavaScript", String.class, cbCls).invoke(terrace, js, proxyCb);
                return true;
            }

            Intent i = new Intent(ctx, dev.vortexnode.sbrowserx.extension.settings.SBrowserXBrowsingAssistActivity.class);
            if (!(ctx instanceof Activity)) i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            ctx.startActivity(i);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "handleBrowsingAssistClick failed", t);
            return false;
        }
    }

    private static boolean isCompactLayoutActive() {
        try {
            if (!sDfuInitDone) {
                sDfuInitDone = true;
                Class<?> dfu = Class.forName("com.sec.android.app.sbrowser.common.device.DeviceFeatureUtils");
                sDfuInstance = dfu.getMethod("getInstance").invoke(null);
                sDfuIsCompact = dfu.getMethod("isCompactLayoutType");
            }
            return sDfuInstance != null && sDfuIsCompact != null
                    && Boolean.TRUE.equals(sDfuIsCompact.invoke(sDfuInstance));
        } catch (Throwable t) {
            return false;
        }
    }

    public static int adjustCompactBarColor(int stockColor) {
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            boolean enabled = ctx == null || SBrowserXPrefs.isCompactBarBlurEnabled(ctx);
            int rgb = normalizeGlassBaseRgb(stockColor);
            if (!enabled) {
                return withAlpha(rgb, 0xFF);
            }
            int transparency = ctx != null ? SBrowserXPrefs.getCompactBarTransparency(ctx) : 50;
            int opacity = 100 - transparency; // 15..85
            int alpha = clampByte(Math.round(255f * opacity / 100f) + 28);
            return withAlpha(rgb, alpha);
        } catch (Throwable t) {
            return stockColor;
        }
    }

    public static float adjustToolbarBlurRadius(float stockRadius) {
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            if (isCompactLayoutActive()) {
                if (ctx != null && !SBrowserXPrefs.isCompactBarBlurEnabled(ctx)) return stockRadius;
                int transparency = ctx != null ? SBrowserXPrefs.getCompactBarTransparency(ctx) : 50;
                return 40f + (transparency * 0.34f);
            }
            if (!isBottomBarBlurEnabled()) return stockRadius;
            int transparency = ctx != null ? SBrowserXPrefs.getBottomBarTransparency(ctx) : 50;
            return 40f + (transparency * 0.34f);
        } catch (Throwable t) {
            return 56f;
        }
    }

    public static int adjustToolbarBlurTintColor(int stockColor) {
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            if (isCompactLayoutActive()) {
                if (ctx != null && !SBrowserXPrefs.isCompactBarBlurEnabled(ctx)) return stockColor;
                int rgb = normalizeGlassBaseRgb(stockColor);
                int transparency = ctx != null ? SBrowserXPrefs.getCompactBarTransparency(ctx) : 50;
                int baseAlpha = clampByte(Math.round(255f * (100 - transparency) / 100f));
                int tintAlpha = clampByte(Math.round(baseAlpha * 0.40f));
                return withAlpha(rgb, tintAlpha);
            }
            if (!isBottomBarBlurEnabled()) return stockColor;
            int rgb = normalizeGlassBaseRgb(stockColor);
            int tintAlpha = clampByte(Math.round(getGlassBaseAlpha() * 0.42f));
            return withAlpha(rgb, tintAlpha);
        } catch (Throwable t) {
            return stockColor;
        }
    }


    /**
     * Fixes Samsung's Compact-mode MoreMenuHandler.getHeight() oscillation bug:
     * stock code compared (mRecyclerView.getHeight() + mHeaderLayout.getHeight()) < maxH
     * while omitting mBottomMenuLayout, so once laid out at maxH the RecyclerView was
     * always shorter than maxH, flipping the dialog to WRAP_CONTENT (-2) and back in a loop.
     */
    public static int computeStableCompactMenuHeight(Object handler) {
        if (handler == null) return 0;
        try {
            Class<?> cls = handler.getClass();

            Field fCtx = cls.getDeclaredField("mContext");
            fCtx.setAccessible(true);
            Context ctx = (Context) fCtx.get(handler);
            if (!(ctx instanceof Activity)) return 0;
            Activity act = (Activity) ctx;

            Method mGetYOffset = cls.getDeclaredMethod("getYOffset");
            mGetYOffset.setAccessible(true);
            int yOffset = (Integer) mGetYOffset.invoke(handler);

            View decor = act.getWindow().getDecorView();
            int decorH = decor.getHeight();
            if (decorH <= 0) return 0;

            android.content.res.Resources res = ctx.getResources();
            String pkg = ctx.getPackageName();

            int multiWinMargin = 0;
            try {
                Class<?> dsCls = Class.forName("com.sec.android.app.sbrowser.common.device.DeviceSettings");
                boolean inMulti = Boolean.TRUE.equals(dsCls.getMethod("isInMultiWindowMode", Activity.class).invoke(null, act));
                if (inMulti) {
                    int id = res.getIdentifier("toolbar_option_menu_compact_dialog_top_margin_multi_window", "dimen", pkg);
                    if (id != 0) multiWinMargin = res.getDimensionPixelOffset(id);
                }
            } catch (Throwable ignored) {}

            int statusBarH = 0;
            int navBarH = 0;
            try {
                Class<?> dluCls = Class.forName("com.sec.android.app.sbrowser.common.device.DeviceLayoutUtil");
                statusBarH = (Integer) dluCls.getMethod("getStatusBarHeight", View.class).invoke(null, decor);
                navBarH = (Integer) dluCls.getMethod("getNavigationBarHeight", View.class).invoke(null, decor);
            } catch (Throwable ignored) {}

            int availH = decorH - yOffset - multiWinMargin - statusBarH - navBarH;
            int maxDimenId = res.getIdentifier("toolbar_option_menu_compact_dialog_max_height", "dimen", pkg);
            int maxDimenH = maxDimenId != 0 ? res.getDimensionPixelOffset(maxDimenId) : availH;
            int maxH = Math.min(availH, maxDimenH);
            if (maxH <= 0) return 0;

            int itemHId = res.getIdentifier("toolbar_option_menu_compact_list_item_height", "dimen", pkg);
            int itemH = itemHId != 0 ? res.getDimensionPixelOffset(itemHId)
                    : Math.round(48f * res.getDisplayMetrics().density);

            int itemCount = 0;
            Field fAdapter = cls.getDeclaredField("mMenuAdapter");
            fAdapter.setAccessible(true);
            Object adapter = fAdapter.get(handler);
            if (adapter != null) {
                itemCount = (Integer) adapter.getClass().getMethod("getItemCount").invoke(adapter);
            }

            int headerH = 0;
            try {
                Method mCalcHeader = cls.getDeclaredMethod("calculateHeaderHeight");
                mCalcHeader.setAccessible(true);
                headerH = (Integer) mCalcHeader.invoke(handler);
            } catch (Throwable ignored) {}
            try {
                Field fHeader = cls.getDeclaredField("mHeaderLayout");
                fHeader.setAccessible(true);
                View hv = (View) fHeader.get(handler);
                if (hv != null && hv.getVisibility() == View.VISIBLE && hv.getHeight() > headerH) {
                    headerH = hv.getHeight();
                }
            } catch (Throwable ignored) {}

            int bottomH = 0;
            try {
                Field fBottom = cls.getDeclaredField("mBottomMenuLayout");
                fBottom.setAccessible(true);
                View bv = (View) fBottom.get(handler);
                if (bv != null && bv.getVisibility() == View.VISIBLE) {
                    int minBottom = Math.round(56f * res.getDisplayMetrics().density);
                    bottomH = Math.max(bv.getHeight(), minBottom);
                }
            } catch (Throwable ignored) {}

            int totalContentH = (itemH * itemCount) + headerH + bottomH;
            if (totalContentH > 0 && totalContentH < maxH) {
                return -2; // ViewGroup.LayoutParams.WRAP_CONTENT
            }
            return maxH;
        } catch (Throwable t) {
            Log.w(TAG, "computeStableCompactMenuHeight fallback to stock", t);
            return 0;
        }
    }


    /**
     * Syncs the side popup More Menu (3-dots menu) translucency & One UI window blur
     * with the active layout's transparency setting (Compact bar in Compact mode,
     * Bottom bar in Standard/Bottom mode) and AMOLED black dark theme.
     */
    private static void clearSemBlurEffect(View target) {
        if (target == null) return;
        try {
            if (!sViewUtilClearBlurInitDone) {
                sViewUtilClearBlurInitDone = true;
                Class<?> vu = Class.forName("com.sec.android.app.sbrowser.common.utils.ViewUtil");
                sViewUtilClearBlur = vu.getMethod("clearBlurEffect", View.class);
            }
            if (sViewUtilClearBlur != null) {
                sViewUtilClearBlur.invoke(null, target);
            }
        } catch (Throwable ignored) {}
    }

    private static void applySemBlurInfo(View target, int blurRadius, int tintColor, float cornerPx) {
        if (target == null || sSemBlurUnsupported) return;
        try {
            if (!sSemBlurInitDone) {
                sSemBlurInitDone = true;
                Class<?> semBlurCls = Class.forName("com.sec.sbrowser.spl.wrapper.SemBlurInfo");
                Object modeField = semBlurCls.getField("BLUR_MODE_WINDOW").get(null);
                sSemBlurModeWindow = (Integer) modeField.getClass().getMethod("get").invoke(modeField);
                Class<?> builderCls = Class.forName("com.sec.sbrowser.spl.wrapper.SemBlurInfo$Builder");
                sSemBlurBuilderCtor = builderCls.getConstructor(int.class);
                sSemBlurSetRadius = builderCls.getMethod("setRadius", int.class);
                sSemBlurSetBgColor = builderCls.getMethod("setBackgroundColor", int.class);
                sSemBlurSetCornerRadius = builderCls.getMethod("setBackgroundCornerRadius", float.class);
                sSemBlurBuild = builderCls.getMethod("build");
                Class<?> majoCls = Class.forName("com.sec.sbrowser.spl.wrapper.MajoView");
                sMajoSetBlurInfo = majoCls.getMethod("semSetBlurInfo", View.class, Object.class);
            }
            if (sSemBlurBuilderCtor == null || sMajoSetBlurInfo == null) {
                sSemBlurUnsupported = true;
                return;
            }
            Object builder = sSemBlurBuilderCtor.newInstance(sSemBlurModeWindow);
            sSemBlurSetRadius.invoke(builder, blurRadius);
            sSemBlurSetBgColor.invoke(builder, tintColor);
            sSemBlurSetCornerRadius.invoke(builder, cornerPx);
            Object blurInfo = sSemBlurBuild.invoke(builder);
            sMajoSetBlurInfo.invoke(null, target, blurInfo);
        } catch (Throwable t) {
            sSemBlurUnsupported = true;
        }
    }

    public static void applyMoreMenuGlassStyle(Dialog dialog) {
        if (dialog == null || dialog.getWindow() == null) return;
        try {
            Context appCtx = SBrowserXPrefs.getAppContext();
            boolean compact = isCompactLayoutActive();
            boolean enabled;
            int transparency;
            if (compact) {
                enabled = appCtx == null || SBrowserXPrefs.isCompactBarBlurEnabled(appCtx);
                transparency = appCtx != null ? SBrowserXPrefs.getCompactBarTransparency(appCtx) : 50;
            } else {
                enabled = appCtx == null || SBrowserXPrefs.isBottomBarBlurEnabled(appCtx);
                transparency = appCtx != null ? SBrowserXPrefs.getBottomBarTransparency(appCtx) : 50;
            }

            Context ctx = dialog.getContext();
            android.content.res.Resources res = ctx.getResources();
            String pkg = ctx.getPackageName();
            View decor = dialog.getWindow().getDecorView();

            int containerId = res.getIdentifier("dialog_container", "id", pkg);
            int outerId = res.getIdentifier("dialog_container_outer", "id", pkg);
            View container = containerId != 0 ? decor.findViewById(containerId) : null;
            View outer = outerId != 0 ? decor.findViewById(outerId) : null;

            boolean night = isBrowserNightMode(ctx);
            float density = res.getDisplayMetrics().density;
            int radiusId = res.getIdentifier("search_window_popup_radius", "dimen", pkg);
            int cornerPx = radiusId != 0 ? res.getDimensionPixelOffset(radiusId) : Math.round(26f * density);

            if (!enabled) {
                if (outer != null) {
                    clearSemBlurEffect(outer);
                }
                if (container != null && container.getBackground() != null) {
                    container.getBackground().mutate().setAlpha(255);
                }
                return;
            }

            int opacity = 100 - transparency; // 15..85
            int alpha = clampByte(Math.round(255f * opacity / 100f));
            int baseRgb = night ? (isAmoledBlackEnabled() ? 0x000000 : 0x1E1E22) : 0xF6F6F8;

            if (container != null) {
                GradientDrawable gd = new GradientDrawable();
                gd.setShape(GradientDrawable.RECTANGLE);
                gd.setCornerRadius(cornerPx);
                gd.setColor(withAlpha(baseRgb, alpha));
                int strokePx = Math.max(1, Math.round(density * 0.75f));
                gd.setStroke(strokePx, night ? 0x26FFFFFF : 0x1A000000);
                container.setBackground(gd);
            }

            if (outer != null) {
                // Replace UltraThick opaque blur with controllable One UI window blur matching user slider
                int blurRadius = Math.round(60f + transparency * 1.4f); // 81..179
                int tintAlpha = clampByte(Math.round(alpha * 0.45f));
                int tintColor = withAlpha(baseRgb, tintAlpha);
                applySemBlurInfo(outer, blurRadius, tintColor, (float) cornerPx);
            }
        } catch (Throwable t) {
            Log.w(TAG, "applyMoreMenuGlassStyle failed", t);
        }
    }

    public static void applyExtensionsPopupGlassStyle(Object popupController) {
        if (popupController == null) return;
        try {
            Class<?> cls = popupController.getClass();
            Field fAct = cls.getDeclaredField("mActivity");
            fAct.setAccessible(true);
            Context ctx = (Context) fAct.get(popupController);
            Field fView = cls.getDeclaredField("mExtensionView");
            fView.setAccessible(true);
            View extView = (View) fView.get(popupController);
            Field fPopup = cls.getDeclaredField("mPopupWindow");
            fPopup.setAccessible(true);
            android.widget.PopupWindow popup = (android.widget.PopupWindow) fPopup.get(popupController);
            if (ctx == null || extView == null) return;

            Context appCtx = SBrowserXPrefs.getAppContext();
            boolean compact = isCompactLayoutActive();
            boolean enabled;
            int transparency;
            if (compact) {
                enabled = appCtx == null || SBrowserXPrefs.isCompactBarBlurEnabled(appCtx);
                transparency = appCtx != null ? SBrowserXPrefs.getCompactBarTransparency(appCtx) : 50;
            } else {
                enabled = appCtx == null || SBrowserXPrefs.isBottomBarBlurEnabled(appCtx);
                transparency = appCtx != null ? SBrowserXPrefs.getBottomBarTransparency(appCtx) : 50;
            }

            android.content.res.Resources res = ctx.getResources();
            String pkg = ctx.getPackageName();
            boolean night = isBrowserNightMode(ctx);
            float density = res.getDisplayMetrics().density;
            int radiusId = res.getIdentifier("toolbar_option_menu_dialog_radius", "dimen", pkg);
            if (radiusId == 0) radiusId = res.getIdentifier("search_window_popup_radius", "dimen", pkg);
            int cornerPx = radiusId != 0 ? res.getDimensionPixelOffset(radiusId) : Math.round(26f * density);
            int baseRgb = night ? (isAmoledBlackEnabled() ? 0x000000 : 0x1E1E22) : 0xF6F6F8;

            if (popup != null) {
                popup.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(0x00000000));
            }

            if (!enabled) {
                clearSemBlurEffect(extView);
                GradientDrawable solid = new GradientDrawable();
                solid.setShape(GradientDrawable.RECTANGLE);
                solid.setCornerRadius(cornerPx);
                solid.setColor(withAlpha(baseRgb, 0xFF));
                int strokePx = Math.max(1, Math.round(density * 0.75f));
                solid.setStroke(strokePx, night ? 0x26FFFFFF : 0x1A000000);
                extView.setBackground(solid);
                return;
            }

            int opacity = 100 - transparency; // 15..85
            int alpha = clampByte(Math.round(255f * opacity / 100f));
            GradientDrawable gd = new GradientDrawable();
            gd.setShape(GradientDrawable.RECTANGLE);
            gd.setCornerRadius(cornerPx);
            gd.setColor(withAlpha(baseRgb, alpha));
            int strokePx = Math.max(1, Math.round(density * 0.75f));
            gd.setStroke(strokePx, night ? 0x26FFFFFF : 0x1A000000);
            extView.setBackground(gd);
            extView.setClipToOutline(true);

            int blurRadius = Math.round(60f + transparency * 1.4f); // 81..179
            int tintAlpha = clampByte(Math.round(alpha * 0.45f));
            int tintColor = withAlpha(baseRgb, tintAlpha);
            applySemBlurInfo(extView, blurRadius, tintColor, (float) cornerPx);
        } catch (Throwable t) {
            Log.w(TAG, "applyExtensionsPopupGlassStyle failed", t);
        }
    }


    private static final ThreadLocal<Object> sCustomizeMenuModelTL = new ThreadLocal<>();
    private static final ThreadLocal<Object> sDarkModeFragmentTL = new ThreadLocal<>();
    private static final ThreadLocal<Object> sPrivacyFragmentTL = new ThreadLocal<>();

    // --- Fix #1, #2, #4: Unified Dark Mode + True Colors + Pure AMOLED Websites ---

    /**
     * Returns:
     *   1 -> force web content dark mode ON
     *   0 -> force web content dark mode OFF
     *  -1 -> fall back to stock DarkModeUtils
     * Unified logic: whenever the browser itself is in Dark Mode (system OR manual),
     * websites follow Dark Mode; whenever browser is in Light Mode, websites stay Light
     * (unless Force Day Dark is explicitly turned ON).
     */
    public static int resolveContentDarkModeOverride(Object darkModeUtils) {
        try {
            if (isForceAdaptiveDarkEnabled()) return 1;
            if (darkModeUtils != null) {
                ensureDarkModeUtilsCache();
                boolean browserNight = sDmuIsNightMode != null
                        && Boolean.TRUE.equals(sDmuIsNightMode.invoke(darkModeUtils));
                boolean highContrast = sDmuIsHighContrast != null
                        && Boolean.TRUE.equals(sDmuIsHighContrast.invoke(darkModeUtils));
                if (highContrast) return 0;
                return browserNight ? 1 : 0;
            }
        } catch (Throwable ignored) {}
        return -1;
    }

    private static boolean isBrowserNightModeAtStartup(Context ctx) {
        try {
            if (ctx != null) {
                android.content.SharedPreferences sp = ctx.getSharedPreferences(
                        ctx.getPackageName() + "_preferences", Context.MODE_PRIVATE);
                boolean sysDefault = sp.getBoolean("pref_manage_dark_mode_system_default", true);
                if (sysDefault) {
                    int ui = ctx.getResources().getConfiguration().uiMode
                            & android.content.res.Configuration.UI_MODE_NIGHT_MASK;
                    return ui == android.content.res.Configuration.UI_MODE_NIGHT_YES;
                }
                return sp.getBoolean("pref_night_mode", false);
            }
        } catch (Throwable ignored) {}
        return isBrowserNightMode(ctx);
    }

    private static boolean isApplyDefaultDarkSitesAtStartup(Context ctx) {
        try {
            if (ctx != null) {
                android.content.SharedPreferences sp = ctx.getSharedPreferences(
                        ctx.getPackageName() + "_preferences", Context.MODE_PRIVATE);
                return sp.getBoolean("pref_apply_default_dark_mode", true);
            }
        } catch (Throwable ignored) {}
        return isApplyDefaultDarkSitesEnabled();
    }

    private static void syncChromiumForceDarkSwitches(boolean enable) {
        try {
            Class<?> tcl = Class.forName("com.sec.terrace.TerraceCommandLine");
            if (enable) {
                tcl.getMethod("appendSwitch", String.class).invoke(null, "force-dark-mode");
                tcl.getMethod("appendSwitchWithValue", String.class, String.class)
                        .invoke(null, "blink-settings", "forceDarkModeEnabled=true");
            } else if (sInCommandLineInit) {
                // Only remove switches pre-native; calling native CommandLineJni.removeSwitch()
                // on a live multi-threaded Chromium process causes Dark -> Light crash.
                tcl.getMethod("removeSwitch", String.class).invoke(null, "force-dark-mode");
                tcl.getMethod("removeSwitch", String.class).invoke(null, "blink-settings");
            }
        } catch (Throwable ignored) {}
    }

    public static int getTerraceBackgroundColorOverride(Context ctx) {
        try {
            Context c = ctx != null ? ctx : SBrowserXPrefs.getAppContext();
            boolean darkActive = isBrowserNightMode(c) || isForceAdaptiveDarkEnabled();
            if (darkActive) {
                return isAmoledBlackEnabled() ? 0xFF000000 : 0xFF121212;
            }
        } catch (Throwable ignored) {}
        return 0;
    }

    public static void onTabLoadFinishedDarkCss(Object tabEventHandler) {
        if (tabEventHandler == null) return;
        try {
            Field f = sFieldTabWebDarkHandler;
            if (f == null) {
                f = tabEventHandler.getClass().getDeclaredField("mWebDarkCustomHandler");
                f.setAccessible(true);
                sFieldTabWebDarkHandler = f;
            }
            Object handler = f.get(tabEventHandler);
            if (handler != null) {
                applyAmoledAndColorFixCss(handler);
            }
        } catch (Throwable ignored) {}
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            if (ctx != null && SBrowserXPrefs.isTextReflowOnZoomEnabled(ctx)) {
                Field f = sFieldTabWebDarkHandler;
                if (f != null) {
                    Object handler = f.get(tabEventHandler);
                    if (handler != null) {
                        Method evalM = sMethodWebDarkEvalJs;
                        if (evalM == null) {
                            evalM = handler.getClass().getMethod("evaluateJavaScript", String.class);
                            sMethodWebDarkEvalJs = evalM;
                        }
                        evalM.invoke(handler, SBROWSERX_TEXT_REFLOW_JS);
                    }
                }
            }
        } catch (Throwable ignored) {}
        try {
            if (isGoogleTranslateEnabled()) {
                SBrowserXDomTranslator.maybeAutoTranslateOnLoad();
            }
        } catch (Throwable ignored) {}
    }

    private static boolean isApplyDefaultDarkSitesEnabled() {
        try {
            ensureDarkModeUtilsCache();
            if (sDmuInstance != null && sDmuIsApplyDefaultDark != null) {
                Object res = sDmuIsApplyDefaultDark.invoke(sDmuInstance);
                if (res instanceof Boolean) return (Boolean) res;
            }
        } catch (Throwable ignored) {}
        return true;
    }

    public static boolean adjustTerraceNightMode(boolean requested) {
        try {
            boolean forceLightSites = requested && isApplyDefaultDarkSitesEnabled();
            syncChromiumForceDarkSwitches(forceLightSites);
            // Always return false to disable Samsung's hue-shifting Terrace Night Mode shader
            return false;
        } catch (Throwable ignored) {}
        return false;
    }

    private static final String SBROWSERX_TEXT_REFLOW_JS =
            "(function(){"
            + "if(window.__sbxReflowInit)return;window.__sbxReflowInit=1;"
            + "var reflowed=[];var active=false;var touchCount=0;var focalEl=null;var tm=null;"
            + "var reset=function(){"
            + "if(!active&&!reflowed.length)return;"
            + "for(var i=0;i<reflowed.length;i++){try{var s=reflowed[i].style;s.maxWidth='';s.boxSizing='';s.tableLayout='';s.wordBreak='';}catch(e){}}"
            + "reflowed=[];active=false;"
            + "};"
            + "var pickFocal=function(e){"
            + "try{"
            + "if(!e.touches||e.touches.length<2)return;"
            + "var mx=(e.touches[0].clientX+e.touches[1].clientX)/2;"
            + "var my=(e.touches[0].clientY+e.touches[1].clientY)/2;"
            + "var hit=document.elementFromPoint(mx,my);"
            + "if(hit)focalEl=hit.closest('p,h1,h2,h3,h4,h5,h6,li,blockquote,td,th,article,section,div')||hit;"
            + "}catch(err){}};"
            + "var applyReflow=function(){"
            + "try{"
            + "var vv=window.visualViewport;if(!vv)return;"
            + "if(vv.scale<=1.04){reset();return;}"
            + "var targetW=Math.max(170,Math.floor(vv.width-16));"
            + "var els=document.querySelectorAll('h1,h2,h3,h4,h5,h6,p,li,dd,dt,blockquote,figcaption,pre,table,td,th,article,section,div');"
            + "var lim=Math.min(els.length,1200);"
            + "for(var i=0;i<lim;i++){"
            + "var el=els[i];var tn=el.tagName;"
            + "if(tn==='DIV'||tn==='SECTION'||tn==='ARTICLE'){"
            + "var hasTxt=false;for(var c=0;c<el.childNodes.length;c++){if(el.childNodes[c].nodeType===3&&el.childNodes[c].nodeValue.trim().length>16){hasTxt=true;break;}}"
            + "if(!hasTxt)continue;"
            + "}"
            + "var r=el.getBoundingClientRect();"
            + "if(r.width<=0)continue;"
            + "if(tn==='TABLE'&&r.width>targetW+6){"
            + "el.style.maxWidth=targetW+'px';el.style.tableLayout='fixed';el.style.boxSizing='border-box';"
            + "if(reflowed.indexOf(el)<0)reflowed.push(el);"
            + "}else if((tn==='TD'||tn==='TH')&&r.width>targetW/2){"
            + "el.style.wordBreak='break-word';el.style.boxSizing='border-box';"
            + "if(reflowed.indexOf(el)<0)reflowed.push(el);"
            + "}else if(r.width>targetW+8){"
            + "el.style.maxWidth=targetW+'px';el.style.boxSizing='border-box';el.style.wordBreak='break-word';"
            + "if(reflowed.indexOf(el)<0)reflowed.push(el);"
            + "}"
            + "}"
            + "active=true;"
            + "if(focalEl&&focalEl.isConnected){"
            + "try{focalEl.scrollIntoView({behavior:'instant',block:'nearest',inline:'start'});}"
            + "catch(se){try{focalEl.scrollIntoView(true);}catch(se2){}}"
            + "}"
            + "}catch(e){}};"
            + "var sched=function(){"
            + "var vv=window.visualViewport;"
            + "if(vv&&vv.scale<=1.04){if(tm){clearTimeout(tm);tm=null;}reset();return;}"
            + "if(tm)clearTimeout(tm);tm=setTimeout(applyReflow,140);"
            + "};"
            + "window.addEventListener('touchstart',function(e){if(e.touches){touchCount=Math.max(touchCount,e.touches.length);if(e.touches.length>=2)pickFocal(e);}},{passive:true});"
            + "window.addEventListener('touchmove',function(e){if(e.touches&&e.touches.length>=2)pickFocal(e);},{passive:true});"
            + "window.addEventListener('touchend',function(e){if(touchCount>=2&&(!e.touches||e.touches.length===0)){touchCount=0;sched();}},{passive:true});"
            + "if(window.visualViewport){window.visualViewport.addEventListener('resize',sched);}"
            + "})();";

    private static final String SBROWSERX_AMOLED_JS =
            "(function(){"
            + "var id='sbrowserx-amoled-css';"
            + "var root=document.head||document.documentElement;"
            + "if(!root)return;"
            + "var st=document.getElementById(id);"
            + "if(!st){st=document.createElement('style');st.id=id;root.appendChild(st);}"
            + "var css='img,picture,video,canvas{filter:none !important;opacity:1 !important;}';"
            + "var amoled=__AMOLED__;"
            + "if(amoled){"
            + "css+='html,body{background-color:#000000 !important;}';"
            + "var paint=function(){"
            + "try{"
            + "var els=document.querySelectorAll('body,main,article,section,header,footer,nav,aside,ul,li,div,table,tr,td,th');"
            + "var lim=Math.min(els.length,1200);"
            + "for(var i=0;i<lim;i++){"
            + "var el=els[i];"
            + "if(el.getAttribute('data-sbx-amoled'))continue;"
            + "var cs=getComputedStyle(el);"
            + "if(cs.backgroundImage&&cs.backgroundImage!=='none')continue;"
            + "var bg=cs.backgroundColor;"
            + "if(!bg||bg==='transparent'||bg==='rgba(0, 0, 0, 0)')continue;"
            + "var m=bg.match(/^rgba?\\((\\d+),\\s*(\\d+),\\s*(\\d+)(?:,\\s*([\\d.]+))?/);"
            + "if(!m)continue;"
            + "if(m[4]!==undefined&&parseFloat(m[4])<0.7)continue;"
            + "var r=+m[1],g=+m[2],b=+m[3];"
            + "var mx=Math.max(r,g,b),mn=Math.min(r,g,b),sat=mx-mn;"
            + "var isDarkNeutral=(mx<=64&&sat<=18);"
            + "var isLightNeutral=(mn>=200&&sat<=20);"
            + "if(!isDarkNeutral&&!isLightNeutral)continue;"
            + "if(isLightNeutral){"
            + "var tn=el.tagName;"
            + "if(tn==='BUTTON'||tn==='INPUT'||tn==='SELECT'||tn==='TEXTAREA'||el.getAttribute('role')==='button')continue;"
            + "if(el.offsetWidth>0&&el.offsetHeight>0&&(el.offsetWidth<48||el.offsetHeight<32))continue;"
            + "}"
            + "el.setAttribute('data-sbx-amoled','1');"
            + "el.style.setProperty('background-color','#000000','important');"
            + "}"
            + "}catch(e){}};"
            + "paint();"
            + "if(!window.__sbxAmoledObs){"
            + "window.__sbxAmoledObs=1;"
            + "if(document.readyState==='loading'){document.addEventListener('DOMContentLoaded',paint,{once:true});}"
            + "window.addEventListener('load',paint,{once:true});"
            + "setTimeout(paint,350);setTimeout(paint,1200);"
            + "var tm=null;var mo=new MutationObserver(function(){if(tm)return;tm=setTimeout(function(){tm=null;paint();},200);});"
            + "if(document.documentElement)mo.observe(document.documentElement,{childList:true,subtree:true});"
            + "setTimeout(function(){try{mo.disconnect();}catch(e){}},6000);"
            + "}"
            + "}else{"
            + "try{var prev=document.querySelectorAll('[data-sbx-amoled]');for(var j=0;j<prev.length;j++){prev[j].style.removeProperty('background-color');prev[j].removeAttribute('data-sbx-amoled');}}catch(e){}"
            + "}"
            + "st.textContent=css;"
            + "})();";

    private static final String SBROWSERX_REMOVE_AMOLED_JS =
            "(function(){var st=document.getElementById('sbrowserx-amoled-css');if(st&&st.parentNode)st.parentNode.removeChild(st);try{var prev=document.querySelectorAll('[data-sbx-amoled]');for(var j=0;j<prev.length;j++){prev[j].style.removeProperty('background-color');prev[j].removeAttribute('data-sbx-amoled');}}catch(e){}})();";

    public static void applyAmoledAndColorFixCss(Object webDarkHandler) {
        if (webDarkHandler == null) return;
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            boolean darkActive = isBrowserNightMode(ctx) || isForceAdaptiveDarkEnabled();
            if (!darkActive) {
                removeAmoledAndColorFixCss(webDarkHandler);
                return;
            }
            boolean amoled = isAmoledBlackEnabled();
            String js = SBROWSERX_AMOLED_JS.replace("__AMOLED__", amoled ? "true" : "false");
            Method evalM = sMethodWebDarkEvalJs;
            if (evalM == null) {
                evalM = webDarkHandler.getClass().getMethod("evaluateJavaScript", String.class);
                sMethodWebDarkEvalJs = evalM;
            }
            evalM.invoke(webDarkHandler, js);
        } catch (Throwable ignored) {}
    }

    public static void removeAmoledAndColorFixCss(Object webDarkHandler) {
        if (webDarkHandler == null) return;
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            // Never strip icon-protection / AMOLED CSS while browser Dark Mode is still active
            // (WebDarkCustomHandler.updateCustomCss(4) calls removeCustomCss() on tab switch when
            // "Use website dark theme" is ON, which previously deleted our <style> right away).
            if (isBrowserNightMode(ctx) || isForceAdaptiveDarkEnabled()) {
                applyAmoledAndColorFixCss(webDarkHandler);
                return;
            }
            Method evalM = sMethodWebDarkEvalJs;
            if (evalM == null) {
                evalM = webDarkHandler.getClass().getMethod("evaluateJavaScript", String.class);
                sMethodWebDarkEvalJs = evalM;
            }
            evalM.invoke(webDarkHandler, SBROWSERX_REMOVE_AMOLED_JS);
        } catch (Throwable ignored) {}
    }

    // --- Fix #1 (v0.9.2): Mutual exclusion between Vivid Images and Samsung Web Dark Mode Brightness ---

    public static void recordDarkModeFragment(Object fragment) {
        sDarkModeFragmentTL.set(fragment);
    }

    public static void syncDarkBrightnessExclusionFromTL() {
        Object fragment = sDarkModeFragmentTL.get();
        sDarkModeFragmentTL.remove();
        syncDarkBrightnessExclusion(fragment);
    }

    public static void syncDarkBrightnessExclusion(Object fragment) {
        if (fragment == null) return;
        try {
            Method findPref = fragment.getClass().getMethod("findPreference", CharSequence.class);
            // Permanently hide Samsung's obsolete Web Dark Mode Brightness slider & thumbnail
            for (String k : new String[] {
                    "pref_web_dark_mode_brightness_title",
                    "pref_web_dark_mode_brightness_thumbnail",
                    "pref_web_dark_mode_brightness"
            }) {
                Object p = findPref.invoke(fragment, k);
                if (p != null) {
                    p.getClass().getMethod("setVisible", boolean.class).invoke(p, false);
                }
            }

            // Localize the first sub-option cleanly & sync AMOLED visibility with Dark Mode state
            Object applyPref = findPref.invoke(fragment, "pref_apply_default_dark_mode");
            boolean darkSubVisible = true;
            if (applyPref != null) {
                darkSubVisible = Boolean.TRUE.equals(applyPref.getClass().getMethod("isVisible").invoke(applyPref));
                String title = SBrowserXStrings.get(SBrowserXStrings.DARK_FORCE_LIGHT_TITLE);
                String summary = SBrowserXStrings.get(SBrowserXStrings.DARK_FORCE_LIGHT_SUMMARY);
                applyPref.getClass().getMethod("setTitle", CharSequence.class).invoke(applyPref, title);
                applyPref.getClass().getMethod("setSummary", CharSequence.class).invoke(applyPref, summary);
            }
            Object amoledPref = findPref.invoke(fragment, "sbrowserx_dark_amoled");
            if (amoledPref != null) {
                amoledPref.getClass().getMethod("setVisible", boolean.class).invoke(amoledPref, darkSubVisible);
            }
        } catch (Throwable ignored) {}
    }

    public static void onNativeApplyDefaultDarkToggled(Object fragment, Object newValue) {
        try {
            SBrowserXRestartManager.markDirtyFromUi();
            syncDarkBrightnessExclusion(fragment);
        } catch (Throwable ignored) {}
    }

    // --- Fix #2 (v0.9.2): Zero-Jitter Compact Bar (Direct Android View Translation, No Bitmap Swap) ---

    @SuppressWarnings({"unchecked", "rawtypes"})
    public static boolean handleCompactBottomOffsetY(Object handler, Object tabDelegate, float bottomControlsOffsetYPix) {
        if (handler == null || tabDelegate == null) return false;
        try {
            if (sCompactFieldOffset == null || sCompactFieldTopBar == null) {
                Class<?> baseCls = handler.getClass().getSuperclass();
                if (baseCls == null) return false;
                Field fOff = baseCls.getDeclaredField("mBottomControlsOffsetYPix");
                fOff.setAccessible(true);
                Field fTop = baseCls.getDeclaredField("mTopBar");
                fTop.setAccessible(true);
                Method mShow = baseCls.getMethod("showTopBar");
                sCompactFieldOffset = fOff;
                sCompactFieldTopBar = fTop;
                sCompactMethodShowTopBar = mShow;
            }

            sCompactFieldOffset.setFloat(handler, bottomControlsOffsetYPix);
            Object topBar = sCompactFieldTopBar.get(handler);
            if (!(topBar instanceof View)) return false;
            View topBarView = (View) topBar;

            Class<?> tdCls = tabDelegate.getClass();
            if (sCachedTabDelegateCls != tdCls) {
                if (sBitmapLayerEnumCls == null) {
                    sBitmapLayerEnumCls = Class.forName("com.sec.terrace.content.browser.TerraceBitmapLayer$BitmapLayer");
                    sBitmapLayerBottom = Enum.valueOf((Class<Enum>) sBitmapLayerEnumCls, "BITMAP_LAYER_BOTTOMBAR");
                }
                sTabMethodUpdateBitmapLayer = tdCls.getMethod("updateBitmapToolbarLayerVisibility", sBitmapLayerEnumCls, boolean.class);
                sTabMethodIsFullScreen = tdCls.getMethod("isFullScreenMode");
                sTabMethodIsLoading = tdCls.getMethod("isLoading");
                sCachedTabDelegateCls = tdCls;
            }

            try {
                if (sTabMethodUpdateBitmapLayer != null && sBitmapLayerBottom != null) {
                    sTabMethodUpdateBitmapLayer.invoke(tabDelegate, sBitmapLayerBottom, false);
                }
            } catch (Throwable ignored) {}

            if (sTabMethodIsFullScreen != null && Boolean.TRUE.equals(sTabMethodIsFullScreen.invoke(tabDelegate))) {
                return true;
            }

            boolean loading = sTabMethodIsLoading != null
                    && Boolean.TRUE.equals(sTabMethodIsLoading.invoke(tabDelegate));

            if (topBarView.getVisibility() != View.VISIBLE && sCompactMethodShowTopBar != null) {
                sCompactMethodShowTopBar.invoke(handler);
            }

            // Deadzone (4px) + loading lock + 0.25px dedup for silky 120Hz scrolling with zero reflection overhead
            float ty = (loading || bottomControlsOffsetYPix <= 4.0f) ? 0.0f : bottomControlsOffsetYPix;
            if (Math.abs(topBarView.getTranslationY() - ty) >= 0.25f) {
                topBarView.setTranslationY(ty);
            }
            if (topBarView.getAlpha() != 1.0f) topBarView.setAlpha(1.0f);
            if (topBarView.getScaleX() != 1.0f) topBarView.setScaleX(1.0f);
            if (topBarView.getScaleY() != 1.0f) topBarView.setScaleY(1.0f);
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    public static void resetCompactBarTranslation(Object handler) {
        if (handler == null) return;
        try {
            if (sCompactFieldTopBar == null) {
                Class<?> baseCls = handler.getClass().getSuperclass();
                if (baseCls == null) return;
                Field fTop = baseCls.getDeclaredField("mTopBar");
                fTop.setAccessible(true);
                sCompactFieldTopBar = fTop;
            }
            Object topBar = sCompactFieldTopBar.get(handler);
            if (topBar instanceof View) {
                View v = (View) topBar;
                v.setTranslationY(0.0f);
                v.setAlpha(1.0f);
                v.setScaleX(1.0f);
                v.setScaleY(1.0f);
            }
        } catch (Throwable ignored) {}
    }

    public static void notifyCompactToolbarUpdated() {
        try {
            Class<?> ctm = Class.forName("com.sec.android.app.sbrowser.common.customize_toolbar.CustomizeToolbarManager");
            Object inst = ctm.getMethod("getInstance").invoke(null);
            ctm.getMethod("reloadMenu").invoke(inst);
        } catch (Throwable t) {
            Log.w(TAG, "notifyCompactToolbarUpdated failed", t);
        }
    }

    // --- Fix #3: Stabilize Compact Bar on Refresh/Load + Replace Galaxy AI Icon ---

    public static boolean shouldStabilizeCompactBarOnLoad(Object handler, Object tabDelegate) {
        if (handler == null || tabDelegate == null) return false;
        try {
            // Never let Samsung's unfinished 0.85x shrink/fade jitter run on Compact pill
            Class<?> baseCls = handler.getClass().getSuperclass();
            if (baseCls != null) {
                Field fTop = baseCls.getDeclaredField("mTopBar");
                fTop.setAccessible(true);
                Object topBar = fTop.get(handler);
                if (topBar != null) {
                    topBar.getClass().getMethod("setAlpha", float.class).invoke(topBar, 1.0f);
                    topBar.getClass().getMethod("setScaleX", float.class).invoke(topBar, 1.0f);
                    topBar.getClass().getMethod("setScaleY", float.class).invoke(topBar, 1.0f);
                }
            }
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    public static void recordCustomizeMenuModel(Object model) {
        sCustomizeMenuModelTL.set(model);
    }

    @SuppressWarnings("unchecked")
    public static List<MenuItem> replaceCompactAiButton(List<MenuItem> items) {
        Object model = sCustomizeMenuModelTL.get();
        sCustomizeMenuModelTL.remove();
        if (items == null || items.isEmpty() || !isCompactLayoutActive()) return items;
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            if (ctx == null) return items;
            String pkg = ctx.getPackageName();
            android.content.res.Resources res = ctx.getResources();
            int aiId = res.getIdentifier("action_browsing_assist", "id", pkg);
            if (aiId == 0) return items;

            int aiIdx = -1;
            for (int i = 0; i < items.size(); i++) {
                MenuItem mi = items.get(i);
                if (mi != null && mi.getItemId() == aiId) {
                    aiIdx = i;
                    break;
                }
            }
            if (aiIdx < 0) return items;

            String choice = SBrowserXPrefs.getCompactAiButton(ctx);
            List<MenuItem> copy = new ArrayList<>(items);
            if (SBrowserXPrefs.COMPACT_BTN_HIDE.equals(choice)) {
                copy.remove(aiIdx);
                return copy;
            }

            String targetResName;
            if (SBrowserXPrefs.COMPACT_BTN_BOOKMARKS.equals(choice)) targetResName = "action_bookmarks";
            else if (SBrowserXPrefs.COMPACT_BTN_SHARE.equals(choice)) targetResName = "action_share";
            else if (SBrowserXPrefs.COMPACT_BTN_DOWNLOADS.equals(choice)) targetResName = "action_downloads";
            else if (SBrowserXPrefs.COMPACT_BTN_HISTORY.equals(choice)) targetResName = "action_history";
            else if (SBrowserXPrefs.COMPACT_BTN_HOME.equals(choice)) targetResName = "action_home";
            else targetResName = "action_new_tab";

            int targetId = res.getIdentifier(targetResName, "id", pkg);
            if (targetId == 0 || model == null) {
                copy.remove(aiIdx);
                return copy;
            }

            // Avoid duplicate if already present in toolbar
            for (MenuItem mi : copy) {
                if (mi != null && mi.getItemId() == targetId) {
                    copy.remove(aiIdx);
                    return copy;
                }
            }

            Field fMenu = model.getClass().getDeclaredField("mMenu");
            fMenu.setAccessible(true);
            Menu menu = (Menu) fMenu.get(model);
            MenuItem replacement = menu != null ? menu.findItem(targetId) : null;
            if (replacement != null) {
                replacement.setVisible(true);
                copy.set(aiIdx, replacement);
            } else {
                copy.remove(aiIdx);
            }
            // Strip any dynamic extension / add-ons button from Compact bar so no 40dp phantom gap ever appears between Tabs and More
            int extId = res.getIdentifier("action_extensions", "id", pkg);
            int origExtId = res.getIdentifier("action_origin_toolbar_extensions", "id", pkg);
            int tabsId = res.getIdentifier("action_tabs", "id", pkg);
            int moreId = res.getIdentifier("action_more", "id", pkg);
            java.util.Iterator<MenuItem> itClean = copy.iterator();
            while (itClean.hasNext()) {
                MenuItem mi = itClean.next();
                if (mi == null) { itClean.remove(); continue; }
                int id = mi.getItemId();
                if ((extId != 0 && id == extId) || (origExtId != 0 && id == origExtId)) {
                    itClean.remove();
                } else if (id != tabsId && id != moreId && id != targetId && id != aiId) {
                    // Only keep known native toolbar items on right side of Compact pill
                    if (mi.getIntent() != null || mi.getGroupId() == 0) {
                        itClean.remove();
                    }
                }
            }
            return copy;
        } catch (Throwable t) {
            Log.w(TAG, "replaceCompactAiButton failed", t);
            return items;
        }
    }

    // --- Fix #5: Crisp, High-Contrast Typography & Icons in Side More Menu ---

    public static void enhanceMoreMenuItemCrispness(Object viewHolder) {
        if (viewHolder == null) return;
        try {
            Field fItemView = viewHolder.getClass().getField("itemView");
            View root = (View) fItemView.get(viewHolder);
            if (root == null) return;
            boolean night = isBrowserNightMode(root.getContext());
            boolean enabled = root.isEnabled();
            int activeColor = night ? 0xFFFFFFFF : 0xFF000000;
            int disabledColor = night ? 0x99FFFFFF : 0x8A000000;
            int targetColor = enabled ? activeColor : disabledColor;
            Typeface mediumTf = Typeface.create("sans-serif-medium", Typeface.NORMAL);
            applyCrispMenuRecursive(root, targetColor, mediumTf);
        } catch (Throwable ignored) {}
    }

    private static void applyCrispMenuRecursive(View v, int color, Typeface tf) {
        if (v instanceof TextView) {
            TextView tv = (TextView) v;
            tv.setTypeface(tf);
            tv.setTextColor(color);
        } else if (v instanceof ImageView) {
            ImageView iv = (ImageView) v;
            if (iv.getDrawable() != null) {
                iv.setColorFilter(color, android.graphics.PorterDuff.Mode.SRC_IN);
            }
        } else if (v instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) v;
            for (int i = 0; i < vg.getChildCount(); i++) {
                applyCrispMenuRecursive(vg.getChildAt(i), color, tf);
            }
        }
    }

    public static void applyUrlBarGlassStyle(Object locationBarObj) {
        if (locationBarObj == null) return;
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            if (ctx != null && !SBrowserXPrefs.isUrlBarBlurEnabled(ctx)) return;

            View urlBarParent = (View) locationBarObj.getClass().getMethod("getUrlBarParent").invoke(locationBarObj);
            if (urlBarParent == null) return;
            Drawable bg = urlBarParent.getBackground();
            if (bg == null) return;
            Drawable current = bg.getCurrent();
            if (current == null) return;
            Drawable mutated = current.mutate();

            boolean isEdit = false;
            try {
                Object res = locationBarObj.getClass().getMethod("isEditMode").invoke(locationBarObj);
                isEdit = Boolean.TRUE.equals(res);
            } catch (Throwable ignored) {}

            int transparency = ctx != null ? SBrowserXPrefs.getUrlBarTransparency(ctx) : 50;
            int opacity = 100 - transparency; // 15..85
            int alpha = clampByte(Math.round(255f * opacity / 100f));
            if (isEdit) {
                alpha = Math.max(alpha, 215);
            }
            mutated.setAlpha(alpha);

            if (mutated instanceof GradientDrawable && !isEdit && alpha < 220) {
                Context vCtx = urlBarParent.getContext();
                boolean night = isBrowserNightMode(vCtx);
                int strokePx = Math.max(1, Math.round(vCtx.getResources().getDisplayMetrics().density * 0.75f));
                int strokeColor = night ? 0x26FFFFFF : 0x1A000000;
                ((GradientDrawable) mutated).setStroke(strokePx, strokeColor);
            }
        } catch (Throwable t) {
            Log.w(TAG, "applyUrlBarGlassStyle failed", t);
        }
    }


    public static boolean isHideSamsungAdBlockersEnabled() {
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            return ctx != null && SBrowserXPrefs.isHideSamsungAdBlockersEnabled(ctx);
        } catch (Throwable t) {
            return false;
        }
    }

    // --- Native Auto-Close Unused Tabs (adds "After 1 day" at index 1) ---

    public static List<String> getAutoCloseKeys() {
        return Arrays.asList(
                "close_never",
                "close_after_1day",
                "close_after_7days",
                "close_after_30days",
                "close_automatically"
        );
    }

    public static List<String> insertAutoClose1DayTitle(List<String> stockTitles) {
        List<String> out = new ArrayList<>();
        if (stockTitles != null && !stockTitles.isEmpty()) {
            out.add(stockTitles.get(0)); // Never
            out.add(SBrowserXStrings.get(SBrowserXStrings.AUTOCLOSE_1D_OPTION)); // After 1 day
            for (int i = 1; i < stockTitles.size(); i++) {
                out.add(stockTitles.get(i));
            }
        } else {
            out.add("Never");
            out.add(SBrowserXStrings.get(SBrowserXStrings.AUTOCLOSE_1D_OPTION));
            out.add("After 7 days");
            out.add("After 30 days");
            out.add("With smart tab management");
        }
        return out;
    }

    public static int getAutoCloseTabStatus(long lastUsedTime, int settingValue) {
        if (settingValue == 0) return 1; // Never -> keep
        if (settingValue == 4) return 2; // Smart tab management
        long days = TimeUnit.MILLISECONDS.toDays(System.currentTimeMillis() - lastUsedTime);
        if (settingValue == 1) return days < 1L ? 1 : 0; // 1 day
        if (settingValue == 2) return days < 7L ? 1 : 0; // 7 days
        if (settingValue == 3) return days < 30L ? 1 : 0; // 30 days
        return 1;
    }

    // --- External Download Manager ---


    /**
     * Forwards context-menu downloads ("Save image", "Save video", "Save link")
     * to the configured external download manager. Skips data:/blob: URLs so
     * stock browser handles inline/in-memory blobs safely.
     */
    private static boolean isImageExtension(String s) {
        if (s == null) return false;
        String lower = s.toLowerCase(java.util.Locale.US);
        int q = lower.indexOf('?');
        if (q >= 0) lower = lower.substring(0, q);
        int h = lower.indexOf('#');
        if (h >= 0) lower = lower.substring(0, h);
        return lower.endsWith(".jpg") || lower.endsWith(".jpeg") || lower.endsWith(".png")
                || lower.endsWith(".webp") || lower.endsWith(".gif") || lower.endsWith(".avif")
                || lower.endsWith(".bmp") || lower.endsWith(".svg") || lower.endsWith(".heic")
                || lower.endsWith(".heif") || lower.endsWith(".ico");
    }

    private static boolean isVideoOrAudioExtension(String s) {
        if (s == null) return false;
        String lower = s.toLowerCase(java.util.Locale.US);
        int q = lower.indexOf('?');
        if (q >= 0) lower = lower.substring(0, q);
        return lower.endsWith(".mp4") || lower.endsWith(".webm") || lower.endsWith(".mkv")
                || lower.endsWith(".mov") || lower.endsWith(".avi") || lower.endsWith(".m3u8")
                || lower.endsWith(".mp3") || lower.endsWith(".m4a") || lower.endsWith(".ogg")
                || lower.endsWith(".flac") || lower.endsWith(".wav") || lower.endsWith(".aac");
    }

    private static boolean isLikelyImageDownload(String url, String mime, String filename, boolean isContextMedia) {
        if (mime != null && mime.toLowerCase(java.util.Locale.US).startsWith("image/")) return true;
        if (isImageExtension(filename) || isImageExtension(url)) return true;
        // Context-menu downloadImage passes isMedia=true; if it's not explicitly video/audio, treat as image
        return isContextMedia && !isVideoOrAudioExtension(url) && !isVideoOrAudioExtension(filename);
    }

    public static boolean tryHandOffDirectUrlDownload(String url, boolean isMedia) {
        if (url == null || !(url.startsWith("http://") || url.startsWith("https://"))) {
            return false;
        }
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            if (ctx == null || !SBrowserXPrefs.isExternalDownloaderEnabled(ctx)) return false;
            if (isLikelyImageDownload(url, null, null, isMedia)
                    && !SBrowserXPrefs.isExternalDownloaderImagesEnabled(ctx)) {
                return false;
            }

            Activity host = sMainActivityRef.get();
            Context launchCtx = (host != null && !host.isFinishing() && !host.isDestroyed()) ? host : ctx;

            String filename = null;
            try {
                String seg = Uri.parse(url).getLastPathSegment();
                if (seg != null && !seg.isEmpty() && seg.length() < 128) filename = seg;
            } catch (Throwable ignored) {}

            Intent viewIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
            if (filename != null) {
                viewIntent.putExtra(Intent.EXTRA_TITLE, filename);
            }
            viewIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);

            String targetPkg = SBrowserXPrefs.getExternalDownloaderPackage(ctx);
            if (targetPkg != null && !targetPkg.isEmpty()) {
                viewIntent.setPackage(targetPkg);
                try {
                    launchCtx.startActivity(viewIntent);
                    return true;
                } catch (Throwable viewErr) {
                    Intent sendIntent = new Intent(Intent.ACTION_SEND);
                    sendIntent.setType("text/plain");
                    sendIntent.putExtra(Intent.EXTRA_TEXT, url);
                    if (filename != null) {
                        sendIntent.putExtra(Intent.EXTRA_TITLE, filename);
                    }
                    sendIntent.setPackage(targetPkg);
                    sendIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    launchCtx.startActivity(sendIntent);
                    return true;
                }
            }

            Intent chooser = Intent.createChooser(viewIntent, SBrowserXStrings.get(SBrowserXStrings.EXT_DL_CHOOSER));
            chooser.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            launchCtx.startActivity(chooser);
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "tryHandOffDirectUrlDownload failed, falling back to stock", t);
            return false;
        }
    }

    public static boolean isForceAdaptiveDarkEnabled() {
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            return ctx != null && SBrowserXPrefs.isForceAdaptiveDarkEnabled(ctx);
        } catch (Throwable t) {
            return false;
        }
    }

    public static boolean isDarkBrightImagesEnabled() {
        return true;
    }

    public static boolean adjustNightDimEnabled(boolean stockEnabled) {
        if (isDarkBrightImagesEnabled()) {
            return false; // Completely disable Samsung's NightDim grey veil over images
        }
        return stockEnabled;
    }

    public static int adjustNightDimGain(int stockGain) {
        if (isDarkBrightImagesEnabled()) {
            return 0;
        }
        return stockGain;
    }

    public static int adjustVaxContrastFactor(int stockFactor) {
        if (isDarkBrightImagesEnabled()) {
            return 100; // Full 100% vibrancy instead of Samsung's washed-out 50%
        }
        return stockFactor;
    }

    public static int adjustForceDarkBehavior(int stockBehavior) {
        // In Samsung Terrace: 1 = Always apply dark mode to ALL sites (including light-only sites like comss.ru),
        // 2 = Use website's own dark theme ONLY (leave light-only sites white).
        if (isForceAdaptiveDarkEnabled()) {
            return 1;
        }
        return stockBehavior;
    }

    public static void applyDarkBrightImagesNow(boolean enabled) {
        try {
            Class<?> bridge = Class.forName("com.sec.terrace.browser.prefs.TerracePrefServiceBridge");
            if (enabled) {
                bridge.getMethod("setUseNightDim", boolean.class, int.class).invoke(null, false, 0);
                bridge.getMethod("setVAXContrastFactor", int.class).invoke(null, 100);
            } else {
                bridge.getMethod("setVAXContrastFactor", int.class).invoke(null, 50);
            }
        } catch (Throwable t) {
            Log.w(TAG, "applyDarkBrightImagesNow skipped", t);
        }
    }

    public static void applyForceAdaptiveDarkNow(boolean enabled) {
        try {
            Class<?> bridge = Class.forName("com.sec.terrace.browser.prefs.TerracePrefServiceBridge");
            Class<?> dmu = Class.forName("com.sec.android.app.sbrowser.common.device.DarkModeUtils");
            Object inst = dmu.getMethod("getInstance").invoke(null);
            if (enabled) {
                bridge.getMethod("setForceDarkBehavior", int.class).invoke(null, 1);
                bridge.getMethod("setNightMode", boolean.class).invoke(null, true);
            } else {
                boolean useSiteOnly = Boolean.TRUE.equals(dmu.getMethod("isUseWebsiteDarkThemeEnabled").invoke(inst));
                bridge.getMethod("setForceDarkBehavior", int.class).invoke(null, useSiteOnly ? 2 : 1);
                boolean stockDark = Boolean.TRUE.equals(dmu.getMethod("isContentDarkModeEnabled").invoke(inst));
                bridge.getMethod("setNightMode", boolean.class).invoke(null, stockDark);
            }
        } catch (Throwable t) {
            Log.w(TAG, "applyForceAdaptiveDarkNow skipped", t);
        }
    }

    private static boolean launchSendDownloadIntent(Context ctx, String targetPkg, String url, String filename) {
        try {
            Intent sendIntent = new Intent(Intent.ACTION_SEND);
            sendIntent.setType("text/plain");
            sendIntent.putExtra(Intent.EXTRA_TEXT, url);
            if (filename != null && !filename.isEmpty()) {
                sendIntent.putExtra(Intent.EXTRA_TITLE, filename);
                sendIntent.putExtra(Intent.EXTRA_SUBJECT, filename);
            }
            sendIntent.setPackage(targetPkg);
            sendIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            ctx.startActivity(sendIntent);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static boolean launchViewDownloadIntent(Context ctx, String targetPkg, String url, String mime, String filename) {
        try {
            Intent viewIntent = new Intent(Intent.ACTION_VIEW);
            if (mime != null && !mime.isEmpty() && !mime.equals("application/octet-stream")) {
                viewIntent.setDataAndType(Uri.parse(url), mime);
            } else {
                viewIntent.setData(Uri.parse(url));
            }
            if (filename != null && !filename.isEmpty()) {
                viewIntent.putExtra(Intent.EXTRA_TITLE, filename);
            }
            viewIntent.setPackage(targetPkg);
            viewIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            ctx.startActivity(viewIntent);
            return true;
        } catch (Throwable ignored) {
            // Retry plain ACTION_VIEW without MIME (some managers like ABDM/1DM reject specific MIME types)
            try {
                Intent plainView = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
                if (filename != null && !filename.isEmpty()) {
                    plainView.putExtra(Intent.EXTRA_TITLE, filename);
                }
                plainView.setPackage(targetPkg);
                plainView.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                ctx.startActivity(plainView);
                return true;
            } catch (Throwable ignored2) {
                return false;
            }
        }
    }

    public static boolean tryHandOffDownload(Object downloadHandler, Activity activity) {
        if (downloadHandler == null || activity == null) return false;
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            if (ctx == null || !SBrowserXPrefs.isExternalDownloaderEnabled(ctx)) return false;

            Field f = downloadHandler.getClass().getDeclaredField("mPreDownloadInfo");
            f.setAccessible(true);
            Object info = f.get(downloadHandler);
            if (info == null) return false;

            String url = (String) info.getClass().getMethod("getUrl").invoke(info);
            if (url == null || !(url.startsWith("http://") || url.startsWith("https://"))) {
                return false;
            }
            if (url.contains("webapk-cdn.internet.apps.samsung.com") || url.contains("webapk-api.internet.apps.samsung.com")) {
                return false;
            }
            String mime = (String) info.getClass().getMethod("getMimetype").invoke(info);
            String filename = (String) info.getClass().getMethod("getFilename").invoke(info);
            if (isLikelyImageDownload(url, mime, filename, false)
                    && !SBrowserXPrefs.isExternalDownloaderImagesEnabled(ctx)) {
                return false;
            }

            String targetPkg = SBrowserXPrefs.getExternalDownloaderPackage(ctx);
            if (targetPkg != null && !targetPkg.isEmpty()) {
                String lowPkg = targetPkg.toLowerCase(java.util.Locale.US);
                boolean preferSend = lowPkg.contains("abdownloadmanager") || lowPkg.contains("abdm") || lowPkg.contains("seal");
                if (preferSend && launchSendDownloadIntent(activity, targetPkg, url, filename)) {
                    return true;
                }
                if (launchViewDownloadIntent(activity, targetPkg, url, mime, filename)) {
                    return true;
                }
                if (!preferSend && launchSendDownloadIntent(activity, targetPkg, url, filename)) {
                    return true;
                }
                return false;
            }

            Intent viewIntent = new Intent(Intent.ACTION_VIEW);
            if (mime != null && !mime.isEmpty() && !mime.equals("application/octet-stream")) {
                viewIntent.setDataAndType(Uri.parse(url), mime);
            } else {
                viewIntent.setData(Uri.parse(url));
            }
            if (filename != null && !filename.isEmpty()) {
                viewIntent.putExtra(Intent.EXTRA_TITLE, filename);
            }
            viewIntent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);

            Intent chooser = Intent.createChooser(viewIntent, SBrowserXStrings.get(SBrowserXStrings.EXT_DL_CHOOSER));
            chooser.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            activity.startActivity(chooser);
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "tryHandOffDownload failed, falling back to stock downloader", t);
            return false;
        }
    }

    // --- Google Translate Hooks ---

    public static boolean isGoogleTranslateEnabled() {
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            return ctx == null || SBrowserXPrefs.isGoogleTranslateEnabled(ctx);
        } catch (Throwable t) {
            return true;
        }
    }

    public static void setActiveTransService(Object sixTransService) {
        sActiveTransService = sixTransService;
    }

    public static boolean tryTransGetSupport(Object service, long cb) {
        return SBrowserXGoogleTranslator.handleGetSupport(service, cb);
    }

    public static boolean tryTransGetMode(Object service, long cb) {
        return SBrowserXGoogleTranslator.handleGetMode(service, cb);
    }

    public static boolean tryTransCreate(Object service, long cb) {
        return SBrowserXGoogleTranslator.handleCreateTrans(service, cb);
    }

    public static boolean tryTransGetLangList(Object service, String direction, long cb) {
        return SBrowserXGoogleTranslator.handleGetLangList(service, direction, cb);
    }

    public static boolean tryTransDetectLang(Object service, String text, long cb) {
        return SBrowserXGoogleTranslator.handleDetectionLang(service, text, cb);
    }

    public static boolean tryGoogleTranslate(
            String sourceLang,
            String targetLang,
            String[] textList,
            long nativeCallback
    ) {
        return SBrowserXGoogleTranslator.handleTranslate(
                sActiveTransService, sourceLang, targetLang, textList, nativeCallback);
    }

    public static boolean tryOpenTranslateSettings(Object service) {
        if (!isGoogleTranslateEnabled()) return false;
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            Activity main = sMainActivityRef.get();
            Context launchCtx = main != null ? main : ctx;
            if (launchCtx == null) return false;
            Intent intent = new Intent(launchCtx, SBrowserXTranslateSettingsActivity.class);
            if (!(launchCtx instanceof Activity)) {
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            }
            launchCtx.startActivity(intent);
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "tryOpenTranslateSettings failed", t);
            return false;
        }
    }

    public static void localizeCustomPreferences(Object fragment) {
        if (fragment == null) return;
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            if (ctx == null) return;
            Method findPref = fragment.getClass().getMethod("findPreference", CharSequence.class);

            Object extDl = findPref.invoke(fragment, "sbrowserx_external_downloader");
            if (extDl != null) {
                extDl.getClass().getMethod("setTitle", CharSequence.class)
                        .invoke(extDl, SBrowserXStrings.get(SBrowserXStrings.EXT_DL_TITLE));
                extDl.getClass().getMethod("setSummary", CharSequence.class)
                        .invoke(extDl, getExternalDownloaderSummary(ctx));
            }

            Object webrtc = findPref.invoke(fragment, "sbrowserx_privacy_webrtc");
            if (webrtc != null) {
                webrtc.getClass().getMethod("setTitle", CharSequence.class)
                        .invoke(webrtc, SBrowserXStrings.get(SBrowserXStrings.WEBRTC_TITLE));
                webrtc.getClass().getMethod("setSummary", CharSequence.class)
                        .invoke(webrtc, SBrowserXStrings.webrtcLabel(SBrowserXPrefs.getWebRtcPolicy(ctx)));
            }

            Object extPref = findPref.invoke(fragment, "sbrowserx_settings_extensions");
            if (extPref != null) {
                String lang = java.util.Locale.getDefault().getLanguage();
                String extSum = "ru".equals(lang) ? "Управление расширениями и Chrome Web Store"
                        : ("uk".equals(lang) ? "Керування розширеннями та Chrome Web Store"
                        : "Manage extensions & Chrome Web Store");
                extPref.getClass().getMethod("setSummary", CharSequence.class).invoke(extPref, extSum);
            }

            Object bmPref = findPref.invoke(fragment, "sbrowserx_settings_bookmarks");
            if (bmPref != null) {
                String lang = java.util.Locale.getDefault().getLanguage();
                String bmTitle = "ru".equals(lang) ? "Закладки"
                        : ("uk".equals(lang) ? "Закладки" : "Bookmarks");
                String bmSum = "ru".equals(lang) ? "Быстрый переход к закладкам и папкам"
                        : ("uk".equals(lang) ? "Швидкий перехід до закладок і папок"
                        : "Quick access to bookmarks & folders");
                bmPref.getClass().getMethod("setTitle", CharSequence.class).invoke(bmPref, bmTitle);
                bmPref.getClass().getMethod("setSummary", CharSequence.class).invoke(bmPref, bmSum);
            }

            Object hub = findPref.invoke(fragment, "sbrowserx_settings_hub");
            if (hub != null) {
                String summary = SBrowserXStrings.get(SBrowserXStrings.CAT_EXTENSIONS) + ", WebRTC, "
                        + SBrowserXStrings.get(SBrowserXStrings.CAT_APPEARANCE);
                hub.getClass().getMethod("setSummary", CharSequence.class).invoke(hub, summary);
            }

            String onLbl = SBrowserXStrings.get(SBrowserXStrings.BTN_ENABLE);
            String offLbl = SBrowserXStrings.get(SBrowserXStrings.BTN_DISABLE);

            bindNativeSwitch(findPref, fragment, "sbrowserx_privacy_fingerprint",
                    SBrowserXStrings.get(SBrowserXStrings.FINGERPRINT_TITLE),
                    SBrowserXStrings.get(SBrowserXStrings.FINGERPRINT_SUMMARY),
                    SBrowserXPrefs.isFingerprintProtectionEnabled(ctx),
                    checked -> SBrowserXPrefs.setFingerprintProtectionEnabled(ctx, checked));

            bindNativeSwitch(findPref, fragment, "sbrowserx_privacy_hide_adblockers",
                    SBrowserXStrings.get(SBrowserXStrings.HIDE_ADBLOCKERS_TITLE),
                    SBrowserXStrings.get(SBrowserXStrings.HIDE_ADBLOCKERS_SUMMARY),
                    SBrowserXPrefs.isHideSamsungAdBlockersEnabled(ctx),
                    checked -> SBrowserXPrefs.setHideSamsungAdBlockersEnabled(ctx, checked));

            bindNativeSwitch(findPref, fragment, "sbrowserx_external_downloader_images",
                    SBrowserXStrings.get(SBrowserXStrings.EXT_DL_IMAGES_TITLE),
                    SBrowserXStrings.get(SBrowserXStrings.EXT_DL_IMAGES_SUMMARY),
                    SBrowserXPrefs.isExternalDownloaderImagesEnabled(ctx),
                    checked -> SBrowserXPrefs.setExternalDownloaderImagesEnabled(ctx, checked));

            bindNativeSwitch(findPref, fragment, "sbrowserx_dark_amoled",
                    SBrowserXStrings.get(SBrowserXStrings.AMOLED_TITLE),
                    SBrowserXStrings.get(SBrowserXStrings.AMOLED_SUMMARY),
                    SBrowserXPrefs.isAmoledBlackEnabled(ctx),
                    checked -> SBrowserXPrefs.setAmoledBlackEnabled(ctx, checked));



            syncDarkBrightnessExclusion(fragment);

            String layoutSum = (SBrowserXPrefs.isBottomBarBlurEnabled(ctx) ? SBrowserXPrefs.getBottomBarTransparency(ctx) + "%" : offLbl)
                    + " • " + (SBrowserXPrefs.isUrlBarBlurEnabled(ctx) ? SBrowserXPrefs.getUrlBarTransparency(ctx) + "%" : offLbl)
                    + " • " + (SBrowserXPrefs.isCompactBarBlurEnabled(ctx) ? SBrowserXPrefs.getCompactBarTransparency(ctx) + "%" : offLbl);
            setNativePref(findPref, fragment, "sbrowserx_layout_transparency",
                    SBrowserXStrings.get(SBrowserXStrings.LAYOUT_TRANSPARENCY_TITLE),
                    layoutSum);

            boolean isCompact = isCompactLayoutActive();
            Object compactBtnPref = findPref.invoke(fragment, "sbrowserx_layout_compact_button");
            if (compactBtnPref != null) {
                compactBtnPref.getClass().getMethod("setTitle", CharSequence.class)
                        .invoke(compactBtnPref, SBrowserXStrings.get(SBrowserXStrings.COMPACT_AI_BTN_TITLE));
                compactBtnPref.getClass().getMethod("setSummary", CharSequence.class)
                        .invoke(compactBtnPref, isCompact
                                ? SBrowserXStrings.compactButtonLabel(SBrowserXPrefs.getCompactAiButton(ctx))
                                : SBrowserXStrings.get(SBrowserXStrings.LAYOUT_ONLY_COMPACT));
                compactBtnPref.getClass().getMethod("setEnabled", boolean.class)
                        .invoke(compactBtnPref, isCompact);
            }

            String transSum = (SBrowserXPrefs.isGoogleTranslateEnabled(ctx) ? onLbl : offLbl)
                    + " • " + SBrowserXGoogleTranslator.getLanguageDisplayName(SBrowserXPrefs.getTranslateTargetLang(ctx));
            setNativePref(findPref, fragment, "sbrowserx_useful_translate",
                    SBrowserXStrings.get(SBrowserXStrings.GTRANS_SETTINGS_TITLE),
                    transSum);

            bindNativeSwitch(findPref, fragment, "sbrowserx_unlimited_tabs",
                    SBrowserXStrings.get(SBrowserXStrings.UNLIMITED_TABS_TITLE),
                    SBrowserXStrings.get(SBrowserXStrings.UNLIMITED_TABS_SUMMARY),
                    SBrowserXPrefs.isUnlimitedTabsEnabled(ctx),
                    checked -> SBrowserXPrefs.setUnlimitedTabsEnabled(ctx, checked));

            setNativePref(findPref, fragment, "sbrowserx_sync_backup",
                    SBrowserXStrings.get(SBrowserXStrings.SYNC_BACKUP_TITLE),
                    SBrowserXStrings.get(SBrowserXStrings.SYNC_BACKUP_SUMMARY));

            setNativePref(findPref, fragment, "sbrowserx_browsing_assist",
                    SBrowserXStrings.get(SBrowserXStrings.ASSIST_TITLE),
                    SBrowserXStrings.get(SBrowserXStrings.ASSIST_SUMMARY));

            String[] deadKeys = new String[] {
                    "cloud_sync", "pref_browsing_assist", "pref_drawing_assist",
                    "pref_shopping_assistant", "pref_read_aloud", "pref_contact_us", "pref_leave_internet"
            };
            for (String dk : deadKeys) {
                try {
                    Object dp = findPref.invoke(fragment, dk);
                    if (dp != null) {
                        dp.getClass().getMethod("setVisible", boolean.class).invoke(dp, false);
                    }
                } catch (Throwable ignored2) {}
            }
        } catch (Throwable ignored) {}
    }

    private interface NativeSwitchCallback { void onChanged(boolean checked); }

    private static void syncSwitchChecked(Method findPref, Object fragment, String key, boolean checked) {
        try {
            Object pref = findPref.invoke(fragment, key);
            if (pref != null) {
                pref.getClass().getMethod("setChecked", boolean.class).invoke(pref, checked);
            }
        } catch (Throwable ignored) {}
    }

    private static void bindNativeSwitch(
            Method findPref, Object fragment, String key,
            String title, String summary, boolean initialChecked,
            NativeSwitchCallback cb
    ) {
        try {
            Object pref = findPref.invoke(fragment, key);
            if (pref == null) return;
            pref.getClass().getMethod("setTitle", CharSequence.class).invoke(pref, title);
            pref.getClass().getMethod("setSummary", CharSequence.class).invoke(pref, summary);
            pref.getClass().getMethod("setChecked", boolean.class).invoke(pref, initialChecked);

            // R8-safe reflection: locate setOnPreferenceChangeListener(obfuscatedInterface)
            Method setListener = null;
            for (Method m : pref.getClass().getMethods()) {
                if ("setOnPreferenceChangeListener".equals(m.getName()) && m.getParameterTypes().length == 1) {
                    setListener = m;
                    break;
                }
            }
            if (setListener != null) {
                Class<?> iface = setListener.getParameterTypes()[0];
                Object proxy = Proxy.newProxyInstance(
                        iface.getClassLoader(),
                        new Class<?>[] { iface },
                        (p, method, args) -> {
                            if (args != null && args.length == 2 && args[1] instanceof Boolean) {
                                cb.onChanged((Boolean) args[1]);
                                return Boolean.TRUE;
                            }
                            return Boolean.TRUE;
                        });
                setListener.invoke(pref, proxy);
            }
        } catch (Throwable t) {
            Log.w(TAG, "bindNativeSwitch failed for " + key, t);
        }
    }

    private static void setNativePref(Method findPref, Object fragment, String key, String title, String summary) {
        try {
            Object pref = findPref.invoke(fragment, key);
            if (pref != null) {
                pref.getClass().getMethod("setTitle", CharSequence.class).invoke(pref, title);
                pref.getClass().getMethod("setSummary", CharSequence.class).invoke(pref, summary);
            }
        } catch (Throwable ignored) {}
    }

    public static String getExternalDownloaderSummary(Context ctx) {
        if (ctx == null || !SBrowserXPrefs.isExternalDownloaderEnabled(ctx)) {
            return SBrowserXStrings.get(SBrowserXStrings.BTN_DISABLE);
        }
        String pkg = SBrowserXPrefs.getExternalDownloaderPackage(ctx);
        if (pkg == null || pkg.isEmpty()) {
            return SBrowserXStrings.get(SBrowserXStrings.EXT_DL_CHOOSER);
        }
        try {
            android.content.pm.PackageManager pm = ctx.getPackageManager();
            CharSequence label = pm.getApplicationLabel(pm.getApplicationInfo(pkg, 0));
            if (label != null && label.length() > 0) return label.toString();
        } catch (Throwable ignored) {}
        return pkg;
    }

    public static String[] getGoogleTranslateLangCodes() {
        if (!isGoogleTranslateEnabled()) return null;
        String[][] langs = SBrowserXGoogleTranslator.SUPPORTED_LANGUAGES;
        String[] out = new String[langs.length];
        for (int i = 0; i < langs.length; i++) {
            out[i] = langs[i][0];
        }
        return out;
    }

    public static String getGoogleTranslateTargetLangOrNull() {
        if (!isGoogleTranslateEnabled()) return null;
        Context ctx = SBrowserXPrefs.getAppContext();
        return ctx != null ? SBrowserXPrefs.getTranslateTargetLang(ctx) : "en";
    }

    public static void onTransBarTargetLangSelected(String code) {
        if (code == null || code.isEmpty() || "add_lang".equals(code)) return;
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            if (ctx != null && SBrowserXPrefs.isGoogleTranslateEnabled(ctx)) {
                SBrowserXPrefs.setTranslateTargetLang(ctx, code);
            }
        } catch (Throwable ignored) {}
    }

    public static boolean openNativeExtensionsActivity(Context context) {
        if (context == null) return false;
        try {
            Intent intent = new Intent(context, SBrowserXExtensionsActivity.class);
            Activity main = sMainActivityRef.get();
            if (main != null) {
                try {
                    Class<?> mim = Class.forName("com.sec.android.app.sbrowser.multi_instance.MultiInstanceManager");
                    Object inst = mim.getMethod("getInstance").invoke(null);
                    String id = (String) mim.getMethod("getMainActivityId", Activity.class).invoke(inst, main);
                    if (id != null) intent.putExtra("SBrowserMainActivityContextId", id);
                } catch (Throwable ignored) {}
            }
            if (!(context instanceof Activity)) {
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            }
            context.startActivity(intent);
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "openNativeExtensionsActivity failed", t);
            return false;
        }
    }

    public static String resolveTransLangDisplayName(Object service, String code) {
        if (code == null || code.isEmpty()) return "";
        if (isGoogleTranslateEnabled()) {
            // TransBarLangListHandler.getDisplayName() expects a BCP-47 locale tag (e.g. "ru", "en", "zh-CN"),
            // NOT a pre-translated display name!
            return code.replace('_', '-');
        }
        if (service != null) {
            try {
                Field f = service.getClass().getDeclaredField("mSupportLangMap");
                f.setAccessible(true);
                Object map = f.get(service);
                if (map instanceof java.util.Map) {
                    Object val = ((java.util.Map<?, ?>) map).get(code);
                    if (val instanceof String) return (String) val;
                }
            } catch (Throwable ignored) {}
        }
        return code;
    }

    public static boolean isStartPageOmniboxUrl(String url) {
        if (url == null) return false;
        String trimmed = url.trim();
        return SBrowserXStartPageServer.isStartPageUrl(trimmed)
                || "127.0.0.1".equals(trimmed)
                || trimmed.startsWith("127.0.0.1:")
                || trimmed.startsWith("http://127.0.0.1:")
                || trimmed.startsWith("https://127.0.0.1:");
    }

    public static boolean shouldForceBlankOmnibox(String url, boolean origForceBlank) {
        return origForceBlank || isStartPageOmniboxUrl(url);
    }

    private static volatile long sAllowStartPagePreviewUntilMs;
    private static volatile long sLastAutoRedirectMs;

    public static void allowStartPagePreviewBriefly() {
        sAllowStartPagePreviewUntilMs = System.currentTimeMillis() + 12000L;
    }

    private static String resolveNativeHomepageUrl() {
        try {
            Class<?> hpsCls = Class.forName("com.sec.android.app.sbrowser.homepage.HomePageSettings");
            Object inst = hpsCls.getMethod("getInstance").invoke(null);
            if (inst != null) {
                Object typeObj = hpsCls.getMethod("getHomePageType").invoke(inst);
                if ("quick_access".equals(typeObj)) {
                    return "internet-native://newtab/";
                }
                Object urlObj = hpsCls.getMethod("getHomePage").invoke(inst);
                if (urlObj instanceof String) {
                    String u = ((String) urlObj).trim();
                    if (!u.isEmpty() && !isStartPageOmniboxUrl(u)) return u;
                }
            }
        } catch (Throwable ignored) {}
        return "internet-native://newtab/";
    }

    public static void navigateCurrentTabIfOnStartPage(final String targetUrl) {
        if (targetUrl == null || targetUrl.isEmpty()) return;
        try {
            final Activity act = sMainActivityRef.get();
            if (act == null || act.isFinishing() || act.isDestroyed()) return;
            act.runOnUiThread(() -> {
                try {
                    Method getTab = sActGetCurrentTab;
                    if (getTab == null || !getTab.getDeclaringClass().isInstance(act)) {
                        getTab = act.getClass().getMethod("getCurrentTab");
                        sActGetCurrentTab = getTab;
                    }
                    Object tab = getTab.invoke(act);
                    if (tab == null) return;
                    Method getUrl = sTabGetUrl;
                    if (getUrl == null || !getUrl.getDeclaringClass().isInstance(tab)) {
                        getUrl = tab.getClass().getMethod("getUrl");
                        sTabGetUrl = getUrl;
                    }
                    Object curUrlObj = getUrl.invoke(tab);
                    String curUrl = curUrlObj instanceof String ? (String) curUrlObj : "";
                    if (isStartPageOmniboxUrl(curUrl) && !targetUrl.equals(curUrl)) {
                        tab.getClass().getMethod("loadUrl", String.class).invoke(tab, targetUrl);
                    }
                } catch (Throwable ignored) {}
            });
        } catch (Throwable ignored) {}
    }

    private static void navigateCurrentTabIfOnQuickAccess(final String targetUrl) {
        if (targetUrl == null || targetUrl.isEmpty()) return;
        try {
            final Activity act = sMainActivityRef.get();
            if (act == null || act.isFinishing() || act.isDestroyed()) return;
            act.runOnUiThread(() -> {
                try {
                    Method getTab = sActGetCurrentTab;
                    if (getTab == null || !getTab.getDeclaringClass().isInstance(act)) {
                        getTab = act.getClass().getMethod("getCurrentTab");
                        sActGetCurrentTab = getTab;
                    }
                    Object tab = getTab.invoke(act);
                    if (tab == null) return;
                    Method isQa = sTabIsNewQuickAccess;
                    if (isQa == null || !isQa.getDeclaringClass().isInstance(tab)) {
                        isQa = tab.getClass().getMethod("isNewQuickAccessPage");
                        sTabIsNewQuickAccess = isQa;
                    }
                    if (Boolean.TRUE.equals(isQa.invoke(tab))) {
                        tab.getClass().getMethod("loadUrl", String.class).invoke(tab, targetUrl);
                    }
                } catch (Throwable ignored) {}
            });
        } catch (Throwable ignored) {}
    }

    public static String sanitizeOmniboxUrl(String url) {
        if (url == null) return "";
        if (isStartPageOmniboxUrl(url)) {
            Context ctx = SBrowserXPrefs.getAppContext();
            long now = System.currentTimeMillis();
            if (ctx != null && !SBrowserXPrefs.isStartPageEnabled(ctx)
                    && now > sAllowStartPagePreviewUntilMs
                    && (now - sLastAutoRedirectMs) > 1500L) {
                sLastAutoRedirectMs = now;
                syncStartPageWindowBackdrop(false);
                navigateCurrentTabIfOnStartPage(resolveNativeHomepageUrl());
                return "";
            }
            syncStartPageWindowBackdrop(true);
            return "";
        }
        if (sStartPageBackdropActive && !url.trim().isEmpty()) {
            syncStartPageWindowBackdrop(false);
        }
        return url;
    }

    public static String formatStartPageDisplayUrl(String url) {
        if (url != null && isStartPageOmniboxUrl(url)) {
            return SBrowserXStrings.get(SBrowserXStrings.SP_TITLE);
        }
        return url;
    }

    private static volatile boolean sUpdatingHomepageInternally;

    public static void applyStartPageHomepageSetting(Context ctx, boolean enable) {
        if (ctx == null) return;
        sUpdatingHomepageInternally = true;
        try {
            SBrowserXStartPageServer.ensureStarted(ctx);
            Class<?> hpsCls = Class.forName("com.sec.android.app.sbrowser.homepage.HomePageSettings");
            Object inst = hpsCls.getMethod("getInstance").invoke(null);
            if (inst == null) return;
            if (enable) {
                String url = SBrowserXStartPageServer.getBaseUrl();
                hpsCls.getMethod("setHomePageType", String.class).invoke(inst, "other");
                try { hpsCls.getMethod("setOtherHomePage", String.class).invoke(inst, url); } catch (Throwable ignored) {}
                hpsCls.getMethod("setHomePage", String.class).invoke(inst, url);
                navigateCurrentTabIfOnQuickAccess(url);
            } else {
                try {
                    hpsCls.getMethod("setHomepageAsQuickAccess").invoke(inst);
                } catch (Throwable fallback) {
                    hpsCls.getMethod("setHomePageType", String.class).invoke(inst, "quick_access");
                    hpsCls.getMethod("setHomePage", String.class).invoke(inst, "internet-native://newtab/");
                }
                syncStartPageWindowBackdrop(false);
                navigateCurrentTabIfOnStartPage("internet-native://newtab/");
            }
        } catch (Throwable t) {
            Log.w(TAG, "applyStartPageHomepageSetting failed", t);
        } finally {
            sUpdatingHomepageInternally = false;
        }
    }

    public static void onNativeHomepageTypeChanged(String type) {
        if (sUpdatingHomepageInternally || type == null) return;
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            if (ctx != null && !"other".equals(type) && SBrowserXPrefs.isStartPageEnabled(ctx)) {
                SBrowserXPrefs.setStartPageEnabled(ctx, false);
                syncStartPageWindowBackdrop(false);
                String target = "quick_access".equals(type) ? "internet-native://newtab/" : resolveNativeHomepageUrl();
                navigateCurrentTabIfOnStartPage(target);
            }
        } catch (Throwable ignored) {}
    }

    public static void onNativeHomepageUrlChanged(String url) {
        if (sUpdatingHomepageInternally || url == null || url.trim().isEmpty()) return;
        try {
            Context ctx = SBrowserXPrefs.getAppContext();
            if (ctx != null && !isStartPageOmniboxUrl(url) && SBrowserXPrefs.isStartPageEnabled(ctx)) {
                SBrowserXPrefs.setStartPageEnabled(ctx, false);
                syncStartPageWindowBackdrop(false);
                navigateCurrentTabIfOnStartPage(url);
            }
        } catch (Throwable ignored) {}
    }

    public static void injectStartPageIntoHomepageSettings(Object fragment) {
        if (fragment == null) return;
        try {
            Method getScreen = fragment.getClass().getMethod("getPreferenceScreen");
            Object screen = getScreen.invoke(fragment);
            if (screen == null) return;
            Method getCtx = fragment.getClass().getMethod("getContext");
            Context ctx = (Context) getCtx.invoke(fragment);
            if (ctx == null) return;

            Method findPref = screen.getClass().getMethod("findPreference", CharSequence.class);
            Object existing = findPref.invoke(screen, "sbrowserx_start_page_entry");
            Class<?> prefCls = Class.forName("androidx.preference.Preference");
            Object pref = existing;
            if (pref == null) {
                pref = prefCls.getConstructor(Context.class).newInstance(ctx);
                prefCls.getMethod("setKey", String.class).invoke(pref, "sbrowserx_start_page_entry");
                prefCls.getMethod("setOrder", int.class).invoke(pref, 999);
                Intent intent = new Intent(ctx, dev.vortexnode.sbrowserx.extension.settings.SBrowserXStartPageSettingsActivity.class);
                prefCls.getMethod("setIntent", Intent.class).invoke(pref, intent);
                screen.getClass().getMethod("addPreference", prefCls).invoke(screen, pref);
            }
            prefCls.getMethod("setTitle", CharSequence.class).invoke(pref, SBrowserXStrings.get(SBrowserXStrings.SP_TITLE));
            String sum = SBrowserXPrefs.isStartPageEnabled(ctx)
                    ? SBrowserXStrings.get(SBrowserXStrings.SP_ENABLED_TOAST)
                    : SBrowserXStrings.get(SBrowserXStrings.SP_SUMMARY);
            prefCls.getMethod("setSummary", CharSequence.class).invoke(pref, sum);
        } catch (Throwable ignored) {}
    }

    public static Activity getMainActivity() {
        return sMainActivityRef.get();
    }

    public static void onTransBarTranslatePage(boolean translate) {
        if (!isGoogleTranslateEnabled()) return;
        if (translate) {
            Context ctx = SBrowserXPrefs.getAppContext();
            String tl = ctx != null ? SBrowserXPrefs.getTranslateTargetLang(ctx) : "ru";
            SBrowserXDomTranslator.translateCurrentTab("auto", tl);
        } else {
            SBrowserXDomTranslator.revertCurrentTab();
        }
    }

    public static void onTransBarTargetItemSelected(Object transBarInfo) {
        if (transBarInfo == null || !isGoogleTranslateEnabled()) return;
        try {
            String code = (String) transBarInfo.getClass().getMethod("getCode").invoke(transBarInfo);
            if (code == null || code.isEmpty() || "add_lang".equals(code)) return;
            Context ctx = SBrowserXPrefs.getAppContext();
            if (ctx != null) {
                SBrowserXPrefs.setTranslateTargetLang(ctx, code);
            }
            SBrowserXDomTranslator.translateCurrentTab("auto", code);
        } catch (Throwable t) {
            Log.e(TAG, "onTransBarTargetItemSelected failed", t);
        }
    }

    public static void onTransBarSourceItemSelected(Object transBarInfo) {
        if (transBarInfo == null || !isGoogleTranslateEnabled()) return;
        try {
            String code = (String) transBarInfo.getClass().getMethod("getCode").invoke(transBarInfo);
            Context ctx = SBrowserXPrefs.getAppContext();
            String tl = ctx != null ? SBrowserXPrefs.getTranslateTargetLang(ctx) : "ru";
            SBrowserXDomTranslator.translateCurrentTab(code != null ? code : "auto", tl);
        } catch (Throwable t) {
            Log.e(TAG, "onTransBarSourceItemSelected failed", t);
        }
    }

    public static void onTransBarClose() {
        if (!isGoogleTranslateEnabled()) return;
        SBrowserXDomTranslator.revertCurrentTab();
    }

    public static void onTransBarLoadFinished() {
        if (!isGoogleTranslateEnabled()) return;
        SBrowserXDomTranslator.maybeAutoTranslateOnLoad();
    }

    private static final int CUSTOM_TAB_MENU_TRANSLATE_ID = 0x5B580001;
    private static volatile WeakReference<Activity> sCustomTabActivityRef = new WeakReference<>(null);

    public static void onCustomTabResume(Activity activity) {
        if (activity != null) {
            sCustomTabActivityRef = new WeakReference<>(activity);
        }
    }

    public static void onCustomTabLoadFinished(Activity activity, String url) {
        if (activity == null || !isGoogleTranslateEnabled()) return;
        sCustomTabActivityRef = new WeakReference<>(activity);
        SBrowserXDomTranslator.maybeAutoTranslateActivity(activity, true);
    }

    public static void onCustomTabMenuInitialized(Object toolbar) {
        if (toolbar == null || !isGoogleTranslateEnabled()) return;
        try {
            Field f = toolbar.getClass().getDeclaredField("mMenuPopup");
            f.setAccessible(true);
            Object popup = f.get(toolbar);
            if (popup == null) return;
            android.view.Menu menu = (android.view.Menu) popup.getClass().getMethod("getMenu").invoke(popup);
            if (menu == null || menu.findItem(CUSTOM_TAB_MENU_TRANSLATE_ID) != null) return;
            String lang = java.util.Locale.getDefault().getLanguage();
            String label = "ru".equals(lang) ? "Перевести..."
                    : ("uk".equals(lang) ? "Перекласти..." : "Translate...");
            menu.add(0, CUSTOM_TAB_MENU_TRANSLATE_ID, 2, label);
        } catch (Throwable t) {
            Log.e(TAG, "onCustomTabMenuInitialized failed", t);
        }
    }

    public static boolean tryHandleCustomTabMenuItem(Object coordinator, android.view.MenuItem item) {
        if (item == null || item.getItemId() != CUSTOM_TAB_MENU_TRANSLATE_ID) return false;
        try {
            Activity ct = null;
            if (coordinator != null) {
                try {
                    Field f = coordinator.getClass().getDeclaredField("mActivity");
                    f.setAccessible(true);
                    Object a = f.get(coordinator);
                    if (a instanceof Activity) ct = (Activity) a;
                } catch (Throwable ignored) {}
            }
            if (ct == null) ct = sCustomTabActivityRef.get();
            if (ct != null) {
                String tl = SBrowserXPrefs.getTranslateTargetLang(ct);
                SBrowserXDomTranslator.translateTab(ct, "auto", tl, true);
            }
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "tryHandleCustomTabMenuItem failed", t);
            return false;
        }
    }

    public static boolean tryHandleMainTranslateClick(Object menuHelper, Object delegate) {
        if (!isGoogleTranslateEnabled()) return false;
        try {
            if (delegate != null) {
                try {
                    delegate.getClass().getMethod("closeOptionsMenu").invoke(delegate);
                } catch (Throwable ignored) {}
            }
            Activity main = sMainActivityRef.get();
            if (main == null && menuHelper != null) {
                try {
                    Field f = menuHelper.getClass().getDeclaredField("mActivity");
                    f.setAccessible(true);
                    Object a = f.get(menuHelper);
                    if (a instanceof Activity) main = (Activity) a;
                } catch (Throwable ignored) {}
            }
            if (main != null) {
                String tl = SBrowserXPrefs.getTranslateTargetLang(main);
                SBrowserXDomTranslator.translateTab(main, "auto", tl, true);
                return true;
            }
        } catch (Throwable t) {
            Log.e(TAG, "tryHandleMainTranslateClick failed", t);
        }
        return false;
    }
}
