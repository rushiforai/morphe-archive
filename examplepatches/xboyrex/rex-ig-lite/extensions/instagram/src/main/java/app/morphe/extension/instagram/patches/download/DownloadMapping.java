/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.download;

import static app.morphe.extension.instagram.utils.IgStr.str;

import androidx.fragment.app.Fragment;

import java.io.File;

import android.content.Context;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.instagram.utils.InstaUtils;
import app.morphe.extension.instagram.constants.Constants;

public class DownloadMapping {

    private static File getMappingsFile() {
        Context ctx = Utils.getContext();
        File dir = new File(ctx.getFilesDir(), "mobileconfig");
        if (!dir.exists()) dir.mkdirs();
        return new File(dir, "id_name_mapping.json");
    }

    private static void getMappingsDialogBox(Context context) {
        RexDialogs.showConfirmDialog(
                context,
                str("rex_missing_mapping_file"),
                str("rex_missing_mapping_file_desc"),
                str("rex_download_id_mapping"),
                false,
                DownloadMapping::downloadMapping
        );
    }

    private static boolean isMappingFileExists() {
        try {
            File mappingFile = getMappingsFile();
            if (mappingFile.exists() && mappingFile.isFile()) {
                long fileSizeInBytes = mappingFile.length();
                long limitInBytes = 10 * 1024; // 10 KB
                return fileSizeInBytes > limitInBytes;
            }
        } catch (Exception e) {
            RexUtils.logger(e);
        }
        return false;
    }

    public static void checkMappings(Fragment fragment) {
        try {
            if (!DownloadMapping.isMappingFileExists() && fragment != null && fragment.getContext() != null) {
                DownloadMapping.getMappingsDialogBox(fragment.getContext());
            }
        } catch (Exception e) {
            RexUtils.logger(e);
        }
    }

    public static void downloadMapping() {
        Context ctx = Utils.getContext();
        String host = Constants.REX_MAPPINGS_PATH;
        String appVersionName = Utils.getAppVersionName();
        String mappingsFilename = appVersionName + ".json";
        File destinationFile = getMappingsFile();
        InstaUtils.downloadFile(host, mappingsFilename, destinationFile, () -> Utils.restartApp(ctx));
    }
}
