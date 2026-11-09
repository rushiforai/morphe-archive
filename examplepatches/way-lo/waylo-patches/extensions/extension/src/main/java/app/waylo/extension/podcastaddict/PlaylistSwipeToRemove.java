package app.waylo.extension.podcastaddict;

import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.ListView;

import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/**
 * Swipe a row of the Podcast Addict Playlist left or right to remove it.
 *
 * <p>All entry points are called from code injected by the patch:
 * <ul>
 *   <li>{@link #onRemoveListenerSet} from {@code DragSortListView.setRemoveListener()}</li>
 *   <li>{@link #onIntercept} from the start of {@code DragSortListView.onInterceptTouchEvent()}</li>
 *   <li>{@link #onTouch} from the start of {@code DragSortListView.onTouchEvent()}</li>
 *   <li>{@link #resetRow} from the start of the playlist adapter's {@code getView()}</li>
 * </ul>
 *
 * <p>Only the list that registered a {@link PlaylistRemoveHost} as its remove listener is affected,
 * so every other drag-sort list in the app behaves as before.
 *
 * <p>Notes on how the list is built, which this code relies on:
 * <ul>
 *   <li>The list wraps every row in a container view; the real row is the container's first child.
 *       The row is the view that is moved and faded, because the adapter resets it on every
 *       rebind. Moving the container instead leaves recycled containers stuck invisible.</li>
 *   <li>The container is only shrunk (to 1px) after a removal to close the gap; the list's own
 *       code resets the container height whenever it rebinds it.</li>
 * </ul>
 */
@SuppressWarnings("unused")
public final class PlaylistSwipeToRemove {

    private static final long ANIMATION_MS = 150;
    private static final int COLLAPSED_HEIGHT_PX = 1;

    /**
     * Every Playlist list that registered a remove listener. The app keeps several Playlist tabs
     * (each with its own list) alive at once, so one remembered list is not enough. The values are
     * weak because the host references its fragment, which references the list (the key).
     */
    private static final WeakHashMap<ListView, WeakReference<PlaylistRemoveHost>> hosts = new WeakHashMap<>();

    /** A touch started on a row, and has not ended. */
    private static boolean tracking;
    /** The touch is now a horizontal swipe handled by this class. */
    private static boolean swiping;
    /** Set while a synthetic cancel event is sent to the list, so it is not handled again here. */
    private static boolean passthrough;

    private static float downX;
    private static float downY;
    private static int position;
    private static View row;

    /**
     * Injection point.
     */
    public static void onRemoveListenerSet(ListView list, Object listener) {
        if (listener instanceof PlaylistRemoveHost) {
            hosts.put(list, new WeakReference<>((PlaylistRemoveHost) listener));
        } else {
            hosts.remove(list);
        }
        tracking = false;
        swiping = false;
    }

    private static boolean keepsRow(ListView list) {
        return hostFor(list) instanceof SwipeKeepsRow;
    }

    private static PlaylistRemoveHost hostFor(ListView list) {
        WeakReference<PlaylistRemoveHost> reference = hosts.get(list);
        return reference == null ? null : reference.get();
    }

