package app.waylo.extension.podcastaddict;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import android.widget.AbsListView;
import android.widget.AdapterView;
import android.widget.ListView;
import android.widget.PopupMenu;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;

/**
 * Swipe a row of an episode list (Recent episodes, New episodes) to add the episode to the
 * playlist, or to remove it when it is already there.
 * <p>
 * The action runs through the app's own long press menu, without showing it: the fragment builds
 * its context menu into an invisible menu, which decides between "Add to playlist" and "Remove"
 * exactly as a long press would, and the visible one of the two is then selected. This needs no
 * obfuscated names, only framework methods.
 */
@SuppressWarnings("unused")
public final class EpisodeListSwipe {

    private static final String APP_PACKAGE = "com.bambuna.podcastaddict";
    private static final String RECENT_FILTER = "LATEST_EPISODES";

    private EpisodeListSwipe() {
    }

    /**
     * Patched to return true by the "Recent episodes swipe" patch.
     */
    private static boolean isRecentEnabled() {
        return false;
    }

    /**
     * Patched to return true by the "New episodes swipe" patch.
     */
    private static boolean isNewEpisodesEnabled() {
        return false;
    }

    /**
     * Injection point. Called when an episode list fragment creates its list view.
     *
     * @param fragment The episode list fragment.
     */
    public static void attach(Object fragment, AbsListView list) {
        try {
            if (!(list instanceof ListView) || !(fragment instanceof View.OnCreateContextMenuListener)) return;
            Activity activity = activityOf(list);
            if (activity == null) return;

            String name = activity.getClass().getName();
            boolean candidate = (isRecentEnabled() && name.endsWith(".FilteredEpisodeListActivity"))
                    || (isNewEpisodesEnabled() && name.endsWith(".NewEpisodesActivity"));
            if (!candidate) return;

            ListView listView = (ListView) list;
            PlaylistSwipeToRemove.onRemoveListenerSet(listView, new Host(fragment, listView));
            listView.setOnTouchListener(new Touch());
        } catch (Exception ignored) {
        }
    }

    /**
     * Whether swipes are on for the screen right now. The filtered episode list screen shows
     * several filters, and only the Recent one is swipeable.
     */
    private static boolean isActive(Activity activity) {
        if (activity == null) return false;
        String name = activity.getClass().getName();
        if (name.endsWith(".NewEpisodesActivity")) return isNewEpisodesEnabled();
        if (!name.endsWith(".FilteredEpisodeListActivity") || !isRecentEnabled()) return false;

        // The current filter is an enum field of the activity. Enum constant names are kept.
        try {
            for (Field field : activity.getClass().getDeclaredFields()) {
                if (!Enum.class.isAssignableFrom(field.getType())) continue;
                field.setAccessible(true);
                Object value = field.get(activity);
                if (value instanceof Enum && RECENT_FILTER.equals(((Enum<?>) value).name())) return true;
            }
        } catch (Exception ignored) {
        }
        return false;
    }

    private static Activity activityOf(View view) {
        Context context = view.getContext();
        while (context instanceof ContextWrapper) {
            if (context instanceof Activity) return (Activity) context;
            context = ((ContextWrapper) context).getBaseContext();
        }
        return null;
    }

    private static int idOf(Resources resources, String name, String packageName) {
        int id = resources.getIdentifier(name, "id", packageName);
        return id != 0 ? id : resources.getIdentifier(name, "id", APP_PACKAGE);
    }

    /**
     * Feeds the list's touches to the shared swipe engine, deciding per gesture whether this
     * screen is swipeable.
     */
    private static final class Touch implements View.OnTouchListener {
        private boolean active;

        @Override
        public boolean onTouch(View view, MotionEvent event) {
            if (!(view instanceof ListView)) return false;
            ListView list = (ListView) view;

            if (event.getActionMasked() == MotionEvent.ACTION_DOWN) {
                active = isActive(activityOf(list));
                if (!active) return false;
                // The list gets no intercept call for a touch it receives directly.
                PlaylistSwipeToRemove.onIntercept(list, event, null);
            }
            return active && PlaylistSwipeToRemove.onTouch(list, event, null);
        }
    }

    private static final class Host implements PlaylistRemoveHost, SwipeKeepsRow {
        private final WeakReference<Object> fragment;
        private final WeakReference<ListView> list;

        Host(Object fragment, ListView list) {
            this.fragment = new WeakReference<>(fragment);
            this.list = new WeakReference<>(list);
        }

        @Override
        public void swipeRemoveAt(int position) {
            try {
                Object fragment = this.fragment.get();
                ListView list = this.list.get();
                if (fragment == null || list == null) return;
                Activity activity = activityOf(list);
                if (activity == null) return;

                View row = list.getChildAt(position - list.getFirstVisiblePosition());
                if (row == null) return;
                AdapterView.AdapterContextMenuInfo info = new AdapterView.AdapterContextMenuInfo(
                        row, position, list.getItemIdAtPosition(position));

                // Let the fragment build its long press menu into an invisible menu.
                Menu menu = new PopupMenu(activity, list).getMenu();
                ContextMenu contextMenu = contextMenuOver(menu);
                ((View.OnCreateContextMenuListener) fragment).onCreateContextMenu(contextMenu, list, info);

                Resources resources = activity.getResources();
                String packageName = activity.getPackageName();
                MenuItem chosen = visibleItem(menu, idOf(resources, "dequeue", packageName));
                if (chosen == null) chosen = visibleItem(menu, idOf(resources, "enqueue", packageName));
                if (chosen == null) return;

                // Select it the way a tap on the long press menu does.
                activity.onMenuItemSelected(Window.FEATURE_CONTEXT_MENU, itemWithInfo(chosen, info));
            } catch (Exception ignored) {
            }
        }

        private static MenuItem visibleItem(Menu menu, int id) {
            if (id == 0) return null;
            MenuItem item = menu.findItem(id);
            return item != null && item.isVisible() ? item : null;
        }

        /**
         * A context menu backed by a regular menu. The header calls, which only a context menu
         * has, are ignored.
         */
        private static ContextMenu contextMenuOver(Menu menu) {
            final Object[] self = new Object[1];
            InvocationHandler handler = (proxy, method, args) -> {
                if (method.getDeclaringClass() == ContextMenu.class) {
                    return method.getReturnType() == void.class ? null : self[0];
                }
                return method.invoke(menu, args);
            };
            self[0] = Proxy.newProxyInstance(
                    ContextMenu.class.getClassLoader(), new Class<?>[]{ContextMenu.class}, handler);
            return (ContextMenu) self[0];
        }

        /**
         * The menu item, reporting the row it was "opened" on, as a context menu item does.
         */
        private static MenuItem itemWithInfo(MenuItem item, ContextMenu.ContextMenuInfo info) {
            InvocationHandler handler = (proxy, method, args) -> {
                if ("getMenuInfo".equals(method.getName()) && method.getParameterTypes().length == 0) return info;
                return method.invoke(item, args);
            };
            return (MenuItem) Proxy.newProxyInstance(
                    MenuItem.class.getClassLoader(), new Class<?>[]{MenuItem.class}, handler);
        }
    }
}
