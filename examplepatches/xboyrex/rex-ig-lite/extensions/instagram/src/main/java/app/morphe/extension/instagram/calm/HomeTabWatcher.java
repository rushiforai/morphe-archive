package app.morphe.extension.instagram.calm;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;

import java.lang.ref.WeakReference;

import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.instagram.settings.preference.widgets.RexHaptics;

/**
 * Watches the window for the bottom tab bar's "feed_tab" (Home) and "direct_tab"
 * (Messages) buttons and gives each a long-press that opens the Rex IG Lite Quick Access menu.
 */
public final class HomeTabWatcher implements ViewTreeObserver.OnGlobalLayoutListener {

    // Note: do NOT call setTag(...) on the tabs to mark them. Instagram stores its own
    // object in the tab's view tag and casts it back on resume, so an overwritten tag
    // crashes (ClassCastException).
    private static final View.OnLongClickListener OPEN_SETTINGS = v -> {
        Context activity = Settings.getActivityContext(v);
        if (activity == null) return false;
        RexHaptics.longPress(v);
        RexDialogs.showHomeQuickMenu(activity);
        return true;
    };

    private final ViewGroup root;
    private WeakReference<View> armedHome = new WeakReference<>(null);
    private WeakReference<View> armedDirect = new WeakReference<>(null);

    public HomeTabWatcher(ViewGroup root) {
        this.root = root;
    }

    @Override
    public void onGlobalLayout() {
        Context context = root.getContext();
        if (context == null) return;
        View window = root.getRootView();

        View homeTab = find(context, window, "feed_tab");
        if (homeTab != null && homeTab != armedHome.get()) {
            homeTab.setLongClickable(true);
            homeTab.setOnLongClickListener(OPEN_SETTINGS);
            armedHome = new WeakReference<>(homeTab);
            Onboarding.maybeShow(root);
        }
        View directTab = find(context, window, "direct_tab");
        if (directTab != null && directTab != armedDirect.get()) {
            directTab.setLongClickable(true);
            directTab.setOnLongClickListener(OPEN_SETTINGS);
            armedDirect = new WeakReference<>(directTab);
        }
    }

    private static View find(Context context, View window, String name) {
        int id = Hiders.resolveId(context, name);
        return id == 0 || window == null ? null : window.findViewById(id);
    }
}
