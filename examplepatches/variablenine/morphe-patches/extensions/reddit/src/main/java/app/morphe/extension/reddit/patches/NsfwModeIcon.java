package app.morphe.extension.reddit.patches;

import app.morphe.extension.reddit.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;
import app.morphe.extension.shared.Utils;

/**
 * Swaps the Reddit brand mark in the home app bar for an 18+ one while NSFW mode is on, so the
 * mode can be read off the one thing that is always on screen.
 *
 * <p>The app bar is Compose, and the mark is a single {@code painterResource} call on
 * {@code icon_brand_full_color}. The patch inserts this method over that resource id, so the
 * whole swap is one integer: nothing is added to the layout and nothing is drawn over.
 *
 * <p>The id is resolved once and cached. Failing to resolve it leaves Reddit's own mark in
 * place, which is the right failure: an app bar with no icon at all would look broken.
 */
@SuppressWarnings("unused")
public final class NsfwModeIcon {

    private static final String ICON_NAME = "morphe_nsfw_mode_icon";

    /**
     * Reddit's own 18+ glyph, used if this patch's drawable did not make it into the build. It
     * is untinted so it draws in the vector's own black rather than the app's NSFW red, which is
     * a worse mark but a much better outcome than no mark at all.
     */
    private static final String FALLBACK_ICON_NAME = "icon_nsfw2_fill";

    /** Resolved lazily rather than in a static initialiser, which runs before resources exist. */
    private static int iconId = -1;

    /**
     * Whether the one-off report has been shown. Temporary: this hook cannot say anything when
     * it is never applied, so the only way to tell "the fingerprint missed" from "the drawable
     * did not ship" is for the hook to speak up the first time it runs. Remove once the mark is
     * known to work.
     */
    private static volatile boolean reported;

    private NsfwModeIcon() {
    }

    /**
     * Injection point. Chooses the drawable the home app bar's brand mark is drawn from.
     *
     * @param defaultIcon Reddit's own brand mark.
     * @return The 18+ mark while NSFW mode is on, and Reddit's own otherwise.
     */
    public static int brandIcon(int defaultIcon) {
        try {
            if (!Settings.NSFW_FEED_MODE.get()) {
                return defaultIcon;
            }

            int icon = nsfwIcon();
            report(icon);
            return icon == 0 ? defaultIcon : icon;
        } catch (Exception ex) {
            Logger.printException(() -> "brandIcon failure", ex);
            return defaultIcon;
        }
    }

    private static int nsfwIcon() {
        int cached = iconId;
        if (cached != -1) {
            return cached;
        }

        int resolved = ResourceUtils.getIdentifier(ResourceType.DRAWABLE, ICON_NAME);
        if (resolved == 0) {
            resolved = ResourceUtils.getIdentifier(ResourceType.DRAWABLE, FALLBACK_ICON_NAME);
            final int fallback = resolved;
            Logger.printInfo(() -> ICON_NAME + " is missing; Reddit's own glyph resolved to "
                    + fallback);
        }
        iconId = resolved;
        return resolved;
    }

    /**
     * Says once, on screen, what this hook found. Temporary - see {@link #reported}.
     */
    private static void report(int icon) {
        if (reported) {
            return;
        }
        reported = true;

        String state = icon == 0
                ? "no icon found at all"
                : (icon == ResourceUtils.getIdentifier(ResourceType.DRAWABLE, ICON_NAME)
                        ? "using the Morphe mark"
                        : "using Reddit's own glyph");
        Utils.showToastShort("NSFW app bar hook ran: " + state);
    }
}
