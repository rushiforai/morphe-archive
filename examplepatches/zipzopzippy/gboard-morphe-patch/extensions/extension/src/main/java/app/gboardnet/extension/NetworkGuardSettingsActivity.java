package app.gboardnet.extension;

import android.app.Activity;
import android.content.Context;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Bundle;
import android.text.InputType;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.util.List;

/**
 * "Network access" screen, opened from Gboard settings.
 * Plain framework views on purpose, so it does not depend on Gboard's (obfuscated) UI code.
 */
public final class NetworkGuardSettingsActivity extends Activity {
    private static final int MAX_LOG_ROWS = 200;

    private Switch enabledSwitch;
    private Switch loggingSwitch;
    private EditText rulesEdit;
    private Switch gmsSwitch;
    private Switch offlineVoiceSwitch;
    private EditText gmsEdit;
    private LinearLayout logList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        setTheme(Build.VERSION.SDK_INT >= 29
                ? android.R.style.Theme_DeviceDefault_DayNight
                : android.R.style.Theme_DeviceDefault_Light);
        super.onCreate(savedInstanceState);
        NetworkGuard.init(this);
        setTitle("Network access");
        setContentView(buildUi());
        loadConfig();
        refreshLog();
    }

    private View buildUi() {
        int pad = dp(16);
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setPadding(pad, pad, pad, pad);

        enabledSwitch = new Switch(this);
        enabledSwitch.setText("Block network requests");
        enabledSwitch.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
        root.addView(enabledSwitch, matchWrap());

        root.addView(caption("When on, Gboard can only reach the hosts below. Everything else "
                + "(analytics, sync, downloads, AI features, ...) is blocked."));

        loggingSwitch = new Switch(this);
        loggingSwitch.setText("Log requests");
        loggingSwitch.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
        root.addView(loggingSwitch, withTopMargin(matchWrap(), dp(12)));

        root.addView(header("Allowed hosts"));
        root.addView(caption("One rule per line. 'example.com' allows only that host, "
                + "'*.example.com' also allows subdomains, 'example.com/path/' allows only URLs "
                + "under that path (connections to the host itself are still allowed, "
                + "since paths are not visible at the DNS/socket level). Lines starting with # are ignored."));

        rulesEdit = new EditText(this);
        rulesEdit.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS | InputType.TYPE_TEXT_VARIATION_URI);
        rulesEdit.setTypeface(Typeface.MONOSPACE);
        rulesEdit.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        rulesEdit.setGravity(Gravity.TOP | Gravity.START);
        rulesEdit.setMinLines(4);
        rulesEdit.setHorizontallyScrolling(false);
        root.addView(rulesEdit, matchWrap());

        LinearLayout buttons = new LinearLayout(this);
        buttons.setOrientation(LinearLayout.HORIZONTAL);
        buttons.addView(button("Save", v -> saveConfig()));
        buttons.addView(button("Restore defaults", v -> {
            NetworkGuard.Config d = NetworkGuard.defaults();
            enabledSwitch.setChecked(d.enabled);
            loggingSwitch.setChecked(d.logging);
            rulesEdit.setText(d.rulesText);
            gmsSwitch.setChecked(d.blockGms);
            gmsEdit.setText(d.gmsRulesText);
            offlineVoiceSwitch.setChecked(d.preferOfflineVoice);
            saveConfig();
        }));
        root.addView(header("Google Play services"));
        root.addView(caption("Gboard hands some work (usage logging, settings sync, ...) to Play services, "
                + "which then sends it from its own process. When this is on, Gboard is not allowed to "
                + "connect to Play services at all, except for the actions listed below "
                + "(one per line, a trailing * matches a prefix). Play services' own traffic "
                + "is not affected; use a firewall or private DNS for that."));
        gmsSwitch = new Switch(this);
        gmsSwitch.setText("Block hand-offs to Play services");
        gmsSwitch.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
        root.addView(gmsSwitch, matchWrap());
        gmsEdit = new EditText(this);
        gmsEdit.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_MULTI_LINE
                | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        gmsEdit.setTypeface(Typeface.MONOSPACE);
        gmsEdit.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14);
        gmsEdit.setGravity(Gravity.TOP | Gravity.START);
        gmsEdit.setMinLines(2);
        gmsEdit.setHint("e.g. com.google.android.gms.phenotype.service.START");
        root.addView(gmsEdit, matchWrap());

        root.addView(header("Voice typing"));
        offlineVoiceSwitch = new Switch(this);
        offlineVoiceSwitch.setText("Prefer offline voice typing");
        offlineVoiceSwitch.setTextSize(TypedValue.COMPLEX_UNIT_SP, 17);
        root.addView(offlineVoiceSwitch, matchWrap());
        root.addView(caption("For English voice typing, skip Google's online speech recognizer and use "
                + "Gboard's on-device one (works for every English variant). Gboard downloads the speech pack "
                + "from dl.google.com once, over Wi-Fi. Other languages keep Gboard's normal online voice typing. "
                + "Needs the 'Offline voice typing' patch."));

        root.addView(buttons, matchWrap());

        root.addView(header("Recent requests"));
        root.addView(caption("Newest first. Tap a blocked entry to add its host to the allowlist "
                + "(then Save). To find what a feature needs, clear the log, use the feature, "
                + "and refresh."));

        LinearLayout logButtons = new LinearLayout(this);
        logButtons.setOrientation(LinearLayout.HORIZONTAL);
        logButtons.addView(button("Refresh", v -> refreshLog()));
        logButtons.addView(button("Clear log", v -> {
            NetworkGuard.clearLog(this);
            refreshLog();
        }));
        root.addView(logButtons, matchWrap());

        logList = new LinearLayout(this);
        logList.setOrientation(LinearLayout.VERTICAL);
        root.addView(logList, matchWrap());

        root.addView(caption("Not covered: traffic Play services sends by itself, and redirects "
                + "followed inside Cronet."));

        ScrollView scroll = new ScrollView(this);
        scroll.setFillViewport(true);
        scroll.addView(root);
        if (Build.VERSION.SDK_INT >= 30) {
            scroll.setFitsSystemWindows(true);
        }
        return scroll;
    }

    private void loadConfig() {
        NetworkGuard.Config c = NetworkGuard.current();
        enabledSwitch.setChecked(c.enabled);
        loggingSwitch.setChecked(c.logging);
        rulesEdit.setText(c.rulesText);
        gmsSwitch.setChecked(c.blockGms);
        gmsEdit.setText(c.gmsRulesText);
        offlineVoiceSwitch.setChecked(c.preferOfflineVoice);
    }

    private void saveConfig() {
        try {
            String rules = rulesEdit.getText().toString().replace("\r", "").trim();
            String gmsRules = gmsEdit.getText().toString().replace("\r", "").trim();
            NetworkGuard.save(this, enabledSwitch.isChecked(), loggingSwitch.isChecked(), rules,
                    gmsSwitch.isChecked(), gmsRules, offlineVoiceSwitch.isChecked());
            Toast.makeText(this, "Saved", Toast.LENGTH_SHORT).show();
        } catch (Exception e) {
            Toast.makeText(this, "Could not save: " + e.getMessage(), Toast.LENGTH_LONG).show();
        }
    }

    private void refreshLog() {
        logList.removeAllViews();
        List<String> lines = NetworkGuard.readLog(this);
        if (lines.isEmpty()) {
            logList.addView(caption("(empty)"));
            return;
        }
        int shown = 0;
        for (int i = lines.size() - 1; i >= 0 && shown < MAX_LOG_ROWS; i--, shown++) {
            final String line = lines.get(i);
            TextView row = new TextView(this);
            row.setText(line);
            row.setTypeface(Typeface.MONOSPACE);
            row.setTextSize(TypedValue.COMPLEX_UNIT_SP, 12);
            row.setPadding(0, dp(4), 0, dp(4));
            if (line.contains(" BLOCK ")) {
                row.setTextColor(0xFFD93025);
                row.setOnClickListener(v -> addRuleFromLog(line));
            }
            logList.addView(row, matchWrap());
        }
    }

    /** Log line format: "MM-dd HH:mm:ss BLOCK layer host/path". */
    private void addRuleFromLog(String line) {
        String[] parts = line.split(" ");
        if (parts.length < 5) return;
        String target = parts[4];
        boolean gms = parts[3].equals("gms");
        EditText edit = gms ? gmsEdit : rulesEdit;
        int slash = target.indexOf('/');
        String host = gms || slash < 0 ? target : target.substring(0, slash);
        String current = edit.getText().toString();
        for (String l : current.split("\n")) {
            if (l.trim().equalsIgnoreCase(host)) {
                Toast.makeText(this, host + " is already listed", Toast.LENGTH_SHORT).show();
                return;
            }
        }
        edit.setText(current.isEmpty() || current.endsWith("\n") ? current + host : current + "\n" + host);
        Toast.makeText(this, "Added " + host + ", tap Save to apply", Toast.LENGTH_SHORT).show();
    }

    // region View helpers

    private TextView header(String text) {
        TextView t = new TextView(this);
        t.setText(text);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
        t.setTypeface(Typeface.DEFAULT_BOLD);
        t.setLayoutParams(withTopMargin(matchWrap(), dp(24)));
        return t;
    }

    private TextView caption(String text) {
        TextView t = new TextView(this);
        t.setText(text);
        t.setTextSize(TypedValue.COMPLEX_UNIT_SP, 13);
        t.setAlpha(0.75f);
        t.setPadding(0, dp(4), 0, dp(8));
        return t;
    }

    private Button button(String text, View.OnClickListener listener) {
        Button b = new Button(this);
        b.setText(text);
        b.setAllCaps(false);
        b.setOnClickListener(listener);
        return b;
    }

    private LinearLayout.LayoutParams matchWrap() {
        return new LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
    }

    private static LinearLayout.LayoutParams withTopMargin(LinearLayout.LayoutParams p, int top) {
        p.topMargin = top;
        return p;
    }

    private int dp(int value) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value, getResources().getDisplayMetrics());
    }

    // endregion
}
