/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
*/

package app.morphe.extension.rex.constants;


public class ExtensionStrings {
    public static final String REX_SETTINGS = "rex_settings";

    public static String DEFAULT_REX_FOLDER = "xboyrex";

    public static String DOWNLOAD_ONGOING = "Downloading: ";
    public static String DOWNLOAD_COMPLETED = "Downloaded: ";
    public static String DOWNLOAD_ERROR = "Download Error: ";

    public static String DOWNLOAD_SET_PATH_FAILED = "Failed to save download folder";
    public static String DOWNLOAD_SET_PATH_SUCCESS = "Download directory updated!";
    public static String DOWNLOAD_GRANT_PERMISSION = "Choose a download folder to continue";
    public static String DOWNLOAD_GRANT_PERMISSION_FAILED = "Could not open folder picker";

    public static void setDefaultRexFolder(String defaultRexFolder) {
        DEFAULT_REX_FOLDER = defaultRexFolder;
    }

    public static void setDownloadOngoing(String downloadOngoing) {
        DOWNLOAD_ONGOING = downloadOngoing;
    }

    public static void setDownloadCompleted(String downloadCompleted) {
        DOWNLOAD_COMPLETED = downloadCompleted;
    }

    public static void setDownloadError(String downloadError) {
        DOWNLOAD_ERROR = downloadError;
    }

    public static void setDownloadSetPathFailed(String downloadSetPathFailed) {
        DOWNLOAD_SET_PATH_FAILED = downloadSetPathFailed;
    }

    public static void setDownloadSetPathSuccess(String downloadSetPathSuccess) {
        DOWNLOAD_SET_PATH_SUCCESS = downloadSetPathSuccess;
    }

    public static void setDownloadGrantPermission(String downloadGrantPermission) {
        DOWNLOAD_GRANT_PERMISSION = downloadGrantPermission;
    }

    public static void setDownloadGrantPermissionFailed(String downloadGrantPermissionFailed) {
        DOWNLOAD_GRANT_PERMISSION_FAILED = downloadGrantPermissionFailed;
    }
}
