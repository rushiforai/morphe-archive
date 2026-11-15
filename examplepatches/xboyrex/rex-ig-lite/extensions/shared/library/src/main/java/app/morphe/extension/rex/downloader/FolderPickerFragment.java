/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
*/


package app.morphe.extension.rex.downloader;

import android.app.Activity;
import android.annotation.SuppressLint;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.provider.DocumentsContract;

import android.app.Fragment;

import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.rex.constants.ExtensionStrings;

public class FolderPickerFragment extends Fragment {

    private static final int FOLDER_REQUEST_CODE = 43;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (savedInstanceState == null) {
            requestFolderPermission();
        }
    }

    public void requestFolderPermission() {
        try {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT_TREE);
            intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION
                    | Intent.FLAG_GRANT_WRITE_URI_PERMISSION
                    | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION);
            startActivityForResult(intent, FOLDER_REQUEST_CODE);
        } catch (Exception e) {
            Logger.printException(() -> "launch folder picker failure", e);
            toast(ExtensionStrings.DOWNLOAD_SET_PATH_FAILED);
            finishHost();
        }
    }

    @Override
    @SuppressLint("WrongConstant")
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);

        if (resultCode == Activity.RESULT_CANCELED) {
            finishHost();
            return;
        }

        if (requestCode == FOLDER_REQUEST_CODE && resultCode == Activity.RESULT_OK && data != null) {
            Uri treeUri = data.getData();
            if (treeUri != null) {
                try {
                    // Keep only the READ/WRITE grant modes accepted by ContentResolver.
                    Activity act = getActivity();
                    if (act != null) {
                        act.getContentResolver().takePersistableUriPermission(
                                treeUri,
                                data.getFlags() & (Intent.FLAG_GRANT_READ_URI_PERMISSION
                                        | Intent.FLAG_GRANT_WRITE_URI_PERMISSION));
                    }

                    StorageUtils.saveCustomTreeUri(treeUri);
                    StorageUtils.saveCustomPath(DocumentsContract.getTreeDocumentId(treeUri));
                    toast(ExtensionStrings.DOWNLOAD_SET_PATH_SUCCESS);
                } catch (Exception e) {
                    Logger.printException(() -> "setting path failure", e);
                    toast(ExtensionStrings.DOWNLOAD_SET_PATH_FAILED);
                }
            }
        }
        finishHost();
    }

    private void finishHost() {
        if (getActivity() != null) {
            getActivity().finish();
        }
    }

    private void toast(String msg) {
        Utils.showToastShort(msg);
    }
}
