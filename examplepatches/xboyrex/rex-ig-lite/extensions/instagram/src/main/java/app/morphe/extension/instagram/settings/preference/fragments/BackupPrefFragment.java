/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.settings.preference.fragments;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.app.Activity;
import android.app.Fragment;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import app.morphe.extension.instagram.constants.Constants;
import app.morphe.extension.instagram.patches.devFlags.FlagsSharedPref;
import app.morphe.extension.instagram.settings.ActivityHook;
import app.morphe.extension.rex.RexUtils;
import app.morphe.extension.shared.Logger;

public class BackupPrefFragment extends Fragment {

    private File sourceFile;
    private Context context;
    private boolean isJsonExport;
    private boolean inlineHosted;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        context = getActivity() != null ? getActivity() : RexUtils.getContext();
        Bundle args = getArguments();
        inlineHosted = args != null && args.getBoolean(ActivityHook.EXTRA_INLINE_HOST, false);

        String filename = null;
        String ext = null;

        if (args != null) {
            if (args.containsKey("rex_export_dev_overrides")) {
                filename = "InstaRex_MetaConfig_Overrides_v3.16.0";
                ext = ".json";
                isJsonExport = true;
                File mcDir = new File(context.getFilesDir(), "mobileconfig");
                if (!mcDir.exists()) mcDir.mkdirs();
                sourceFile = new File(mcDir, "mc_overrides.json");
                ensureValidOverridesFileForExport(context, sourceFile);
            } else if (args.containsKey("rex_export_initial_features")) {
                filename = "InstaRex_Initial_Features_State_v3.16.0";
                ext = ".json";
                isJsonExport = true;
                sourceFile = new File(context.getFilesDir(), "rex_initial_features_export.json");
                ensureInitialFeaturesFileForExport(sourceFile);
            } else if (args.containsKey("rex_export_pref")) {
                filename = "InstaRex_Settings_Backup_v3.16.0";
                ext = ".xml";
                isJsonExport = false;
                sourceFile = new File(context.getApplicationInfo().dataDir + "/shared_prefs", Constants.REX_SETTINGS + ".xml");
            }
        }

        if (savedInstanceState == null) {
            if (filename != null && ext != null && sourceFile != null) {
                if (sourceFile.exists() && sourceFile.length() > 0) {
                    startIntent(filename, ext);
                } else {
                    toast(str("rex_fail_no_file"));
                    finishHost();
                }
            } else {
                toast(str("rex_export_fail"));
                finishHost();
            }
        }
    }

    private static void ensureInitialFeaturesFileForExport(File outFile) {
        if (outFile == null) return;
        try {
            JSONObject exported = FlagsSharedPref.exportAllAsJsonObject();
            try (FileOutputStream out = new FileOutputStream(outFile)) {
                out.write(exported.toString(2).getBytes(StandardCharsets.UTF_8));
                out.flush();
            }
        } catch (Throwable ignored) {
        }
    }

    private static void ensureValidOverridesFileForExport(Context ctx, File mcFile) {
        if (mcFile == null) return;
        if (mcFile.exists() && mcFile.length() > 2) {
            return;
        }
        try {
            int rawId = ctx.getResources().getIdentifier("instarex_pro_config_v6", "raw", ctx.getPackageName());
            if (rawId != 0) {
                try (InputStream in = ctx.getResources().openRawResource(rawId);
                     FileOutputStream out = new FileOutputStream(mcFile)) {
                    byte[] buf = new byte[8192];
                    int n;
                    while ((n = in.read(buf)) != -1) {
                        out.write(buf, 0, n);
                    }
                    out.flush();
                }
                if (mcFile.exists() && mcFile.length() > 2) return;
            }
        } catch (Throwable ignored) {
        }
        try {
            JSONObject exported = FlagsSharedPref.exportAllAsJsonObject();
            try (FileOutputStream out = new FileOutputStream(mcFile)) {
                out.write(exported.toString(2).getBytes(StandardCharsets.UTF_8));
                out.flush();
            }
        } catch (Throwable ignored) {
        }
    }

    private void startIntent(String fileName, String extension) {
        try {
            fileName = fileName + "_" + new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss", Locale.US).format(new Date()) + extension;
            Intent intent = new Intent(Intent.ACTION_CREATE_DOCUMENT);
            intent.addCategory(Intent.CATEGORY_OPENABLE);
            intent.setType(".xml".equals(extension) ? "application/xml" : "application/json");
            intent.putExtra(Intent.EXTRA_TITLE, fileName);

            startActivityForResult(intent, 1);
        } catch (Exception e) {
            Logger.printException(() -> "startActivityForResult failure", e);
            toast(str(e instanceof ActivityNotFoundException
                    ? "rex_file_picker_unavailable"
                    : "rex_export_fail"));
            finishHost();
        }
    }

    private void copyAndVerifyFile(Uri uri) {
        try {
            long totalWritten = 0;
            try (FileInputStream in = new FileInputStream(sourceFile);
                  OutputStream out = context.getContentResolver().openOutputStream(uri)) {
                if (out == null) {
                    throw new IOException("Could not open destination output stream: " + uri);
                }
                byte[] buffer = new byte[8192];
                int read;
                while ((read = in.read(buffer)) > 0) {
                    out.write(buffer, 0, read);
                    totalWritten += read;
                }
                out.flush();
            }

            if (totalWritten <= 0) {
                throw new IOException("Zero bytes written during export");
            }

            try (InputStream verifyIn = context.getContentResolver().openInputStream(uri)) {
                if (verifyIn == null) {
                    throw new IOException("Could not reopen exported file for verification");
                }
                ByteArrayOutputStream baos = new ByteArrayOutputStream();
                byte[] buf = new byte[8192];
                int n;
                while ((n = verifyIn.read(buf)) != -1) {
                    baos.write(buf, 0, n);
                }
                byte[] exportedBytes = baos.toByteArray();
                if (exportedBytes.length == 0) {
                    throw new IOException("Exported file is empty on readback");
                }
                if (isJsonExport) {
                    String content = new String(exportedBytes, StandardCharsets.UTF_8);
                    Object parsed = new JSONTokener(content).nextValue();
                    if (!(parsed instanceof JSONObject) && !(parsed instanceof JSONArray)) {
                        throw new IOException("Exported JSON failed round-trip parse validation");
                    }
                }
            }

            toast(str("rex_export_success"));
        } catch (Exception e) {
            toast(str("rex_export_fail"));
            Logger.printException(() -> "export failure", e);
        }
    }

    @Override
    public void onActivityResult(int req, int res, Intent data) {
        super.onActivityResult(req, res, data);

        if (res == Activity.RESULT_CANCELED) {
            finishHost();
            return;
        }

        Uri uri = null;
        if (data != null) {
            uri = data.getData();
        }

        if (uri == null) {
            toast(str("rex_fail_no_path"));
        } else if (res == Activity.RESULT_OK) {
            copyAndVerifyFile(uri);
        }

        finishHost();
    }

    private void finishHost() {
        try {
            if (getFragmentManager() != null) {
                getFragmentManager().beginTransaction().remove(this).commitAllowingStateLoss();
            }
        } catch (Throwable ignored) {}
        if (!inlineHosted && getActivity() != null) {
            getActivity().finish();
        }
    }

    private void toast(String msg) {
        RexUtils.toast(msg);
    }
}
