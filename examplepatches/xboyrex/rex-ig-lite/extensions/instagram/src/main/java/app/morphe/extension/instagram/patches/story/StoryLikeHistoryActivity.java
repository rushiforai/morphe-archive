/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 * GNU General Public License v3.0
 */

package app.morphe.extension.instagram.patches.story;

import android.app.Activity;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupMenu;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import app.morphe.extension.instagram.settings.preference.widgets.RexHaptics;
import app.morphe.extension.instagram.settings.preference.widgets.RexIcon;

@SuppressWarnings({"unused", "deprecation"})
public final class StoryLikeHistoryActivity extends Activity implements StoryLikeHistoryAdapter.Listener {
    private static final String TAG = "StoryLikeHistory";

    private static final int TAB_RECENT = 0;
    private static final int TAB_EXPIRED = 1;

    private static final int BG = 0xFF000000;
    private static final int BAR_BG = 0xFF0D0F14;
    private static final int CARD_BG = 0xFF15181D;
    private static final int ELEVATED_BG = 0xFF1E222A;
    private static final int BORDER_STROKE = 0xFF303741;
    private static final int TEXT_PRIMARY = 0xFFF5F7FA;
    private static final int TEXT_SECONDARY = 0xFF9AA3AE;
    private static final int ACCENT = 0xFF23C6D8;
    private static final int ACTIVE_TEAL = 0xFF35CDBB;
    private static final int CORAL_PINK = 0xFFF06470;

