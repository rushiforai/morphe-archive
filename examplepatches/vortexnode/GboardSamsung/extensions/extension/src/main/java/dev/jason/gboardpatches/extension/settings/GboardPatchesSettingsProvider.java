package dev.jason.gboardpatches.extension.settings;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;

import java.util.ArrayList;

import dev.jason.gboardpatches.extension.symbolfooter.GboardSymbolFooterOrderSettings;

public final class GboardPatchesSettingsProvider extends ContentProvider {
    private static final String TAG = "GboardPatches";
    private static final String LOG_LABEL = "expression footer tab order";
    public static final String METHOD_GET_SYMBOL_FOOTER_ORDER_SETTINGS =
            "get_symbol_footer_order_settings";
    public static final String BUNDLE_KEY_SYMBOL_FOOTER_ORDER =
            "symbol_footer_order";
    public static final String AUTHORITY_SUFFIX = ".gboard_patches";

    @Override
    public boolean onCreate() {
        return true;
    }

    @Override
    public Bundle call(String method, String arg, Bundle extras) {
        if (METHOD_GET_SYMBOL_FOOTER_ORDER_SETTINGS.equals(method)) {
            try {
                if (getContext() == null) {
                    return new Bundle();
                }
                GboardSymbolFooterOrderSettings.ensureDefaults(getContext());
                ArrayList<String> configuredOrder =
                        new ArrayList<String>(
                                GboardSymbolFooterOrderSettings.readSymbolFooterOrder(
                                        getContext()));
                Log.i(TAG, "Provider returning " + LOG_LABEL + ": " + configuredOrder);
                Bundle result = new Bundle();
                result.putStringArrayList(
                        BUNDLE_KEY_SYMBOL_FOOTER_ORDER,
                        configuredOrder);
                return result;
            } catch (Throwable throwable) {
                Log.w(TAG, "Provider failed to read " + LOG_LABEL, throwable);
                return new Bundle();
            }
        }

        try {
            return super.call(method, arg, extras);
        } catch (Throwable throwable) {
            Log.w(TAG, "Provider call failed for method=" + method, throwable);
            return null;
        }
    }

    @Override
    public Cursor query(Uri uri, String[] projection, String selection, String[] selectionArgs,
            String sortOrder) {
        return null;
    }

    @Override
    public String getType(Uri uri) {
        return null;
    }

    @Override
    public Uri insert(Uri uri, ContentValues values) {
        return null;
    }

    @Override
    public int delete(Uri uri, String selection, String[] selectionArgs) {
        return 0;
    }

    @Override
    public int update(Uri uri, ContentValues values, String selection, String[] selectionArgs) {
        return 0;
    }
}
