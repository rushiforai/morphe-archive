package dev.vortexnode.sbrowserx.extension.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Configuration;
import android.net.Uri;
import android.os.Bundle;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import dev.vortexnode.sbrowserx.extension.SBrowserXHooks;
import dev.vortexnode.sbrowserx.extension.SBrowserXPrefs;
import dev.vortexnode.sbrowserx.extension.SBrowserXStrings;

public final class SBrowserXExternalDownloaderDialogActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SBrowserXPrefs.init(this);

        boolean night = SBrowserXHooks.isBrowserNightMode(this);
        int theme = night
                ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;

        List<String> labels = new ArrayList<>();
        List<String> pkgValues = new ArrayList<>();

        // Index 0: Disabled (built-in)
        labels.add(SBrowserXStrings.get(SBrowserXStrings.BTN_DISABLE));
        pkgValues.add("__OFF__");

        // Index 1: Always ask (system chooser)
        labels.add(SBrowserXStrings.get(SBrowserXStrings.EXT_DL_CHOOSER));
        pkgValues.add("");

        // Discover installed downloaders / link handlers (ABDM, 1DM, ADM, FDM, Seal, etc.)
        Map<String, String> candidates = discoverDownloaderApps();
        List<Map.Entry<String, String>> sorted = new ArrayList<>(candidates.entrySet());
        Collections.sort(sorted, (a, b) -> {
            boolean aDl = isLikelyDownloader(a.getKey(), a.getValue());
            boolean bDl = isLikelyDownloader(b.getKey(), b.getValue());
            if (aDl != bDl) return aDl ? -1 : 1;
            return a.getValue().compareToIgnoreCase(b.getValue());
        });
        for (Map.Entry<String, String> entry : sorted) {
            labels.add(entry.getValue());
            pkgValues.add(entry.getKey());
        }

        boolean enabled = SBrowserXPrefs.isExternalDownloaderEnabled(this);
        String savedPkg = SBrowserXPrefs.getExternalDownloaderPackage(this);
        int selected = 0;
        if (enabled) {
            selected = 1;
            if (savedPkg != null && !savedPkg.isEmpty()) {
                int idx = pkgValues.indexOf(savedPkg);
                if (idx >= 0) selected = idx;
            }
        }

        new AlertDialog.Builder(this, theme)
                .setTitle(SBrowserXStrings.get(SBrowserXStrings.EXT_DL_TITLE))
                .setSingleChoiceItems(labels.toArray(new String[0]), selected, (dialog, which) -> {
                    String val = pkgValues.get(which);
                    if ("__OFF__".equals(val)) {
                        SBrowserXPrefs.setExternalDownloaderEnabled(this, false);
                    } else {
                        SBrowserXPrefs.setExternalDownloaderEnabled(this, true);
                        SBrowserXPrefs.setExternalDownloaderPackage(this, val);
                    }
                    dialog.dismiss();
                    finish();
                })
                .setNegativeButton(android.R.string.cancel, (d, w) -> finish())
                .setOnCancelListener(d -> finish())
                .show();
    }

    private Map<String, String> discoverDownloaderApps() {
        Map<String, String> out = new LinkedHashMap<>();
        PackageManager pm = getPackageManager();
        String selfPkg = getPackageName();

        // 1. Apps handling ACTION_VIEW for file download URLs
        Intent viewBin = new Intent(Intent.ACTION_VIEW);
        viewBin.setDataAndType(Uri.parse("https://example.com/file.zip"), "application/octet-stream");
        collectResolved(pm, viewBin, selfPkg, out);

        // 2. Apps handling ACTION_VIEW for generic https links
        Intent viewHttp = new Intent(Intent.ACTION_VIEW, Uri.parse("https://example.com/file.zip"));
        collectResolved(pm, viewHttp, selfPkg, out);

        // 3. Apps handling ACTION_SEND text/plain (ABDM, Seal, etc.)
        Intent sendTxt = new Intent(Intent.ACTION_SEND);
        sendTxt.setType("text/plain");
        collectResolved(pm, sendTxt, selfPkg, out);

        return out;
    }

    private void collectResolved(PackageManager pm, Intent intent, String selfPkg, Map<String, String> out) {
        try {
            List<ResolveInfo> list = pm.queryIntentActivities(intent, PackageManager.MATCH_DEFAULT_ONLY);
            if (list == null) return;
            for (ResolveInfo ri : list) {
                if (ri.activityInfo == null) continue;
                String pkg = ri.activityInfo.packageName;
                if (pkg == null || pkg.equals(selfPkg) || out.containsKey(pkg)) continue;
                // Keep likely downloaders from ACTION_SEND, or all non-system-UI handlers from ACTION_VIEW
                CharSequence labelCs = ri.loadLabel(pm);
                String label = labelCs != null ? labelCs.toString().trim() : pkg;
                if (Intent.ACTION_SEND.equals(intent.getAction()) && !isLikelyDownloader(pkg, label)) {
                    continue;
                }
                out.put(pkg, label);
            }
        } catch (Throwable ignored) {}
    }

    private static boolean isLikelyDownloader(String pkg, String label) {
        String s = (pkg + " " + label).toLowerCase(Locale.US);
        return s.contains("download")
                || s.contains("abdm")
                || s.contains("1dm")
                || s.contains("idm")
                || s.contains("adm")
                || s.contains("fdm")
                || s.contains("seal")
                || s.contains("aria")
                || s.contains("navi")
                || s.contains("loader")
                || s.contains("torrent")
                || s.contains("libre")
                || s.contains("dvget");
    }
}
