package app.font.extension.anytype;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.widget.Toast;
import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Non-exported SAF relay; font bytes are copied while the temporary grant is valid. */
public final class FontPickerActivity extends Activity {
    private static final int PICK_FONT = 941;
    private static final ExecutorService WORKER = Executors.newSingleThreadExecutor();
    private Uri pendingUri;
    @Override public void onCreate(Bundle state) {
        super.onCreate(state);
        if (state != null && state.getString("font_uri") != null) {
            importSelected(Uri.parse(state.getString("font_uri")));
        } else if (state == null) {
            Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT)
                    .addCategory(Intent.CATEGORY_OPENABLE).setType("*/*")
                    .addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
            try { startActivityForResult(intent, PICK_FONT); }
            catch (RuntimeException error) { fail("No document picker is available"); }
        }
    }
    @Override protected void onActivityResult(int request, int result, Intent data) {
        super.onActivityResult(request, result, data);
        if (request != PICK_FONT) return;
        if (result != RESULT_OK || data == null || data.getData() == null) { finish(); return; }
        importSelected(data.getData());
    }
    @Override protected void onSaveInstanceState(Bundle state) {
        if (pendingUri != null) state.putString("font_uri", pendingUri.toString());
        super.onSaveInstanceState(state);
    }
    private void importSelected(Uri uri) {
        pendingUri = uri;
        WORKER.execute(() -> {
            String failure = null;
            try { CustomFontManager.importFont(uri); }
            catch (IOException | RuntimeException error) { failure = error.getMessage(); }
            catch (OutOfMemoryError error) { failure = "Not enough memory to load this font"; }
            final String message = failure;
            runOnUiThread(() -> {
                pendingUri = null;
                if (message == null) { finish(); CustomFontManager.refresh(); }
                else fail(message);
            });
        });
    }
    private void fail(String message) {
        Toast.makeText(getApplicationContext(), message, Toast.LENGTH_LONG).show();
        finish();
    }
    public static void showSettings() {
        Activity activity = CustomFontManager.activity();
        if (activity == null || activity.isFinishing()) return;
        AlertDialog dialog = new AlertDialog.Builder(activity)
                .setTitle("Font")
                .setItems(new String[]{"Default", "Choose custom font…", "Reset to default"}, (d, which) -> {
                    if (which == 1) activity.startActivity(new Intent(activity, FontPickerActivity.class));
                    else {
                        try { CustomFontManager.reset(); CustomFontManager.refresh(); }
                        catch (IOException error) { Toast.makeText(activity, error.getMessage(), Toast.LENGTH_LONG).show(); }
                    }
                }).setNegativeButton(android.R.string.cancel, null).create();
        dialog.show();
        CustomFontManager.applyTree(dialog.getWindow().getDecorView());
    }
}
