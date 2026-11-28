package dev.vortexnode.sbrowserx.extension.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.widget.CompoundButton;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import dev.vortexnode.sbrowserx.extension.SBrowserXBackupManager;
import dev.vortexnode.sbrowserx.extension.SBrowserXBookmarkBackup;
import dev.vortexnode.sbrowserx.extension.SBrowserXHooks;
import dev.vortexnode.sbrowserx.extension.SBrowserXPrefs;
import dev.vortexnode.sbrowserx.extension.SBrowserXStrings;
import dev.vortexnode.sbrowserx.extension.SBrowserXWebRtcManager;

public final class SBrowserXBackupActivity extends Activity {
    private static final int REQ_LOCAL_EXPORT = 5101;
    private static final int REQ_LOCAL_IMPORT = 5102;
    private static final int REQ_LOCAL_TREE = 5103;
    private static final int REQ_DRIVE_EXPORT = 5104;
    private static final int REQ_DRIVE_IMPORT = 5105;
    private static final int REQ_DRIVE_TREE = 5106;
    private static final int REQ_LOCAL_BM_EXPORT = 5107;
    private static final int REQ_LOCAL_BM_IMPORT = 5108;
    private static final int REQ_DRIVE_BM_EXPORT = 5109;
    private static final int REQ_DRIVE_BM_IMPORT = 5110;

    private TextView localFolderSummary;
    private TextView localIntervalSummary;
    private TextView localLastSummary;
    private TextView driveFolderSummary;
    private TextView driveIntervalSummary;
    private TextView driveLastSummary;
    private LinearLayout localIntervalRow;
    private LinearLayout driveIntervalRow;
    private LinearLayout localAutoBmRow;
    private LinearLayout driveAutoBmRow;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        SBrowserXPrefs.init(this);

        boolean night = SBrowserXHooks.isBrowserNightMode(this);
        boolean amoled = night && SBrowserXPrefs.isAmoledBlackEnabled(this);
        int bgColor = night ? (amoled ? 0xFF000000 : 0xFF0B0B0D) : 0xFFF2F3F7;
        int cardColor = night ? (amoled ? 0xFF101012 : 0xFF1A1A1E) : 0xFFFFFFFF;
        int textPrimary = night ? 0xFFF5F5F7 : 0xFF141416;
        int textSecondary = night ? 0xFF9EA2AD : 0xFF6B707C;

