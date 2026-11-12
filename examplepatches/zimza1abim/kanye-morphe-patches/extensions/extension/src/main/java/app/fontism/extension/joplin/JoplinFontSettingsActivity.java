package app.fontism.extension.joplin;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ComponentName;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.view.Gravity;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.IOException;

public final class JoplinFontSettingsActivity extends Activity {
    private static final int PICK_FONT = 36022;
    private int primaryText;
    private int secondaryText;
    private int background;
    private int cardColor;
    private TextView currentFont;
    private TextView status;
    private TextView preview;
    private boolean busy;
    private final java.util.concurrent.ExecutorService worker = java.util.concurrent.Executors.newSingleThreadExecutor();
    private void changeFont(Runnable operation) {
        if (busy) return;
        busy = true;
        status.setText("Preparing font…");
        worker.execute(() -> {
            try {
                operation.run();
                runOnUiThread(() -> {
                    busy = false;
                    if (isDestroyed()) return;
                    refresh();
                    Toast.makeText(this, "Applied. Go back to refresh Joplin.", Toast.LENGTH_LONG).show();
                });
            } catch (Exception error) {
                runOnUiThread(() -> {
                    busy = false;
                    if (isDestroyed()) return;
                    refresh();
                    new AlertDialog.Builder(this).setTitle("Couldn't apply font")
                        .setMessage(error.getCause() != null ? error.getCause().getMessage() : error.getMessage())
                        .setPositiveButton("OK", null).show();
                });
            }
        });
    }
    @Override public void onBackPressed() {
        if (busy) { Toast.makeText(this, "Please wait until the font is ready.", Toast.LENGTH_SHORT).show(); return; }
        super.onBackPressed();
    }
    @Override protected void onDestroy() {
        worker.shutdown();
        super.onDestroy();
    }

    @Override
    protected void onCreate(Bundle state) {
        boolean dark = (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        setTheme(dark ? android.R.style.Theme_Material_NoActionBar
                : android.R.style.Theme_Material_Light_NoActionBar);
        primaryText = dark ? Color.rgb(232, 234, 237) : Color.rgb(32, 33, 36);
        secondaryText = dark ? Color.rgb(189, 193, 198) : Color.rgb(95, 99, 104);
        background = dark ? Color.rgb(28, 30, 33) : Color.WHITE;
        cardColor = dark ? Color.rgb(45, 48, 52) : Color.rgb(244, 247, 251);
        super.onCreate(state);
        setTitle("Joplin font");
        setContentView(createContent());
        refresh();
    }

    private ScrollView createContent() {
        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setBackgroundColor(background);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(24), dp(34), dp(24), dp(34));
        scroll.addView(root, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        root.addView(text("Joplin font", 29, primaryText), matchWrap());
        TextView description = text(
                "Applies to the editor and note viewer before they first draw.",
                15, secondaryText);
        LinearLayout.LayoutParams descriptionParams = matchWrap();
        descriptionParams.topMargin = dp(8);
        root.addView(description, descriptionParams);

        LinearLayout currentCard = card();
        currentCard.addView(text("Current font", 13, secondaryText), matchWrap());
        currentFont = text("", 20, primaryText);
        LinearLayout.LayoutParams currentParams = matchWrap();
        currentParams.topMargin = dp(6);
        currentCard.addView(currentFont, currentParams);
        status = text("", 13, secondaryText);
        LinearLayout.LayoutParams statusParams = matchWrap();
        statusParams.topMargin = dp(4);
        currentCard.addView(status, statusParams);
        LinearLayout.LayoutParams currentCardParams = matchWrap();
        currentCardParams.topMargin = dp(22);
        root.addView(currentCard, currentCardParams);

        LinearLayout previewCard = card();
        previewCard.addView(text("Preview", 13, secondaryText), matchWrap());
        preview = text("다람쥐 헌 쳇바퀴에 타고파\nThe quick brown fox\n0123456789", 23, primaryText);
        preview.setLineSpacing(0f, 1.18f);
        LinearLayout.LayoutParams previewParams = matchWrap();
        previewParams.topMargin = dp(10);
        previewCard.addView(preview, previewParams);
        LinearLayout.LayoutParams previewCardParams = matchWrap();
        previewCardParams.topMargin = dp(14);
        root.addView(previewCard, previewCardParams);

        Button choose = primaryButton("Choose a font file");
        choose.setOnClickListener(view -> chooseFont());
        LinearLayout.LayoutParams chooseParams = matchWrap();
        chooseParams.topMargin = dp(18);
        root.addView(choose, chooseParams);

        Button disable = button("Turn off custom font");
        disable.setOnClickListener(view -> changeFont(() -> {
            try { JoplinFontStore.setEnabled(this, false); }
            catch (IOException error) { throw new RuntimeException(error); }
        }));
        LinearLayout.LayoutParams disableParams = matchWrap();
        disableParams.topMargin = dp(8);
        root.addView(disable, disableParams);

        Button openJoplin = button("Open Joplin");
        openJoplin.setOnClickListener(view -> openJoplin());
        LinearLayout.LayoutParams openParams = matchWrap();
        openParams.topMargin = dp(8);
        root.addView(openJoplin, openParams);

        TextView hint = text(
                "TTF or OTF, up to 32 MB. Icons and emoji keep their fonts.",
                13, secondaryText);
        LinearLayout.LayoutParams hintParams = matchWrap();
        hintParams.topMargin = dp(16);
        root.addView(hint, hintParams);
        return scroll;
    }

    private void chooseFont() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("*/*");
        intent.putExtra(Intent.EXTRA_MIME_TYPES, new String[]{
                "font/ttf", "font/otf",
                "application/font-sfnt", "application/octet-stream"
        });
        startActivityForResult(intent, PICK_FONT);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != PICK_FONT || resultCode != RESULT_OK || data == null) return;
        Uri uri = data.getData();
        if (uri == null) return;
        changeFont(() -> {
            try { JoplinFontStore.importFont(this, uri); }
            catch (IOException error) { throw new RuntimeException(error); }
        });
    }

    private void refresh() {
        boolean enabled = JoplinFontStore.enabled(this);
        currentFont.setText(JoplinFontStore.displayName(this));
        status.setText(enabled ? "On" : "Off");
        preview.setTypeface(Typeface.DEFAULT);
        if (!enabled) return;
        try {
            File file = JoplinFontStore.selectedFile(this);
            preview.setTypeface(Typeface.createFromFile(file));
        } catch (RuntimeException ignored) {
            // Android's Typeface preview does not understand WOFF/WOFF2, but WebView does.
        }
    }

    private void openJoplin() { onBackPressed(); }


    private LinearLayout card() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(18), dp(17), dp(18), dp(17));
        GradientDrawable backgroundDrawable = new GradientDrawable();
        backgroundDrawable.setColor(cardColor);
        backgroundDrawable.setCornerRadius(dp(18));
        card.setBackground(backgroundDrawable);
        return card;
    }

    private Button primaryButton(String value) {
        Button button = button(value);
        button.setTextColor(Color.WHITE);
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(Color.rgb(48, 106, 203));
        drawable.setCornerRadius(dp(14));
        button.setBackground(drawable);
        return button;
    }

    private Button button(String value) {
        Button button = new Button(this);
        button.setText(value);
        button.setTextSize(15);
        button.setAllCaps(false);
        button.setMinHeight(dp(52));
        return button;
    }

    private TextView text(String value, int sp, int color) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(sp);
        view.setTextColor(color);
        view.setGravity(Gravity.START);
        return view;
    }

    private LinearLayout.LayoutParams matchWrap() {
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
