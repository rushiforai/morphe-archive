package app.fontism.extension.notesnook;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.Editable;
import android.text.TextUtils;
import android.text.TextWatcher;
import android.util.LruCache;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.EditText;
import android.widget.HorizontalScrollView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Notesnook font screen: device fonts (Galaxy font apps, system fonts) or a font file. */
public final class NotesnookFontSettingsActivity extends Activity {
    private static final int PICK_FONT = 36031;
    private static final String SAMPLE = "가나다라마 Aa 123";
    private static final String PREVIEW = "다람쥐 헌 쳇바퀴에 타고파\nThe quick brown fox jumps over";
    private static final String[] FILTERS = {"Hangul", "Font apps", "System", "All"};

    // Notesnook palette: green accent on neutral surfaces.
    private int ink, muted, faint, surface, raised, accent, accentSoft, onAccent, divider;

    private final ExecutorService worker = Executors.newSingleThreadExecutor();
    private final ExecutorService previews = Executors.newFixedThreadPool(2);
    private final Handler main = new Handler(Looper.getMainLooper());
    private final LruCache<String, Typeface> previewCache = new LruCache<>(96);
    private final Set<String> previewPending = Collections.synchronizedSet(new HashSet<>());
    private final List<NotesnookDeviceFonts.Entry> allFonts = new ArrayList<>();
    private final List<Object> rows = new ArrayList<>();
    private final List<TextView> chips = new ArrayList<>();
    private RowAdapter adapter;
    private int filter;
    private boolean scanning = true;
    private boolean busy;

    private TextView currentName, currentSource, currentState, currentPreview, listStatus;
    private ProgressBar currentProgress, listProgress;
    private View restartBanner;
    private EditText search;

    @Override protected void onCreate(Bundle state) {
        boolean dark = (getResources().getConfiguration().uiMode & Configuration.UI_MODE_NIGHT_MASK)
                == Configuration.UI_MODE_NIGHT_YES;
        setTheme(dark ? android.R.style.Theme_Material_NoActionBar : android.R.style.Theme_Material_Light_NoActionBar);
        ink = dark ? 0xffe8eae8 : 0xff1d1f1e;
        muted = dark ? 0xffa9b0ac : 0xff5f6763;
        faint = dark ? 0xff7c837f : 0xff8c938f;
        surface = dark ? 0xff181818 : 0xffffffff;
        raised = dark ? 0xff242424 : 0xfff3f6f4;
        accent = dark ? 0xff3ddc84 : 0xff008837;
        accentSoft = dark ? 0x333ddc84 : 0x1f008837;
        onAccent = dark ? 0xff07210f : 0xffffffff;
        divider = dark ? 0xff333333 : 0xffe3e7e5;
        super.onCreate(state);

        getWindow().setStatusBarColor(Color.TRANSPARENT);
        getWindow().setNavigationBarColor(Color.TRANSPARENT);
        int flags = View.SYSTEM_UI_FLAG_LAYOUT_STABLE | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION;
        if (!dark) flags |= View.SYSTEM_UI_FLAG_LIGHT_STATUS_BAR
                | (Build.VERSION.SDK_INT >= 26 ? View.SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR : 0);
        getWindow().getDecorView().setSystemUiVisibility(flags);
        setTitle("Font");

        LinearLayout root = column();
        root.setBackgroundColor(surface);
        View bar = topBar();
        root.addView(bar, matchWrap());
        ListView list = new ListView(this);
        list.setDivider(null);
        list.setSelector(android.R.color.transparent);
        list.setClipToPadding(false);
        list.addHeaderView(header(), null, false);
        adapter = new RowAdapter();
        list.setAdapter(adapter);
        list.setOnItemClickListener((parent, view, position, id) -> {
            Object row = adapter.getItem(position - list.getHeaderViewsCount());
            if (row instanceof NotesnookDeviceFonts.Entry) confirm((NotesnookDeviceFonts.Entry) row);
        });
        root.addView(list, new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, 0, 1));
        setContentView(root);

