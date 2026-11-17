/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.download;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.content.Context;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.Drawable;
import android.util.TypedValue;

import com.instagram.common.session.UserSession;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

import app.morphe.extension.instagram.settings.Settings;
import app.morphe.extension.instagram.settings.SettingsStatus;
import app.morphe.extension.instagram.utils.Pref;
import app.morphe.extension.rex.sharedPreference.SharedPref;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/**
 * Reels download button. The reels action column is a Litho UFI whose buttons are separate components.
 * The patch builds a second copy of the save button component next to the real one and registers it
 * here; every hook below receives the component being rendered and only changes the copy, so the real
 * save button renders exactly as before.
 */
public final class ReelDownload {
    private static final String DRAWABLE_DOWNLOAD_ICON = "instagram_download_outline_44";
    private static final String ICON_TINT_ATTRIBUTE = "igds_color_primary_button_on_media";
    private static final Set<Object> COPIES = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap<>()));

    private ReelDownload() {}

    public static boolean isEnabled() {
        return SettingsStatus.reelDownloadButton
                && Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.ENABLE_DOWNLOAD))
                && (Boolean.TRUE.equals(SharedPref.getBooleanPref(Settings.REEL_DOWNLOAD_BUTTON)) || Pref.reelsFloatingToolbar());
    }

    public static void register(Object component) {
        COPIES.add(component);
    }

    private static final ThreadLocal<Copy> CURRENT = new ThreadLocal<>();

    private static final class Copy {
        final Context context;
        final UserSession userSession;
        final Object component;
        final ColorFilter tint;

        Copy(Context context, UserSession userSession, Object component, ColorFilter tint) {
            this.context = context;
            this.userSession = userSession;
            this.component = component;
            this.tint = tint;
        }
    }

    public static void begin(Object component, Object composer) {
        CURRENT.set(
                COPIES.contains(component)
                        ? new Copy(context(composer), session(component), component, tint(component))
                        : null);
    }

    public static void end() {
        CURRENT.remove();
    }

    public static Drawable icon(Drawable original) {
        Copy copy = CURRENT.get();
        if (copy == null) return original;
        Context context = copy.context;
        int drawableId = ResourceUtils.getIdentifier(context, ResourceType.DRAWABLE, DRAWABLE_DOWNLOAD_ICON);
        if (drawableId == 0) throw new IllegalStateException("Missing drawable " + DRAWABLE_DOWNLOAD_ICON);
        Drawable drawable = context.getDrawable(drawableId).mutate();
        drawable.setColorFilter(copy.tint != null ? copy.tint : themeTint(copy.context));
        return drawable;
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
        return CURRENT.get() == null ? original : str("rex_download_current_media");
    }

    public static int viewId(int original) {
        return CURRENT.get() == null ? original : -1;
    }

    public static Function1<Object, Object> click(Function1<Object, Object> original) {
        Copy copy = CURRENT.get();
        if (copy == null) return original;
        return new DownloadClick(copy);
    }

    public static Function1<Object, Object> longClick(Function1<Object, Object> original) {
        Copy copy = CURRENT.get();
        if (copy == null) return original;
        return ignored -> DownloadUtils.onPostDownloadLongClick(copy.context, copy.userSession,
                media(copy.component), currentIndex(copy.component));
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

    private static final class DownloadClick implements Function1<Object, Object> {
        private final Copy copy;

        DownloadClick(Copy copy) {
            this.copy = copy;
        }

        @Override
        public Object invoke(Object ignored) {
            download(copy);
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
