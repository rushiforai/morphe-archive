/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3384
 * https://github.com/MorpheApp/morphe-patches/pull/3447
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.extension.shared.patches;

import android.graphics.drawable.Drawable;
import android.text.Spanned;
import android.view.View;

import androidx.annotation.Nullable;

import com.facebook.litho.TextContent;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.WeakHashMap;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;

/**
 * Forces Litho views to calculate their layout again, which reloads the view.
 * Litho otherwise keeps the calculated layout until the view is bound again,
 * such as after scrolling the view off-screen and back.
 * <p>
 * Only the texts with a {@link RelayoutSpan} are laid out again, such as loading texts.
 * The mounted text drawables of these texts are remembered, so a relayout checks only
 * these drawables and lays out only the Litho views that show an outdated text.
 * <p>
 * The shown Litho views of lists can also be mounted again, such as to load again the images that
 * failed to load. Laying out or binding a view again does not load its images again,
 * as the image components do not change.
 */
@SuppressWarnings("unused")
public final class LithoRelayoutPatch {

    /**
     * Interface added to the Litho view class during patching.
     */
    public interface LithoViewInterface {
        /**
         * Forces the Litho view to calculate the layout again.
         */
        void patch_forceRelayout();

        /**
         * Unmounts all content of the Litho view, which is mounted again by the next layout.
         */
        void patch_forceRemount();
    }

    /**
     * Span of a Litho text that is laid out again when outdated, such as a loading text.
     */
    public interface RelayoutSpan {
        /**
         * Called on the main thread.
         *
         * @return If the text is outdated, and laying it out again changes it.
         */
        boolean isOutdated();
    }

    /**
     * Relayouts requested at about the same time, such as titles fetched at the same time,
     * are done with a single pass.
     */
    private static final long RELAYOUT_DELAY_MILLISECONDS = 100;

    /**
     * Mounted text drawables that showed a text with a {@link RelayoutSpan}.
     * Accessed only on the main thread.
     */
    private static final Set<Drawable> relayoutTextDrawables = Collections.newSetFromMap(new WeakHashMap<>());

    /**
     * Litho views that were measured. Accessed only on the main thread.
     */
    private static final Set<View> lithoViews = Collections.newSetFromMap(new WeakHashMap<>());

    private static volatile boolean relayoutScheduled;

    private static volatile boolean remountListViewsRequested;

    private LithoRelayoutPatch() {
    }

    /**
     * Forces the Litho views that show an outdated text to calculate the layout again.
     * Can be called on any thread.
     */
    public static void relayoutOutdatedTexts() {
        scheduleRelayout();
    }

    /**
     * Mounts again the content of the shown Litho views of lists, which loads their images again.
     * Same as when a list item is scrolled off-screen and bound again to a view.
     * Views outside of lists, such as the player overlay, are not mounted again.
     * Can be called on any thread.
     */
    public static void remountListViews() {
        remountListViewsRequested = true;
        scheduleRelayout();
    }

    private static void scheduleRelayout() {
        if (!relayoutScheduled) {
            relayoutScheduled = true;
            // Delayed, so the layouts calculated in the current frame are mounted.
            Utils.runOnMainThreadDelayed(LithoRelayoutPatch::relayoutOutdatedViews, RELAYOUT_DELAY_MILLISECONDS);
        }
    }

    /**
     * Injection point.
     * <p>
     * Called on the main thread when a Litho view is measured.
     */
    public static void onLithoViewMeasured(View lithoView) {
        lithoViews.add(lithoView);
    }

    /**
     * Injection point.
     * <p>
     * Called on the main thread before the text drawable is added to its host, so the host is found later.
     */
    public static void onLithoTextMounted(Drawable textDrawable, CharSequence text) {
        try {
            Boolean outdated = isOutdated(text);
            if (outdated != null) {
                relayoutTextDrawables.add(textDrawable);
                // The text can be outdated before it's mounted, such as a title fetched meanwhile.
                if (outdated) {
                    relayoutOutdatedTexts();
                }
            }
        } catch (Exception ex) {
            Logger.printException(() -> "onLithoTextMounted failure", ex);
        }
    }

    private static void relayoutOutdatedViews() {
        relayoutScheduled = false;
        final boolean remountListViews = remountListViewsRequested;
        remountListViewsRequested = false;

        try {
            if (remountListViews) {
                // Unmounting a Litho view also unmounts its nested Litho views,
                // so the views are found before any is unmounted.
                List<LithoViewInterface> remountViews = new ArrayList<>(lithoViews.size());
                for (View view : new ArrayList<>(lithoViews)) {
                    if (view.isShown() && view instanceof LithoViewInterface lithoView) {
                        remountViews.add(lithoView);
                    }
                }
                for (LithoViewInterface lithoView : remountViews) {
                    lithoView.patch_forceRemount();
                }
                Logger.printDebug(() -> "Remounted Litho views: " + remountViews.size());
            }

            Set<LithoViewInterface> relayoutViews = new LinkedHashSet<>();
            for (Drawable textDrawable : new ArrayList<>(relayoutTextDrawables)) {
                // The callback is the host, or null if the text was unmounted.
                if (!(textDrawable.getCallback() instanceof View host)
                        || !(textDrawable instanceof TextContent textContent)) {
                    relayoutTextDrawables.remove(textDrawable);
                    continue;
                }

                // Drawables are reused for other texts, so the current texts are checked.
                boolean showsRelayoutText = false;
                boolean showsOutdatedText = false;
                for (CharSequence text : textContent.getTextItems()) {
                    Boolean outdated = isOutdated(text);
                    if (outdated != null) {
                        showsRelayoutText = true;
                        showsOutdatedText |= outdated;
                    }
                }

                if (!showsRelayoutText) {
                    relayoutTextDrawables.remove(textDrawable);
                } else if (showsOutdatedText) {
                    // The closest Litho view calculates the layout of the host.
                    View view = host;
                    while (!(view instanceof LithoViewInterface) && view.getParent() instanceof View parent) {
                        view = parent;
                    }
                    if (view instanceof LithoViewInterface lithoView) {
                        relayoutViews.add(lithoView);
                        // Texts that are still outdated after the relayout are mounted again.
                        relayoutTextDrawables.remove(textDrawable);
                    }
                }
            }

            for (LithoViewInterface lithoView : relayoutViews) {
                lithoView.patch_forceRelayout();
            }
        } catch (Exception ex) {
            Logger.printException(() -> "relayoutOutdatedViews failure", ex);
        }
    }

    /**
     * @return If any {@link RelayoutSpan} of the text is outdated, or null if the text has none.
     */
    @Nullable
    private static Boolean isOutdated(@Nullable CharSequence text) {
        if (!(text instanceof Spanned spanned)) {
            return null;
        }
        RelayoutSpan[] spans = spanned.getSpans(0, spanned.length(), RelayoutSpan.class);
        if (spans.length == 0) {
            return null;
        }
        for (RelayoutSpan span : spans) {
            if (span.isOutdated()) {
                return true;
            }
        }
        return false;
    }
}
