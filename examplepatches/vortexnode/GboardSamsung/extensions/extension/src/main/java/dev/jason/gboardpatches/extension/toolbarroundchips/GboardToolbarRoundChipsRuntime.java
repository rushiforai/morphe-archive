package dev.jason.gboardpatches.extension.toolbarroundchips;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOverlay;
import android.view.ViewParent;
import android.widget.ImageView;
import android.widget.TextView;

import dev.jason.gboardpatches.extension.settings.GboardPatchesSettings;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.function.Function;
import java.util.function.Predicate;

/**
 * Passive visual decorator that renders adaptive Samsung One UI 8-style circular backgrounds
 * behind standard Access Point icons in Gboard's top toolbar.
 *
 * <p>Verified against Gboard 18.5.4 XML/DEX:
 * <ul>
 *   <li>Top-bar Access Points are {@code AccessPointsBarItemSoftKeyView} (extends {@code SoftKeyView})
 *       containing a dedicated background {@link View} tagged
 *       {@code .access-point-bar-item-ripple-background.item-ripple} positioned behind the
 *       {@code .icon.for-access-point-icon} {@link ImageView}.</li>
 *   <li>Attaching a {@link ViewOverlay} drawable to that background {@link View} draws the circle
 *       behind the stock Google icon without mutating stock {@code background}/ripple drawables,
 *       touch listeners, drag-and-drop, or layout bounds.</li>
 *   <li>Color adapts to Gboard's active theme: Material You dynamic palette ({@code system:} /
 *       {@code dynamic_color_spec:}) matches functional keys, while standard light/dark/system
 *       themes match the Rambler microphone circle (crisp white in light, subtle surface in dark).</li>
 *   <li>Rambler voice button ({@code .background-icon.for-action-key}), the {@code ⊞} menu button
 *       ({@code .access-point-entry-menu-icon} / {@code .access-point-menu-icon}), expanded menu
 *       items, candidate suggestions, and text/clipboard chips are strictly excluded.</li>
 * </ul>
 */
public final class GboardToolbarRoundChipsRuntime {
    static final String ACCESS_POINT_BAR_BG_TAG = ".access-point-bar-item-ripple-background";
    static final String ACCESS_POINT_ICON_TAG = ".icon.for-access-point-icon";
    static final String GBOARD_THEME_PREF_KEY = "additional_keyboard_theme";

    private static final String ACTION_KEY_BG_TAG = ".background-icon.for-action-key";
    private static final String MENU_ENTRY_ICON_TAG = ".access-point-entry-menu-icon";
    private static final String MENU_ICON_TAG = ".access-point-menu-icon";
    private static final String CANDIDATES_AREA_TAG = ".candidates-area";
    private static final String CANDIDATE_KEY_TAG = ".for-candidate-key";

    private static final String DYNAMIC_THEME_PREFIX_SILK = "silk:";
    private static final String DYNAMIC_THEME_PREFIX_SYSTEM = "system:";
    private static final String DYNAMIC_THEME_PREFIX_SPEC = "dynamic_color_spec:";
    private static final String DYNAMIC_THEME_TOKEN = "dynamic_color";

    private static final float MIN_SLOT_DP = 24.0f;
    private static final float MIN_DIAMETER_DP = 24.0f;
    private static final float MAX_DIAMETER_DP = 40.0f;
    private static final float MAX_MENU_DIAMETER_DP = 38.0f;
    private static final float VERTICAL_INSET_DP = 0.5f;
    private static final float HORIZONTAL_INSET_DP = 4.0f;
    private static final float LIGHT_STROKE_DP = 0.75f;

    private static final int DARK_THEME_CHIP_ALPHA = 38;
    private static final int DYNAMIC_DARK_CHIP_ALPHA = 240;
    private static final int STANDARD_LIGHT_CHIP_COLOR = Color.WHITE;
    private static final int STANDARD_LIGHT_STROKE_COLOR = 0x14000000;
    private static final int FALLBACK_LIGHT_ICON_COLOR = 0xFF1C1C1E;
    private static final int FALLBACK_DARK_ICON_COLOR = 0xFFFFFFFF;

