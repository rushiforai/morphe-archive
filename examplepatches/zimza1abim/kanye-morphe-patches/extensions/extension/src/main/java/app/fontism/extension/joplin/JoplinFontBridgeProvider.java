package app.fontism.extension.joplin;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;

/** Initializes before React Native; no overlay or activity lifecycle overrides. */
public final class JoplinFontBridgeProvider extends ContentProvider {
    @Override public boolean onCreate() {
        JoplinFontInjector.initialize(getContext().getApplicationContext());
        return true;
    }
    @Override public Cursor query(Uri u, String[] p, String s, String[] a, String o) { return null; }
    @Override public String getType(Uri u) { return null; }
    @Override public Uri insert(Uri u, ContentValues v) { return null; }
    @Override public int delete(Uri u, String s, String[] a) { return 0; }
    @Override public int update(Uri u, ContentValues v, String s, String[] a) { return 0; }
}
