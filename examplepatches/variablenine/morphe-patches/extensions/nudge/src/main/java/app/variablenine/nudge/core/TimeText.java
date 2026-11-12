package app.variablenine.nudge.core;

/**
 * Elapsed and remaining time in words. Showing how long a reminder has been waiting
 * makes time visible without any judgement attached to it.
 */
public final class TimeText {

    private TimeText() {
    }

    /** "just now", "25 min ago", "1 hr 20 min ago", "5 hr ago", "2 days ago". */
    public static String ago(long millis) {
        if (millis < TaskBook.MINUTE) return "just now";
        return span(millis) + " ago";
    }

    /** "in 25 min", "in 2 hr", "in a moment". */
    public static String in(long millis) {
        if (millis < TaskBook.MINUTE) return "in a moment";
        return "in " + span(millis);
    }

    /** "25 min", "1 hr 20 min", "5 hr", "2 days". Never shorter than a minute. */
    public static String span(long millis) {
        long minutes = Math.max(1, millis / TaskBook.MINUTE);
        if (minutes < 60) return minutes + " min";
        long hours = minutes / 60;
        if (hours < 24) {
            long rest = minutes % 60;
            // Under three hours the minutes still matter; beyond that they are noise.
            if (hours < 3 && rest >= 10) return hours + " hr " + rest + " min";
            return hours + " hr";
        }
        long days = hours / 24;
        return days == 1 ? "1 day" : days + " days";
    }
}
