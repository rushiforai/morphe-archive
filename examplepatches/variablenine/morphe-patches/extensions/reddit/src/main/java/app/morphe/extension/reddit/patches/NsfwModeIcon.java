package app.morphe.extension.reddit.patches;

import app.morphe.extension.reddit.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.ResourceType;
import app.morphe.extension.shared.ResourceUtils;

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

    /** Resolved lazily rather than in a static initialiser, which runs before resources exist. */
    private static int iconId = -1;

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
            Logger.printInfo(() -> "NSFW mode: " + ICON_NAME + " is missing, "
                    + "leaving the app bar mark alone");
        }
        iconId = resolved;
        return resolved;
    }
}
