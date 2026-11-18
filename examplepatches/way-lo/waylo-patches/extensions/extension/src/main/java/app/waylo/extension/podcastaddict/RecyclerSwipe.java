package app.waylo.extension.podcastaddict;

import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.AdapterView;

import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.WeakHashMap;

/**
 * Swipe a row of a RecyclerView based list (Playlist and episode lists since 2026.14.1) left or
 * right to run an action on it.
 * <p>
 * The list classes get {@code onInterceptTouchEvent} and {@code onTouchEvent} overrides that call
 * this class first. The ListView based lists of older versions use {@link PlaylistSwipeToRemove}.
 */
@SuppressWarnings("unused")
public final class RecyclerSwipe {

    private static final long ANIMATION_MS = 150;
    /** How long a removed row stays hidden while the list updates, before it is restored. */
    private static final long RESTORE_MS = 600;

    /** The swipeable lists and what a swipe does on each. */
    private static final WeakHashMap<ViewGroup, Host> hosts = new WeakHashMap<>();

    private static boolean tracking;
    private static boolean swiping;
    private static boolean passthrough;
    private static float downX;
    private static float downY;
    private static int slop;
    private static View row;

    private RecyclerSwipe() {
    }

    /**
     * What a swipe does on a list.
     */
    abstract static class Host {
        private final WeakReference<Object> fragment;
        private final boolean keepsRow;
        private final String[] itemNames;

        /**
         * @param fragment  The fragment owning the list and its long press menu.
         * @param keepsRow  True when the row stays in the list after the action: it slides back.
         * @param itemNames Long press menu items to run, in order of preference.
         */
        Host(Object fragment, boolean keepsRow, String... itemNames) {
            this.fragment = new WeakReference<>(fragment);
            this.keepsRow = keepsRow;
            this.itemNames = itemNames;
        }

        /** Whether swipes are on right now. */
        boolean isActive(ViewGroup list) {
            return true;
        }

        Runnable prepare(ViewGroup list, View row) {
            Object fragment = this.fragment.get();
            AdapterView.AdapterContextMenuInfo info = menuInfo(list, row);
            if (fragment == null || info == null) return null;
            return ContextMenuAction.prepare(fragment, list, info, itemNames);
        }
    }

    /**
     * Registers a list. A null list (the fragment clearing its view) is ignored.
     */
    static void register(View list, Host host) {
        if (list instanceof ViewGroup) hosts.put((ViewGroup) list, host);
    }

    /**
     * Injection point. Called when the Playlist fragment assigns its list view.
     */
    public static void attachPlaylist(Object fragment, View list) {
        // "dequeue" is the long press menu's "Remove". The menu hides it where it does not apply.
        register(list, new Host(fragment, false, "dequeue") {
        });
    }

    /**
     * Injection point. Called first in the list's {@code onInterceptTouchEvent}.
     *
     * @param floatView The list's floating drag view, non-null while a row is being reordered.
     * @return True to take over the touch.
     */
    public static boolean onIntercept(ViewGroup list, MotionEvent event, View floatView) {
        try {
            if (passthrough) return false;
            Host host = hosts.get(list);
            if (host == null) return false;

            switch (event.getActionMasked()) {
                case MotionEvent.ACTION_DOWN: {
                    swiping = false;
                    row = null;
                    tracking = floatView == null && host.isActive(list);
                    if (!tracking) return false;
                    row = childUnder(list, event.getX(), event.getY());
                    tracking = row != null;
                    downX = event.getX();
                    downY = event.getY();
                    slop = ViewConfiguration.get(list.getContext()).getScaledTouchSlop();
                    if (tracking && !host.keepsRow) {
                        // Keep parents (the tab pager) from taking horizontal drags. Lists whose
                        // rows stay put wait for a real swipe, so pull-to-refresh keeps working.
                        blockParents(list);
                    }
                    return false;
                }
                case MotionEvent.ACTION_MOVE: {
                    if (!tracking) return false;
                    if (swiping) return true;
                    if (!host.keepsRow) blockParents(list);
                    if (floatView != null) {
                        tracking = false;
                        return false;
                    }
                    float dx = Math.abs(event.getX() - downX);
                    float dy = Math.abs(event.getY() - downY);
                    // Clearly horizontal only, so vertical scrolling and reordering are unaffected.
                    if (dx <= slop || dx <= dy * 1.5f) return false;

                    swiping = true;
                    blockParents(list);
                    cancelList(list, event);
                    return true;
                }
                case MotionEvent.ACTION_UP:
                case MotionEvent.ACTION_CANCEL:
                    if (!swiping) tracking = false;
                    return false;
            }
        } catch (Exception ignored) {
            reset();
        }
        return false;
    }

