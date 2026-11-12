package app.variablenine.nudge;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.ProviderInfo;
import android.database.Cursor;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.os.Process;

import app.variablenine.nudge.core.Log;

/**
 * Two jobs, neither of which is serving data in the usual sense:
 *
 * <ol>
 * <li><b>Start-up.</b> Android creates every provider of an app before any of the app's
 * own code runs. That gives the reminder spot a way in without changing a single line
 * of the host app, which is why this patch does not break when the app is updated.</li>
 * <li><b>Sync.</b> {@link #call} lets the other patched apps on the phone exchange
 * reminders with this one. It answers nobody who is not signed with the same key.</li>
 * </ol>
 */
public final class NudgeProvider extends ContentProvider {

    @Override
    public void attachInfo(Context context, ProviderInfo info) {
        if (info != null && info.authority != null) {
            // If several authorities were ever declared, the first is the one that counts.
            String authority = info.authority;
            int semicolon = authority.indexOf(';');
            SiblingSync.setOwnAuthority(semicolon < 0 ? authority : authority.substring(0, semicolon));
        }
        super.attachInfo(context, info);
    }

    @Override
    public boolean onCreate() {
        try {
            Nudge.start(getContext());
        } catch (Throwable t) {
            // Whatever goes wrong here, the host app must still start.
            Log.w("start failed", t);
        }
        return true;
    }

    @Override
    public Bundle call(String method, String arg, Bundle extras) {
        try {
            Context context = getContext();
            if (context == null || !SiblingSync.METHOD_SYNC.equals(method)) return null;
            int caller = Binder.getCallingUid();
            if (caller != Process.myUid()) {
                PackageManager pm = context.getPackageManager();
                if (pm.checkSignatures(caller, Process.myUid()) != PackageManager.SIGNATURE_MATCH) {
                    return null;
                }
            }
            if (extras != null) extras.setClassLoader(NudgeProvider.class.getClassLoader());
            return SiblingSync.serve(context, extras, caller);
        } catch (Throwable t) {
            Log.w("sync request failed", t);
            return null;
        }
    }

    // There is no table behind this provider. Everything below is intentionally inert.

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
