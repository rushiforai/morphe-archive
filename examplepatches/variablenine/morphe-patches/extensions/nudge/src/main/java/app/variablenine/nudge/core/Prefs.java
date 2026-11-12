package app.variablenine.nudge.core;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

/**
 * The user's settings for the reminder spot. Per app on purpose: where the tab sits in
 * YouTube says nothing about where it should sit in Reddit.
 */
public final class Prefs {

    /** How often the tab is allowed to draw attention to itself. */
    public static final int CUES_OFF = 0;
    public static final int CUES_GENTLE = 1;
    public static final int CUES_REGULAR = 2;

    /**
     * Apps whose notifications become reminders, as package names. An entry ending in a
     * dot matches every package that starts with it.
     */
    public static final String DEFAULT_SOURCE = "com.anthropic.";

    private static final String FILE = "app.variablenine.nudge.prefs";

    private static final String K_SOURCES = "sources";
    private static final String K_MUTED_SENDERS = "muted_senders";
    private static final String K_SEEN_SENDERS = "seen_senders";
    private static final String K_CUES = "cues";
    private static final String K_FADE_HOURS = "fade_hours";
    private static final String K_SIDE_RIGHT = "side_right";
    private static final String K_Y_FRACTION = "y_fraction";
    private static final String K_PAUSED_UNTIL = "paused_until";
    private static final String K_ONLY_WHILE_OPEN = "only_while_open";
    private static final String K_HAPTICS = "haptics";
    private static final String K_CLEAR_NOTIFICATION = "clear_notification";
    private static final String K_SETUP_DISMISSED_UNTIL = "setup_dismissed_until";
    private static final String K_FED_BY_SIBLING = "fed_by_sibling";
    private static final String K_FEED_TARGETS = "feed_targets";
    private static final String K_LAST_STILL_RELEVANT = "last_still_relevant";

    private static Prefs instance;

    private final SharedPreferences p;

    public static synchronized Prefs get(Context context) {
        if (instance == null) instance = new Prefs(context.getApplicationContext());
        return instance;
    }

    private Prefs(Context app) {
        p = app.getSharedPreferences(FILE, Context.MODE_PRIVATE);
    }

    // region sources

    public Set<String> sources() {
        Set<String> s = p.getStringSet(K_SOURCES, null);
        if (s == null) return Collections.singleton(DEFAULT_SOURCE);
        return new TreeSet<>(s);
    }

    public void setSources(Set<String> sources) {
        p.edit().putStringSet(K_SOURCES, new HashSet<>(sources)).apply();
    }

    public boolean isSource(String packageName) {
        if (packageName == null) return false;
        for (String s : sources()) {
            if (s.isEmpty()) continue;
            if (s.endsWith(".") ? packageName.startsWith(s) : packageName.equals(s)) return true;
        }
        return false;
    }

    /** Senders (notification titles) the user switched off. */
    public Set<String> mutedSenders() {
        return new TreeSet<>(p.getStringSet(K_MUTED_SENDERS, Collections.<String>emptySet()));
    }

    public void setSenderMuted(String sender, boolean muted) {
        Set<String> s = new HashSet<>(mutedSenders());
        if (muted) s.add(sender);
        else s.remove(sender);
        p.edit().putStringSet(K_MUTED_SENDERS, s).apply();
    }

    public boolean isSenderMuted(String sender) {
        return sender != null && p.getStringSet(K_MUTED_SENDERS, Collections.<String>emptySet())
                .contains(sender);
    }

    /** Senders seen so far, so the settings can offer a switch for each. Names only. */
    public Set<String> seenSenders() {
        return new TreeSet<>(p.getStringSet(K_SEEN_SENDERS, Collections.<String>emptySet()));
    }

    public void noteSender(String sender) {
        if (sender == null || sender.isEmpty() || sender.length() > 80) return;
        Set<String> seen = p.getStringSet(K_SEEN_SENDERS, Collections.<String>emptySet());
        if (seen.contains(sender) || seen.size() >= 40) return;
        Set<String> s = new HashSet<>(seen);
        s.add(sender);
        p.edit().putStringSet(K_SEEN_SENDERS, s).apply();
    }

    // endregion

    // region behaviour

