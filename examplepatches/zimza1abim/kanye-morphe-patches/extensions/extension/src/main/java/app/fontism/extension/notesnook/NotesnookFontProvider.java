package app.fontism.extension.notesnook;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.database.Cursor;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.Build;
import android.util.Log;
import java.util.Collections;

/** Initializes before Application.onCreate and React Native; no lifecycle overrides. */
public final class NotesnookFontProvider extends ContentProvider {
    static final String SHORTCUT_ID = "morphe-notesnook-font";

    @Override public boolean onCreate() {
        Context context = getContext().getApplicationContext();
        NotesnookFontInjector.initialize(context);
        publishShortcut(context);
        return true;
    }

    /** App-icon long-press entry. Re-published at each start in case the app replaced it. */
    static void publishShortcut(Context context) {
        if (Build.VERSION.SDK_INT < 25) return;
        try {
            ShortcutManager manager = context.getSystemService(ShortcutManager.class);
            if (manager == null) return;
            for (ShortcutInfo info : manager.getDynamicShortcuts()) if (SHORTCUT_ID.equals(info.getId())) return;
            if (manager.getDynamicShortcuts().size() >= manager.getMaxShortcutCountPerActivity()) return;
            Intent intent = new Intent(context, NotesnookFontSettingsActivity.class)
                    .setAction(Intent.ACTION_VIEW).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            ShortcutInfo shortcut = new ShortcutInfo.Builder(context, SHORTCUT_ID)
                    .setShortLabel("Font").setLongLabel("Notesnook font")
                    .setIcon(Icon.createWithResource(context, android.R.drawable.ic_menu_edit))
                    .setIntent(intent).setRank(99).build();
            manager.addDynamicShortcuts(Collections.singletonList(shortcut));
        } catch (RuntimeException error) {
            Log.w(NotesnookFontStore.TAG, "Font shortcut unavailable", error);
        }
    }

    @Override public Cursor query(Uri u, String[] p, String s, String[] a, String o) { return null; }
    @Override public String getType(Uri u) { return null; }
    @Override public Uri insert(Uri u, ContentValues v) { return null; }
    @Override public int delete(Uri u, String s, String[] a) { return 0; }
    @Override public int update(Uri u, ContentValues v, String s, String[] a) { return 0; }
}