    private static final Map<View, AttachedChip> ATTACHED_CHIPS = new WeakHashMap<>();
    private static final Map<View, Boolean> KNOWN_TOOLBAR_ITEMS = new WeakHashMap<>();
    private static final Map<View, AttachedMenuChip> ATTACHED_MENU_CHIPS = new WeakHashMap<>();
    private static final Map<View, Boolean> KNOWN_MENU_ITEMS = new WeakHashMap<>();

    private static volatile Predicate<View> settingEnabledPredicate =
            view -> GboardToolbarRoundChipsSettings.isEnabled(view.getContext());
    private static volatile Predicate<View> menuGridEnabledPredicate =
            view -> GboardToolbarRoundChipsSettings.isMenuGridEnabled(view.getContext());
    private static volatile Function<Context, String> activeThemeSpecProvider =
            GboardToolbarRoundChipsRuntime::readActiveThemeSpec;

    private GboardToolbarRoundChipsRuntime() {}

    /** Separate after-stock runtime entry point for bound SoftKeyView instances. */
    public static void afterSoftKeyBind(View softKeyView) {
        if (softKeyView == null) return;
        try {
            boolean enabled = settingEnabledPredicate.test(softKeyView);
            applyToSoftKeyView(softKeyView, enabled);
        } catch (Throwable ignored) {
            // Decorative toolbar chips must never disrupt key binding or keyboard stability.
        }
        try {
            boolean menuEnabled = menuGridEnabledPredicate.test(softKeyView);
            applyMenuGridToSoftKeyView(softKeyView, menuEnabled);
        } catch (Throwable ignored) {
            // Decorative menu grid chip must never disrupt key binding or keyboard stability.
        }
    }

    /** Immediately removes or re-applies chips when the user toggles the setting. */
    public static void onPreferenceChanged(boolean enabled) {
        Runnable update = () -> {
            if (!enabled) {
                List<View> hosts;
                synchronized (ATTACHED_CHIPS) {
                    hosts = new ArrayList<>(ATTACHED_CHIPS.keySet());
                }
                for (View host : hosts) {
                    if (host != null) {
                        detachChip(host);
                    }
                }
                return;
            }
            List<View> candidates;
            synchronized (KNOWN_TOOLBAR_ITEMS) {
                candidates = new ArrayList<>(KNOWN_TOOLBAR_ITEMS.keySet());
            }
            for (View host : candidates) {
                if (host != null) {
                    applyToSoftKeyView(host, true);
                }
            }
        };

        try {
            Looper mainLooper = Looper.getMainLooper();
            if (mainLooper != null && Looper.myLooper() != mainLooper) {
                new Handler(mainLooper).post(update);
                return;
            }
        } catch (Throwable ignored) {
            // Keep synchronous fallback usable in JVM unit tests.
        }
        update.run();
    }

    /** Immediately removes or re-applies the fixed menu grid ({@code ⊞}) chip on toggle. */
    public static void onMenuGridPreferenceChanged(boolean enabled) {
        Runnable update = () -> {
            if (!enabled) {
                List<View> hosts;
                synchronized (ATTACHED_MENU_CHIPS) {
                    hosts = new ArrayList<>(ATTACHED_MENU_CHIPS.keySet());
                }
                for (View host : hosts) {
                    if (host != null) {
                        detachMenuChip(host);
                    }
                }
                return;
            }
            List<View> candidates;
            synchronized (KNOWN_MENU_ITEMS) {
                candidates = new ArrayList<>(KNOWN_MENU_ITEMS.keySet());
            }
            for (View host : candidates) {
                if (host != null) {
                    applyMenuGridToSoftKeyView(host, true);
                }
            }
        };

        try {
            Looper mainLooper = Looper.getMainLooper();
            if (mainLooper != null && Looper.myLooper() != mainLooper) {
                new Handler(mainLooper).post(update);
                return;
            }
        } catch (Throwable ignored) {
            // Keep synchronous fallback usable in JVM unit tests.
        }
        update.run();
    }

    static void applyToSoftKeyView(View softKeyView, boolean enabled) {
        if (softKeyView == null) return;

        View bgTarget = findEligibleBackgroundTarget(softKeyView);
        if (bgTarget == null) {
            synchronized (KNOWN_TOOLBAR_ITEMS) {
                KNOWN_TOOLBAR_ITEMS.remove(softKeyView);
            }
            detachChip(softKeyView);
            return;
        }

        synchronized (KNOWN_TOOLBAR_ITEMS) {
            KNOWN_TOOLBAR_ITEMS.put(softKeyView, Boolean.TRUE);
        }

        if (!enabled) {
            detachChip(softKeyView);
            return;
        }

        attachOrUpdateChip(softKeyView, bgTarget);
    }