    public int cues() {
        int c = p.getInt(K_CUES, CUES_GENTLE);
        return c < CUES_OFF || c > CUES_REGULAR ? CUES_GENTLE : c;
    }

    public void setCues(int cues) {
        p.edit().putInt(K_CUES, cues).apply();
    }

    /** After this many hours a reminder stops asking for attention. 0 means never. */
    public int fadeHours() {
        return Math.max(0, p.getInt(K_FADE_HOURS, 36));
    }

    public void setFadeHours(int hours) {
        p.edit().putInt(K_FADE_HOURS, hours).apply();
    }

    public long fadeMillis() {
        return fadeHours() * TaskBook.HOUR;
    }

    /** Cues are held back until this time. The tab itself stays. */
    public long pausedUntil() {
        return p.getLong(K_PAUSED_UNTIL, 0);
    }

    public void setPausedUntil(long time) {
        p.edit().putLong(K_PAUSED_UNTIL, time).apply();
    }

    public boolean haptics() {
        return p.getBoolean(K_HAPTICS, true);
    }

    public void setHaptics(boolean on) {
        p.edit().putBoolean(K_HAPTICS, on).apply();
    }

    /**
     * Dismiss the original notification once its reminder is finished here. Off unless the
     * user asks for it: dismissing tells the sending app, and what it does with that is
     * its business.
     */
    public boolean clearNotification() {
        return p.getBoolean(K_CLEAR_NOTIFICATION, false);
    }

    public void setClearNotification(boolean on) {
        p.edit().putBoolean(K_CLEAR_NOTIFICATION, on).apply();
    }

    /**
     * Listen for notifications only while this app is on screen. Saves memory, but a
     * reminder that is swiped away while the app is closed is then never seen.
     */
    public boolean onlyWhileOpen() {
        return p.getBoolean(K_ONLY_WHILE_OPEN, false);
    }

    public void setOnlyWhileOpen(boolean on) {
        p.edit().putBoolean(K_ONLY_WHILE_OPEN, on).apply();
    }

    /** Last time the "still relevant?" question was put for old reminders. */
    public long lastStillRelevant() {
        return p.getLong(K_LAST_STILL_RELEVANT, 0);
    }

    public void setLastStillRelevant(long time) {
        p.edit().putLong(K_LAST_STILL_RELEVANT, time).apply();
    }

    // endregion

    // region placement

    public boolean sideRight() {
        return p.getBoolean(K_SIDE_RIGHT, true);
    }

    /** Vertical position of the tab as a fraction of the usable height, 0 = top. */
    public float yFraction() {
        float f = p.getFloat(K_Y_FRACTION, 0.34f);
        return f < 0f || f > 1f || Float.isNaN(f) ? 0.34f : f;
    }

    public void setPlacement(boolean sideRight, float yFraction) {
        p.edit().putBoolean(K_SIDE_RIGHT, sideRight).putFloat(K_Y_FRACTION, yFraction).apply();
    }

    // endregion

    // region setup and sync

    /** The setup hint stays away until this time. {@link Long#MAX_VALUE} means for good. */
    public long setupDismissedUntil() {
        return p.getLong(K_SETUP_DISMISSED_UNTIL, 0);
    }

    public void setSetupDismissedUntil(long time) {
        p.edit().putLong(K_SETUP_DISMISSED_UNTIL, time).apply();
    }

    /** Another patched app that has notification access is passing its reminders on to this one. */
    public boolean fedBySibling() {
        return p.getBoolean(K_FED_BY_SIBLING, false);
    }

    public void setFedBySibling(boolean fed) {
        if (fed != fedBySibling()) p.edit().putBoolean(K_FED_BY_SIBLING, fed).apply();
    }

    /** Authorities of patched apps that have no notification access and rely on this one. */
    public Set<String> feedTargets() {
        return new TreeSet<>(p.getStringSet(K_FEED_TARGETS, Collections.<String>emptySet()));
    }

    public void setFeedTarget(String authority, boolean needsFeed) {
        Set<String> current = p.getStringSet(K_FEED_TARGETS, Collections.<String>emptySet());
        if (current.contains(authority) == needsFeed) return;
        Set<String> s = new HashSet<>(current);
        if (needsFeed) s.add(authority);
        else s.remove(authority);
        p.edit().putStringSet(K_FEED_TARGETS, s).apply();
    }

    // endregion
}
