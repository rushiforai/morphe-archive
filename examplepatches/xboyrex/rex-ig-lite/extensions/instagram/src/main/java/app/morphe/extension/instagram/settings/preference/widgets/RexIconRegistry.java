/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */

package app.morphe.extension.instagram.settings.preference.widgets;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;

import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * Central semantic icon registry for InstaRex (Rex IG Lite).
 * Maps every preference key, settings category route, media action, and dialog header
 * to validated Tabler Icons (24x24 viewBox, 2px stroke, round caps/joins) with active/filled
 * state switching and Android Reduce Motion support.
 */
public final class RexIconRegistry {

    private RexIconRegistry() {
    }

    /**
     * Resolves a preference key, category route key, or semantic icon name to its canonical
     * Tabler icon identifier.
     */
    public static String resolveSemanticIconId(String keyOrSemanticName) {
        return RexIcon.iconForKey(keyOrSemanticName);
    }

    /**
     * Returns a tinted Android VectorDrawable for the given semantic icon ID or preference key.
     */
    public static Drawable getIconDrawable(
            Context context,
            String keyOrIconName,
            int tintColor,
            int sizeDp,
            boolean selectedFilledState
    ) {
        String semanticId = RexIcon.iconForKey(keyOrIconName);
        return RexIcon.getDrawable(context, semanticId, tintColor, sizeDp, selectedFilledState);
    }

    public static Drawable getIconDrawable(
            Context context,
            String keyOrIconName,
            int tintColor,
            int sizeDp
    ) {
        return getIconDrawable(context, keyOrIconName, tintColor, sizeDp, false);
    }

    /**
     * Returns an outline Tabler icon drawable at the standard 24dp or custom size.
     */
    public static Drawable getOutlineDrawable(
            Context context,
            String keyOrIconName,
            int tintColor,
            int sizeDp
    ) {
        return getIconDrawable(context, keyOrIconName, tintColor, sizeDp, false);
    }

    /**
     * Binds or animates an ImageView between outline (inactive) and filled (active) Tabler states,
     * automatically respecting system Reduce Motion settings.
     */
    public static void bindStateIcon(
            ImageView target,
            Context context,
            String keyOrIconName,
            boolean activeState,
            int activeTint,
            int inactiveTint,
            int sizeDp,
            boolean animateTransition
    ) {
        String semanticId = RexIcon.iconForKey(keyOrIconName);
        RexIcon.bindOrAnimateState(
                target,
                semanticId,
                activeState,
                inactiveTint,
                activeTint,
                sizeDp,
                animateTransition
        );
    }

    /**
     * Returns the complete read-only mapping of preference/route keys to semantic Tabler icon IDs.
     */
    public static Map<String, String> getPreferenceIconMappings() {
        return RexIcon.getPreferenceKeyMappings();
    }

    /**
     * Returns all registered semantic Tabler icon names in the central registry.
     */
    public static Set<String> getAllRegisteredSemanticIcons() {
        Map<String, String> map = RexIcon.getPreferenceKeyMappings();
        return map == null ? Collections.emptySet() : Collections.unmodifiableSet(new HashSet<>(map.values()));
    }
}
