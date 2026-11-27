package io.github.xd33m.watchtime.addon;

import java.util.Objects;

/** One report to the Watchtime Tracker app (protocol v1): a Short is playing, or nothing is. */
public final class Report {
    public static final String PLAYING = "playing";
    public static final String STOPPED = "stopped";

    /** {@link #PLAYING} or {@link #STOPPED}. */
    public final String state;
    /** The Short's video id with {@link #PLAYING}, null with {@link #STOPPED}. */
    public final String contentId;

    private Report(String state, String contentId) {
        this.state = state;
        this.contentId = contentId;
    }

    public static Report playing(String id) {
        return new Report(PLAYING, id);
    }

    public static Report stopped() {
        return new Report(STOPPED, null);
    }

    @Override
    public boolean equals(Object o) {
        if (!(o instanceof Report)) return false;
        Report r = (Report) o;
        return state.equals(r.state) && Objects.equals(contentId, r.contentId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(state, contentId);
    }

    @Override
    public String toString() {
        return contentId == null ? state : state + "(" + contentId + ")";
    }
}