    private static void attachOrUpdateChip(View softKeyView, View bgTarget) {
        ViewOverlay overlay = bgTarget.getOverlay();
        if (overlay == null) return;

        AttachedChip existing;
        synchronized (ATTACHED_CHIPS) {
            existing = ATTACHED_CHIPS.get(softKeyView);
        }
        if (existing != null) {
            View existingBg = existing.bgTargetRef.get();
            if (existingBg == bgTarget) {
                existing.drawable.setBounds(
                        0, 0, Math.max(0, bgTarget.getWidth()), Math.max(0, bgTarget.getHeight()));
                bgTarget.invalidate();
                return;
            }
            detachChip(softKeyView);
        }

        RoundChipOverlayDrawable drawable = new RoundChipOverlayDrawable(softKeyView, bgTarget);
        drawable.setBounds(
                0, 0, Math.max(0, bgTarget.getWidth()), Math.max(0, bgTarget.getHeight()));
        View.OnLayoutChangeListener layoutListener = (v, l, t, r, b, ol, ot, or, ob) -> {
            drawable.setBounds(0, 0, Math.max(0, r - l), Math.max(0, b - t));
            v.invalidate();
        };

        overlay.add(drawable);
        bgTarget.addOnLayoutChangeListener(layoutListener);
        synchronized (ATTACHED_CHIPS) {
            ATTACHED_CHIPS.put(softKeyView, new AttachedChip(bgTarget, drawable, layoutListener));
        }
        bgTarget.invalidate();
    }

    private static void detachChip(View softKeyView) {
        AttachedChip attached;
        synchronized (ATTACHED_CHIPS) {
            attached = ATTACHED_CHIPS.remove(softKeyView);
        }
        if (attached == null) return;
        View bgTarget = attached.bgTargetRef.get();
        if (bgTarget == null) return;
        try {
            bgTarget.removeOnLayoutChangeListener(attached.layoutListener);
        } catch (Throwable ignored) {
            // Ignore detached view edge cases.
        }
        try {
            ViewOverlay overlay = bgTarget.getOverlay();
            if (overlay != null) {
                overlay.remove(attached.drawable);
            }
        } catch (Throwable ignored) {
            // Ignore detached view edge cases.
        }
        bgTarget.invalidate();
    }

    /**
     * Returns the dedicated top-bar Access Point ripple background view if and only if
     * {@code softKeyView} is a standard icon-only Access Point bar item (excluding Rambler,
     * {@code ⊞} menu, candidate keys, text/clipboard pills, and expanded menu rows).
     */
    static void applyMenuGridToSoftKeyView(View softKeyView, boolean enabled) {
        if (softKeyView == null) return;

        View menuTarget = findEligibleMenuGridTarget(softKeyView);
        if (menuTarget == null) {
            synchronized (KNOWN_MENU_ITEMS) {
                KNOWN_MENU_ITEMS.remove(softKeyView);
            }
            detachMenuChip(softKeyView);
            return;
        }

        synchronized (KNOWN_MENU_ITEMS) {
            KNOWN_MENU_ITEMS.put(softKeyView, Boolean.TRUE);
        }

        if (!enabled) {
            detachMenuChip(softKeyView);
            return;
        }

        attachOrUpdateMenuChip(softKeyView, menuTarget);
    }

    private static void attachOrUpdateMenuChip(View softKeyView, View menuTarget) {
        Drawable currentBg = menuTarget.getBackground();
        AttachedMenuChip existing;
        synchronized (ATTACHED_MENU_CHIPS) {
            existing = ATTACHED_MENU_CHIPS.get(softKeyView);
        }
        if (existing != null) {
            View existingTarget = existing.menuTargetRef.get();
            if (existingTarget == menuTarget && currentBg == existing.wrapper) {
                menuTarget.invalidate();
                return;
            }
            detachMenuChip(softKeyView);
            currentBg = menuTarget.getBackground();
        }

        Drawable stockBg = currentBg instanceof MenuChipLayerDrawable existingWrapper
                ? existingWrapper.stockBackground
                : currentBg;
        FixedMenuChipDrawable chipDrawable = new FixedMenuChipDrawable(softKeyView, menuTarget);
        MenuChipLayerDrawable wrapper = new MenuChipLayerDrawable(chipDrawable, stockBg);
        menuTarget.setBackground(wrapper);
        synchronized (ATTACHED_MENU_CHIPS) {
            ATTACHED_MENU_CHIPS.put(softKeyView, new AttachedMenuChip(menuTarget, wrapper));
        }
        menuTarget.invalidate();
    }

