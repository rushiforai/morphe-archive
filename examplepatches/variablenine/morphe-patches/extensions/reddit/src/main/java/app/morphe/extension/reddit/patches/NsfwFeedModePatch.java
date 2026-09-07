package app.morphe.extension.reddit.patches;

import java.util.ArrayList;
import java.util.List;

import app.morphe.extension.reddit.nsfw.NsfwCellScanner;
import app.morphe.extension.reddit.settings.Settings;
import app.morphe.extension.shared.Logger;

/**
 * NSFW mode: while it is on, the home feed is reduced to its 18+ posts.
 *
 * <p>The setting is read on every call rather than cached in a static, because this is a mode
 * the user turns on and off, and it must take effect on the next feed load instead of on the
 * next app start.
 *
 * <p>This hooks the home feed's page builder and nothing else. Earlier versions also filtered
 * the {@code Listing} model and the listing element mapper; the first is the cache path shared by
 * every screen that reads a listing - subreddits, saved posts, search, profiles - and the second
 * serves the History feed. Neither reaches the home feed, and both could empty a screen that has
 * nothing to do with this mode, so both are gone.
 *
 * <p>One limit cannot be fixed on this side of the wire: this only removes posts. Reddit does not
 * send 18+ posts to a feed at all unless the account has "Show NSFW content (18+)" enabled, so
 * with that account setting off there is nothing for the filter to keep.
 */
@SuppressWarnings("unused")
public final class NsfwFeedModePatch {

    /** How many home feed pages have been filtered this app start. */
    private static final java.util.concurrent.atomic.AtomicInteger pagesSeen =
            new java.util.concurrent.atomic.AtomicInteger();

    /**
     * @return If this patch was included during patching.
     */
    public static boolean isPatchIncluded() {
        return false;  // Modified during patching.
    }

    /**
     * @return If NSFW mode is currently on.
     */
    public static boolean isNsfwModeEnabled() {
        return Settings.NSFW_FEED_MODE.get();
    }

    /**
     * Turns NSFW mode on or off. Exists so the mode can be driven from somewhere
     * other than the settings screen.
     */
    public static void setNsfwModeEnabled(boolean enabled) {
        Settings.NSFW_FEED_MODE.save(enabled);
    }

    /**
     * Injection point. Filters the home feed's GraphQL response before its posts become feed
     * elements.
     *
     * <p>The home feed is built from GraphQL cells whose feed elements carry no NSFW flag at
     * all, so the decision has to be made here, on the response, where the post's indicators
     * cell still carries its {@code CellIndicatorType.NSFW}.
     *
     * <p>Finds the edge list by type and filters it in place, so the cursor and the dist the
     * mapper reads off the same response are left exactly as they arrived. A response where no
     * post was recognised at all is left alone, so a model change costs the filter rather than
     * the feed.
     *
     * @param response The feed response about to be mapped.
     */
    public static void filterHomeFeedResponse(Object response) {
        try {
            if (response == null || !isNsfwModeEnabled()) {
                return;
            }

            for (java.lang.reflect.Field field : response.getClass().getDeclaredFields()) {
                if (!List.class.isAssignableFrom(field.getType())) {
                    continue;
                }
                field.setAccessible(true);

                Object value = field.get(response);
                if (!(value instanceof List)) {
                    continue;
                }

                @SuppressWarnings("unchecked")
                List<Object> edges = (List<Object>) value;
                if (edges.isEmpty()) {
                    continue;
                }

                filterEdges(edges);
                return;
            }
        } catch (Exception ex) {
            Logger.printException(() -> "filterHomeFeedResponse failure", ex);
        }
    }

    private static void filterEdges(List<Object> edges) {
        int page = pagesSeen.incrementAndGet();

        List<Object> keep = new ArrayList<>(edges.size());
        Object lastPost = null;
        int posts = 0;
        int kept = 0;

        for (Object edge : edges) {
            NsfwCellScanner.Scan scan = NsfwCellScanner.scan(edge);
            if (scan == null) {
                // Not a post. The home feed ships more than twenty element types that are not
                // posts - four kinds of community recommendation carousel, chat channel units,
                // topic pills, taxonomy rows, explore features, AMA carousels - and none of them
                // carries a t3_ id, so none can be read for an NSFW state. They are dropped
                // rather than kept: an 18+ feed with a "communities you might like" row in it is
                // not what the mode is for.
                continue;
            }
            posts++;
            lastPost = edge;
            if (scan.nsfw) {
                keep.add(edge);
                kept++;
            }
        }

        if (posts == 0) {
            // Not one edge on the whole page carried a post id, which reads as the response
            // shape having changed rather than as a page that genuinely holds no posts. Fail
            // open: an unfiltered feed is a far better failure than an empty one.
            Logger.printInfo(() -> "NSFW mode: no readable posts in the home response");
            return;
        }

        // A page left with nothing at all gives the feed nothing to draw and nothing to scroll,
        // which reads on screen as a spinner that never resolves. One post is held back in that
        // case, and it is the only way an SFW post reaches an 18+ feed: at most one per page
        // that carried no 18+ post of its own.
        if (keep.isEmpty()) {
            keep.add(lastPost);
        }

        edges.clear();
        edges.addAll(keep);

        final int keptPosts = kept;
        final int totalPosts = posts;
        Logger.printDebug(() -> "NSFW mode: home page " + page + " kept "
                + keptPosts + " of " + totalPosts + " posts");
    }
}
