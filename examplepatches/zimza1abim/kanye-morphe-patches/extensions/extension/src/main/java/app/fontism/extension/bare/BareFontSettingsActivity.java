package app.fontism.extension.bare;

import android.app.Activity;
import android.app.Dialog;
import android.animation.ValueAnimator;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.LruCache;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.view.animation.DecelerateInterpolator;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputMethodManager;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

import java.io.IOException;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public final class BareFontSettingsActivity extends Activity {
    private static final int PICK_FONT = 2101;
    private TextView currentFont;
    private int primaryText;
    private int secondaryText;
    private int background;
    private boolean dark;
    private int surface;
    private int softSurface;
    private int accent;
    private int accentSurface;
    private int divider;

    @Override
    protected void onCreate(Bundle state) {
        dark = (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        setTheme(dark ? android.R.style.Theme_Material_NoActionBar
                : android.R.style.Theme_Material_Light_NoActionBar);
        primaryText = dark ? 0xfff2f3f5 : 0xff17191e;
        secondaryText = dark ? 0xffafb4bf : 0xff626975;
        background = dark ? 0xff101114 : 0xfff2f3f7;
        surface = dark ? 0xff1e2026 : Color.WHITE;
        softSurface = dark ? 0xff2b2e36 : 0xfff0f2f6;
        accent = dark ? 0xff9ebcff : 0xff315cdb;
        accentSurface = dark ? 0xff263451 : 0xffeaf0ff;
        divider = dark ? 0xff3c404a : 0xffdfe3eb;
        super.onCreate(state);
        setTitle("Custom font");
        getWindow().setStatusBarColor(background);
        getWindow().setNavigationBarColor(background);
        if (!dark) getWindow().getDecorView().setSystemUiVisibility(
                View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR | View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR);
        setContentView(createContent());
        refresh();
    }

    private View createContent() {
        LinearLayout page = new LinearLayout(this);
        page.setOrientation(LinearLayout.VERTICAL);
        page.setBackgroundColor(background);
        page.setFitsSystemWindows(true);

        LinearLayout toolbar = new LinearLayout(this);
        toolbar.setGravity(Gravity.CENTER_VERTICAL);
        toolbar.setPadding(dp(20), dp(10), dp(20), dp(8));
        Button back = button("‹");
        back.setTextSize(30);
        back.setMinHeight(0);
        back.setMinimumWidth(0);
        back.setPadding(0, 0, 0, 0);
        back.setContentDescription("Back");
        back.setOnClickListener(view -> finish());
        toolbar.addView(back, new LinearLayout.LayoutParams(dp(48), dp(48)));
        TextView brand = text("Bare", 15, secondaryText);
        LinearLayout.LayoutParams brandParams = new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        brandParams.setMarginStart(dp(14));
        toolbar.addView(brand, brandParams);
        page.addView(toolbar, matchWrap());

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.setClipToPadding(false);
        scroll.setVerticalScrollBarEnabled(false);
        page.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(20), dp(26), dp(20), dp(20));
        scroll.addView(root, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView title = text("Custom\nfont", 36, primaryText);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        title.setGravity(Gravity.START);
        root.addView(title, matchWrap());

        TextView description = text(
                "Font for webpages.",
                15, secondaryText);
        description.setGravity(Gravity.START);
        LinearLayout.LayoutParams descriptionParams = matchWrap();
        descriptionParams.topMargin = dp(8);
        root.addView(description, descriptionParams);

        LinearLayout statusCard = mainCard();
        statusCard.setBackground(roundedBackground(accentSurface, 30));
        TextView currentLabel = text("Current", 13, accent);
        currentLabel.setGravity(Gravity.START);
        statusCard.addView(currentLabel, matchWrap());
        currentFont = text("", 23, primaryText);
        currentFont.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        currentFont.setGravity(Gravity.START);
        LinearLayout.LayoutParams currentTextParams = matchWrap();
        currentTextParams.topMargin = dp(6);
        statusCard.addView(currentFont, currentTextParams);
        TextView selectionHint = text("Restart to apply changes", 13, secondaryText);
        LinearLayout.LayoutParams selectionHintParams = matchWrap();
        selectionHintParams.topMargin = dp(10);
        statusCard.addView(selectionHint, selectionHintParams);
        LinearLayout.LayoutParams statusParams = matchWrap();
        statusParams.topMargin = dp(24);
        root.addView(statusCard, statusParams);

        addSection(root, "Choose a font");
        LinearLayout selectionCard = rowCard();
        selectionCard.addView(settingRow("Aa", "Installed font APK",
                "Search by name and preview", this::scanInstalledFonts), matchWrap());
        addDivider(selectionCard);
        selectionCard.addView(settingRow("Tt", "Font file",
                "TTF · OTF · TTC", view -> chooseFontFile()), matchWrap());
        root.addView(selectionCard, matchWrap());

        addSection(root, "Default");
        LinearLayout sourceCard = rowCard();
        sourceCard.addView(settingRow("↺", "Browser default", "Reset to the default font", view -> {
            BareFontStore.useBrowserDefault(this);
            refresh();
            Toast.makeText(this, "Default font set. Restart Bare to apply.", Toast.LENGTH_LONG).show();
        }), matchWrap());
        root.addView(sourceCard, matchWrap());

        LinearLayout footer = new LinearLayout(this);
        footer.setOrientation(LinearLayout.VERTICAL);
        footer.setPadding(dp(20), dp(10), dp(20), dp(28));
        Button restart = primaryButton("Apply and restart");
        restart.setOnClickListener(view -> {
            restart.setEnabled(false);
            Toast.makeText(this, "Restarting Bare…", Toast.LENGTH_SHORT).show();
            startActivity(new Intent(this, BareRestartActivity.class));
        });
        footer.addView(restart, matchWrap());
        page.addView(footer, matchWrap());
        animateEntrance(root);
        return page;
    }

    private void chooseFontFile() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("*/*");
        intent.putExtra(Intent.EXTRA_MIME_TYPES, new String[]{
                "font/ttf", "font/otf", "font/collection",
                "application/font-sfnt", "application/octet-stream"
        });
        startActivityForResult(intent, PICK_FONT);
    }

    private void scanInstalledFonts(View button) {
        button.setEnabled(false);
        button.setAlpha(0.5f);
        new Thread(() -> {
            List<BareFontPackageScanner.InstalledFont> fonts =
                    BareFontPackageScanner.scan(this);
            runOnUiThread(() -> {
                if (isFinishing() || isDestroyed()) return;
                button.setEnabled(true);
                button.setAlpha(1f);
                showInstalledFonts(fonts);
            });
        }, "Bare-font-scan").start();
    }

    private void showInstalledFonts(List<BareFontPackageScanner.InstalledFont> fonts) {
        if (fonts.isEmpty()) {
            LinearLayout empty = new LinearLayout(this);
            empty.setOrientation(LinearLayout.VERTICAL);
            empty.setPadding(dp(24), dp(12), dp(24), dp(20));
            addHandle(empty);
            empty.addView(text("No installed fonts", 24, primaryText), matchWrap());
            TextView message = text("Install a font APK or\nchoose a TTF, OTF or TTC file.", 15, secondaryText);
            message.setPadding(0, dp(16), 0, dp(20));
            empty.addView(message, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
            Dialog notice = createSheet(empty, 360);
            Button choose = primaryButton("Choose a font file");
            choose.setOnClickListener(view -> { notice.dismiss(); chooseFontFile(); });
            empty.addView(choose, matchWrap());
            Button close = button("Close");
            close.setOnClickListener(view -> notice.dismiss());
            LinearLayout.LayoutParams closeParams = matchWrap();
            closeParams.topMargin = dp(8);
            closeParams.bottomMargin = dp(12);
            empty.addView(close, closeParams);
            notice.show();
            return;
        }
        FontPreviewAdapter adapter = new FontPreviewAdapter(fonts);
        int listSurface = softSurface;

        LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setPadding(dp(20), dp(12), dp(20), dp(16));
        addHandle(content);

        TextView title = text("Installed fonts", 24, primaryText);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        title.setGravity(Gravity.START);
        content.addView(title, matchWrap());

        TextView subtitle = text("Tap a font to preview", 14, secondaryText);
        subtitle.setGravity(Gravity.START);
        LinearLayout.LayoutParams subtitleParams = matchWrap();
        subtitleParams.topMargin = dp(6);
        content.addView(subtitle, subtitleParams);

        LinearLayout searchBar = new LinearLayout(this);
        searchBar.setGravity(Gravity.CENTER_VERTICAL);
        searchBar.setPadding(dp(16), 0, dp(4), 0);
        searchBar.setBackground(roundedBackground(listSurface, 24));
        EditText search = new EditText(this);
        search.setHint("Search fonts");
        search.setContentDescription("Search fonts");
        search.setTextColor(primaryText);
        search.setHintTextColor(secondaryText);
        search.setTextSize(16);
        search.setSingleLine(true);
        search.setInputType(InputType.TYPE_CLASS_TEXT);
        search.setImeOptions(EditorInfo.IME_ACTION_DONE);
        search.setBackgroundColor(Color.TRANSPARENT);
        search.setPadding(0, dp(12), 0, dp(12));
        searchBar.addView(search, new LinearLayout.LayoutParams(0, dp(56), 1f));
        Button clearSearch = button("×");
        clearSearch.setContentDescription("Clear search");
        clearSearch.setPadding(0, 0, 0, 0);
        clearSearch.setMinWidth(0);
        clearSearch.setMinimumWidth(0);
        clearSearch.setVisibility(View.GONE);
        clearSearch.setOnClickListener(view -> search.setText(""));
        searchBar.addView(clearSearch, new LinearLayout.LayoutParams(dp(48), dp(48)));
        LinearLayout.LayoutParams searchParams = matchWrap();
        searchParams.topMargin = dp(16);
        content.addView(searchBar, searchParams);

        TextView resultCount = text(fonts.size() + " fonts", 13, secondaryText);
        resultCount.setGravity(Gravity.START);
        LinearLayout.LayoutParams countParams = matchWrap();
        countParams.topMargin = dp(10);
        content.addView(resultCount, countParams);

        FrameLayout listContainer = new FrameLayout(this);
        ListView list = new ListView(this);
        list.setAdapter(adapter);
        list.setDivider(new ColorDrawable(divider));
        list.setDividerHeight(dp(1));
        list.setBackground(roundedBackground(surface, 24));
        list.setSelector(new RippleDrawable(ColorStateList.valueOf(dark ? 0x22ffffff : 0x14315cdb),
                new ColorDrawable(Color.TRANSPARENT), null));
        list.setClipToOutline(true);
        list.setPadding(0, dp(4), 0, dp(4));
        LinearLayout.LayoutParams listParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f);
        listParams.topMargin = dp(10);
        listContainer.addView(list, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        TextView empty = text("No matching fonts", 15, secondaryText);
        empty.setGravity(Gravity.CENTER);
        empty.setPadding(dp(16), dp(16), dp(16), dp(16));
        empty.setVisibility(View.GONE);
        listContainer.addView(empty, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        list.setEmptyView(empty);
        content.addView(listContainer, listParams);
        content.setFocusableInTouchMode(true);
        content.requestFocus();

        search.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) {}
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) {
                boolean changed = adapter.filter(s.toString());
                clearSearch.setVisibility(s.length() == 0 ? View.GONE : View.VISIBLE);
                resultCount.setText(s.toString().trim().isEmpty()
                        ? fonts.size() + " fonts"
                        : adapter.getCount() + " of " + fonts.size() + " fonts");
                if (changed) list.setSelection(0);
            }
            @Override public void afterTextChanged(Editable s) {}
        });
        search.setOnEditorActionListener((view, actionId, event) -> {
            if (actionId != EditorInfo.IME_ACTION_DONE) return false;
            hideSearchKeyboard(search);
            content.requestFocus();
            return true;
        });

        Dialog dialog = createSheet(content, 780);
        Button close = button("Close");
        close.setOnClickListener(view -> dialog.dismiss());
        LinearLayout.LayoutParams closeParams = matchWrap();
        closeParams.topMargin = dp(12);
        closeParams.bottomMargin = dp(12);
        content.addView(close, closeParams);
        list.setOnItemClickListener((parent, view, index, id) -> {
            BareFontPackageScanner.InstalledFont font = adapter.getItem(index);
            int firstVisible = list.getFirstVisiblePosition();
            int top = list.getChildCount() == 0 ? 0
                    : list.getChildAt(0).getTop() - list.getPaddingTop();
            hideSearchKeyboard(search);
            content.requestFocus();
            showDetailedPreview(font, adapter.peekTypeface(font), () -> {
                dialog.dismiss();
                importInstalledFont(font);
            }, () -> {
                if (dialog.isShowing()) list.post(() -> {
                    if (dialog.isShowing()) list.setSelectionFromTop(firstVisible, top);
                });
            });
        });
        dialog.setOnDismissListener(ignored -> adapter.close());
        dialog.show();
    }

    private void hideSearchKeyboard(View search) {
        InputMethodManager keyboard = (InputMethodManager) getSystemService(INPUT_METHOD_SERVICE);
        if (keyboard != null) keyboard.hideSoftInputFromWindow(search.getWindowToken(), 0);
    }

    private void showDetailedPreview(
            BareFontPackageScanner.InstalledFont font, Typeface cachedTypeface,
            Runnable useFont, Runnable returnToList) {
        int cardColor = softSurface;

        LinearLayout sheet = new LinearLayout(this);
        sheet.setOrientation(LinearLayout.VERTICAL);
        sheet.setPadding(dp(20), dp(12), dp(20), dp(16));
        addHandle(sheet);
        ScrollView scroll = new ScrollView(this);
        scroll.setVerticalScrollBarEnabled(false);
        sheet.addView(scroll, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(0, 0, 0, dp(12));
        scroll.addView(root, new ScrollView.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        TextView title = text("Font preview", 24, primaryText);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        title.setGravity(Gravity.START);
        root.addView(title, matchWrap());

        TextView name = text(font.displayLabel(), 14, secondaryText);
        name.setGravity(Gravity.START);
        LinearLayout.LayoutParams nameParams = matchWrap();
        nameParams.topMargin = dp(6);
        root.addView(name, nameParams);

        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(24), dp(26), dp(24), dp(26));
        card.setBackground(roundedBackground(cardColor, 28));
        LinearLayout.LayoutParams cardParams = matchWrap();
        cardParams.topMargin = dp(20);
        root.addView(card, cardParams);

        TextView korean = previewText("다람쥐 헌 쳇바퀴에 타고파", 26);
        TextView english = previewText("The quick brown fox jumps over the lazy dog", 22);
        TextView numbers = previewText("0123456789", 26);
        card.addView(korean, matchWrap());
        LinearLayout.LayoutParams englishParams = matchWrap();
        englishParams.topMargin = dp(18);
        card.addView(english, englishParams);
        LinearLayout.LayoutParams numberParams = matchWrap();
        numberParams.topMargin = dp(18);
        card.addView(numbers, numberParams);

        TextView loading = text("Loading preview…", 13, secondaryText);
        loading.setGravity(Gravity.START);
        LinearLayout.LayoutParams loadingParams = matchWrap();
        loadingParams.topMargin = dp(10);
        root.addView(loading, loadingParams);

        TextView sizeLabel = text("Preview size 26", 14, primaryText);
        sizeLabel.setGravity(Gravity.START);
        LinearLayout.LayoutParams sizeParams = matchWrap();
        sizeParams.topMargin = dp(18);
        root.addView(sizeLabel, sizeParams);

        SeekBar size = new SeekBar(this);
        size.setProgressTintList(ColorStateList.valueOf(accent));
        size.setThumbTintList(ColorStateList.valueOf(accent));
        size.setProgressBackgroundTintList(ColorStateList.valueOf(divider));
        size.setMinHeight(dp(48));
        size.setContentDescription("Preview font size");
        size.setMax(24);
        size.setProgress(10);
        size.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                int sp = 16 + progress;
                korean.setTextSize(sp);
                english.setTextSize(Math.max(14, sp - 4));
                numbers.setTextSize(sp);
                sizeLabel.setText("Preview size " + sp);
            }

            @Override public void onStartTrackingTouch(SeekBar seekBar) {}
            @Override public void onStopTrackingTouch(SeekBar seekBar) {}
        });
        root.addView(size, matchWrap());

        Dialog preview = createSheet(sheet, 720);
        LinearLayout actions = new LinearLayout(this);
        actions.setPadding(0, dp(12), 0, dp(12));
        Button back = button("Back to list");
        back.setOnClickListener(view -> preview.dismiss());
        actions.addView(back, new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        Button use = primaryButton("Use this font");
        use.setOnClickListener(view -> {
            use.setEnabled(false);
            useFont.run();
            preview.dismiss();
        });
        LinearLayout.LayoutParams useParams = new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1.35f);
        useParams.setMarginStart(dp(10));
        actions.addView(use, useParams);
        sheet.addView(actions, matchWrap());
        preview.setOnDismissListener(ignored -> returnToList.run());
        preview.show();

        TextView[] samples = {korean, english, numbers};
        if (cachedTypeface != null) {
            applyPreviewTypeface(samples, loading, cachedTypeface);
            return;
        }
        for (TextView sample : samples) sample.setAlpha(0.38f);
        new Thread(() -> {
            Typeface loaded = font.loadPreviewTypeface(this);
            runOnUiThread(() -> {
                if (!preview.isShowing()) return;
                if (loaded == null) {
                    loading.setText("Preview unavailable");
                    return;
                }
                applyPreviewTypeface(samples, loading, loaded);
            });
        }, "Bare-font-detail-preview").start();
    }

    private void applyPreviewTypeface(TextView[] samples, TextView loading, Typeface typeface) {
        for (TextView sample : samples) {
            sample.setTypeface(typeface);
            sample.setAlpha(1f);
        }
        loading.setVisibility(View.GONE);
    }

    private TextView previewText(String value, int sp) {
        TextView view = text(value, sp, primaryText);
        view.setGravity(Gravity.START);
        view.setLineSpacing(0f, 1.08f);
        return view;
    }

    private GradientDrawable roundedBackground(int color, int radiusDp) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(dp(radiusDp));
        return drawable;
    }

    private void importInstalledFont(BareFontPackageScanner.InstalledFont font) {
        new Thread(() -> {
            String error = null;
            try {
                font.install(this);
            } catch (IOException | SecurityException exception) {
                error = exception.getMessage();
            }
            showImportResult(error);
        }, "Bare-font-import").start();
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != PICK_FONT || resultCode != RESULT_OK || data == null) return;
        Uri uri = data.getData();
        if (uri == null) return;
        new Thread(() -> {
            String error = null;
            try {
                BareFontStore.importFont(this, uri);
            } catch (IOException | SecurityException exception) {
                error = exception.getMessage();
            }
            showImportResult(error);
        }, "Bare-font-file-import").start();
    }

    private void showImportResult(String error) {
        runOnUiThread(() -> {
            if (error == null) {
                refresh();
                Toast.makeText(this, "Font saved. Restart Bare to apply.", Toast.LENGTH_LONG).show();
            } else {
                Toast.makeText(this, error, Toast.LENGTH_LONG).show();
            }
        });
    }

    private void refresh() {
        String source = BareFontStore.source(this);
        String value;
        if (BareFontStore.SOURCE_INTERNAL.equals(source)) {
            value = BareFontStore.hasValidInternalFont(this)
                    ? BareFontStore.displayName(this)
                    : "No saved font · Browser default";
        } else {
            value = "Browser default";
        }
        currentFont.setText(value);
    }

    private final class FontPreviewAdapter extends BaseAdapter implements AutoCloseable {
        private static final String SAMPLE = "가나다라마바사  Aa 123";
        private final List<BareFontPackageScanner.InstalledFont> fonts;
        private final List<BareFontPackageScanner.InstalledFont> allFonts;
        private final List<String> searchLabels = new ArrayList<>();
        private String query = "";
        private final LruCache<String, Typeface> typefaces = new LruCache<>(12);
        private final Set<String> loading = Collections.newSetFromMap(new ConcurrentHashMap<>());
        private final Set<PreviewRow> boundRows = Collections.newSetFromMap(new WeakHashMap<>());
        private final ExecutorService loader = Executors.newSingleThreadExecutor();
        private final Handler main = new Handler(Looper.getMainLooper());
        private volatile boolean closed;

        FontPreviewAdapter(List<BareFontPackageScanner.InstalledFont> fonts) {
            this.allFonts = new ArrayList<>(fonts);
            this.fonts = new ArrayList<>(fonts);
            for (BareFontPackageScanner.InstalledFont font : fonts) {
                searchLabels.add(normalizeSearch(font.displayLabel()));
            }
        }

        boolean filter(String value) {
            String next = normalizeSearch(value);
            if (next.equals(query)) return false;
            query = next;
            fonts.clear();
            for (int i = 0; i < allFonts.size(); i++) {
                if (query.isEmpty() || searchLabels.get(i).contains(query)) fonts.add(allFonts.get(i));
            }
            notifyDataSetChanged();
            return true;
        }

        @Override
        public int getCount() {
            return fonts.size();
        }

        @Override
        public BareFontPackageScanner.InstalledFont getItem(int position) {
            return fonts.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            PreviewRow row;
            if (convertView == null) {
                LinearLayout container = new LinearLayout(BareFontSettingsActivity.this);
                container.setOrientation(LinearLayout.HORIZONTAL);
                container.setGravity(Gravity.CENTER_VERTICAL);
                container.setPadding(dp(16), dp(16), dp(12), dp(16));

                LinearLayout textColumn = new LinearLayout(BareFontSettingsActivity.this);
                textColumn.setOrientation(LinearLayout.VERTICAL);
                container.addView(textColumn, new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

                TextView label = text("", 15, primaryText);
                textColumn.addView(label, matchWrap());

                TextView preview = text(SAMPLE, 22, primaryText);
                preview.setGravity(Gravity.CENTER_VERTICAL);
                LinearLayout.LayoutParams previewParams = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, dp(36));
                previewParams.topMargin = dp(4);
                textColumn.addView(preview, previewParams);

                TextView arrow = text("›", 24, secondaryText);
                arrow.setGravity(Gravity.CENTER);
                container.addView(arrow, new LinearLayout.LayoutParams(dp(28), dp(48)));

                row = new PreviewRow(label, preview);
                boundRows.add(row);
                container.setTag(row);
                convertView = container;
            } else {
                row = (PreviewRow) convertView.getTag();
            }

            BareFontPackageScanner.InstalledFont font = getItem(position);
            String key = font.previewKey();
            row.key = key;
            row.label.setText(font.displayLabel());

            Typeface loaded = typefaces.get(key);
            if (loaded != null) {
                row.preview.setTypeface(loaded);
            } else {
                row.preview.setTypeface(Typeface.DEFAULT);
                loadPreview(font);
            }
            return convertView;
        }

        private void loadPreview(BareFontPackageScanner.InstalledFont font) {
            String key = font.previewKey();
            if (closed || !loading.add(key)) return;
            loader.execute(() -> {
                Typeface loaded = font.loadPreviewTypeface(BareFontSettingsActivity.this);
                main.post(() -> {
                    loading.remove(key);
                    if (closed) return;
                    if (loaded != null) {
                        typefaces.put(key, loaded);
                        for (PreviewRow row : boundRows) {
                            if (key.equals(row.key)) row.preview.setTypeface(loaded);
                        }
                    }
                });
            });
        }

        Typeface peekTypeface(BareFontPackageScanner.InstalledFont font) {
            return typefaces.get(font.previewKey());
        }

        @Override
        public void close() {
            closed = true;
            loader.shutdownNow();
            loading.clear();
            typefaces.evictAll();
            boundRows.clear();
        }
    }

    private static String normalizeSearch(String value) {
        return Normalizer.normalize(value.trim(), Normalizer.Form.NFC).toLowerCase(Locale.ROOT);
    }

    private static final class PreviewRow {
        final TextView label;
        final TextView preview;
        String key;

        PreviewRow(TextView label, TextView preview) {
            this.label = label;
            this.preview = preview;
        }
    }

    private Button button(String label) {
        return materialButton(label, false);
    }

    private Button primaryButton(String label) {
        return materialButton(label, true);
    }

    private Button materialButton(String label, boolean primary) {
        Button button = new Button(this);
        button.setStateListAnimator(null);
        button.setElevation(0f);
        button.setTranslationZ(0f);
        button.setText(label);
        button.setAllCaps(false);
        button.setTextSize(16);
        button.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        button.setTextColor(primary
                ? (dark ? 0xff152344 : Color.WHITE)
                : primaryText);
        button.setGravity(Gravity.CENTER);
        button.setMinHeight(dp(56));
        button.setPadding(dp(16), dp(12), dp(16), dp(12));
        int fill = primary ? accent : softSurface;
        GradientDrawable shape = roundedBackground(fill, 30);
        button.setBackground(new RippleDrawable(
                ColorStateList.valueOf(dark || primary ? 0x22ffffff : 0x14315cdb), shape, null));
        return button;
    }

    private LinearLayout mainCard() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(24), dp(24), dp(24), dp(24));
        card.setBackground(roundedBackground(surface, 28));
        return card;
    }

    private LinearLayout rowCard() {
        LinearLayout card = mainCard();
        card.setPadding(0, dp(4), 0, dp(4));
        card.setClipToOutline(true);
        return card;
    }

    private void addSection(LinearLayout parent, String label) {
        TextView title = text(label, 13, secondaryText);
        title.setPadding(dp(16), dp(24), dp(16), dp(10));
        parent.addView(title, matchWrap());
    }

    private View settingRow(String symbol, String title, String summary, View.OnClickListener action) {
        LinearLayout row = new LinearLayout(this);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(16), dp(18), dp(16), dp(18));
        row.setMinimumHeight(dp(84));
        row.setBackground(new RippleDrawable(ColorStateList.valueOf(dark ? 0x22ffffff : 0x14315cdb),
                new ColorDrawable(Color.TRANSPARENT), null));
        row.setFocusable(true);
        row.setOnClickListener(action);
        TextView icon = text(symbol, 20, accent);
        icon.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        icon.setGravity(Gravity.CENTER);
        icon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        icon.setBackground(roundedBackground(accentSurface, 17));
        row.addView(icon, new LinearLayout.LayoutParams(dp(44), dp(44)));
        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(0,
                ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        labelParams.setMarginStart(dp(14));
        labelParams.setMarginEnd(dp(10));
        row.addView(labels, labelParams);
        TextView name = text(title, 16, primaryText);
        name.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
        labels.addView(name, matchWrap());
        TextView detail = text(summary, 13, secondaryText);
        LinearLayout.LayoutParams detailParams = matchWrap();
        detailParams.topMargin = dp(5);
        labels.addView(detail, detailParams);
        TextView arrow = text("›", 24, secondaryText);
        arrow.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
        row.addView(arrow);
        return row;
    }

    private void addDivider(LinearLayout parent) {
        View line = new View(this);
        line.setBackgroundColor(divider);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(1));
        params.setMarginStart(dp(74));
        params.setMarginEnd(dp(16));
        parent.addView(line, params);
    }

    private void addHandle(LinearLayout root) {
        View handle = new View(this);
        handle.setBackground(roundedBackground(divider, 3));
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(dp(34), dp(4));
        params.gravity = Gravity.CENTER_HORIZONTAL;
        params.bottomMargin = dp(20);
        root.addView(handle, params);
    }

    private Dialog createSheet(LinearLayout content, int heightDp) {
        Dialog dialog = new Dialog(this) {
            @Override
            protected void onStart() {
                super.onStart();
                // Dialog.show() calls onStart BEFORE attaching the window. Set the
                // final bounds here, not in the asynchronously delivered onShow.
                resizeSheet(this, BareFontSettingsActivity.this.getWindow().getDecorView(), heightDp);
            }
        };
        dialog.requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);
        content.setBackground(roundedBackground(surface, 32));
        content.setClipToOutline(true);
        dialog.setContentView(content);
        dialog.setCanceledOnTouchOutside(true);
        if (dialog.getWindow() != null) {
            dialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            // A platform/OEM dialog entrance can scale from a different origin.
            // The sheet appears at its final position without a second translation.
            dialog.getWindow().setWindowAnimations(0);
            dialog.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DIM_BEHIND);
            dialog.getWindow().setDimAmount(0.32f);
            dialog.getWindow().setGravity(Gravity.BOTTOM | Gravity.CENTER_HORIZONTAL);
            dialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE
                    | WindowManager.LayoutParams.SOFT_INPUT_STATE_ALWAYS_HIDDEN);
            WindowManager.LayoutParams attributes = dialog.getWindow().getAttributes();
            attributes.y = dp(12);
            dialog.getWindow().setAttributes(attributes);
        }
        dialog.setOnShowListener(ignored -> {
            // Floating windows can retain their requested height behind the IME.
            // Re-measure only when the visible display frame actually changes.
            content.getViewTreeObserver().addOnGlobalLayoutListener(
                    () -> resizeSheet(dialog, content, heightDp));
        });
        return dialog;
    }

    private void resizeSheet(Dialog dialog, View content, int heightDp) {
        if (dialog.getWindow() == null) return;
        android.graphics.Rect visible = new android.graphics.Rect();
        content.getWindowVisibleDisplayFrame(visible);
        int displayHeight = getResources().getDisplayMetrics().heightPixels;
        int availableHeight = visible.height() > 0 ? visible.height() : displayHeight;
        int height = Math.max(dp(1), Math.min(Math.min(dp(heightDp), displayHeight * 87 / 100),
                availableHeight - dp(24)));
        int width = Math.min(dp(600), getResources().getDisplayMetrics().widthPixels - dp(20));
        WindowManager.LayoutParams attributes = dialog.getWindow().getAttributes();
        if (attributes.width != width || attributes.height != height) {
            dialog.getWindow().setLayout(width, height);
        }
    }

    private void animateEntrance(View view) {
        if (!ValueAnimator.areAnimatorsEnabled()) return;
        view.setAlpha(0f);
        view.setTranslationY(dp(14));
        view.animate().alpha(1f).translationY(0f).setDuration(220)
                .setInterpolator(new DecelerateInterpolator()).start();
    }

    private TextView sectionTitle(String value) {
        TextView title = text(value, 16, primaryText);
        title.setGravity(Gravity.START);
        return title;
    }

    private TextView text(String value, int sp, int color) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(sp);
        view.setTextColor(color);
        view.setFontFeatureSettings("kern");
        view.setLineSpacing(0, 1.08f);
        return view;
    }

    private LinearLayout.LayoutParams matchWrap() {
        return new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
