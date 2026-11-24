package app.brokenn.extension.jiohotstar.settings;

import android.animation.LayoutTransition;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.os.Bundle;
import android.view.Gravity;
import android.view.HapticFeedbackConstants;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

// Hidden settings screen, built in code (no resources); rows persist to "brokenn_prefs".
@SuppressWarnings("unused")
public class BrokennSettingsActivity extends Activity {

    private static final int BG = 0xFF0B0B0F;
    private static final int SURFACE = 0xFF17171E;
    private static final int SURFACE_STROKE = 0xFF26262F;
    private static final int FG = 0xFFF2F2F7;
    private static final int SUBTLE = 0xFF8E8E9A;
    private static final int ACCENT = 0xFFFF5A79;

    private SharedPreferences prefs;

    /** True when a setting changed since open, so leaving prompts a restart. */
    private boolean dirty;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        prefs = getSharedPreferences("brokenn_prefs", MODE_PRIVATE);
        registerBackHandling();

        if (android.os.Build.VERSION.SDK_INT >= 21) {
            getWindow().setStatusBarColor(0x00000000);
            getWindow().setNavigationBarColor(BG);
            getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS);
        }

        // Top sheet: blue-to-purple gradient fading out inside the upper half.
        android.widget.FrameLayout frame = new android.widget.FrameLayout(this);
        frame.setBackgroundColor(BG);

        View glow = new View(this) {
            private final android.graphics.Paint paint = new android.graphics.Paint();
            @Override
            protected void onDraw(android.graphics.Canvas canvas) {
                if (getHeight() <= 0) return;
                paint.setShader(new android.graphics.LinearGradient(
                    0, 0, 0, getHeight(),
                    new int[]{0xFF0F2A48, 0xFF25162D, 0x000B0B0F},
                    null, android.graphics.Shader.TileMode.CLAMP));
                canvas.drawRect(0, 0, getWidth(), getHeight(), paint);
            }
        };
        frame.addView(glow, new android.widget.FrameLayout.LayoutParams(
            android.view.ViewGroup.LayoutParams.MATCH_PARENT,
            Math.round(0.5f * getResources().getDisplayMetrics().heightPixels)));

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(dp(20), dp(8), dp(20), dp(20));

        // Pinned app bar: back chevron and title.
        final int barHeight = dp(88);
        LinearLayout appBar = new LinearLayout(this);
        appBar.setOrientation(LinearLayout.HORIZONTAL);
        appBar.setGravity(Gravity.CENTER_VERTICAL);
        appBar.setPadding(dp(20), dp(36), dp(20), dp(0));

        ChevronView back = new ChevronView(this, FG, false);
        back.setRotation(90f); // down-pointing V rotated to point left
        // Padded holder: bigger round touch target with an oval ripple.
        android.widget.FrameLayout backHolder = new android.widget.FrameLayout(this);
        backHolder.setPadding(dp(10), dp(10), dp(10), dp(10));
        backHolder.addView(back);
        addRipple(backHolder, true);
        backHolder.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                v.performHapticFeedback(HapticFeedbackConstants.VIRTUAL_KEY);
                handleBack();
            }
        });
        appBar.addView(backHolder);

        TextView brand = text("Brokenn", 22, ACCENT, true);
        Typeface introScript = Fonts.introScript(this);
        if (introScript != null) brand.setTypeface(introScript);
        brand.setPadding(dp(14), 0, 0, 0);
        appBar.addView(brand);

        TextView title = text(" settings", 16, FG, true);
        appBar.addView(title);

        android.widget.FrameLayout.LayoutParams barParams = new android.widget.FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, barHeight);
        barParams.gravity = android.view.Gravity.TOP;
        frame.addView(appBar, barParams);

        // Animate sibling repositioning when a card above expands or collapses.
        LayoutTransition rootTransition = new LayoutTransition();
        rootTransition.enableTransitionType(LayoutTransition.CHANGING);
        rootTransition.setDuration(220);
        root.setLayoutTransition(rootTransition);

        // One glass card per feature group; cards only render for included patches.
        BrokennStatus.load();
        boolean showPlayer = BrokennStatus.hidePlayerButtons;
        boolean showTabs = BrokennStatus.hideWatchPageElements;
        if (showPlayer || showTabs) {
            addStaticHeading(root, "WATCH PAGE");
        }
        if (showPlayer) {
            LinearLayout playerCard = featureCard(root, "Hide player buttons",
                "Removes the selected buttons from the player's bottom and top bars.");
            addToggle(playerCard, "Watch Next", "Removes the Watch Next button.", "hide_player_watch_next", false);
            addToggle(playerCard, "Episodes", "Removes the Episodes button.", "hide_player_episodes", false);
            addToggle(playerCard, "Shop", "Removes the Shop / Order Food button.", "hide_player_shop", false);
            addToggle(playerCard, "Speed", "Removes the playback speed button.", "hide_player_speed", false);
            addToggle(playerCard, "Rate", "Removes the rate button.", "hide_player_rate", false);
            addToggle(playerCard, "Next Episode", "Removes the next episode button.", "hide_player_next_episode", false);
            addToggle(playerCard, "Back", "Removes the back button from the top bar.", "hide_player_top_back", false);
            addToggle(playerCard, "Settings", "Removes the settings gear from the top bar.", "hide_player_top_settings", false);
            addToggle(playerCard, "Fullscreen", "Removes the fullscreen / exit fullscreen button from the top bar.", "hide_player_top_fullscreen", false);
            addToggle(playerCard, "Lock", "Removes the lock button from the top bar.", "hide_player_top_lock", false);
            addToggle(playerCard, "Cast", "Removes the cast button from the top bar.", "hide_player_top_cast", false);
            removeTrailingDivider(playerCard);
        }

        if (showTabs) {
            LinearLayout tabsCard = featureCard(root, "Hide watch page tabs",
                "Removes the selected tabs from watch page.");
            addToggle(tabsCard, "For You", "Hides the For You tab.", "hide_tab_for_you", false);
            addToggle(tabsCard, "Jeeto", "Hides the Jeeto tab.", "hide_tab_jeeto", false);
            addToggle(tabsCard, "Memes", "Hides the Memes tab.", "hide_tab_memes", false);
            addToggle(tabsCard, "Live Chat", "Hides the live chat tab.", "hide_tab_live_chat", false);
            addToggle(tabsCard, "Brand tabs", "Hides sponsored brand tabs.", "hide_brand_tabs", false);
            addToggle(tabsCard, "Sponsored pills", "Hides floating sponsored pills.", "hide_sponsored_pills", false);
            removeTrailingDivider(tabsCard);
        }

        if (BrokennStatus.feedFilter) {
            addStaticHeading(root, "HOME FEED");
            LinearLayout shelvesCard = newCard(root);
            addFilterRow(shelvesCard);
        }

        LinearLayout about = addStaticSection(root, "ABOUT");
        addRow(about, "App version", appVersion());
        addDivider(about);
        addRow(about, "Patches version", BuildConfig.PATCHES_VERSION);

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.addView(root);
        android.widget.FrameLayout.LayoutParams scrollParams = new android.widget.FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.MATCH_PARENT);
        scrollParams.topMargin = dp(88);
        frame.addView(scroll, scrollParams);
        setContentView(frame);
    }

    /** Adds a plain section heading (no card). */
    private void addStaticHeading(LinearLayout parent, String heading) {
        TextView headingView = text(heading, 12, ACCENT, true);
        headingView.setLetterSpacing(0.12f);
        headingView.setPadding(dp(4), dp(16), 0, dp(8));
        parent.addView(headingView);
    }

    /** Adds a static (non-collapsible) section: plain heading + card. Returns the content card. */
    private LinearLayout addStaticSection(LinearLayout parent, String heading) {
        TextView headingView = text(heading, 12, ACCENT, true);
        headingView.setLetterSpacing(0.12f);
        headingView.setPadding(dp(4), dp(16), 0, dp(8));
        parent.addView(headingView);

        LinearLayout card = newCard(parent);
        return card;
    }

    /** Collapsible card with a title/description header and chevron; returns the content container. */
    private LinearLayout featureCard(LinearLayout parent, String heading, String description) {
        LinearLayout card = newCard(parent);

        // LayoutTransition animates the child visibility change.
        LayoutTransition cardTransition = new LayoutTransition();
        cardTransition.setDuration(220);
        card.setLayoutTransition(cardTransition);

        final LinearLayout content = new LinearLayout(this);
        content.setOrientation(LinearLayout.VERTICAL);
        content.setVisibility(View.GONE);

        final ChevronView chevron = new ChevronView(this, SUBTLE, false);

        LinearLayout header = new LinearLayout(this);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        // Row padding so the chevron lines up with the check/cross buttons.
        header.setPadding(dp(20), dp(10), dp(20), dp(10));
        header.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                boolean show = content.getVisibility() != View.VISIBLE;
                content.setVisibility(show ? View.VISIBLE : View.GONE);
                chevron.setUp(show);
            }
        });

        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);

        TextView headingView = text(heading, 15.5f, FG, true);
        labels.addView(headingView);

        TextView descView = text(description, 12, SUBTLE, false);
        descView.setPadding(0, dp(1), dp(12), 0);
        labels.addView(descView);

        header.addView(labels, new LinearLayout.LayoutParams(
            0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        header.addView(chevron);

        addRipple(header, false);
        card.addView(header);
        card.addView(content);
        return content;
    }

    /** Removes a trailing divider left after the last row of a card. */
    private void removeTrailingDivider(LinearLayout card) {
        int n = card.getChildCount();
        if (n > 0 && card.getChildAt(n - 1).getClass() == View.class) {
            card.removeViewAt(n - 1);
        }
    }

    /** Adds a thin divider between rows inside a card. */
    private void addDivider(LinearLayout card) {
        View divider = new View(this);
        divider.setBackgroundColor(0x1FFFFFFF);
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, dp(1));
        params.setMargins(dp(20), 0, dp(20), 0);
        card.addView(divider, params);
    }

    private LinearLayout newCard(LinearLayout parent) {
        LinearLayout card = new LinearLayout(this);
        card.setOrientation(LinearLayout.VERTICAL);
        card.setBackground(cardBackground());
        // Rows pad themselves so ripples fill the card; the outline must be opaque or clipping is refused.
        if (android.os.Build.VERSION.SDK_INT >= 21) {
            card.setOutlineProvider(new android.view.ViewOutlineProvider() {
                @Override
                public void getOutline(View view, android.graphics.Outline outline) {
                    outline.setRoundRect(0, 0, view.getWidth(), view.getHeight(), dp(16));
                    outline.setAlpha(1f);
                }
            });
            card.setClipToOutline(true);
        }
        LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        params.topMargin = dp(8);
        parent.addView(card, params);
        return card;
    }

    private GradientDrawable cardBackground() {
        GradientDrawable drawable = new GradientDrawable();
        // Glass: translucent fill over the gradient, hairline white stroke.
        drawable.setColor(0x9E17171E);
        drawable.setCornerRadius(dp(16));
        drawable.setStroke(dp(1), 0x2EFFFFFF);
        return drawable;
    }

    /** About row: label left, value right. */
    private void addRow(LinearLayout card, String label, String value) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(20), dp(12), dp(20), dp(12));

        TextView labelText = text(label, 14, FG, false);
        row.addView(labelText, new LinearLayout.LayoutParams(
            0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        TextView valueText = text(value, 13, SUBTLE, false);
        row.addView(valueText);
        row.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View v) {
                android.content.ClipboardManager clipboard =
                    (android.content.ClipboardManager) getSystemService(CLIPBOARD_SERVICE);
                if (clipboard != null) {
                    android.content.ClipData clip =
                        android.content.ClipData.newPlainText("Brokenn", value);
                    // Sensitive: skips Android 13+'s own clipboard chip.
                    if (android.os.Build.VERSION.SDK_INT >= 33) {
                        android.os.PersistableBundle extras = new android.os.PersistableBundle();
                        extras.putBoolean("android.content.extra.IS_SENSITIVE", true);
                        clip.getDescription().setExtras(extras);
                    }
                    clipboard.setPrimaryClip(clip);
                }
                v.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
                android.widget.Toast.makeText(BrokennSettingsActivity.this,
                    label + " copied", android.widget.Toast.LENGTH_SHORT).show();
                return true;
            }
        });
        addRipple(row, false);
        card.addView(row);
    }

    /** Toggle row: title + gray description on the left, check/cross button on the right. */
    private void addToggle(LinearLayout card, String label, String description, final String key, boolean def) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(20), dp(10), dp(20), dp(10));

        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);

        TextView labelText = text(label, 15, FG, false);
        labels.addView(labelText);

        TextView descText = text(description, 12, SUBTLE, false);
        descText.setPadding(0, dp(1), dp(12), 0);
        labels.addView(descText);

        row.addView(labels, new LinearLayout.LayoutParams(
            0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        final ToggleView toggle = new ToggleView(this, prefs.getBoolean(key, def));
        toggle.setChangeListener(new ToggleView.OnChange() {
            @Override
            public void onChange(boolean isChecked) {
                prefs.edit().putBoolean(key, isChecked).apply();
                dirty = true;
            }
        });
        row.addView(toggle);

        // Whole row toggles, Material-style.
        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                toggle.toggle();
            }
        });

        addRipple(row, false);
        card.addView(row);
        addDivider(card);
    }

    /** Feed filter row: opens the tray-title editor dialog when tapped. */
    private void addFilterRow(LinearLayout card) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(dp(20), dp(12), dp(20), dp(12));

        LinearLayout labels = new LinearLayout(this);
        labels.setOrientation(LinearLayout.VERTICAL);
        TextView labelText = text("Feed filter", 15, FG, false);
        labels.addView(labelText);
        TextView descText = text("List tray titles to filter, separated by new lines.", 12, SUBTLE, false);
        descText.setPadding(0, dp(1), dp(12), 0);
        labels.addView(descText);
        row.addView(labels, new LinearLayout.LayoutParams(
            0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        final TextView valueText = text(filterSummary(), 13, SUBTLE, false);
        row.addView(valueText);
        row.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showFeedFilterDialog(valueText);
            }
        });
        addRipple(row, false);
        card.addView(row);
    }

    /** Summary for the feed filter row: entry count, or None when empty. */
    private String filterSummary() {
        String raw = prefs.getString("hidden_shelves", "").trim();
        if (raw.length() == 0) return "None";
        int n = 0;
        for (String line : raw.split("\n")) {
            if (line.trim().length() > 0) n++;
        }
        return n + (n == 1 ? " tray" : " trays");
    }

    /** Editor for hidden tray titles, one per line; OK persists to "hidden_shelves". */
    private void showFeedFilterDialog(final TextView valueText) {
        final android.app.Dialog dialog = new android.app.Dialog(this);
        dialog.requestWindowFeature(android.view.Window.FEATURE_NO_TITLE);

        LinearLayout box = new LinearLayout(this);
        box.setOrientation(LinearLayout.VERTICAL);
        GradientDrawable panel = new GradientDrawable();
        panel.setColor(SURFACE);
        panel.setCornerRadius(dp(20));
        panel.setStroke(dp(1), SURFACE_STROKE);
        box.setBackground(panel);
        int pad = dp(20);
        box.setPadding(pad, pad, pad, dp(16));

        TextView title = text("Feed filter", 17, FG, true);
        box.addView(title);

        TextView subtitle = text("Trays to hide from the home feed — one title per line.",
            12.5f, SUBTLE, false);
        subtitle.setPadding(0, dp(6), 0, dp(14));
        box.addView(subtitle);

        final EditText input = new EditText(this);
        input.setText(prefs.getString("hidden_shelves", ""));
        input.setGravity(Gravity.TOP);
        input.setMinLines(4);
        input.setMaxLines(10);
        input.setTextColor(FG);
        input.setHintTextColor(SUBTLE);
        input.setHint("Top 10\nContinue Watching");
        input.setTextSize(13.5f);
        input.setInputType(android.text.InputType.TYPE_CLASS_TEXT
            | android.text.InputType.TYPE_TEXT_FLAG_MULTI_LINE
            | android.text.InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        GradientDrawable field = new GradientDrawable();
        field.setColor(0xFF0F0F14);
        field.setCornerRadius(dp(12));
        field.setStroke(dp(1), SURFACE_STROKE);
        input.setBackground(field);
        input.setPadding(dp(12), dp(10), dp(12), dp(10));
        box.addView(input, new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT));

        LinearLayout buttons = new LinearLayout(this);
        buttons.setOrientation(LinearLayout.HORIZONTAL);
        buttons.setGravity(Gravity.CENTER_VERTICAL | Gravity.END);
        buttons.setPadding(0, dp(16), 0, 0);

        TextView cancel = text("Cancel", 14, SUBTLE, true);
        cancel.setPadding(dp(16), dp(10), dp(16), dp(10));
        cancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dialog.dismiss();
            }
        });
        buttons.addView(cancel);

        TextView ok = text("OK", 14, 0xFFFFFFFF, true);
        GradientDrawable okBg = new GradientDrawable();
        okBg.setColor(ACCENT);
        okBg.setCornerRadius(dp(999));
        ok.setBackground(okBg);
        ok.setPadding(dp(20), dp(10), dp(20), dp(10));
        LinearLayout.LayoutParams okParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        okParams.leftMargin = dp(10);
        buttons.addView(ok, okParams);
        box.addView(buttons);

        ok.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                prefs.edit().putString("hidden_shelves",
                    input.getText().toString().trim()).apply();
                valueText.setText(filterSummary());
                dirty = true;
                dialog.dismiss();
            }
        });

        dialog.setContentView(box);
        android.view.Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new android.graphics.drawable.ColorDrawable(0x00000000));
            android.view.WindowManager.LayoutParams params = window.getAttributes();
            params.width = Math.round(320 * getResources().getDisplayMetrics().density);
            window.setAttributes(params);
        }
        dialog.show();
    }

    /** Patches read preferences only on reassembly, so offer a restart on leave. */
    @Override
    @android.annotation.SuppressLint("GestureBackNavigation")
    public void onBackPressed() {
        handleBack();
    }

    private void handleBack() {
        if (!dirty) {
            finish();
            return;
        }
        dirty = false;
        showRestartDialog();
    }

    private void registerBackHandling() {
        if (android.os.Build.VERSION.SDK_INT < 33) return;
        getOnBackInvokedDispatcher().registerOnBackInvokedCallback(
            android.window.OnBackInvokedDispatcher.PRIORITY_DEFAULT,
            new android.window.OnBackInvokedCallback() {
                @Override
                public void onBackInvoked() {
                    handleBack();
                }
            });
    }

    /** Restart prompt in the app's own AlertDialog so it matches the system look. */
    private void showRestartDialog() {
        new android.app.AlertDialog.Builder(this)
            .setTitle("Restart needed")
            .setMessage("Changes apply after the app restarts.")
            .setPositiveButton("Restart now", new android.content.DialogInterface.OnClickListener() {
                @Override
                public void onClick(android.content.DialogInterface dialog, int which) {
                    restartApp();
                }
            })
            .setNegativeButton("Later", new android.content.DialogInterface.OnClickListener() {
                @Override
                public void onClick(android.content.DialogInterface dialog, int which) {
                    finish();
                }
            })
            .show();
    }

    private void restartApp() {
        finishAffinity();
        Intent launch = getPackageManager().getLaunchIntentForPackage(getPackageName());
        if (launch != null) {
            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            startActivity(launch);
        }
        Runtime.getRuntime().exit(0);
    }

    private void addBody(LinearLayout card, String message) {
        TextView view = text(message, 14, SUBTLE, false);
        view.setLineSpacing(dp(2), 1.0f);
        view.setPadding(dp(4), dp(12), dp(4), dp(12));
        card.addView(view);
    }

    /** Thin chevron drawn as a vector; used for the back arrow and expanders. */
    private static final class ChevronView extends View {
        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final int sizePx;

        ChevronView(android.content.Context context, int color, boolean expanded) {
            super(context);
            float density = context.getResources().getDisplayMetrics().density;
            sizePx = Math.round(18 * density);
            paint.setColor(color);
            paint.setStrokeWidth(2f * density);
            paint.setStyle(Paint.Style.STROKE);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setStrokeJoin(Paint.Join.ROUND);
            setRotation(expanded ? 180f : 0f);
        }

        void setUp(boolean up) {
            animate().rotation(up ? 180f : 0f).setDuration(200).start();
        }

        @Override
        protected void onMeasure(int widthSpec, int heightSpec) {
            setMeasuredDimension(
                android.view.View.resolveSize(sizePx, widthSpec),
                android.view.View.resolveSize(sizePx, heightSpec));
        }

        @Override
        protected void onDraw(Canvas canvas) {
            float cx = getWidth() / 2f;
            float cy = getHeight() / 2f;
            float half = sizePx * 0.26f;
            Path path = new Path();
            path.moveTo(cx - half, cy - half * 0.55f);
            path.lineTo(cx, cy + half * 0.55f);
            path.lineTo(cx + half, cy - half * 0.55f);
            canvas.drawPath(path, paint);
        }
    }

    /** Check/cross circle button; the glyph pops in with a rotate+scale entrance. */
    private final class ToggleView extends View {
        interface OnChange { void onChange(boolean checked); }

        private static final int FILL_OFF = 0xFF23232B;
        private static final int OUTLINE = 0xFF6A6A75;
        private static final int ICON_OFF = 0xFF8E8E9A;
        private static final int ICON_ON = 0xFFFFFFFF;

        private final Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final int trackOn = ACCENT;
        private final int sizePx;
        private final int strokePx;
        private final int iconPx;
        private float progress;     // 0 = off, 1 = on (circle colour)
        private float iconProgress; // 0..1 entrance of the current glyph
        private boolean checked;
        private boolean showCheck;
        private ValueAnimator animator;
        private OnChange changeListener;

        ToggleView(android.content.Context context, boolean initial) {
            super(context);
            float density = context.getResources().getDisplayMetrics().density;
            sizePx = Math.round(18 * density);
            strokePx = Math.round(2 * density);
            iconPx = Math.round(3 * density);
            checked = initial;
            showCheck = initial;
            progress = initial ? 1f : 0f;
            iconProgress = 1f;
        }

        void setChangeListener(OnChange listener) {
            changeListener = listener;
        }

        void toggle() {
            setChecked(!checked, true);
        }

        void setChecked(boolean value, boolean animate) {
            if (value == checked) return;
            checked = value;
            showCheck = value;
            iconProgress = 0f;
            performHapticFeedback(HapticFeedbackConstants.VIRTUAL_KEY);
            if (changeListener != null) changeListener.onChange(value);
            final float startProgress = progress;
            final float target = value ? 1f : 0f;
            if (animator != null) animator.cancel();
            animator = ValueAnimator.ofFloat(0f, 1f);
            animator.setDuration(animate ? 220 : 0);
            animator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
                
                public void onAnimationUpdate(ValueAnimator animation) {
                    float t = (Float) animation.getAnimatedValue();
                    progress = startProgress + (target - startProgress) * t;
                    iconProgress = t;
                    invalidate();
                }
            });
            animator.start();
        }

        
        protected void onMeasure(int widthSpec, int heightSpec) {
            setMeasuredDimension(
                android.view.View.resolveSize(sizePx, widthSpec),
                android.view.View.resolveSize(sizePx, heightSpec));
        }

        
        protected void onDraw(Canvas canvas) {
            float cx = getWidth() / 2f;
            float cy = getHeight() / 2f;
            float radius = sizePx / 2f;

            // Circle: dark fill with outline when off, accent fill when on.
            paint.setStyle(Paint.Style.FILL);
            paint.setColor(lerpColor(FILL_OFF, trackOn, progress));
            canvas.drawCircle(cx, cy, radius, paint);
            if (progress < 1f) {
                paint.setStyle(Paint.Style.STROKE);
                paint.setStrokeWidth(strokePx);
                paint.setColor(OUTLINE);
                paint.setAlpha(Math.round(255 * (1f - progress)));
                canvas.drawCircle(cx, cy, radius - strokePx / 2f, paint);
                paint.setStyle(Paint.Style.FILL);
                paint.setAlpha(255);
            }

            // Glyph: pops in with a rotate+scale entrance; check when on, cross when off.
            float scale = 0.5f + 0.5f * iconProgress;
            float rotation = (showCheck ? -90f : 90f) * (1f - iconProgress);
            paint.setStrokeWidth(strokePx);
            paint.setStrokeCap(Paint.Cap.ROUND);
            paint.setColor(showCheck ? ICON_ON : ICON_OFF);
            canvas.save();
            canvas.rotate(rotation, cx, cy);
            canvas.scale(scale, scale, cx, cy);
            if (showCheck) {
                canvas.drawLine(cx - iconPx, cy, cx - iconPx * 0.25f, cy + iconPx * 0.75f, paint);
                canvas.drawLine(cx - iconPx * 0.25f, cy + iconPx * 0.75f, cx + iconPx, cy - iconPx * 0.75f, paint);
            } else {
                canvas.drawLine(cx - iconPx, cy - iconPx, cx + iconPx, cy + iconPx, paint);
                canvas.drawLine(cx - iconPx, cy + iconPx, cx + iconPx, cy - iconPx, paint);
            }
            canvas.restore();
        }

        private int lerpColor(int from, int to, float t) {
            int r = Math.round(((from >> 16) & 0xFF) + (((to >> 16) & 0xFF) - ((from >> 16) & 0xFF)) * t);
            int g = Math.round(((from >> 8) & 0xFF) + (((to >> 8) & 0xFF) - ((from >> 8) & 0xFF)) * t);
            int b = Math.round((from & 0xFF) + ((to & 0xFF) - (from & 0xFF)) * t);
            return 0xFF000000 | (r << 16) | (g << 8) | b;
        }
    }

    private TextView text(String value, float sp, int color, boolean bold) {
        TextView view = new TextView(this);
        view.setText(value);
        view.setTextSize(sp);
        view.setTextColor(color);
        view.setTypeface(Typeface.DEFAULT, bold ? Typeface.BOLD : Typeface.NORMAL);
        return view;
    }

    private String appVersion() {
        try {
            return getPackageManager().getPackageInfo(getPackageName(), 0).versionName;
        } catch (Exception e) {
            return "unknown";
        }
    }

    /** Ripple press feedback: rectangular for rows (card clips it), oval for buttons. */
    private void addRipple(View view, boolean oval) {
        if (android.os.Build.VERSION.SDK_INT < 21) return;
        GradientDrawable mask = new GradientDrawable();
        if (oval) {
            mask.setShape(GradientDrawable.OVAL);
        }
        mask.setColor(0xFFFFFFFF);
        android.graphics.drawable.RippleDrawable ripple = new android.graphics.drawable.RippleDrawable(
            android.content.res.ColorStateList.valueOf(0x2EFFFFFF), null, mask);
        view.setBackground(ripple);
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