    /**
     * Injection point. Called first in the list's {@code onTouchEvent}.
     *
     * @return True when the touch was consumed by a swipe.
     */
    public static boolean onTouch(ViewGroup list, MotionEvent event, View floatView) {
        try {
            if (passthrough) return false;
            // A touch the list receives directly (no row took it) gets no intercept call.
            if (!swiping) return tracking && onIntercept(list, event, floatView);
            View swipedRow = row;
            Host host = hosts.get(list);
            if (swipedRow == null || host == null) {
                reset();
                return false;
            }

            float dx = event.getX() - downX;
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_MOVE) {
                blockParents(list);
                swipedRow.setTranslationX(dx);
                float width = Math.max(1, list.getWidth());
                swipedRow.setAlpha(1f - Math.min(1f, Math.abs(dx) / width) * 0.7f);
                return true;
            }
            if (action != MotionEvent.ACTION_UP && action != MotionEvent.ACTION_CANCEL) return true;

            reset();
            int width = list.getWidth();
            Runnable run = action == MotionEvent.ACTION_UP && Math.abs(dx) > width / 3f
                    ? host.prepare(list, swipedRow)
                    : null;

            if (run != null && host.keepsRow) {
                run.run();
                slideBack(swipedRow);
            } else if (run != null) {
                swipedRow.animate()
                        .translationX(dx < 0 ? -width : width)
                        .alpha(0f)
                        .setDuration(ANIMATION_MS)
                        .withEndAction(() -> {
                            run.run();
                            restoreLater(swipedRow);
                        })
                        .start();
            } else {
                slideBack(swipedRow);
            }
            return true;
        } catch (Exception ignored) {
            reset();
            return false;
        }
    }

    private static void slideBack(View row) {
        row.animate().translationX(0f).alpha(1f).setDuration(ANIMATION_MS).start();
    }

    /**
     * A removed row's view is reused for other rows, so it must be visible again once the list
     * has updated: when it is detached (recycled), or after a moment if the list rebinds it in
     * place.
     */
    private static void restoreLater(View row) {
        View.OnAttachStateChangeListener listener = new View.OnAttachStateChangeListener() {
            @Override
            public void onViewAttachedToWindow(View view) {
            }

            @Override
            public void onViewDetachedFromWindow(View view) {
                view.removeOnAttachStateChangeListener(this);
                restore(view);
            }
        };
        row.addOnAttachStateChangeListener(listener);
        row.postDelayed(() -> {
            row.removeOnAttachStateChangeListener(listener);
            restore(row);
        }, RESTORE_MS);
    }

    private static void restore(View row) {
        row.animate().cancel();
        row.setTranslationX(0f);
        row.setAlpha(1f);
    }

    /**
     * Sends a cancel through the list's own touch handling (row long press, drag to reorder, fast
     * scroller), which stops seeing the touch once the swipe takes it over.
     */
    private static void cancelList(ViewGroup list, MotionEvent event) {
        MotionEvent cancel = MotionEvent.obtain(event);
        cancel.setAction(MotionEvent.ACTION_CANCEL);
        passthrough = true;
        try {
            list.onInterceptTouchEvent(cancel);
            list.onTouchEvent(cancel);
        } finally {
            passthrough = false;
            cancel.recycle();
        }
    }

    /**
     * Asks every ancestor not to intercept the touch. ViewGroup stops passing the request up at the
     * first ancestor whose flag is already set, so the direct parent alone is not enough.
     */
    private static void blockParents(ViewGroup list) {
        for (ViewParent parent = list.getParent(); parent != null; parent = parent.getParent()) {
            parent.requestDisallowInterceptTouchEvent(true);
        }
    }

    private static View childUnder(ViewGroup list, float x, float y) {
        for (int i = list.getChildCount() - 1; i >= 0; i--) {
            View child = list.getChildAt(i);
            if (child.getVisibility() != View.VISIBLE) continue;
            float top = child.getTop() + child.getTranslationY();
            if (x >= child.getLeft() && x < child.getRight() && y >= top && y < top + child.getHeight()) {
                return child;
            }
        }
        return null;
    }

    private static void reset() {
        tracking = false;
        swiping = false;
        row = null;
    }

    // ---------------------------------------------------------------------------------------------
    // Row menu info, as the list reports it for a long press: the row, its adapter position and id.
    // ---------------------------------------------------------------------------------------------

    private static Class<?> holderLookupClass;
    private static Method holderLookup;

    static AdapterView.AdapterContextMenuInfo menuInfo(ViewGroup list, View row) {
        try {
            Object holder = holderOf(list, row);
            if (holder == null) return null;
            int position = (Integer) firstMethod(holder.getClass(),
                    "getBindingAdapterPosition", "getAdapterPosition", "getLayoutPosition").invoke(holder);
            long id = (Long) holder.getClass().getMethod("getItemId").invoke(holder);
            if (position < 0) return null;
            return new AdapterView.AdapterContextMenuInfo(row, position, id);
        } catch (Exception ignored) {
            return null;
        }
    }

    /**
     * The row's view holder, through the list's (obfuscated) child view holder lookup: the public
     * method taking a view and returning a type that has an adapter position.
     */
    private static Object holderOf(ViewGroup list, View row) throws Exception {
        if (holderLookupClass != list.getClass()) {
            holderLookup = null;
            for (Method method : list.getClass().getMethods()) {
                Class<?>[] parameters = method.getParameterTypes();
                if (parameters.length != 1 || parameters[0] != View.class) continue;
                Class<?> type = method.getReturnType();
                if (View.class.isAssignableFrom(type) || type.isPrimitive()) continue;
                if (firstMethodOrNull(type, "getBindingAdapterPosition", "getAdapterPosition") == null) continue;
                holderLookup = method;
                break;
            }
            holderLookupClass = list.getClass();
        }
        return holderLookup == null ? null : holderLookup.invoke(list, row);
    }

    private static Method firstMethod(Class<?> type, String... names) throws NoSuchMethodException {
        Method method = firstMethodOrNull(type, names);
        if (method == null) throw new NoSuchMethodException(names[0]);
        return method;
    }

    private static Method firstMethodOrNull(Class<?> type, String... names) {
        for (String name : names) {
            try {
                return type.getMethod(name);
            } catch (NoSuchMethodException ignored) {
            }
        }
        return null;
    }
}
