package app.waylo.extension.podcastaddict;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.res.Resources;
import android.view.ContextMenu;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.Window;
import android.widget.PopupMenu;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;

/**
 * Runs an item of a fragment's long press (context) menu without showing the menu.
 * <p>
 * The fragment builds its context menu into an invisible menu, exactly as for a long press, so it
 * decides itself which items apply to the row. The first visible item of the requested ones is
 * then selected through the activity, the way a tap on the menu does. Only framework methods are
 * used, so this does not depend on obfuscated names.
 */
final class ContextMenuAction {

    private static final String APP_PACKAGE = "com.bambuna.podcastaddict";

    private ContextMenuAction() {
    }

    /**
     * @param fragment  The fragment that registered {@code list} for its context menu.
     * @param list      The list view, passed to the fragment as the view the menu is for.
     * @param info      The menu info for the row, as the list would report it on a long press.
     * @param itemNames Resource names of the menu item ids to look for, in order of preference.
     * @return The action selecting the first visible item, or null when none applies.
     */
    static Runnable prepare(Object fragment, View list, ContextMenu.ContextMenuInfo info, String... itemNames) {
        try {
            if (!(fragment instanceof View.OnCreateContextMenuListener)) return null;
            Activity activity = activityOf(list);
            if (activity == null) return null;

            Menu menu = new PopupMenu(activity, list).getMenu();
            ((View.OnCreateContextMenuListener) fragment).onCreateContextMenu(contextMenuOver(menu), list, info);

            Resources resources = activity.getResources();
            String packageName = activity.getPackageName();
            for (String name : itemNames) {
                MenuItem item = visibleItem(menu, idOf(resources, name, packageName));
                if (item == null) continue;
                MenuItem selected = itemWithInfo(item, info);
                return () -> {
                    try {
                        activity.onMenuItemSelected(Window.FEATURE_CONTEXT_MENU, selected);
                    } catch (Exception ignored) {
                    }
                };
            }
        } catch (Exception ignored) {
        }
        return null;
    }

    static Activity activityOf(View view) {
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

    private static MenuItem visibleItem(Menu menu, int id) {
        if (id == 0) return null;
        MenuItem item = menu.findItem(id);
        return item != null && item.isVisible() ? item : null;
    }

    /**
     * A context menu backed by a regular menu. The header calls, which only a context menu has,
     * are ignored.
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
