package app.fontism.extension.orca;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.database.Cursor;
import android.net.Uri;
import android.os.Binder;
import android.os.ParcelFileDescriptor;
import android.os.Process;
import org.json.JSONException;
import org.json.JSONObject;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.HashSet;
import java.util.Arrays;
import java.util.Set;
import java.util.concurrent.FutureTask;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Private, same-UID JSON bridge used by Expo FileSystem's content URI reader.
 * Routes (authority dev.orca.app.morphe.fonts): /state /list /select?key=
 * /reset /import?uri=&amp;name= and the PNG /preview?key=&amp;generation=&amp;width=
 * &amp;height=&amp;size=&amp;color=. An optional "request" cache-buster is accepted.
 */
public final class OrcaFontProvider extends ContentProvider {
    private final OrcaRequestCache responses = new OrcaRequestCache(4, OrcaFontStore::epoch);
    private final ExecutorService worker = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "Orca-fonts");
        thread.setDaemon(true);
        return thread;
    });

    @Override public boolean onCreate() {
        if (getContext() == null) return false;
        OrcaFontStore.prepare(getContext().getApplicationContext());
        OrcaWebFonts.initialize(getContext().getApplicationContext());
        return true;
    }

    @Override public ParcelFileDescriptor openFile(Uri uri, String mode) throws FileNotFoundException {
        if (Binder.getCallingUid() != Process.myUid()) throw new SecurityException("Private font settings");
        if (!"r".equals(mode)) throw new FileNotFoundException("Font settings are read-only");
        List<String> segments = uri.getPathSegments();
        if (segments.size() != 1) throw new FileNotFoundException("Unknown font settings request");
        String route = segments.get(0);
        if ("preview".equals(route)) {
            Set<String> expected = new HashSet<>(Arrays.asList("key", "width", "height", "size", "color", "generation"));
            if (!uri.getQueryParameterNames().equals(expected)) throw new FileNotFoundException("Invalid font preview");
            for (String parameter : expected) if (uri.getQueryParameters(parameter).size() != 1)
                throw new FileNotFoundException("Invalid font preview");
            String previewKey = uri.getQueryParameter("key");
            if (previewKey == null || previewKey.isEmpty() || previewKey.length() > 4096)
                throw new FileNotFoundException("Invalid font preview");
            try {
                OrcaPreviewSpec spec = new OrcaPreviewSpec(uri.getQueryParameter("width"), uri.getQueryParameter("height"),
                        uri.getQueryParameter("size"), uri.getQueryParameter("color"), uri.getQueryParameter("generation"));
                return OrcaFontPreviews.open(getContext(), previewKey, spec);
            } catch (IllegalArgumentException invalid) {
                throw new FileNotFoundException("Invalid font preview");
            }
        }
        if (!"state".equals(route) && !"list".equals(route) && !"select".equals(route) && !"reset".equals(route)
                && !"import".equals(route) && !"restart".equals(route) && !"termcss".equals(route))
            throw new FileNotFoundException("Unknown font settings request");
        Set<String> allowed = new HashSet<>();
        if ("select".equals(route)) allowed.add("key");
        if ("import".equals(route)) { allowed.add("uri"); allowed.add("name"); }
        Set<String> given = new HashSet<>(uri.getQueryParameterNames());
        if (given.remove("request")) {
            if (uri.getQueryParameters("request").size() != 1
                    || !uri.getQueryParameter("request").matches("[a-zA-Z0-9-]{1,80}"))
                throw new FileNotFoundException("Invalid font request");
        }
        if (!given.equals(allowed)) throw new FileNotFoundException("Invalid font request");
        String key = "select".equals(route) ? uri.getQueryParameter("key") : null;
        if ("select".equals(route) && (key == null || key.isEmpty() || key.length() > 4096
                || uri.getQueryParameters("key").size() != 1))
            throw new FileNotFoundException("Choose a device font");
        if ("import".equals(route) && (uri.getQueryParameters("uri").size() != 1
                || uri.getQueryParameters("name").size() != 1 || uri.getQueryParameter("uri").length() > 8192
                || uri.getQueryParameter("name").length() > 1024)) throw new FileNotFoundException("Invalid font import");
        try {
            // File.text() opens once to check existence and again to read. Reuse
            // the same operation for that URI, including list scans and mutations.
            FutureTask<byte[]> response = responses.get(uri.toString(), () -> {
                String json;
                try {
                    switch (route) {
                        case "state": json = OrcaFontStore.state(getContext()); break;
                        case "list": json = OrcaFontStore.list(getContext()); break;
                        case "select": json = OrcaFontStore.select(getContext(), key); break;
                        case "import": json = OrcaFontStore.importFont(getContext(),
                                uri.getQueryParameter("uri"), uri.getQueryParameter("name")); break;
                        case "restart": json = restart(); break;
                        case "termcss": json = new JSONObject().put("css", OrcaWebFonts.terminalCss())
                                .put("revision", OrcaFontStore.revision(getContext())).toString(); break;
                        default: json = OrcaFontStore.reset(getContext()); break;
                    }
                } catch (IOException | RuntimeException failure) {
                    json = error("Font settings could not be updated");
                }
                return json.getBytes(StandardCharsets.UTF_8);
            }, worker);
            ParcelFileDescriptor[] pipe = ParcelFileDescriptor.createPipe();
            try {
                worker.execute(() -> {
                    try (OutputStream out = new ParcelFileDescriptor.AutoCloseOutputStream(pipe[1])) {
                        out.write(response.get());
                    } catch (InterruptedException interrupted) {
                        Thread.currentThread().interrupt();
                    } catch (IOException | ExecutionException closedReader) {
                        // Navigation/cancellation can close the reader before a scan completes.
                    }
                });
            } catch (RuntimeException failed) {
                pipe[0].close(); pipe[1].close();
                throw failed;
            }
            return pipe[0];
        } catch (IOException | RuntimeException failed) {
            FileNotFoundException error = new FileNotFoundException("Font settings are unavailable");
            error.initCause(failed);
            throw error;
        }
    }

    /** The caller is the visible app itself, so starting the restarter is a foreground start. */
    private String restart() {
        android.content.Context context = getContext();
        android.content.Intent intent = new android.content.Intent(context, OrcaRestartActivity.class)
                .addFlags(android.content.Intent.FLAG_ACTIVITY_NEW_TASK | android.content.Intent.FLAG_ACTIVITY_NO_ANIMATION);
        context.startActivity(intent);
        return "{\"ok\":true}";
    }

    private static String error(String message) {
        try { return new JSONObject().put("error", message).toString(); }
        catch (JSONException impossible) { return "{\"error\":\"Font settings are unavailable\"}"; }
    }

    @Override public String getType(Uri uri) {
        return "/preview".equals(uri.getPath()) ? "image/png" : "application/json";
    }
    @Override public void onTrimMemory(int level) {
        super.onTrimMemory(level);
        if (level >= android.content.ComponentCallbacks2.TRIM_MEMORY_RUNNING_LOW) OrcaFontPreviews.clear();
    }
    @Override public Cursor query(Uri uri, String[] projection, String selection, String[] args, String order) { return null; }
    @Override public Uri insert(Uri uri, ContentValues values) { throw new UnsupportedOperationException(); }
    @Override public int delete(Uri uri, String selection, String[] args) { throw new UnsupportedOperationException(); }
    @Override public int update(Uri uri, ContentValues values, String selection, String[] args) { throw new UnsupportedOperationException(); }
}
