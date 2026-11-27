package dev.vortexnode.sbrowserx.extension.settings;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

import dev.vortexnode.sbrowserx.extension.SBrowserXBookmarkBackup;

public final class SBrowserXBookmarksBridgeActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        try {
            SBrowserXBookmarkBackup.repairOrphanedImportedBookmarks(getApplicationContext());
            SBrowserXBookmarkBackup.fetchMissingBookmarkIconsAsync(getApplicationContext());
        } catch (Throwable ignored) {}
        try {
            Class<?> helperCls = Class.forName("com.sec.android.app.sbrowser.sites.SitesIntentHelper");
            Intent intent = (Intent) helperCls
                    .getMethod("getIntent", android.content.Context.class, int.class)
                    .invoke(null, this, 0);
            if (intent != null) {
                startActivity(intent);
                finish();
                return;
            }
        } catch (Throwable ignored) {}
        try {
            Class<?> sitesCls = Class.forName("com.sec.android.app.sbrowser.sites.SitesActivity");
            Intent intent = new Intent(this, sitesCls);
            intent.putExtra("tab_index", 0);
            startActivity(intent);
        } catch (Throwable ignored) {}
        finish();
    }
}
