package app.variablenine.nudge.core;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class TimeTextTest {

    private static final long MIN = TaskBook.MINUTE;
    private static final long HOUR = TaskBook.HOUR;

    @Test
    public void elapsedTimeReadsNaturally() {
        assertEquals("just now", TimeText.ago(0));
        assertEquals("just now", TimeText.ago(59_000));
        assertEquals("1 min ago", TimeText.ago(MIN));
        assertEquals("25 min ago", TimeText.ago(25 * MIN + 30_000));
        assertEquals("59 min ago", TimeText.ago(59 * MIN));
        assertEquals("1 hr ago", TimeText.ago(HOUR));
        assertEquals("1 hr ago", TimeText.ago(HOUR + 9 * MIN));
        assertEquals("1 hr 20 min ago", TimeText.ago(HOUR + 20 * MIN));
        assertEquals("2 hr 45 min ago", TimeText.ago(2 * HOUR + 45 * MIN));
        assertEquals("3 hr ago", TimeText.ago(3 * HOUR + 45 * MIN));
        assertEquals("23 hr ago", TimeText.ago(23 * HOUR + 59 * MIN));
        assertEquals("1 day ago", TimeText.ago(24 * HOUR));
        assertEquals("2 days ago", TimeText.ago(50 * HOUR));
    }

    @Test
    public void remainingTimeReadsNaturally() {
        assertEquals("in a moment", TimeText.in(5_000));
        assertEquals("in 20 min", TimeText.in(20 * MIN));
        assertEquals("in 2 hr", TimeText.in(2 * HOUR));
        assertEquals("in 12 hr", TimeText.in(12 * HOUR));
    }
}
