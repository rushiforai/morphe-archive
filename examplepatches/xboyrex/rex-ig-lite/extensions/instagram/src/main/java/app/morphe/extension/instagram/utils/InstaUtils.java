/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */


package app.morphe.extension.instagram.utils;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.os.Build;
import android.os.Environment;
import android.util.Log;
import android.os.Handler;
import android.os.Looper;

import java.io.File;
import java.net.HttpURLConnection;

import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.entity.DeveloperOptions;
import app.morphe.extension.instagram.patches.customise.font.FontStorage;
import app.morphe.extension.instagram.settings.preference.widgets.InstagramPreferenceStyle;
import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.instagram.patches.dm.InboxLock;
import app.morphe.extension.instagram.patches.focusLock.FocusLock;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.requests.Requester;
import app.morphe.extension.shared.requests.Route;
import app.morphe.extension.shared.Logger;
import static app.morphe.extension.shared.requests.Route.Method.GET;

public class InstaUtils {

    public static boolean deleteRecursive(File file) {
        try {
            if (file == null || !file.exists()) {
                RexUtils.toast(str("rex_fail_no_file"));
                return false;
            }

            if (file.isDirectory()) {
                File[] children = file.listFiles();
                if (children != null) {
                    for (File child : children) {
                        deleteRecursive(child);
                    }
                }
            }
            return file.delete();
        } catch (RuntimeException e) {
            RexUtils.logger(e);
        }
        return false;
    }

    public static void decompileExperiments(boolean asJson) {
        String appVersionName = Utils.getAppVersionName();
        DeveloperOptions developerOptions = new DeveloperOptions();

        String fileName = appVersionName + " Experiments";
        boolean fileDone = false;
        String data = "";
        String fileDoneTxt = " failed";

        if (asJson) {
            fileName += ".json";
            data = developerOptions.toJSONObject().toString();
        } else {
            fileName += ".txt";
            data = developerOptions.toString();
        }
        fileDone = RexUtils.rexWriteFile(fileName, Constants.DEFAULT_REX_FOLDER, data, false);
        fileDoneTxt = fileDone ? " created" : fileDoneTxt;
        RexUtils.toast(fileName + fileDoneTxt);
    }

    public static void showResetSettingsDialog(Context context) {
        if (FocusLock.isActive()) {
            RexUtils.toast(str("rex_focus_lock_blocked_action"));
            return;
        }
        // A reset would also turn Inbox lock off, so it has to be confirmed first while the lock is up.
        if (InboxLock.mustConfirmToDisable() && context instanceof Activity) {
            InboxLock.confirmIfLocked((Activity) context, () -> showResetSettingsDialog(context), null);
            return;
        }
        new AlertDialog.Builder(InstagramPreferenceStyle.dialogContext(context))
                .setTitle(str("rex_reset_pref_confirm"))
                .setNegativeButton(str("rex_cancel"), null)
                .setPositiveButton(
                        str("rex_ok"),
                        (dialogInterface, which) -> deletePref()
                )
                .show();
    }

    public static void deletePref(){
        // The font file lives outside the preferences, so a reset removes it separately.
        FontStorage.delete();
        if(Pref.clearAllPreferences()){
            RexUtils.toast(str("rex_reset_pref_success"));
            Utils.restartApp(Utils.getContext());
        }else{
            RexUtils.toast(str("rex_reset_pref_failed"));
        }
    }

    public static void downloadFile(String host, String endpoint, File outputFile, Runnable onComplete) {
        Context context = Utils.getContext();

        if (!Utils.isNetworkConnected()) {
            RexUtils.toast(str("rex_no_internet"));
            return;
        }
        Utils.runOnBackgroundThread(() -> {
            try {
                Route route = new Route(GET, endpoint);
                HttpURLConnection connection = Requester.getConnectionFromRoute(host, route);
                String response = Requester.parseString(connection);

                boolean fileWritten = RexUtils.writeFile(outputFile, response.getBytes(), false);

                new Handler(Looper.getMainLooper()).post(() -> {
                    if (!fileWritten) {
                        RexUtils.toast(str("rex_download_failed_media") + outputFile.getName());
                        return;
                    }
                    RexUtils.toast(str("rex_downloaded_media") + outputFile.getName());

                    if (onComplete != null) {
                        onComplete.run();
                    }
                });

            } catch (Exception e) {
                RexUtils.logger(e);
                RexUtils.toast(str("rex_download_failed_media") + outputFile.getName());
            }
        });
    }
}