    /**
     * Injection point. Called first in the list's {@code onInterceptTouchEvent}.
     *
     * @param floatView The list's floating drag view, which exists only while a reorder drag is active.
     * @return True if the list must intercept the touch, and the swipe takes over.
     */
    public static boolean onIntercept(ListView list, MotionEvent event, View floatView) {
        try {
            if (hostFor(list) == null) return false;

            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN:
                    downX = event.getX();
                    downY = event.getY();
                    swiping = false;
                    position = list.pointToPosition((int) downX, (int) downY);
                    tracking = position >= 0;
                    if (tracking && !keepsRow(list)) {
                        // Keep parents (the tab pager) from taking horizontal drags. Lists whose
                        // rows stay put wait for a real swipe, so pull-to-refresh keeps working.
                        blockParents(list);
                    }
                    return false;

                case MotionEvent.ACTION_MOVE:
                    if (!tracking) return false;
                    // Re-block on every move. Since 2026.14 a gesture host above the list un-blocks
                    // the tab pager (ViewPager2) on the first horizontal move.
                    if (swiping || !keepsRow(list)) blockParents(list);
                    if (swiping) return true;
                    if (floatView != null) return false; // A reorder drag is active.

                    float dx = Math.abs(event.getX() - downX);
                    float dy = Math.abs(event.getY() - downY);
                    float slop = ViewConfiguration.get(list.getContext()).getScaledTouchSlop();
                    // Clearly horizontal only, so vertical scrolling and reordering are unaffected. The 1.5 ratio matches
                    // the Playlist gesture host, which hands horizontal drags to the tab pager at that ratio.
                    if (dx <= slop || dx <= dy * 1.5f) return false;

                    View child = list.getChildAt(position - list.getFirstVisiblePosition());
                    if (child == null) return false;
                    if (!keepsRow(list) && child instanceof ViewGroup && ((ViewGroup) child).getChildCount() > 0) {
                        child = ((ViewGroup) child).getChildAt(0); // The real row inside the list's wrapper.
                    }
                    row = child;
                    swiping = true;
                    blockParents(list);

                    // Cancel the list's own pending touch handling (long press, press state).
                    MotionEvent cancel = MotionEvent.obtain(event);
                    cancel.setAction(MotionEvent.ACTION_CANCEL);
                    passthrough = true;
                    try {
                        list.onTouchEvent(cancel);
                    } finally {
                        passthrough = false;
                        cancel.recycle();
                    }
                    return true;

                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    tracking = false;
                    return false;

                default:
                    return false;
            }
        } catch (Exception ex) {
            reset();
            return false;
        }
    }

    /**
     * Injection point. Called first in the list's {@code onTouchEvent}.
     *
     * @return True if the touch was handled here as a swipe.
     */
    public static boolean onTouch(ListView list, MotionEvent event, View floatView) {
        try {
            PlaylistRemoveHost remover = hostFor(list);
            if (remover == null || passthrough) return false;

            // Touches that began on a row with no clickable child never get an intercept call
            // for the following moves, so detect the swipe from here as well.
            if (!swiping) return tracking && onIntercept(list, event, floatView);

            View swipedRow = row;
            if (swipedRow == null) {
                reset();
                return false;
            }

            float dx = event.getX() - downX;
            float width = list.getWidth();
            int action = event.getActionMasked();

            if (action == MotionEvent.ACTION_MOVE) {
                swipedRow.setTranslationX(dx);
                swipedRow.setAlpha(1f - 0.7f * Math.min(Math.abs(dx) / width, 1f));
                return true;
            }

            if (action != MotionEvent.ACTION_UP && action != MotionEvent.ACTION_CANCEL) {
                return true;
            }

            swiping = false;
            tracking = false;

            boolean remove = action == MotionEvent.ACTION_UP && Math.abs(dx) > width / 3f;
            if (remove && remover instanceof SwipeKeepsRow) {
                // The row stays in the list: run the action and slide the row back.
                remover.swipeRemoveAt(position);
                swipedRow.animate()
                        .translationX(0f)
                        .alpha(1f)
                        .setDuration(ANIMATION_MS)
                        .start();
            } else if (remove) {
                swipedRow.animate()
                        .translationX(dx >= 0 ? width : -width)
                        .alpha(0f)
                        .setDuration(ANIMATION_MS)
                        .withEndAction(new CollapseRow(swipedRow))
                        .start();
                remover.swipeRemoveAt(position);
            } else {
                swipedRow.animate()
                        .translationX(0f)
                        .alpha(1f)
                        .setDuration(ANIMATION_MS)
                        .start();
            }
            return true;
        } catch (Exception ex) {
            reset();
            return false;
        }
    }

    /**
     * Injection point. Called with the {@code convertView} at the start of the playlist adapter's
     * {@code getView()}, so a recycled row never keeps the state of a swipe.
     */
    public static void resetRow(View view) {
        if (view == null) return;

        view.animate().cancel();
        view.setTranslationX(0f);
        view.setAlpha(1f);
        ViewGroup.LayoutParams params = view.getLayoutParams();
        if (params != null) params.height = ViewGroup.LayoutParams.WRAP_CONTENT;
    }

    /**
     * Asks every ancestor not to intercept the touch. Calling only the direct parent is not enough:
     * ViewGroup stops passing the request up at the first ancestor whose flag is already set, so
     * after the gesture host clears the flags above itself, a request from the list never reaches
     * the tab pager.
     */
    private static void blockParents(ListView list) {
        for (ViewParent parent = list.getParent(); parent != null; parent = parent.getParent()) {
            parent.requestDisallowInterceptTouchEvent(true);
        }
    }

    private static void reset() {
        tracking = false;
        swiping = false;
        passthrough = false;
        row = null;
    }

    /**
     * Closes the gap left by a swiped away row until the list refreshes and rebinds it.
     */
    private static final class CollapseRow implements Runnable {
        private final View row;

        CollapseRow(View row) {
            this.row = row;
        }

        @Override
        public void run() {
            // Only a row that finished fading out. A row that was rebound meanwhile has alpha 1.
            if (row.getAlpha() > 0.01f) return;

            ViewParent wrapper = row.getParent();
            if (!(wrapper instanceof View)) return;

            View wrapperView = (View) wrapper;
            ViewGroup.LayoutParams params = wrapperView.getLayoutParams();
            if (params == null) return;

            params.height = COLLAPSED_HEIGHT_PX;
            wrapperView.requestLayout();
        }
    }
}