        getWindow().setStatusBarColor(bgColor);
        getWindow().setNavigationBarColor(bgColor);
        if (!night) {
            getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR);
        }

        ScrollView scroll = new ScrollView(this);
        scroll.setBackgroundColor(bgColor);
        scroll.setFillViewport(true);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        SBrowserXSettingsActivity.applyOneUiEdgeToEdgePadding(root, dp(16), dp(14), dp(16), dp(36));

        root.addView(SBrowserXSettingsActivity.buildOneUiHeader(
                this, SBrowserXStrings.get(SBrowserXStrings.SYNC_BACKUP_TITLE), night, textPrimary, v -> finish()));

        // --- Block 1: Local Backup ---
        root.addView(sectionHeader(SBrowserXStrings.get(SBrowserXStrings.BACKUP_CAT_LOCAL), textSecondary));
        LinearLayout localCard = card(cardColor);
        addRow(localCard, SBrowserXStrings.get(SBrowserXStrings.BACKUP_EXPORT_LOCAL),
                SBrowserXStrings.get(SBrowserXStrings.BACKUP_EXPORT_LOCAL_SUM),
                textPrimary, textSecondary, v -> launchExport(REQ_LOCAL_EXPORT));
        localCard.addView(divider(night));
        addRow(localCard, SBrowserXStrings.get(SBrowserXStrings.BACKUP_IMPORT_LOCAL),
                SBrowserXStrings.get(SBrowserXStrings.BACKUP_IMPORT_LOCAL_SUM),
                textPrimary, textSecondary, v -> launchImport(REQ_LOCAL_IMPORT, false));
        localCard.addView(divider(night));
        addRow(localCard, SBrowserXStrings.get(SBrowserXStrings.BACKUP_BM_EXPORT_LOCAL),
                SBrowserXStrings.get(SBrowserXStrings.BACKUP_BM_EXPORT_LOCAL_SUM),
                textPrimary, textSecondary, v -> launchBookmarksExport(REQ_LOCAL_BM_EXPORT, false));
        localCard.addView(divider(night));
        addRow(localCard, SBrowserXStrings.get(SBrowserXStrings.BACKUP_BM_IMPORT_LOCAL),
                SBrowserXStrings.get(SBrowserXStrings.BACKUP_BM_IMPORT_LOCAL_SUM),
                textPrimary, textSecondary, v -> launchImport(REQ_LOCAL_BM_IMPORT, false));
        localCard.addView(divider(night));
        localFolderSummary = addRow(localCard, SBrowserXStrings.get(SBrowserXStrings.BACKUP_FOLDER_TITLE),
                folderLabel(SBrowserXPrefs.getLocalBackupTreeUri(this)),
                textPrimary, textSecondary, v -> launchFolderPicker(REQ_LOCAL_TREE, false));
        localCard.addView(divider(night));
        addSwitchRow(localCard, SBrowserXStrings.get(SBrowserXStrings.BACKUP_AUTO_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.BACKUP_AUTO_LOCAL_SUM),
                SBrowserXPrefs.isLocalAutoBackupEnabled(this), night, textPrimary, textSecondary,
                (btn, checked) -> {
                    SBrowserXPrefs.setLocalAutoBackupEnabled(this, checked);
                    if (checked && SBrowserXPrefs.getLocalBackupTreeUri(this).isEmpty()) {
                        launchFolderPicker(REQ_LOCAL_TREE, false);
                    }
                    refreshState();
                });
        localCard.addView(divider(night));
        localIntervalRow = new LinearLayout(this);
        localIntervalRow.setOrientation(LinearLayout.VERTICAL);
        localIntervalSummary = addRow(localIntervalRow, SBrowserXStrings.get(SBrowserXStrings.BACKUP_INTERVAL_TITLE),
                intervalLabel(SBrowserXPrefs.getLocalAutoBackupInterval(this)),
                textPrimary, textSecondary, v -> showIntervalDialog(true, night));
        localCard.addView(localIntervalRow);
        localCard.addView(divider(night));
        localAutoBmRow = new LinearLayout(this);
        localAutoBmRow.setOrientation(LinearLayout.VERTICAL);
        addSwitchRow(localAutoBmRow, SBrowserXStrings.get(SBrowserXStrings.BACKUP_BM_AUTO_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.BACKUP_BM_AUTO_SUM),
                SBrowserXPrefs.isLocalAutoBackupBookmarksEnabled(this), night, textPrimary, textSecondary,
                (btn, checked) -> SBrowserXPrefs.setLocalAutoBackupBookmarksEnabled(this, checked));
        localCard.addView(localAutoBmRow);
        localCard.addView(divider(night));
        localLastSummary = addRow(localCard, SBrowserXStrings.get(SBrowserXStrings.BACKUP_LAST_TITLE),
                SBrowserXBackupManager.formatTimestamp(
                        SBrowserXPrefs.getLocalBackupLastTs(this), SBrowserXStrings.get(SBrowserXStrings.BACKUP_NEVER)),
                textPrimary, textSecondary, null);
        root.addView(localCard);

        // --- Block 2: Google Drive Backup ---
        root.addView(sectionHeader(SBrowserXStrings.get(SBrowserXStrings.BACKUP_CAT_DRIVE), textSecondary));
        LinearLayout driveCard = card(cardColor);
        addRow(driveCard, SBrowserXStrings.get(SBrowserXStrings.BACKUP_EXPORT_DRIVE),
                SBrowserXStrings.get(SBrowserXStrings.BACKUP_EXPORT_DRIVE_SUM),
                textPrimary, textSecondary, v -> launchGoogleDriveExport());
        driveCard.addView(divider(night));
        addRow(driveCard, SBrowserXStrings.get(SBrowserXStrings.BACKUP_IMPORT_DRIVE),
                SBrowserXStrings.get(SBrowserXStrings.BACKUP_IMPORT_DRIVE_SUM),
                textPrimary, textSecondary, v -> launchImport(REQ_DRIVE_IMPORT, true));
        driveCard.addView(divider(night));
        addRow(driveCard, SBrowserXStrings.get(SBrowserXStrings.BACKUP_BM_EXPORT_DRIVE),
                SBrowserXStrings.get(SBrowserXStrings.BACKUP_BM_EXPORT_DRIVE_SUM),
                textPrimary, textSecondary, v -> launchGoogleDriveBookmarksExport());
        driveCard.addView(divider(night));
        addRow(driveCard, SBrowserXStrings.get(SBrowserXStrings.BACKUP_BM_IMPORT_DRIVE),
                SBrowserXStrings.get(SBrowserXStrings.BACKUP_BM_IMPORT_DRIVE_SUM),
                textPrimary, textSecondary, v -> launchImport(REQ_DRIVE_BM_IMPORT, true));
        driveCard.addView(divider(night));
        driveFolderSummary = addRow(driveCard, SBrowserXStrings.get(SBrowserXStrings.BACKUP_DRIVE_FOLDER_TITLE),
                folderLabel(SBrowserXPrefs.getDriveBackupTreeUri(this)),
                textPrimary, textSecondary, v -> launchFolderPicker(REQ_DRIVE_TREE, true));
        driveCard.addView(divider(night));
        addSwitchRow(driveCard, SBrowserXStrings.get(SBrowserXStrings.BACKUP_AUTO_DRIVE_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.BACKUP_AUTO_DRIVE_SUM),
                SBrowserXPrefs.isDriveAutoBackupEnabled(this), night, textPrimary, textSecondary,
                (btn, checked) -> {
                    SBrowserXPrefs.setDriveAutoBackupEnabled(this, checked);
                    if (checked && SBrowserXPrefs.getDriveBackupTreeUri(this).isEmpty()) {
                        launchFolderPicker(REQ_DRIVE_TREE, true);
                    }
                    refreshState();
                });
        driveCard.addView(divider(night));
        driveIntervalRow = new LinearLayout(this);
        driveIntervalRow.setOrientation(LinearLayout.VERTICAL);
        driveIntervalSummary = addRow(driveIntervalRow, SBrowserXStrings.get(SBrowserXStrings.BACKUP_INTERVAL_TITLE),
                intervalLabel(SBrowserXPrefs.getDriveAutoBackupInterval(this)),
                textPrimary, textSecondary, v -> showIntervalDialog(false, night));
        driveCard.addView(driveIntervalRow);
        driveCard.addView(divider(night));
        driveAutoBmRow = new LinearLayout(this);
        driveAutoBmRow.setOrientation(LinearLayout.VERTICAL);
        addSwitchRow(driveAutoBmRow, SBrowserXStrings.get(SBrowserXStrings.BACKUP_BM_AUTO_TITLE),
                SBrowserXStrings.get(SBrowserXStrings.BACKUP_BM_AUTO_SUM),
                SBrowserXPrefs.isDriveAutoBackupBookmarksEnabled(this), night, textPrimary, textSecondary,
                (btn, checked) -> SBrowserXPrefs.setDriveAutoBackupBookmarksEnabled(this, checked));
        driveCard.addView(driveAutoBmRow);
        driveCard.addView(divider(night));
        driveLastSummary = addRow(driveCard, SBrowserXStrings.get(SBrowserXStrings.BACKUP_LAST_TITLE),
                SBrowserXBackupManager.formatTimestamp(
                        SBrowserXPrefs.getDriveBackupLastTs(this), SBrowserXStrings.get(SBrowserXStrings.BACKUP_NEVER)),
                textPrimary, textSecondary, null);
        root.addView(driveCard);

        scroll.addView(root);
        setContentView(scroll);
        refreshState();
    }

    private void refreshState() {
        boolean localOn = SBrowserXPrefs.isLocalAutoBackupEnabled(this);
        if (localIntervalRow != null) {
            localIntervalRow.setEnabled(localOn);
            localIntervalRow.setAlpha(localOn ? 1.0f : 0.45f);
        }
        if (localAutoBmRow != null) {
            localAutoBmRow.setEnabled(localOn);
            localAutoBmRow.setAlpha(localOn ? 1.0f : 0.45f);
        }
        boolean driveOn = SBrowserXPrefs.isDriveAutoBackupEnabled(this);
        if (driveIntervalRow != null) {
            driveIntervalRow.setEnabled(driveOn);
            driveIntervalRow.setAlpha(driveOn ? 1.0f : 0.45f);
        }
        if (driveAutoBmRow != null) {
            driveAutoBmRow.setEnabled(driveOn);
            driveAutoBmRow.setAlpha(driveOn ? 1.0f : 0.45f);
        }
        if (localFolderSummary != null) {
            localFolderSummary.setText(folderLabel(SBrowserXPrefs.getLocalBackupTreeUri(this)));
        }
        if (driveFolderSummary != null) {
            driveFolderSummary.setText(folderLabel(SBrowserXPrefs.getDriveBackupTreeUri(this)));
        }
        if (localIntervalSummary != null) {
            localIntervalSummary.setText(intervalLabel(SBrowserXPrefs.getLocalAutoBackupInterval(this)));
        }
        if (driveIntervalSummary != null) {
            driveIntervalSummary.setText(intervalLabel(SBrowserXPrefs.getDriveAutoBackupInterval(this)));
        }
        if (localLastSummary != null) {
            localLastSummary.setText(SBrowserXBackupManager.formatTimestamp(
                    SBrowserXPrefs.getLocalBackupLastTs(this), SBrowserXStrings.get(SBrowserXStrings.BACKUP_NEVER)));
        }
        if (driveLastSummary != null) {
            driveLastSummary.setText(SBrowserXBackupManager.formatTimestamp(
                    SBrowserXPrefs.getDriveBackupLastTs(this), SBrowserXStrings.get(SBrowserXStrings.BACKUP_NEVER)));
        }
    }

    private static final Uri GOOGLE_DRIVE_INITIAL_URI =
            Uri.parse("content://com.google.android.apps.docs.storage/document/acc%3D1%3Bdoc%3D1");

    private void launchGoogleDriveExport() {
        // 1. Try native Google Drive "Save to Drive" upload sheet directly (with account & Drive folder picker)
        try {
            String json = SBrowserXBackupManager.exportToJson(this);
            // Must use a root explicitly declared in Samsung Internet's res/xml/file_paths.xml (<files-path name="Download" path="Download/" />)
            java.io.File dir = new java.io.File(getFilesDir(), "Download");
            if (!dir.exists()) dir.mkdirs();
            java.io.File outFile = new java.io.File(dir, SBrowserXBackupManager.suggestedFileName());
            try (java.io.FileOutputStream fos = new java.io.FileOutputStream(outFile)) {
                fos.write(json.getBytes(java.nio.charset.StandardCharsets.UTF_8));
                fos.flush();
            }
            Class<?> fpCls = Class.forName("androidx.core.content.FileProvider");
            Uri contentUri = (Uri) fpCls.getMethod("getUriForFile", android.content.Context.class, String.class, java.io.File.class)
                    .invoke(null, this, getPackageName() + ".FileProvider", outFile);
            Intent send = new Intent(Intent.ACTION_SEND);
            send.setType("application/json");
            send.putExtra(Intent.EXTRA_STREAM, contentUri);
            send.putExtra(Intent.EXTRA_SUBJECT, outFile.getName());
            send.setPackage("com.google.android.apps.docs");
            send.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            if (send.resolveActivity(getPackageManager()) != null) {
                SBrowserXPrefs.setDriveBackupLastTs(this, System.currentTimeMillis());
                refreshState();
                startActivity(send);
                return;
            }
        } catch (Throwable ignored) {}
        // 2. Fallback: SAF pointing directly to Google Drive provider
        launchExport(REQ_DRIVE_EXPORT, true);
    }

    private void launchGoogleDriveBookmarksExport() {
        new Thread(() -> {
            try {
                SBrowserXBookmarkBackup.ExportResult res = SBrowserXBookmarkBackup.exportBookmarksToHtml(this);
                java.io.File dir = new java.io.File(getFilesDir(), "Download");
                if (!dir.exists()) dir.mkdirs();
                java.io.File outFile = new java.io.File(dir, SBrowserXBookmarkBackup.suggestedHtmlFileName());
                try (java.io.FileOutputStream fos = new java.io.FileOutputStream(outFile)) {
                    fos.write(res.html.getBytes(java.nio.charset.StandardCharsets.UTF_8));
                    fos.flush();
                }
                Class<?> fpCls = Class.forName("androidx.core.content.FileProvider");
                Uri contentUri = (Uri) fpCls.getMethod("getUriForFile", android.content.Context.class, String.class, java.io.File.class)
                        .invoke(null, this, getPackageName() + ".FileProvider", outFile);
                Intent send = new Intent(Intent.ACTION_SEND);
                send.setType("text/html");
                send.putExtra(Intent.EXTRA_STREAM, contentUri);
                send.putExtra(Intent.EXTRA_SUBJECT, outFile.getName());
                send.setPackage("com.google.android.apps.docs");
                send.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
                if (send.resolveActivity(getPackageManager()) != null) {
                    runOnUiThread(() -> {
                        Toast.makeText(this,
                                SBrowserXStrings.get(SBrowserXStrings.BACKUP_BM_EXPORT_OK)
                                        + " (" + res.bookmarkCount + ")",
                                Toast.LENGTH_SHORT).show();
                        startActivity(send);
                    });
                    return;
                }
            } catch (Throwable ignored) {}
            runOnUiThread(() -> launchBookmarksExport(REQ_DRIVE_BM_EXPORT, true));
        }, "SBrowserX-BmDriveExport").start();
    }

    private void launchBookmarksExport(int reqCode, boolean preferGoogleDrive) {
        Intent i = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        i.addCategory(Intent.CATEGORY_OPENABLE);
        i.setType("text/html");
        i.putExtra(Intent.EXTRA_TITLE, SBrowserXBookmarkBackup.suggestedHtmlFileName());
        if (preferGoogleDrive && android.os.Build.VERSION.SDK_INT >= 26) {
            i.putExtra(android.provider.DocumentsContract.EXTRA_INITIAL_URI, GOOGLE_DRIVE_INITIAL_URI);
        }
        try {
            startActivityForResult(i, reqCode);
        } catch (Throwable t) {
            Toast.makeText(this, "SAF unavailable: " + t.getMessage(), Toast.LENGTH_SHORT).show();
        }
    }

    private void launchExport(int reqCode) {
        launchExport(reqCode, false);
    }

    private void launchExport(int reqCode, boolean preferGoogleDrive) {
        Intent i = new Intent(Intent.ACTION_CREATE_DOCUMENT);
        i.addCategory(Intent.CATEGORY_OPENABLE);
        i.setType("application/json");
        i.putExtra(Intent.EXTRA_TITLE, SBrowserXBackupManager.suggestedFileName());
        if (preferGoogleDrive && android.os.Build.VERSION.SDK_INT >= 26) {
            i.putExtra(android.provider.DocumentsContract.EXTRA_INITIAL_URI, GOOGLE_DRIVE_INITIAL_URI);
        }
        try {
            startActivityForResult(i, reqCode);
        } catch (Throwable t) {
            Toast.makeText(this, "SAF unavailable: " + t.getMessage(), Toast.LENGTH_SHORT).show();
        }
    }

    private void launchImport(int reqCode, boolean preferGoogleDrive) {
        if (preferGoogleDrive) {
            try {
                Intent gd = new Intent(Intent.ACTION_GET_CONTENT);
                gd.addCategory(Intent.CATEGORY_OPENABLE);
                gd.setType("*/*");
                gd.setPackage("com.google.android.apps.docs");
                if (gd.resolveActivity(getPackageManager()) != null) {
                    startActivityForResult(gd, reqCode);
                    return;
                }
            } catch (Throwable ignored) {}
        }
        Intent i = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        i.addCategory(Intent.CATEGORY_OPENABLE);
        i.setType("*/*");
        if (preferGoogleDrive && android.os.Build.VERSION.SDK_INT >= 26) {
            i.putExtra(android.provider.DocumentsContract.EXTRA_INITIAL_URI, GOOGLE_DRIVE_INITIAL_URI);
        }
        try {
            startActivityForResult(i, reqCode);
        } catch (Throwable t) {
            Toast.makeText(this, "SAF unavailable: " + t.getMessage(), Toast.LENGTH_SHORT).show();
        }
    }

    private void launchFolderPicker(int reqCode, boolean preferGoogleDrive) {
        Intent i = new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE);
        i.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION
                | Intent.FLAG_GRANT_WRITE_URI_PERMISSION
                | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION);
        if (preferGoogleDrive && android.os.Build.VERSION.SDK_INT >= 26) {
            i.putExtra(android.provider.DocumentsContract.EXTRA_INITIAL_URI, GOOGLE_DRIVE_INITIAL_URI);
        }
        try {
            startActivityForResult(i, reqCode);
        } catch (Throwable t) {
            Toast.makeText(this, "Folder picker unavailable", Toast.LENGTH_SHORT).show();
        }
    }

    private void showIntervalDialog(boolean isLocal, boolean night) {
        int theme = night ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;
        String[] values = new String[] {
                SBrowserXBackupManager.INTERVAL_DAILY,
                SBrowserXBackupManager.INTERVAL_WEEKLY,
                SBrowserXBackupManager.INTERVAL_MONTHLY
        };
        String[] labels = new String[] {
                SBrowserXStrings.get(SBrowserXStrings.BACKUP_INT_DAILY),
                SBrowserXStrings.get(SBrowserXStrings.BACKUP_INT_WEEKLY),
                SBrowserXStrings.get(SBrowserXStrings.BACKUP_INT_MONTHLY)
        };
        String cur = isLocal
                ? SBrowserXPrefs.getLocalAutoBackupInterval(this)
                : SBrowserXPrefs.getDriveAutoBackupInterval(this);
        int sel = 1;
        for (int i = 0; i < values.length; i++) {
            if (values[i].equals(cur)) { sel = i; break; }
        }
        new AlertDialog.Builder(this, theme)
                .setTitle(SBrowserXStrings.get(SBrowserXStrings.BACKUP_INTERVAL_TITLE))
                .setSingleChoiceItems(labels, sel, (d, which) -> {
                    if (isLocal) SBrowserXPrefs.setLocalAutoBackupInterval(this, values[which]);
                    else SBrowserXPrefs.setDriveAutoBackupInterval(this, values[which]);
                    d.dismiss();
                    refreshState();
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode != RESULT_OK || data == null || data.getData() == null) return;
        Uri uri = data.getData();

        if (requestCode == REQ_LOCAL_EXPORT || requestCode == REQ_DRIVE_EXPORT) {
            final int req = requestCode;
            new Thread(() -> {
                try {
                    SBrowserXBackupManager.writeBackupToUri(this, uri);
                    long now = System.currentTimeMillis();
                    if (req == REQ_LOCAL_EXPORT) SBrowserXPrefs.setLocalBackupLastTs(this, now);
                    else SBrowserXPrefs.setDriveBackupLastTs(this, now);
                    runOnUiThread(() -> {
                        Toast.makeText(this, SBrowserXStrings.get(SBrowserXStrings.BACKUP_EXPORT_OK), Toast.LENGTH_SHORT).show();
                        refreshState();
                    });
                } catch (Throwable t) {
                    runOnUiThread(() -> Toast.makeText(this,
                            SBrowserXStrings.get(SBrowserXStrings.BACKUP_ERR) + ": " + t.getMessage(),
                            Toast.LENGTH_LONG).show());
                }
            }, "SBrowserX-FullExport").start();
        } else if (requestCode == REQ_LOCAL_IMPORT || requestCode == REQ_DRIVE_IMPORT) {
            new Thread(() -> {
                try {
                    int count = SBrowserXBackupManager.readBackupFromUri(this, uri);
                    runOnUiThread(() -> {
                        Toast.makeText(this,
                                SBrowserXStrings.get(SBrowserXStrings.BACKUP_IMPORT_OK) + " (" + count + ")",
                                Toast.LENGTH_SHORT).show();
                        promptRestart();
                    });
                } catch (Throwable t) {
                    runOnUiThread(() -> Toast.makeText(this,
                            SBrowserXStrings.get(SBrowserXStrings.BACKUP_ERR) + ": " + t.getMessage(),
                            Toast.LENGTH_LONG).show());
                }
            }, "SBrowserX-FullImport").start();
        } else if (requestCode == REQ_LOCAL_TREE || requestCode == REQ_DRIVE_TREE) {
            try {
                getContentResolver().takePersistableUriPermission(
                        uri, Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_WRITE_URI_PERMISSION);
            } catch (Throwable ignored) {}
            if (requestCode == REQ_LOCAL_TREE) SBrowserXPrefs.setLocalBackupTreeUri(this, uri.toString());
            else SBrowserXPrefs.setDriveBackupTreeUri(this, uri.toString());
            refreshState();
        } else if (requestCode == REQ_LOCAL_BM_EXPORT || requestCode == REQ_DRIVE_BM_EXPORT) {
            new Thread(() -> {
                try {
                    SBrowserXBookmarkBackup.ExportResult res = SBrowserXBookmarkBackup.writeBookmarksToUri(this, uri);
                    runOnUiThread(() -> Toast.makeText(this,
                            SBrowserXStrings.get(SBrowserXStrings.BACKUP_BM_EXPORT_OK)
                                    + " (" + res.bookmarkCount + ")",
                            Toast.LENGTH_SHORT).show());
                } catch (Throwable t) {
                    runOnUiThread(() -> Toast.makeText(this,
                            SBrowserXStrings.get(SBrowserXStrings.BACKUP_ERR) + ": " + t.getMessage(),
                            Toast.LENGTH_LONG).show());
                }
            }, "SBrowserX-BmExport").start();
        } else if (requestCode == REQ_LOCAL_BM_IMPORT || requestCode == REQ_DRIVE_BM_IMPORT) {
            new Thread(() -> {
                try {
                    SBrowserXBookmarkBackup.ImportResult res = SBrowserXBookmarkBackup.readBookmarksFromUri(this, uri);
                    String msg = SBrowserXStrings.get(SBrowserXStrings.BACKUP_BM_IMPORT_OK)
                            + ": +" + res.addedBookmarks
                            + (res.addedFolders > 0 ? " / " + res.addedFolders + " dir" : "")
                            + (res.skippedDuplicates > 0 ? " (skip: " + res.skippedDuplicates + ")" : "");
                    runOnUiThread(() -> Toast.makeText(this, msg, Toast.LENGTH_LONG).show());
                } catch (Throwable t) {
                    runOnUiThread(() -> Toast.makeText(this,
                            SBrowserXStrings.get(SBrowserXStrings.BACKUP_ERR) + ": " + t.getMessage(),
                            Toast.LENGTH_LONG).show());
                }
            }, "SBrowserX-BmImport").start();
        }
    }

    private void promptRestart() {
        boolean night = SBrowserXHooks.isBrowserNightMode(this);
        int theme = night ? android.R.style.Theme_DeviceDefault_Dialog_Alert
                : android.R.style.Theme_DeviceDefault_Light_Dialog_Alert;
        new AlertDialog.Builder(this, theme)
                .setTitle(SBrowserXStrings.get(SBrowserXStrings.RESTART_TITLE))
                .setMessage(SBrowserXStrings.get(SBrowserXStrings.RESTART_REQUIRED))
                .setPositiveButton(SBrowserXStrings.get(SBrowserXStrings.BTN_RESTART),
                        (d, w) -> SBrowserXWebRtcManager.restartBrowser(this))
                .setNegativeButton(SBrowserXStrings.get(SBrowserXStrings.BTN_LATER), null)
                .show();
    }

    private String folderLabel(String uriStr) {
        if (uriStr == null || uriStr.isEmpty()) {
            return SBrowserXStrings.get(SBrowserXStrings.BACKUP_FOLDER_NOT_SET);
        }
        try {
            String decoded = Uri.decode(uriStr);
            int idx = decoded.lastIndexOf(':');
            if (idx >= 0 && idx + 1 < decoded.length()) return decoded.substring(idx + 1);
            int slash = decoded.lastIndexOf('/');
            if (slash >= 0 && slash + 1 < decoded.length()) return decoded.substring(slash + 1);
        } catch (Throwable ignored) {}
        return uriStr;
    }

    private String intervalLabel(String code) {
        if (SBrowserXBackupManager.INTERVAL_DAILY.equals(code)) return SBrowserXStrings.get(SBrowserXStrings.BACKUP_INT_DAILY);
        if (SBrowserXBackupManager.INTERVAL_MONTHLY.equals(code)) return SBrowserXStrings.get(SBrowserXStrings.BACKUP_INT_MONTHLY);
        return SBrowserXStrings.get(SBrowserXStrings.BACKUP_INT_WEEKLY);
    }

    private TextView sectionHeader(String title, int color) {
        TextView tv = new TextView(this);
        tv.setText(title);
        tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        tv.setTextColor(color);
        tv.setPadding(dp(14), dp(18), dp(14), dp(8));
        return tv;
    }

    private LinearLayout card(int bgColor) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(bgColor);
        bg.setCornerRadius(dp(26));
        card.setBackground(bg);
        card.setClipToOutline(true);
        return card;
    }

    private View divider(boolean night) {
        View d = new View(this);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, 1);
        lp.leftMargin = dp(20);
        lp.rightMargin = dp(20);
        d.setLayoutParams(lp);
        d.setBackgroundColor(night ? 0xFF2B2B30 : 0xFFE5E6EB);
        return d;
    }

    private TextView addRow(LinearLayout parent, String title, String summary, int textPrimary, int textSecondary, View.OnClickListener listener) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.VERTICAL);
        row.setPadding(dp(20), dp(15), dp(20), dp(15));
        if (listener != null) {
            row.setClickable(true);
            row.setFocusable(true);
            TypedValue out = new TypedValue();
            getTheme().resolveAttribute(android.R.attr.selectableItemBackground, out, true);
            row.setBackgroundResource(out.resourceId);
            row.setOnClickListener(listener);
        }
        TextView tvTitle = new TextView(this);
        tvTitle.setText(title);
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        tvTitle.setTextColor(textPrimary);
        row.addView(tvTitle);

        TextView tvSum = new TextView(this);
        tvSum.setText(summary);
        tvSum.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        tvSum.setTextColor(textSecondary);
        tvSum.setPadding(0, dp(3), 0, 0);
        row.addView(tvSum);

        parent.addView(row);
        return tvSum;
    }

    private void addSwitchRow(LinearLayout parent, String title, String summary, boolean checked, boolean night,
                              int textPrimary, int textSecondary, CompoundButton.OnCheckedChangeListener listener) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(20), dp(14), dp(16), dp(14));

        LinearLayout textCol = new LinearLayout(this);
        textCol.setOrientation(LinearLayout.VERTICAL);
        textCol.setLayoutParams(new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));
        textCol.setPadding(0, 0, dp(12), 0);

        TextView tvTitle = new TextView(this);
        tvTitle.setText(title);
        tvTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        tvTitle.setTextColor(textPrimary);
        textCol.addView(tvTitle);

        TextView tvSum = new TextView(this);
        tvSum.setText(summary);
        tvSum.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        tvSum.setTextColor(textSecondary);
        tvSum.setPadding(0, dp(3), 0, 0);
        textCol.addView(tvSum);

        Switch sw = new Switch(this);
        SBrowserXSettingsActivity.styleOneUiBlueSwitch(sw, night);
        sw.setChecked(checked);
        sw.setOnCheckedChangeListener(listener);

        row.addView(textCol);
        row.addView(sw);
        row.setOnClickListener(v -> sw.toggle());
        parent.addView(row);
    }

    private int dp(int v) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, getResources().getDisplayMetrics()));
    }
}