        // Edge-to-edge is enforced at targetSdk 35+: keep content clear of the system bars.
        root.setOnApplyWindowInsetsListener((v, insets) -> {
            bar.setPadding(dp(4), insets.getSystemWindowInsetTop() + dp(4), dp(16), dp(4));
            list.setPadding(0, 0, 0, insets.getSystemWindowInsetBottom() + dp(24));
            return insets;
        });

        refresh();
        scanDeviceFonts();
        NotesnookFontProvider.publishShortcut(getApplicationContext());
    }

    @Override protected void onDestroy() {
        worker.shutdownNow();
        previews.shutdownNow();
        super.onDestroy();
    }

    @Override public void onBackPressed() {
        if (busy) {
            Toast.makeText(this, "Preparing font. Please wait.", Toast.LENGTH_SHORT).show();
            return;
        }
        super.onBackPressed();
    }

    // ---- layout ----

    private View topBar() {
        LinearLayout bar = new LinearLayout(this);
        bar.setGravity(Gravity.CENTER_VERTICAL);
        bar.setBackgroundColor(surface);
        ImageView back = new ImageView(this);
        Drawable arrow = themeDrawable(android.R.attr.homeAsUpIndicator);
        if (arrow != null) {
            arrow = arrow.mutate();
            arrow.setTint(ink);
            back.setImageDrawable(arrow);
        }
        back.setScaleType(ImageView.ScaleType.CENTER);
        back.setBackground(new RippleDrawable(ColorStateList.valueOf(divider), null, oval(Color.WHITE)));
        back.setContentDescription("Back");
        back.setOnClickListener(v -> onBackPressed());
        bar.addView(back, new LinearLayout.LayoutParams(dp(48), dp(48)));
        LinearLayout.LayoutParams titleParams = weighted();
        titleParams.leftMargin = dp(8);
        bar.addView(text("Font", 21, ink, true), titleParams);
        return bar;
    }

    private View header() {
        LinearLayout root = column();
        root.setPadding(dp(20), dp(4), dp(20), dp(4));
        TextView intro = text("Applies to all Notesnook text. Icons, emoji and math keep their fonts.", 14, muted, false);
        intro.setLineSpacing(0, 1.25f);
        root.addView(intro);
        root.addView(currentCard(), margins(0, 18, 0, 0));
        root.addView(restartBanner(), margins(0, 12, 0, 0));

        LinearLayout actions = new LinearLayout(this);
        TextView pick = button("Choose file", true);
        pick.setOnClickListener(v -> pickFile());
        TextView reset = button("Default", false);
        reset.setOnClickListener(v -> resetFont());
        actions.addView(pick, weighted());
        LinearLayout.LayoutParams resetParams = weighted();
        resetParams.leftMargin = dp(10);
        actions.addView(reset, resetParams);
        root.addView(actions, margins(0, 14, 0, 0));
        root.addView(text("TTF, OTF or TTC, up to 48 MB", 12, faint, false), margins(4, 8, 0, 0));

        root.addView(text("Device fonts", 18, ink, true), margins(0, 28, 0, 0));
        search = new EditText(this);
        search.setHint("Search fonts");
        search.setSingleLine(true);
        search.setTextSize(15);
        search.setTextColor(ink);
        search.setHintTextColor(faint);
        search.setBackground(rounded(raised, 16));
        search.setPadding(dp(16), dp(13), dp(16), dp(13));
        search.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int a, int b, int c) {}
            @Override public void onTextChanged(CharSequence s, int a, int b, int c) { rebuildRows(); }
            @Override public void afterTextChanged(Editable s) {}
        });
        root.addView(search, margins(0, 12, 0, 0));
        root.addView(filterChips(), margins(0, 12, 0, 0));

        LinearLayout status = new LinearLayout(this);
        status.setGravity(Gravity.CENTER_VERTICAL);
        listProgress = spinner();
        LinearLayout.LayoutParams spinnerParams = new LinearLayout.LayoutParams(dp(16), dp(16));
        spinnerParams.rightMargin = dp(8);
        status.addView(listProgress, spinnerParams);
        listStatus = text("Finding device fonts…", 13, muted, false);
        status.addView(listStatus, weighted());
        root.addView(status, margins(2, 14, 0, 6));
        return root;
    }

    private View currentCard() {
        LinearLayout card = column();
        card.setPadding(dp(20), dp(18), dp(20), dp(20));
        card.setBackground(rounded(raised, 24));
        LinearLayout labelRow = new LinearLayout(this);
        labelRow.setGravity(Gravity.CENTER_VERTICAL);
        labelRow.addView(text("Current font", 13, muted, true), weighted());
        currentProgress = spinner();
        currentProgress.setVisibility(View.GONE);
        labelRow.addView(currentProgress, new LinearLayout.LayoutParams(dp(18), dp(18)));
        currentState = pill("", accentSoft, accent);
        LinearLayout.LayoutParams stateParams = wrap();
        stateParams.leftMargin = dp(8);
        labelRow.addView(currentState, stateParams);
        card.addView(labelRow);
        currentName = text("", 22, ink, true);
        currentName.setMaxLines(2);
        currentName.setEllipsize(TextUtils.TruncateAt.END);
        card.addView(currentName, margins(0, 10, 0, 0));
        currentSource = text("", 13, muted, false);
        card.addView(currentSource, margins(0, 2, 0, 0));
        View rule = new View(this);
        rule.setBackgroundColor(divider);
        LinearLayout.LayoutParams ruleParams = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, Math.max(1, dp(1)));
        ruleParams.topMargin = dp(16);
        card.addView(rule, ruleParams);
        currentPreview = text(PREVIEW, 21, ink, false);
        currentPreview.setLineSpacing(0, 1.3f);
        card.addView(currentPreview, margins(0, 14, 0, 0));
        return card;
    }

    private View restartBanner() {
        LinearLayout banner = new LinearLayout(this);
        banner.setGravity(Gravity.CENTER_VERTICAL);
        banner.setPadding(dp(18), dp(14), dp(12), dp(14));
        banner.setBackground(rounded(accentSoft, 20));
        TextView message = text("Applied. Restart to update open screens.", 14, ink, false);
        message.setLineSpacing(0, 1.2f);
        banner.addView(message, weighted());
        TextView restart = button("Restart", true);
        restart.setMinHeight(dp(40));
        restart.setOnClickListener(v -> restartApp());
        LinearLayout.LayoutParams restartParams = wrap();
        restartParams.leftMargin = dp(10);
        banner.addView(restart, restartParams);
        banner.setVisibility(View.GONE);
        restartBanner = banner;
        return banner;
    }

    private View filterChips() {
        HorizontalScrollView scroll = new HorizontalScrollView(this);
        scroll.setHorizontalScrollBarEnabled(false);
        LinearLayout row = new LinearLayout(this);
        for (int i = 0; i < FILTERS.length; i++) {
            final int index = i;
            TextView chip = text(FILTERS[i], 14, ink, true);
            chip.setGravity(Gravity.CENTER);
            chip.setPadding(dp(16), dp(8), dp(16), dp(8));
            chip.setOnClickListener(v -> {
                filter = index;
                styleChips();
                rebuildRows();
            });
            LinearLayout.LayoutParams params = wrap();
            if (i > 0) params.leftMargin = dp(8);
            row.addView(chip, params);
            chips.add(chip);
        }
        scroll.addView(row);
        styleChips();
        return scroll;
    }

    private void styleChips() {
        for (int i = 0; i < chips.size(); i++) {
            boolean on = i == filter;
            GradientDrawable shape = rounded(on ? accent : surface, 20);
            if (!on) shape.setStroke(Math.max(1, dp(1)), divider);
            TextView chip = chips.get(i);
            chip.setBackground(new RippleDrawable(ColorStateList.valueOf(on ? 0x33ffffff : divider), shape, null));
            chip.setTextColor(on ? onAccent : ink);
        }
    }

    // ---- state ----

    private void refresh() {
        boolean enabled = NotesnookFontStore.enabled();
        currentName.setText(NotesnookFontStore.displayName());
        String source = NotesnookFontStore.sourceKey();
        currentSource.setText(!enabled ? "Notesnook default"
                : source.startsWith("file:") ? "From file"
                : source.contains(".apk!") ? "Galaxy font app" : "System font");
        currentState.setText(busy ? "Applying" : enabled ? "On" : "Default");
        currentState.setBackground(rounded(enabled || busy ? accentSoft : divider, 12));
        currentState.setTextColor(enabled || busy ? accent : muted);
        currentProgress.setVisibility(busy ? View.VISIBLE : View.GONE);
        NotesnookFontInjector.Snapshot font = NotesnookFontInjector.current();
        currentPreview.setTypeface(enabled && font != null && font.base != null
                ? font.base : NotesnookSystemTypefaces.systemDefault());
        if (adapter != null) adapter.notifyDataSetChanged();
    }

    private void scanDeviceFonts() {
        worker.execute(() -> {
            List<NotesnookDeviceFonts.Entry> found = NotesnookDeviceFonts.scan(getApplicationContext());
            main.post(() -> {
                if (isDestroyed()) return;
                allFonts.clear();
                allFonts.addAll(found);
                scanning = false;
                listProgress.setVisibility(View.GONE);
                rebuildRows();
            });
        });
    }

    private void rebuildRows() {
        if (adapter == null) return;
        String query = search.getText().toString().trim().toLowerCase(Locale.ROOT);
        List<NotesnookDeviceFonts.Entry> apps = new ArrayList<>(), system = new ArrayList<>();
        for (NotesnookDeviceFonts.Entry entry : allFonts) {
            if (filter == 0 && !entry.hangul) continue;
            if (filter == 1 && !entry.fromPackage) continue;
            if (filter == 2 && entry.fromPackage) continue;
            if (!query.isEmpty() && !(entry.label + " " + entry.detail).toLowerCase(Locale.ROOT).contains(query)) continue;
            (entry.fromPackage ? apps : system).add(entry);
        }
        rows.clear();
        if (!apps.isEmpty()) { rows.add("Galaxy font apps · " + apps.size()); rows.addAll(apps); }
        if (!system.isEmpty()) { rows.add("System fonts · " + system.size()); rows.addAll(system); }
        if (!scanning) {
            int total = apps.size() + system.size();
            listStatus.setText(allFonts.isEmpty() ? "No device fonts found. Choose a file."
                    : total == 0 ? "No matching fonts." : total + " fonts");
        }
        adapter.notifyDataSetChanged();
    }

    // ---- actions ----

    private void confirm(NotesnookDeviceFonts.Entry entry) {
        if (busy) return;
        LinearLayout body = column();
        body.setPadding(dp(24), dp(8), dp(24), dp(4));
        LinearLayout frame = column();
        frame.setPadding(dp(18), dp(16), dp(18), dp(16));
        frame.setBackground(rounded(raised, 18));
        TextView sample = text(PREVIEW, 22, ink, false);
        sample.setLineSpacing(0, 1.3f);
        Typeface cached = previewCache.get(entry.key());
        if (cached != null) sample.setTypeface(cached);
        frame.addView(sample);
        body.addView(frame);
        body.addView(text(entry.detail, 13, muted, false), margins(2, 12, 0, 0));
        new AlertDialog.Builder(this)
                .setTitle(entry.label)
                .setView(body)
                .setPositiveButton("Apply", (d, w) -> run(() ->
                        NotesnookFontStore.importFace(this, entry.readFace(), entry.label, entry.key())))
                .setNegativeButton("Cancel", null)
                .show();
    }

    private void resetFont() {
        if (!NotesnookFontStore.enabled()) {
            Toast.makeText(this, "Already using the default font.", Toast.LENGTH_SHORT).show();
            return;
        }
        run(() -> NotesnookFontStore.disable(this));
    }

    private void pickFile() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT).addCategory(Intent.CATEGORY_OPENABLE).setType("*/*")
                .putExtra(Intent.EXTRA_MIME_TYPES, new String[]{"font/ttf", "font/otf", "font/collection",
                        "application/font-sfnt", "application/x-font-ttf", "application/octet-stream"});
        try { startActivityForResult(intent, PICK_FONT); }
        catch (RuntimeException error) { Toast.makeText(this, "Couldn't open the file picker.", Toast.LENGTH_LONG).show(); }
    }

    @Override protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != PICK_FONT || resultCode != RESULT_OK || data == null || data.getData() == null) return;
        Uri uri = data.getData();
        run(() -> NotesnookFontStore.importUri(this, uri));
    }

    private interface Operation { void run() throws Exception; }

    private void run(Operation operation) {
        if (busy) return;
        busy = true;
        refresh();
        worker.execute(() -> {
            Exception failure = null;
            try { operation.run(); } catch (Exception error) { failure = error; }
            Exception result = failure;
            main.post(() -> {
                busy = false;
                if (isDestroyed()) return;
                refresh();
                if (result == null) {
                    restartBanner.setVisibility(View.VISIBLE);
                    return;
                }
                String reason = result.getMessage() != null ? result.getMessage()
                        : result.getCause() != null ? String.valueOf(result.getCause().getMessage()) : "Unknown error";
                new AlertDialog.Builder(this).setTitle("Couldn't apply font")
                        .setMessage(reason).setPositiveButton("OK", null).show();
            });
        });
    }

    /** Fresh process: the provider applies the font before any screen is drawn. */
    private void restartApp() {
        Intent launch = getPackageManager().getLaunchIntentForPackage(getPackageName());
        if (launch == null) { finishAffinity(); return; }
        launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
        startActivity(launch);
        finishAffinity();
        main.postDelayed(() -> android.os.Process.killProcess(android.os.Process.myPid()), 250);
    }

    // ---- list ----

    private final class RowAdapter extends BaseAdapter {
        @Override public int getCount() { return rows.size(); }
        @Override public Object getItem(int position) { return position >= 0 && position < rows.size() ? rows.get(position) : null; }
        @Override public long getItemId(int position) { return position; }
        @Override public int getViewTypeCount() { return 2; }
        @Override public int getItemViewType(int position) { return rows.get(position) instanceof String ? 0 : 1; }
        @Override public boolean isEnabled(int position) { return getItemViewType(position) == 1; }

        @Override public View getView(int position, View convert, ViewGroup parent) {
            Object row = rows.get(position);
            if (row instanceof String) {
                TextView label = convert instanceof TextView ? (TextView) convert : text("", 13, muted, true);
                label.setPadding(dp(22), dp(18), dp(20), dp(6));
                label.setText((String) row);
                return label;
            }
            NotesnookDeviceFonts.Entry entry = (NotesnookDeviceFonts.Entry) row;
            FontRow holder = convert != null && convert.getTag() instanceof FontRow ? (FontRow) convert.getTag() : new FontRow();
            boolean selected = NotesnookFontStore.enabled() && entry.key().equals(NotesnookFontStore.sourceKey());
            holder.title.setText(entry.label);
            holder.detail.setText(entry.detail);
            holder.badge.setVisibility(entry.hangul ? View.VISIBLE : View.GONE);
            holder.check.setVisibility(selected ? View.VISIBLE : View.GONE);
            GradientDrawable shape = rounded(selected ? accentSoft : raised, 18);
            if (selected) shape.setStroke(dp(2), accent);
            holder.card.setBackground(new RippleDrawable(ColorStateList.valueOf(divider), shape, null));
            Typeface face = previewCache.get(entry.key());
            holder.sample.setTypeface(face != null ? face : NotesnookSystemTypefaces.systemDefault());
            holder.sample.setTextColor(face != null ? ink : faint);
            if (face == null) loadPreview(entry);
            return holder.root;
        }
    }

    private void loadPreview(NotesnookDeviceFonts.Entry entry) {
        String key = entry.key();
        if (!previewPending.add(key)) return;
        previews.execute(() -> {
            Typeface face = entry.preview(getApplicationContext());
            main.post(() -> {
                previewPending.remove(key);
                if (face != null && !isDestroyed()) {
                    previewCache.put(key, face);
                    adapter.notifyDataSetChanged();
                }
            });
        });
    }

    private final class FontRow {
        final LinearLayout root = new LinearLayout(NotesnookFontSettingsActivity.this);
        final LinearLayout card = new LinearLayout(NotesnookFontSettingsActivity.this);
        final TextView sample = text(SAMPLE, 22, ink, false);
        final TextView title = text("", 14, ink, true);
        final TextView detail = text("", 12, muted, false);
        final TextView badge = pill("Hangul", accentSoft, accent);
        final TextView check = text("✓", 15, onAccent, true);

        FontRow() {
            root.setPadding(dp(16), dp(5), dp(16), dp(5));
            card.setGravity(Gravity.CENTER_VERTICAL);
            card.setPadding(dp(18), dp(14), dp(14), dp(14));
            LinearLayout texts = column();
            sample.setSingleLine(true);
            sample.setEllipsize(TextUtils.TruncateAt.END);
            texts.addView(sample);
            LinearLayout titleRow = new LinearLayout(NotesnookFontSettingsActivity.this);
            titleRow.setGravity(Gravity.CENTER_VERTICAL);
            title.setSingleLine(true);
            title.setEllipsize(TextUtils.TruncateAt.END);
            titleRow.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            LinearLayout.LayoutParams badgeParams = wrap();
            badgeParams.leftMargin = dp(6);
            titleRow.addView(badge, badgeParams);
            texts.addView(titleRow, margins(0, 6, 0, 0));
            detail.setSingleLine(true);
            detail.setEllipsize(TextUtils.TruncateAt.END);
            texts.addView(detail, margins(0, 2, 0, 0));
            card.addView(texts, weighted());
            check.setGravity(Gravity.CENTER);
            check.setBackground(oval(accent));
            LinearLayout.LayoutParams checkParams = new LinearLayout.LayoutParams(dp(26), dp(26));
            checkParams.leftMargin = dp(12);
            card.addView(check, checkParams);
            root.addView(card, matchWrap());
            root.setTag(this);
        }
    }

    // ---- helpers ----

    private LinearLayout column() {
        LinearLayout layout = new LinearLayout(this);
        layout.setOrientation(LinearLayout.VERTICAL);
        return layout;
    }

    private ProgressBar spinner() {
        ProgressBar bar = new ProgressBar(this, null, android.R.attr.progressBarStyleSmall);
        bar.setIndeterminateTintList(ColorStateList.valueOf(accent));
        return bar;
    }

    private TextView button(String label, boolean primary) {
        TextView view = text(label, 15, primary ? onAccent : accent, true);
        view.setGravity(Gravity.CENTER);
        view.setMinHeight(dp(52));
        view.setPadding(dp(18), 0, dp(18), 0);
        GradientDrawable shape = rounded(primary ? accent : surface, 26);
        if (!primary) shape.setStroke(Math.max(1, dp(1)), divider);
        view.setBackground(new RippleDrawable(ColorStateList.valueOf(primary ? 0x33ffffff : divider), shape, null));
        view.setClickable(true);
        view.setFocusable(true);
        return view;
    }

    private TextView pill(String label, int background, int color) {
        TextView view = text(label, 11, color, true);
        view.setPadding(dp(8), dp(2), dp(8), dp(2));
        view.setBackground(rounded(background, 10));
        return view;
    }

    private TextView text(String value, int sp, int color, boolean bold) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(sp);
        view.setTextColor(color);
        if (bold) view.setTypeface(Typeface.create(Typeface.DEFAULT, Typeface.BOLD));
        return view;
    }

    private GradientDrawable rounded(int color, int radius) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(dp(radius));
        return drawable;
    }

    private GradientDrawable oval(int color) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setShape(GradientDrawable.OVAL);
        drawable.setColor(color);
        return drawable;
    }

    private Drawable themeDrawable(int attr) {
        TypedArray values = obtainStyledAttributes(new int[]{attr});
        try { return values.getDrawable(0); } finally { values.recycle(); }
    }

    private LinearLayout.LayoutParams wrap() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private LinearLayout.LayoutParams matchWrap() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private LinearLayout.LayoutParams weighted() {
        return new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1);
    }

    private LinearLayout.LayoutParams margins(int l, int t, int r, int b) {
        LinearLayout.LayoutParams params = matchWrap();
        params.setMargins(dp(l), dp(t), dp(r), dp(b));
        return params;
    }

    private int dp(int value) { return Math.round(value * getResources().getDisplayMetrics().density); }
}
