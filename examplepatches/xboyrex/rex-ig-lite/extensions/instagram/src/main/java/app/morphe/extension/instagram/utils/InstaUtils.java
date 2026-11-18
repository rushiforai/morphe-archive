/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.utils;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;

import java.io.File;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.nio.charset.StandardCharsets;

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
import static app.morphe.extension.shared.requests.Route.Method.GET;

public class InstaUtils {

    public static void decompileExperiments(boolean asJson) {
        Utils.runOnBackgroundThread(() -> {
            try {
                String appVersionName = Utils.getAppVersionName();
                DeveloperOptions developerOptions = new DeveloperOptions();

                String fileName = appVersionName + "_Experiments" + (asJson ? ".json" : ".txt");
                String data = asJson
                        ? developerOptions.toJSONObject().toString(2)
                        : developerOptions.toString();
                if (data == null || data.trim().isEmpty()) {
                    data = asJson ? "{}" : "No decoded experiments available on this build.\n";
                }

                boolean fileDone = writeExportToDownloads(fileName, asJson ? "application/json" : "text/plain", data);
                final String msg = fileDone
                        ? ("Saved Download/" + Constants.DEFAULT_REX_FOLDER + "/" + fileName)
                        : ("Failed to save " + fileName);
                new Handler(Looper.getMainLooper()).post(() -> RexUtils.toast(msg));
            } catch (Throwable e) {
                RexUtils.logger(e);
                new Handler(Looper.getMainLooper()).post(() ->
                        RexUtils.toast("Experiment export unavailable on this build"));
            }
        });
    }

    public static boolean writeDiagnosticJsonToDownloads(String fileName, String json, String toastMsg) {
        boolean ok = writeExportToDownloads(fileName, "application/json", json);
        if (ok && toastMsg != null && !toastMsg.isEmpty()) {
            Utils.showToastShort(toastMsg);
        } else if (!ok) {
            Utils.showToastShort(str("rex_export_failed"));
        }
        return ok;
    }

    private static boolean writeExportToDownloads(String fileName, String mimeType, String data) {
        Context ctx = Utils.getContext();
        byte[] bytes = (data == null ? "" : data).getBytes(StandardCharsets.UTF_8);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q && ctx != null) {
            try {
                ContentValues values = new ContentValues();
                values.put(MediaStore.MediaColumns.DISPLAY_NAME, fileName);
                values.put(MediaStore.MediaColumns.MIME_TYPE, mimeType);
                values.put(MediaStore.MediaColumns.RELATIVE_PATH,
                        Environment.DIRECTORY_DOWNLOADS + "/" + Constants.DEFAULT_REX_FOLDER);
                Uri uri = ctx.getContentResolver().insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, values);
                if (uri != null) {
                    try (OutputStream out = ctx.getContentResolver().openOutputStream(uri)) {
                        if (out != null) {
                            out.write(bytes);
                            out.flush();
                            return true;
                        }
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        return RexUtils.rexWriteFile(fileName, Constants.DEFAULT_REX_FOLDER, data == null ? "" : data, false);
    }

    public static void showResetSettingsDialog(Context context) {
        if (FocusLock.isActive()) {
            RexUtils.toast(str("rex_focus_lock_blocked_action"));
            return;
        }
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

    public static void deletePref() {
        FontStorage.delete();
        if (Pref.clearAllPreferences()) {
            RexUtils.toast(str("rex_reset_pref_success"));
            Utils.restartApp(Utils.getContext());
        } else {
            RexUtils.toast(str("rex_reset_pref_failed"));
        }
    }

    public static void downloadFile(String host, String endpoint, File outputFile, Runnable onComplete) {
        if (!Utils.isNetworkConnected()) {
            RexUtils.toast(str("rex_no_internet"));
            return;
        }
        Utils.runOnBackgroundThread(() -> {
            try {
                if (outputFile != null && outputFile.getParentFile() != null && !outputFile.getParentFile().exists()) {
                    outputFile.getParentFile().mkdirs();
                }
                Route route = new Route(GET, endpoint);
                HttpURLConnection connection = Requester.getConnectionFromRoute(host, route);
                int status = connection.getResponseCode();
                if (status < 200 || status >= 300) {
                    connection.disconnect();
                    new Handler(Looper.getMainLooper()).post(() ->
                            RexUtils.toast("No remote file found for " + endpoint + " (HTTP " + status + ")"));
                    return;
                }
                String response = Requester.parseStringAndDisconnect(connection);
                if (response == null || response.trim().isEmpty()) {
                    new Handler(Looper.getMainLooper()).post(() ->
                            RexUtils.toast(str("rex_download_failed_media") + outputFile.getName()));
                    return;
                }

                boolean fileWritten = RexUtils.writeFile(outputFile, response.getBytes(StandardCharsets.UTF_8), false);

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
                new Handler(Looper.getMainLooper()).post(() ->
                        RexUtils.toast(str("rex_download_failed_media") + (outputFile == null ? "" : outputFile.getName())));
            }
        });
    }
}