    private static void detachMenuChip(View softKeyView) {
        AttachedMenuChip attached;
        synchronized (ATTACHED_MENU_CHIPS) {
            attached = ATTACHED_MENU_CHIPS.remove(softKeyView);
        }
        if (attached == null) return;
        View menuTarget = attached.menuTargetRef.get();
        if (menuTarget == null) return;
        try {
            if (menuTarget.getBackground() == attached.wrapper) {
                menuTarget.setBackground(attached.wrapper.stockBackground);
            }
        } catch (Throwable ignored) {
            // Ignore detached view edge cases.
        }
        menuTarget.invalidate();
    }

    /**
     * Returns the {@code ⊞} menu grid FrameLayout ({@code .access-point-entry-menu-icon} or
     * {@code .access-point-menu-icon}) if eligible, excluding Rambler and candidate areas.
     */
    static View findEligibleMenuGridTarget(View softKeyView) {
        if (softKeyView == null || softKeyView.getVisibility() != View.VISIBLE) return null;
        if (hasExcludedAncestorTag(softKeyView)) return null;
        if (containsMenuExcludedDescendantTag(softKeyView)) return null;
        if (hasVisibleTextLabel(softKeyView)) return null;
        View entry = findViewWithTagToken(softKeyView, MENU_ENTRY_ICON_TAG);
        if (entry != null) return entry;
        return findViewWithTagToken(softKeyView, MENU_ICON_TAG);
    }

    /**
     * Computes fixed Rambler-style circular chip geometry for the {@code ⊞} menu button.
     * Skips drawing when the menu button is selected/activated (expanded {@code ✕} state),
     * letting Gboard's native active circle render without double-layering.
     */
    static ChipGeometry computeMenuGridGeometry(View softKeyView, View menuTarget) {
        if (softKeyView == null || menuTarget == null) return null;
        if (softKeyView.getVisibility() != View.VISIBLE || menuTarget.getVisibility() != View.VISIBLE) {
            return null;
        }
        if (!menuGridEnabledPredicate.test(softKeyView)) return null;
        if (softKeyView.isSelected() || softKeyView.isActivated()
                || menuTarget.isSelected() || menuTarget.isActivated()) {
            return null;
        }
        if (findEligibleMenuGridTarget(softKeyView) != menuTarget) return null;

        int width = menuTarget.getWidth();
        int height = menuTarget.getHeight();
        if (width <= 0 || height <= 0) return null;

        float density = resolveDensity(menuTarget);
        float minDim = Math.min(width, height);
        if (minDim < MIN_SLOT_DP * density) return null;

        float diameter = clamp(
                minDim - VERTICAL_INSET_DP * density,
                MIN_DIAMETER_DP * density,
                MAX_MENU_DIAMETER_DP * density);
        if (diameter > minDim) {
            diameter = minDim;
        }

        // Fixed non-dynamic Rambler-style color: pure white in light themes, neutral dark in dark.
        ChipAppearance appearance = resolveFixedRamblerAppearance(softKeyView, density);
        return new ChipGeometry(
                width * 0.5f,
                height * 0.5f,
                diameter * 0.5f,
                appearance.fillColor,
                appearance.strokeColor,
                appearance.strokeWidth);
    }

    static View findEligibleBackgroundTarget(View softKeyView) {
        if (softKeyView == null || softKeyView.getVisibility() != View.VISIBLE) return null;
        if (hasExcludedAncestorTag(softKeyView)) return null;
        if (containsExcludedDescendantTag(softKeyView)) return null;
        if (hasVisibleTextLabel(softKeyView)) return null;
        return findViewWithTagToken(softKeyView, ACCESS_POINT_BAR_BG_TAG);
    }

