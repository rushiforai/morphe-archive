package io.github.xd33m.watchtime.addon;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class ShortsTrackerTest {
    private final ShortsTracker t = new ShortsTracker();

    @Test
    public void a_playing_Short_is_reported_then_beats_every_10_s() {
        assertEquals(Report.playing("s1"), t.onTime(0, 100, true, true, "s1"));
        assertNull(t.onTime(1_000, 1_100, true, true, "s1"));
        assertNull(t.onTime(9_999, 10_099, true, true, "s1"));
        assertEquals(Report.playing("s1"), t.onTime(10_000, 10_100, true, true, "s1"));
    }

    @Test
    public void a_pause_is_stopped_by_the_watchdog_after_2_s() {
        t.onTime(0, 100, true, true, "s1");
        assertNull(t.onWatchdog(2_000));
        assertEquals(Report.stopped(), t.onWatchdog(2_001));
        assertFalse(t.isPlaying());
    }

    @Test
    public void resume_after_a_pause_reports_playing_at_once() {
        t.onTime(0, 5_000, true, true, "s1");
        t.onWatchdog(3_000); // stopped
        assertEquals(Report.playing("s1"), t.onTime(40_000, 5_000, true, true, "s1"));
    }

    @Test
    public void a_loop_keeps_playing_without_a_new_report() {
        t.onTime(0, 41_000, true, true, "s1");
        assertNull(t.onTime(1_000, 200, true, true, "s1")); // time jumped back: same Short
        assertTrue(t.isPlaying());
    }

    @Test
    public void swiping_reports_the_next_Short_at_once() {
        t.onTime(0, 100, true, true, "s1");
        assertEquals(Report.playing("s2"), t.onTime(3_000, 50, true, true, "s2"));
    }

    @Test
    public void fast_swipes_report_each_Short_once() {
        assertEquals(Report.playing("a"), t.onTime(0, 10, true, true, "a"));
        assertEquals(Report.playing("b"), t.onTime(200, 10, true, true, "b"));
        assertEquals(Report.playing("c"), t.onTime(400, 10, true, true, "c"));
        assertNull(t.onTime(1_400, 1_010, true, true, "c"));
    }

    @Test
    public void a_feed_preview_is_never_reported() {
        assertNull(t.onTime(0, 100, false, false, "s1"));
        assertNull(t.onTime(1_000, 1_100, false, false, "s1"));
        assertFalse(t.isPlaying());
    }

    @Test
    public void a_minimized_regular_video_is_not_reported() {
        assertNull(t.onTime(0, 512_000, true, false, "regular"));
    }

    @Test
    public void leaving_the_Shorts_player_stops_at_once() {
        t.onTime(0, 100, true, true, "s1");
        assertEquals(Report.stopped(), t.onTime(500, 600, false, false, "s1"));
    }

    @Test
    public void after_not_wanted_nothing_is_reported() {
        t.onTime(0, 100, true, true, "s1");
        t.stopForever();
        assertNull(t.onTime(20_000, 20_100, true, true, "s2"));
        assertNull(t.onWatchdog(30_000));
        assertFalse(t.isPlaying());
    }

    @Test
    public void an_empty_id_is_not_reported() {
        assertNull(t.onTime(0, 100, true, true, ""));
        assertNull(t.onTime(0, 100, true, true, null));
    }

    @Test
    public void a_stuck_Short_resumes_without_progress_only_once() {
        assertEquals(Report.playing("s1"), t.onTime(0, 0, true, true, "s1"));
        assertEquals(Report.stopped(), t.onWatchdog(3_000));
        assertEquals(Report.playing("s1"), t.onTime(3_000, 0, true, true, "s1"));
        assertEquals(Report.stopped(), t.onWatchdog(6_000));
        assertNull(t.onTime(6_000, 0, true, true, "s1"));
        assertFalse(t.isPlaying());
        assertEquals(Report.playing("s1"), t.onTime(7_000, 1_000, true, true, "s1")); // time moves again
    }
}