    private static final ExecutorService LOADER = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = new Thread(runnable, "xboyrex-story-likes-ui");
        thread.setDaemon(true);
        return thread;
    });

    private final List<StoryLikeHistoryEntry> all = new ArrayList<>();
    private StoryLikeHistoryAdapter adapter;
    private GridView grid;
    private LinearLayout emptyState;
    private TextView emptyTitle;
    private TextView emptySubtitle;
    private ProgressBar loading;
    private TextView errorView;
    private EditText searchInput;
    private View searchBox;
    private TextView statTotalValue;
    private TextView statActiveValue;
    private TextView statExpiredValue;
    private View chartActiveSegment;
    private View chartExpiredSegment;
    private final TextView[] tabs = new TextView[2];
    private int tab = TAB_RECENT;
    private String query = "";

    public static void open(Context context) {
        try {
            Intent intent = new Intent(context, StoryLikeHistoryActivity.class);
            if (!(context instanceof Activity)) {
                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            }
            context.startActivity(intent);
        } catch (Throwable t) {
            Log.e(TAG, "open failed", t);
            Toast.makeText(context, pt() ? "Não foi possível abrir o histórico" : "Could not open the history",
                    Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            getWindow().setStatusBarColor(BG);
            getWindow().setNavigationBarColor(BG);
        }
        setContentView(buildRoot());
        load();
    }

    @Override
    protected void onResume() {
        super.onResume();
        load();
    }

    private void load() {
        loading.setVisibility(View.VISIBLE);
        errorView.setVisibility(View.GONE);
        LOADER.execute(() -> {
            List<StoryLikeHistoryEntry> entries;
            try {
                entries = StoryLikeHistory.entries(getApplicationContext());
            } catch (Throwable t) {
                Log.e(TAG, "load failed", t);
                runOnUiThread(this::showError);
                return;
            }
            List<StoryLikeHistoryEntry> copy = new ArrayList<>(entries);
            runOnUiThread(() -> {
                if (isFinishing()) return;
                all.clear();
                all.addAll(copy);
                render();
            });
        });
    }

    private void showError() {
        if (isFinishing()) return;
        loading.setVisibility(View.GONE);
        grid.setVisibility(View.GONE);
        emptyState.setVisibility(View.GONE);
        errorView.setText(pt() ? "Não foi possível ler o histórico." : "Could not read the history.");
        errorView.setVisibility(View.VISIBLE);
    }

    private View buildRoot() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(BG);

        root.addView(buildTopBar(), new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(58)));

        searchBox = buildSearchBox();
        searchBox.setVisibility(View.GONE);
        root.addView(searchBox);

        root.addView(buildAnalyticsOverviewCard());
        root.addView(buildTabs());

        FrameLayout content = new FrameLayout(this);

        grid = new GridView(this);
        grid.setNumColumns(2);
        grid.setVerticalSpacing(dp(12));
        grid.setHorizontalSpacing(dp(12));
        grid.setStretchMode(GridView.STRETCH_COLUMN_WIDTH);
        grid.setPadding(dp(14), dp(10), dp(14), dp(24));
        grid.setClipToPadding(false);
        grid.setVerticalScrollBarEnabled(false);
        adapter = new StoryLikeHistoryAdapter(this, new ArrayList<StoryLikeHistoryEntry>(), this);
        grid.setAdapter(adapter);
        content.addView(grid, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        loading = new ProgressBar(this);
        content.addView(loading, centeredWrap());
        loading.setVisibility(View.GONE);

        emptyState = buildEmptyState();
        content.addView(emptyState, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER));
        emptyState.setVisibility(View.GONE);

        errorView = new TextView(this);
        errorView.setTextColor(TEXT_SECONDARY);
        errorView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
        errorView.setGravity(Gravity.CENTER);
        content.addView(errorView, centeredWrap());
        errorView.setVisibility(View.GONE);

        root.addView(content, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        root.setOnApplyWindowInsetsListener((v, insets) -> {
            v.setPadding(0, insets.getSystemWindowInsetTop(), 0, insets.getSystemWindowInsetBottom());
            return insets;
        });
        return root;
    }

    private View buildTopBar() {
        FrameLayout bar = new FrameLayout(this);
        bar.setBackgroundColor(BAR_BG);

        FrameLayout backBtn = new FrameLayout(this);
        ImageView backIcon = new ImageView(this);
        backIcon.setImageDrawable(RexIcon.getDrawable(this, "arrow-left", TEXT_PRIMARY, 22));
        backBtn.addView(backIcon, new FrameLayout.LayoutParams(dp(22), dp(22), Gravity.CENTER));
        backBtn.setContentDescription(pt() ? "Voltar" : "Back");
        backBtn.setOnClickListener(v -> {
            RexHaptics.tap(v);
            finish();
        });
        bar.addView(backBtn, new FrameLayout.LayoutParams(dp(52), dp(52), Gravity.START | Gravity.CENTER_VERTICAL));

        LinearLayout titleRow = new LinearLayout(this);
        titleRow.setOrientation(LinearLayout.HORIZONTAL);
        titleRow.setGravity(Gravity.CENTER);
        ImageView titleHeart = new ImageView(this);
        titleHeart.setImageDrawable(RexIcon.getDrawable(this, "heart", CORAL_PINK, 19, true));
        LinearLayout.LayoutParams thLp = new LinearLayout.LayoutParams(dp(19), dp(19));
        thLp.setMarginEnd(dp(8));
        titleRow.addView(titleHeart, thLp);

        TextView title = new TextView(this);
        title.setText(pt() ? "Curtidas em Stories" : "Story Likes & Activity");
        title.setTextColor(TEXT_PRIMARY);
        title.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f);
        title.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        title.setSingleLine(true);
        titleRow.addView(title);

        FrameLayout.LayoutParams titleLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER);
        titleLp.leftMargin = dp(56);
        titleLp.rightMargin = dp(96);
        bar.addView(titleRow, titleLp);

        LinearLayout rightActions = new LinearLayout(this);
        rightActions.setOrientation(LinearLayout.HORIZONTAL);
        rightActions.setGravity(Gravity.CENTER_VERTICAL);

        FrameLayout searchButton = new FrameLayout(this);
        ImageView searchIcon = new ImageView(this);
        searchIcon.setImageDrawable(RexIcon.getDrawable(this, "search", TEXT_PRIMARY, 20));
        searchButton.addView(searchIcon, new FrameLayout.LayoutParams(dp(20), dp(20), Gravity.CENTER));
        searchButton.setContentDescription(pt() ? "Buscar" : "Search");
        searchButton.setOnClickListener(v -> {
            RexHaptics.tap(v);
            toggleSearch();
        });
        rightActions.addView(searchButton, new LinearLayout.LayoutParams(dp(44), dp(48)));

        FrameLayout refreshButton = new FrameLayout(this);
        ImageView refreshIcon = new ImageView(this);
        refreshIcon.setImageDrawable(RexIcon.getDrawable(this, "refresh-cw", ACCENT, 19));
        refreshButton.addView(refreshIcon, new FrameLayout.LayoutParams(dp(19), dp(19), Gravity.CENTER));
        refreshButton.setContentDescription("Refresh");
        refreshButton.setOnClickListener(v -> {
            RexHaptics.tap(v);
            load();
        });
        rightActions.addView(refreshButton, new LinearLayout.LayoutParams(dp(44), dp(48)));

        FrameLayout.LayoutParams raLp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.END | Gravity.CENTER_VERTICAL);
        raLp.rightMargin = dp(4);
        bar.addView(rightActions, raLp);
        return bar;
    }

    private View buildAnalyticsOverviewCard() {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setPadding(dp(16), dp(12), dp(16), dp(12));
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(CARD_BG);
        bg.setCornerRadius(dp(18));
        bg.setStroke(Math.max(1, dp(1)), BORDER_STROKE);
        card.setBackground(bg);

        LinearLayout statsRow = new LinearLayout(this);
        statsRow.setOrientation(LinearLayout.HORIZONTAL);
        statsRow.setGravity(Gravity.CENTER_VERTICAL);

        statTotalValue = new TextView(this);
        statActiveValue = new TextView(this);
        statExpiredValue = new TextView(this);

        statsRow.addView(createMetricColumn("24h Liked", statTotalValue, ACCENT, "heart"),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        statsRow.addView(createMetricColumn("Active", statActiveValue, ACTIVE_TEAL, "clock"),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        statsRow.addView(createMetricColumn("Expired", statExpiredValue, CORAL_PINK, "history"),
                new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        card.addView(statsRow);

        // Visual distribution chart bar
        LinearLayout chartBar = new LinearLayout(this);
        chartBar.setOrientation(LinearLayout.HORIZONTAL);
        GradientDrawable trackBg = new GradientDrawable();
        trackBg.setColor(ELEVATED_BG);
        trackBg.setCornerRadius(dp(4));
        chartBar.setBackground(trackBg);
        chartBar.setPadding(dp(1), dp(1), dp(1), dp(1));

        chartActiveSegment = new View(this);
        GradientDrawable actBg = new GradientDrawable();
        actBg.setColor(ACTIVE_TEAL);
        actBg.setCornerRadius(dp(4));
        chartActiveSegment.setBackground(actBg);

        chartExpiredSegment = new View(this);
        GradientDrawable expBg = new GradientDrawable();
        expBg.setColor(CORAL_PINK);
        expBg.setCornerRadius(dp(4));
        chartExpiredSegment.setBackground(expBg);

        chartBar.addView(chartActiveSegment, new LinearLayout.LayoutParams(0, dp(6), 1f));
        chartBar.addView(chartExpiredSegment, new LinearLayout.LayoutParams(0, dp(6), 0f));

        LinearLayout.LayoutParams barLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, dp(8));
        barLp.topMargin = dp(10);
        card.addView(chartBar, barLp);

        LinearLayout.LayoutParams cardLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        cardLp.setMargins(dp(14), dp(10), dp(14), dp(6));
        card.setLayoutParams(cardLp);
        return card;
    }

    private LinearLayout createMetricColumn(String label, TextView valueView, int accentColor, String iconId) {
        LinearLayout col = new LinearLayout(this);
        col.setOrientation(LinearLayout.VERTICAL);
        col.setGravity(Gravity.CENTER_HORIZONTAL);

        LinearLayout top = new LinearLayout(this);
        top.setOrientation(LinearLayout.HORIZONTAL);
        top.setGravity(Gravity.CENTER_VERTICAL);
        ImageView ic = new ImageView(this);
        ic.setImageDrawable(RexIcon.getDrawable(this, iconId, accentColor, 14));
        LinearLayout.LayoutParams icLp = new LinearLayout.LayoutParams(dp(14), dp(14));
        icLp.setMarginEnd(dp(5));
        top.addView(ic, icLp);

        valueView.setText("0");
        valueView.setTextColor(TEXT_PRIMARY);
        valueView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f);
        valueView.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        top.addView(valueView);
        col.addView(top);

        TextView lbl = new TextView(this);
        lbl.setText(label);
        lbl.setTextColor(TEXT_SECONDARY);
        lbl.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f);
        lbl.setPadding(0, dp(2), 0, 0);
        col.addView(lbl);
        return col;
    }

    private View buildSearchBox() {
        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.HORIZONTAL);
        box.setGravity(Gravity.CENTER_VERTICAL);
        box.setPadding(dp(12), dp(6), dp(12), dp(6));
        GradientDrawable bg = rounded(CARD_BG, 14);
        bg.setStroke(Math.max(1, dp(1)), BORDER_STROKE);
        box.setBackground(bg);

        ImageView searchIcon = new ImageView(this);
        searchIcon.setImageDrawable(RexIcon.getDrawable(this, "search", TEXT_SECONDARY, 18));
        LinearLayout.LayoutParams sLp = new LinearLayout.LayoutParams(dp(18), dp(18));
        sLp.setMarginEnd(dp(8));
        box.addView(searchIcon, sLp);

        EditText input = new EditText(this);
        input.setSingleLine(true);
        input.setHint(pt() ? "Buscar por nome ou @usuário" : "Search name or @username");
        input.setHintTextColor(TEXT_SECONDARY);
        input.setTextColor(TEXT_PRIMARY);
        input.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        input.setBackground(null);
        input.setPadding(0, dp(6), 0, dp(6));
        input.addTextChangedListener(new TextWatcher() {
            @Override public void beforeTextChanged(CharSequence s, int start, int count, int after) { }
            @Override public void onTextChanged(CharSequence s, int start, int before, int count) { }
            @Override public void afterTextChanged(Editable s) {
                query = s == null ? "" : s.toString();
                render();
            }
        });
        searchInput = input;
        box.addView(input, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        FrameLayout wrapper = new FrameLayout(this);
        wrapper.setPadding(dp(14), dp(8), dp(14), dp(2));
        wrapper.addView(box, new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return wrapper;
    }

    private View buildTabs() {
        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setPadding(dp(14), dp(4), dp(14), dp(4));

        String[] labels = {pt() ? "Recentes" : "Recent", pt() ? "Expirados" : "Expired"};
        for (int i = 0; i < labels.length; i++) {
            final int index = i;
            TextView tabView = new TextView(this);
            tabView.setText(labels[i]);
            tabView.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f);
            tabView.setGravity(Gravity.CENTER);
            tabView.setPadding(dp(14), dp(8), dp(14), dp(8));
            tabView.setOnClickListener(v -> {
                RexHaptics.tap(v);
                tab = index;
                render();
            });
            tabs[i] = tabView;
            LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(0, dp(38), 1f);
            if (i == 0) lp.setMarginEnd(dp(6));
            else lp.setMarginStart(dp(6));
            bar.addView(tabView, lp);
        }
        return bar;
    }

    private LinearLayout buildEmptyState() {
        LinearLayout outer = new LinearLayout(this);
        outer.setOrientation(LinearLayout.VERTICAL);
        outer.setGravity(Gravity.CENTER);
        outer.setPadding(dp(24), dp(16), dp(24), dp(24));

        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setGravity(Gravity.CENTER_HORIZONTAL);
        card.setPadding(dp(24), dp(26), dp(24), dp(26));
        GradientDrawable cardBg = new GradientDrawable();
        cardBg.setColor(CARD_BG);
        cardBg.setCornerRadius(dp(22));
        cardBg.setStroke(Math.max(1, dp(1)), BORDER_STROKE);
        card.setBackground(cardBg);

        FrameLayout iconHalo = new FrameLayout(this);
        GradientDrawable haloBg = new GradientDrawable();
        haloBg.setShape(GradientDrawable.OVAL);
        haloBg.setColor(0x2223C6D8);
        haloBg.setStroke(Math.max(1, dp(1)), 0x5523C6D8);
        iconHalo.setBackground(haloBg);

        ImageView heartSvg = new ImageView(this);
        heartSvg.setImageDrawable(RexIcon.getDrawable(this, "heart-spark", ACCENT, 34));
        iconHalo.addView(heartSvg, new FrameLayout.LayoutParams(dp(34), dp(34), Gravity.CENTER));
        card.addView(iconHalo, new LinearLayout.LayoutParams(dp(68), dp(68)));

        emptyTitle = new TextView(this);
        emptyTitle.setTextColor(TEXT_PRIMARY);
        emptyTitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17f);
        emptyTitle.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
        emptyTitle.setGravity(Gravity.CENTER);
        emptyTitle.setPadding(0, dp(14), 0, dp(6));
        card.addView(emptyTitle);

        emptySubtitle = new TextView(this);
        emptySubtitle.setTextColor(TEXT_SECONDARY);
        emptySubtitle.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.2f);
        emptySubtitle.setGravity(Gravity.CENTER);
        card.addView(emptySubtitle);

        outer.addView(card, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));
        return outer;
    }

    private FrameLayout.LayoutParams centeredWrap() {
        return new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.CENTER);
    }

    private void render() {
        long now = System.currentTimeMillis();

        int activeCount = 0;
        int expiredCount = 0;
        for (Iterator<StoryLikeHistoryEntry> it = all.iterator(); it.hasNext(); ) {
            StoryLikeHistoryEntry e = it.next();
            if (e.shouldRemove(now)) {
                it.remove();
            } else if (e.isExpired(now)) {
                expiredCount++;
            } else {
                activeCount++;
            }
        }
        int totalCount = activeCount + expiredCount;
        if (statTotalValue != null) statTotalValue.setText(String.valueOf(totalCount));
        if (statActiveValue != null) statActiveValue.setText(String.valueOf(activeCount));
        if (statExpiredValue != null) statExpiredValue.setText(String.valueOf(expiredCount));
        if (chartActiveSegment != null && chartExpiredSegment != null) {
            float actW = totalCount == 0 ? 1f : Math.max(0.05f, (float) activeCount / totalCount);
            float expW = totalCount == 0 ? 0f : (float) expiredCount / totalCount;
            chartActiveSegment.setLayoutParams(new LinearLayout.LayoutParams(0, dp(6), actW));
            chartExpiredSegment.setLayoutParams(new LinearLayout.LayoutParams(0, dp(6), expW));
        }

        String needle = query.trim().toLowerCase(Locale.ROOT);
        List<StoryLikeHistoryEntry> visible = new ArrayList<>();
        for (StoryLikeHistoryEntry entry : all) {
            if (tab == TAB_EXPIRED && !entry.isExpired(now)) continue;
            if (!matches(entry, needle)) continue;
            visible.add(entry);
        }
        Collections.sort(visible, new Comparator<StoryLikeHistoryEntry>() {
            @Override
            public int compare(StoryLikeHistoryEntry a, StoryLikeHistoryEntry b) {
                return Long.compare(b.likedAt, a.likedAt);
            }
        });

        adapter.submit(visible);
        loading.setVisibility(View.GONE);
        errorView.setVisibility(View.GONE);

        boolean empty = visible.isEmpty();
        grid.setVisibility(empty ? View.GONE : View.VISIBLE);
        emptyState.setVisibility(empty ? View.VISIBLE : View.GONE);
        if (empty) updateEmptyText(needle);

        String recentLabel = (pt() ? "Recentes (" : "Recent (") + totalCount + ")";
        String expiredLabel = (pt() ? "Expirados (" : "Expired (") + expiredCount + ")";
        if (tabs[0] != null) tabs[0].setText(recentLabel);
        if (tabs[1] != null) tabs[1].setText(expiredLabel);

        for (int i = 0; i < tabs.length; i++) {
            boolean selected = i == tab;
            tabs[i].setTextColor(selected ? Color.BLACK : TEXT_SECONDARY);
            tabs[i].setTypeface(Typeface.create("sans-serif-medium", selected ? Typeface.BOLD : Typeface.NORMAL));
            GradientDrawable pill = new GradientDrawable();
            pill.setCornerRadius(dp(12));
            if (selected) {
                pill.setColor(ACCENT);
            } else {
                pill.setColor(CARD_BG);
                pill.setStroke(Math.max(1, dp(1)), BORDER_STROKE);
            }
            tabs[i].setBackground(pill);
        }
    }

    private void updateEmptyText(String needle) {
        if (!needle.isEmpty()) {
            emptyTitle.setText(pt() ? "Nenhum resultado" : "No Matching Stories");
            emptySubtitle.setText(pt() ? "Tente outro nome ou @usuário." : "Try searching for another display name or @username.");
        } else if (tab == TAB_EXPIRED) {
            emptyTitle.setText(pt() ? "Nenhum Story expirado" : "No Expired Story Likes");
            emptySubtitle.setText(pt()
                    ? "Os Stories curtidos que saírem do ar nas últimas 24h aparecem aqui."
                    : "Stories you liked that pass their 24-hour window will be archived here.");
        } else {
            emptyTitle.setText(pt() ? "Nenhuma curtida em Stories ainda" : "No Story Likes Recorded Yet");
            emptySubtitle.setText(pt()
                    ? "Os Stories que você curtir nas últimas 24 horas aparecerão aqui com miniatura e horário."
                    : "Tap the Heart icon on any Story and it will appear here with its thumbnail, @creator handle, and timestamp.");
        }
    }

    private boolean matches(StoryLikeHistoryEntry entry, String needle) {
        if (needle.isEmpty()) return true;
        return contains(entry.displayName, needle)
                || contains(entry.username, needle)
                || contains(entry.authorId, needle);
    }

    private static boolean contains(String value, String needle) {
        return value != null && value.toLowerCase(Locale.ROOT).contains(needle);
    }

    private void toggleSearch() {
        boolean show = searchBox.getVisibility() != View.VISIBLE;
        searchBox.setVisibility(show ? View.VISIBLE : View.GONE);
        if (show) {
            searchInput.requestFocus();
        } else {
            searchInput.setText("");
        }
    }

    @Override
    public void onThumbnail(StoryLikeHistoryEntry entry) {
        onProfile(entry);
    }

    @Override
    public void onProfile(StoryLikeHistoryEntry entry) {
        if (entry.username == null || entry.username.isEmpty()) {
            Toast.makeText(this, pt() ? "Story não está mais disponível" : "Story is no longer available",
                    Toast.LENGTH_SHORT).show();
            return;
        }
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW,
                    Uri.parse("instagram://user?username=" + Uri.encode(entry.username)));
            intent.setPackage(getPackageName());
            startActivity(intent);
        } catch (Throwable t) {
            Log.e(TAG, "openProfile failed", t);
            Toast.makeText(this, pt() ? "Não foi possível abrir o perfil" : "Could not open the profile",
                    Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    public void onMenu(final StoryLikeHistoryEntry entry, View anchor) {
        PopupMenu popup = new PopupMenu(this, anchor);
        popup.getMenu().add(0, 1, 0, pt() ? "Copiar username" : "Copy @username");
        popup.getMenu().add(0, 2, 1, pt() ? "Remover registro" : "Remove entry");
        popup.setOnMenuItemClickListener(item -> {
            if (item.getItemId() == 1) {
                copyUsername(entry);
            } else {
                StoryLikeHistory.remove(getApplicationContext(), entry.storyId);
                all.remove(entry);
                render();
            }
            return true;
        });
        popup.show();
    }

    private void copyUsername(StoryLikeHistoryEntry entry) {
        try {
            ClipboardManager clipboard = (ClipboardManager) getSystemService(Context.CLIPBOARD_SERVICE);
            if (clipboard == null || entry.username == null) return;
            clipboard.setPrimaryClip(ClipData.newPlainText("username", entry.username));
            Toast.makeText(this, pt() ? "Username copiado" : "Copied @" + entry.username, Toast.LENGTH_SHORT).show();
        } catch (Throwable t) {
            Log.e(TAG, "copyUsername failed", t);
        }
    }

    private static String menuLabel() {
        return pt() ? "Curtidas em Stories" : "Story likes";
    }

    public static CharSequence[] addButtons(CharSequence[] items) {
        return items;
    }

    public static boolean buttonAction(CharSequence text, Context context) {
        try {
            if (text == null || !menuLabel().contentEquals(text)) return false;
            open(context);
            return true;
        } catch (Throwable t) {
            Log.e(TAG, "buttonAction failed", t);
            return false;
        }
    }

    private static boolean pt() {
        return "pt".equals(Locale.getDefault().getLanguage());
    }

    private int dp(int value) {
        return Math.round(TypedValue.applyDimension(
                TypedValue.COMPLEX_UNIT_DIP, value, getResources().getDisplayMetrics()));
    }

    private GradientDrawable rounded(int color, int radiusDp) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(color);
        drawable.setCornerRadius(dp(radiusDp));
        return drawable;
    }
}