    static ChipGeometry computeGeometry(View softKeyView, View bgTarget) {
        if (softKeyView == null || bgTarget == null) return null;
        if (softKeyView.getVisibility() != View.VISIBLE || bgTarget.getVisibility() != View.VISIBLE) {
            return null;
        }
        if (!settingEnabledPredicate.test(softKeyView)) return null;
        if (findEligibleBackgroundTarget(softKeyView) != bgTarget) return null;

        int width = bgTarget.getWidth();
        int height = bgTarget.getHeight();
        if (width <= 0 || height <= 0) return null;

        float density = resolveDensity(bgTarget);
        float minDim = Math.min(width, height);
        if (minDim < MIN_SLOT_DP * density) return null;

        // AccessPointsBar stretches slots horizontally at 3-5 items while bgTarget already carries
        // vertical toolbar padding. Use almost full vertical height to match the Rambler mic
        // circle size, while preserving a horizontal gap when slots get narrow (8 items / 1-hand).
        float available = Math.min(
                height - VERTICAL_INSET_DP * density,
                width - HORIZONTAL_INSET_DP * density);
        float diameter = clamp(
                available,
                MIN_DIAMETER_DP * density,
                MAX_DIAMETER_DP * density);
        if (diameter > minDim) {
            diameter = minDim;
        }

        ChipAppearance appearance = resolveChipAppearance(softKeyView, density);
        return new ChipGeometry(
                width * 0.5f,
                height * 0.5f,
                diameter * 0.5f,
                appearance.fillColor,
                appearance.strokeColor,
                appearance.strokeWidth);
    }

    static int resolveAdaptiveChipColor(View softKeyView) {
        return resolveChipAppearance(softKeyView, resolveDensity(softKeyView)).fillColor;
    }

    static boolean isDynamicColorThemeSelected(Context context) {
        if (context == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return false;
        try {
            String spec = activeThemeSpecProvider.apply(context);
            if (spec == null || spec.isEmpty() || "DEFAULT_THEME_NAME".equals(spec)) {
                return true;
            }
            if (spec.startsWith("system_auto:")
                    || spec.startsWith("assets:")
                    || spec.startsWith("files:")) {
                return false;
            }
            return spec.startsWith(DYNAMIC_THEME_PREFIX_SILK)
                    || spec.startsWith(DYNAMIC_THEME_PREFIX_SYSTEM)
                    || spec.startsWith(DYNAMIC_THEME_PREFIX_SPEC)
                    || spec.contains(DYNAMIC_THEME_TOKEN);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static ChipAppearance resolveChipAppearance(View softKeyView, float density) {
        int iconColor = resolveIconColor(softKeyView);
        int r = Color.red(iconColor);
        int g = Color.green(iconColor);
        int b = Color.blue(iconColor);
        double luminance = (0.299 * r + 0.587 * g + 0.114 * b) / 255.0;
        boolean darkSurface = luminance >= 0.5;

        Context context = softKeyView.getContext();
        if (isDynamicColorThemeSelected(context)) {
            Integer dynamicColor = resolveMaterialYouChipColor(context, darkSurface);
            if (dynamicColor != null) {
                return new ChipAppearance(dynamicColor, 0, 0f);
            }
        }

        return resolveFixedRamblerAppearanceFromIcon(r, g, b, darkSurface, density);
    }

    private static ChipAppearance resolveFixedRamblerAppearance(View softKeyView, float density) {
        int iconColor = resolveIconColor(softKeyView);
        int r = Color.red(iconColor);
        int g = Color.green(iconColor);
        int b = Color.blue(iconColor);
        double luminance = (0.299 * r + 0.587 * g + 0.114 * b) / 255.0;
        return resolveFixedRamblerAppearanceFromIcon(r, g, b, luminance >= 0.5, density);
    }

    private static ChipAppearance resolveFixedRamblerAppearanceFromIcon(
            int r, int g, int b, boolean darkSurface, float density) {
        if (darkSurface) {
            return new ChipAppearance(Color.argb(DARK_THEME_CHIP_ALPHA, r, g, b), 0, 0f);
        }
        return new ChipAppearance(
                STANDARD_LIGHT_CHIP_COLOR,
                STANDARD_LIGHT_STROKE_COLOR,
                LIGHT_STROKE_DP * density);
    }

    private static Integer resolveMaterialYouChipColor(Context context, boolean darkSurface) {
        if (context == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
            return null;
        }
        try {
            Resources resources = context.getResources();
            if (resources == null) return null;
            int colorRes = darkSurface
                    ? android.R.color.system_accent2_700
                    : android.R.color.system_accent1_100;
            int rawColor = resources.getColor(colorRes, context.getTheme());
            int alpha = darkSurface ? DYNAMIC_DARK_CHIP_ALPHA : 255;
            return Color.argb(alpha, Color.red(rawColor), Color.green(rawColor), Color.blue(rawColor));
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String readActiveThemeSpec(Context context) {
        return GboardPatchesSettings.readGboardPreferenceString(
                context, GBOARD_THEME_PREF_KEY, null);
    }

    private static int resolveIconColor(View softKeyView) {
        ImageView iconView = findAccessPointIcon(softKeyView);
        if (iconView != null) {
            ColorStateList tintList = iconView.getImageTintList();
            if (tintList != null) {
                return tintList.getColorForState(
                        iconView.getDrawableState(), tintList.getDefaultColor());
            }
        }
        return isNightMode(softKeyView) ? FALLBACK_DARK_ICON_COLOR : FALLBACK_LIGHT_ICON_COLOR;
    }

    private static ImageView findAccessPointIcon(View root) {
        View tagged = findViewWithTagToken(root, ACCESS_POINT_ICON_TAG);
        if (tagged instanceof ImageView imageView) {
            return imageView;
        }
        return findFirstVisibleImageView(root);
    }

    private static ImageView findFirstVisibleImageView(View root) {
        if (root == null || root.getVisibility() != View.VISIBLE) return null;
        if (root instanceof ImageView imageView) return imageView;
        if (root instanceof ViewGroup group) {
            for (int i = 0; i < group.getChildCount(); i++) {
                ImageView found = findFirstVisibleImageView(group.getChildAt(i));
                if (found != null) return found;
            }
        }
        return null;
    }

    private static boolean hasVisibleTextLabel(View root) {
        if (root == null || root.getVisibility() != View.VISIBLE) return false;
        if (root instanceof TextView textView) {
            CharSequence text = textView.getText();
            if (text != null && text.toString().trim().length() > 0) {
                return true;
            }
        }
        if (root instanceof ViewGroup group) {
            for (int i = 0; i < group.getChildCount(); i++) {
                if (hasVisibleTextLabel(group.getChildAt(i))) {
                    return true;
                }
            }
        }
        return false;
    }

    private static boolean hasExcludedAncestorTag(View view) {
        ViewParent current = view.getParent();
        while (current instanceof View parentView) {
            if (hasTagToken(parentView, CANDIDATES_AREA_TAG)
                    || hasTagToken(parentView, CANDIDATE_KEY_TAG)) {
                return true;
            }
            current = parentView.getParent();
        }
        return false;
    }

    private static boolean containsMenuExcludedDescendantTag(View root) {
        if (root == null) return false;
        if (hasTagToken(root, ACTION_KEY_BG_TAG) || hasTagToken(root, CANDIDATE_KEY_TAG)) {
            return true;
        }
        if (root instanceof ViewGroup group) {
            for (int i = 0; i < group.getChildCount(); i++) {
                if (containsMenuExcludedDescendantTag(group.getChildAt(i))) {
                    return true;
                }
            }
        }
        return false;
    }

    private static boolean containsExcludedDescendantTag(View root) {
        if (root == null) return false;
        if (hasTagToken(root, ACTION_KEY_BG_TAG)
                || hasTagToken(root, MENU_ENTRY_ICON_TAG)
                || hasTagToken(root, MENU_ICON_TAG)
                || hasTagToken(root, CANDIDATE_KEY_TAG)) {
            return true;
        }
        if (root instanceof ViewGroup group) {
            for (int i = 0; i < group.getChildCount(); i++) {
                if (containsExcludedDescendantTag(group.getChildAt(i))) {
                    return true;
                }
            }
        }
        return false;
    }

    private static View findViewWithTagToken(View root, String token) {
        if (root == null || root.getVisibility() != View.VISIBLE) return null;
        if (hasTagToken(root, token)) return root;
        if (root instanceof ViewGroup group) {
            for (int i = 0; i < group.getChildCount(); i++) {
                View found = findViewWithTagToken(group.getChildAt(i), token);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static boolean hasTagToken(View view, String token) {
        Object tag = view.getTag();
        if (!(tag instanceof String tagText)) return false;
        return tagText.equals(token)
                || tagText.startsWith(token + ".")
                || tagText.contains(token + ".")
                || tagText.endsWith(token);
    }

    private static boolean isNightMode(View view) {
        try {
            Resources resources = view.getResources();
            if (resources != null && resources.getConfiguration() != null) {
                int mask = resources.getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK;
                return mask == Configuration.UI_MODE_NIGHT_YES;
            }
        } catch (Throwable ignored) {
            // Fall through to light fallback.
        }
        return false;
    }

    private static float resolveDensity(View view) {
        try {
            Resources resources = view.getResources();
            if (resources != null && resources.getDisplayMetrics() != null
                    && resources.getDisplayMetrics().density > 0f) {
                return resources.getDisplayMetrics().density;
            }
        } catch (Throwable ignored) {
            // Use density-independent test fallback.
        }
        return 1f;
    }

    private static float clamp(float value, float min, float max) {
        return Math.max(min, Math.min(max, value));
    }

    static boolean isChipAttachedForTesting(View softKeyView) {
        synchronized (ATTACHED_CHIPS) {
            return ATTACHED_CHIPS.containsKey(softKeyView);
        }
    }

    static boolean isMenuChipAttachedForTesting(View softKeyView) {
        synchronized (ATTACHED_MENU_CHIPS) {
            return ATTACHED_MENU_CHIPS.containsKey(softKeyView);
        }
    }

    static void setSettingEnabledPredicateForTesting(Predicate<View> predicate) {
        settingEnabledPredicate = predicate != null
                ? predicate
                : view -> GboardToolbarRoundChipsSettings.isEnabled(view.getContext());
    }

    static void setMenuGridEnabledPredicateForTesting(Predicate<View> predicate) {
        menuGridEnabledPredicate = predicate != null
                ? predicate
                : view -> GboardToolbarRoundChipsSettings.isMenuGridEnabled(view.getContext());
    }

    static void setActiveThemeSpecProviderForTesting(Function<Context, String> provider) {
        activeThemeSpecProvider = provider != null
                ? provider
                : GboardToolbarRoundChipsRuntime::readActiveThemeSpec;
    }

    static void resetForTesting() {
        List<View> hosts;
        synchronized (ATTACHED_CHIPS) {
            hosts = new ArrayList<>(ATTACHED_CHIPS.keySet());
        }
        for (View host : hosts) {
            if (host != null) detachChip(host);
        }
        synchronized (KNOWN_TOOLBAR_ITEMS) {
            KNOWN_TOOLBAR_ITEMS.clear();
        }
        List<View> menuHosts;
        synchronized (ATTACHED_MENU_CHIPS) {
            menuHosts = new ArrayList<>(ATTACHED_MENU_CHIPS.keySet());
        }
        for (View host : menuHosts) {
            if (host != null) detachMenuChip(host);
        }
        synchronized (KNOWN_MENU_ITEMS) {
            KNOWN_MENU_ITEMS.clear();
        }
        setSettingEnabledPredicateForTesting(null);
        setMenuGridEnabledPredicateForTesting(null);
        setActiveThemeSpecProviderForTesting(null);
    }

    private static final class AttachedChip {
        final WeakReference<View> bgTargetRef;
        final RoundChipOverlayDrawable drawable;
        final View.OnLayoutChangeListener layoutListener;

        AttachedChip(
                View bgTarget,
                RoundChipOverlayDrawable drawable,
                View.OnLayoutChangeListener layoutListener) {
            this.bgTargetRef = new WeakReference<>(bgTarget);
            this.drawable = drawable;
            this.layoutListener = layoutListener;
        }
    }

    private static final class ChipAppearance {
        final int fillColor;
        final int strokeColor;
        final float strokeWidth;

        ChipAppearance(int fillColor, int strokeColor, float strokeWidth) {
            this.fillColor = fillColor;
            this.strokeColor = strokeColor;
            this.strokeWidth = strokeWidth;
        }
    }

    static final class ChipGeometry {
        final float centerX;
        final float centerY;
        final float radius;
        final int color;
        final int strokeColor;
        final float strokeWidth;

        ChipGeometry(
                float centerX,
                float centerY,
                float radius,
                int color,
                int strokeColor,
                float strokeWidth) {
            this.centerX = centerX;
            this.centerY = centerY;
            this.radius = radius;
            this.color = color;
            this.strokeColor = strokeColor;
            this.strokeWidth = strokeWidth;
        }
    }

    static final class RoundChipOverlayDrawable extends Drawable {
        private final WeakReference<View> hostRef;
        private final WeakReference<View> bgTargetRef;
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);

        RoundChipOverlayDrawable(View host, View bgTarget) {
            this.hostRef = new WeakReference<>(host);
            this.bgTargetRef = new WeakReference<>(bgTarget);
            fillPaint.setStyle(Paint.Style.FILL);
            strokePaint.setStyle(Paint.Style.STROKE);
        }

        @Override
        public void draw(Canvas canvas) {
            View host = hostRef.get();
            View bgTarget = bgTargetRef.get();
            if (host == null || bgTarget == null) return;
            ChipGeometry geometry = computeGeometry(host, bgTarget);
            if (geometry == null) return;
            fillPaint.setColor(geometry.color);
            canvas.drawCircle(geometry.centerX, geometry.centerY, geometry.radius, fillPaint);
            if (geometry.strokeColor != 0 && geometry.strokeWidth > 0f) {
                strokePaint.setColor(geometry.strokeColor);
                strokePaint.setStrokeWidth(geometry.strokeWidth);
                float strokeRadius = Math.max(0f, geometry.radius - geometry.strokeWidth * 0.5f);
                canvas.drawCircle(geometry.centerX, geometry.centerY, strokeRadius, strokePaint);
            }
        }

        @Override public void setAlpha(int alpha) { fillPaint.setAlpha(alpha); }
        @Override public void setColorFilter(ColorFilter colorFilter) { fillPaint.setColorFilter(colorFilter); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }

    private static final class AttachedMenuChip {
        final WeakReference<View> menuTargetRef;
        final MenuChipLayerDrawable wrapper;

        AttachedMenuChip(View menuTarget, MenuChipLayerDrawable wrapper) {
            this.menuTargetRef = new WeakReference<>(menuTarget);
            this.wrapper = wrapper;
        }
    }

    static final class MenuChipLayerDrawable extends LayerDrawable {
        final Drawable stockBackground;

        MenuChipLayerDrawable(Drawable chipDrawable, Drawable stockBackground) {
            super(stockBackground != null
                    ? new Drawable[] { chipDrawable, stockBackground }
                    : new Drawable[] { chipDrawable });
            this.stockBackground = stockBackground;
        }
    }

    static final class FixedMenuChipDrawable extends Drawable {
        private final WeakReference<View> hostRef;
        private final WeakReference<View> menuTargetRef;
        private final Paint fillPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint strokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);

        FixedMenuChipDrawable(View host, View menuTarget) {
            this.hostRef = new WeakReference<>(host);
            this.menuTargetRef = new WeakReference<>(menuTarget);
            fillPaint.setStyle(Paint.Style.FILL);
            strokePaint.setStyle(Paint.Style.STROKE);
        }

        @Override
        public void draw(Canvas canvas) {
            View host = hostRef.get();
            View menuTarget = menuTargetRef.get();
            if (host == null || menuTarget == null) return;
            ChipGeometry geometry = computeMenuGridGeometry(host, menuTarget);
            if (geometry == null) return;
            fillPaint.setColor(geometry.color);
            canvas.drawCircle(geometry.centerX, geometry.centerY, geometry.radius, fillPaint);
            if (geometry.strokeColor != 0 && geometry.strokeWidth > 0f) {
                strokePaint.setColor(geometry.strokeColor);
                strokePaint.setStrokeWidth(geometry.strokeWidth);
                float strokeRadius = Math.max(0f, geometry.radius - geometry.strokeWidth * 0.5f);
                canvas.drawCircle(geometry.centerX, geometry.centerY, strokeRadius, strokePaint);
            }
        }

        @Override public void setAlpha(int alpha) { fillPaint.setAlpha(alpha); }
        @Override public void setColorFilter(ColorFilter colorFilter) { fillPaint.setColorFilter(colorFilter); }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
