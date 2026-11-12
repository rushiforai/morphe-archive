package app.variablenine.nudge.core;

import android.app.Notification;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Turns a notification into the reminders it carries.
 *
 * <p>Nothing here is specific to one app: it reads the standard fields every Android
 * notification uses, so it keeps working when the sending app changes its layout.
 */
public final class NotificationParser {

    /** One message from a notification. */
    public static final class Reminder {
        /** Who it is from, as the notification showed it. May be empty. */
        public final String sender;
        public final String text;
        /** When it was issued. */
        public final long time;

        Reminder(String sender, String text, long time) {
            this.sender = sender;
            this.text = text;
            this.time = time;
        }
    }

    private static final long TWO_DAYS = 2 * TaskBook.DAY;
    /** Android 16 "live update" notifications. The constant itself only exists from API 36. */
    private static final int FLAG_PROMOTED_ONGOING = 0x00040000;

    private NotificationParser() {
    }

    /**
     * @param postTime when the system received the notification
     * @return the reminders in the notification, oldest first; empty if it is not a
     * message for the user (progress bars, live status, calls). Whether a group header
     * counts is for the caller to decide, see {@link #isGroupSummary}.
     */
    public static List<Reminder> parse(Notification n, long postTime) {
        if (n == null) return Collections.emptyList();
        Bundle extras = n.extras;
        if (extras == null) return Collections.emptyList();

        // Status displays are not messages: services at work, live progress, calls, media.
        // A plain "ongoing" flag is not enough to tell, a reminder may be made sticky.
        if ((n.flags & (Notification.FLAG_FOREGROUND_SERVICE | FLAG_PROMOTED_ONGOING)) != 0) {
            return Collections.emptyList();
        }
        if (isStatusCategory(n.category) || isStatusStyle(extras)) return Collections.emptyList();
        if (extras.getInt(Notification.EXTRA_PROGRESS_MAX, 0) > 0
                || extras.getBoolean(Notification.EXTRA_PROGRESS_INDETERMINATE, false)) {
            return Collections.emptyList();
        }

        String title = firstNonEmpty(
                text(extras, Notification.EXTRA_CONVERSATION_TITLE),
                text(extras, Notification.EXTRA_TITLE),
                text(extras, Notification.EXTRA_TITLE_BIG));

        List<Reminder> out = new ArrayList<>();

        // Chat style notifications list each message with its own time and sender.
        Parcelable[] messages = parcelables(extras, Notification.EXTRA_MESSAGES);
        if (messages != null && messages.length > 0) {
            List<Reminder> unsigned = new ArrayList<>();
            for (Parcelable p : messages) {
                if (!(p instanceof Bundle)) continue;
                Bundle m = (Bundle) p;
                String body = charSequence(m, "text");
                if (body.isEmpty()) continue;
                String sender = messageSender(m);
                long sent = m.getLong("time", 0);
                long time = sent > 0 ? sent : postTime;
                if (sender == null) {
                    // By Android's convention a message without a sender is one the user
                    // wrote themselves, for example a reply typed into the notification.
                    unsigned.add(new Reminder(title, body, time));
                } else {
                    out.add(new Reminder(title.isEmpty() ? sender : title, body, time));
                }
            }
            if (!out.isEmpty()) return out;
            // Not one message names a sender. A notification made only of the user's own
            // words makes no sense, so the app simply does not fill the field in.
            if (!unsigned.isEmpty()) return unsigned;
        }

        String body = firstNonEmpty(
                text(extras, Notification.EXTRA_BIG_TEXT),
                text(extras, Notification.EXTRA_TEXT),
                lines(extras));
        String sender = title;
        if (body.isEmpty()) {
            // Title only: the title is the message.
            body = title;
            sender = "";
        }
        if (body.isEmpty()) return out;
        out.add(new Reminder(sender, body, eventTime(n.when, postTime)));
        return out;
    }

    /**
     * Apps usually stamp a notification with the time of the message it is about, which
     * stays the same when the notification is posted again. That is the better clock
     * for telling a repeat from a new request, but only if it is believable.
     */
    static long eventTime(long when, long postTime) {
        boolean believable = when > 0 && when <= postTime + TaskBook.MINUTE
                && postTime - when < TWO_DAYS;
        return believable ? when : postTime;
    }

    /**
     * A group header usually only repeats what its member notifications say ("3 new
     * messages"), but some apps post a single notification flagged as one.
     */
    public static boolean isGroupSummary(Notification n) {
        return n != null && (n.flags & Notification.FLAG_GROUP_SUMMARY) != 0;
    }

    private static boolean isStatusStyle(Bundle extras) {
        String style = charSequence(extras, Notification.EXTRA_TEMPLATE);
        return style.endsWith("$ProgressStyle") || style.endsWith("$CallStyle")
                || style.endsWith("$MediaStyle") || style.endsWith("$DecoratedMediaCustomViewStyle");
    }

    private static boolean isStatusCategory(String category) {
        if (category == null) return false;
        switch (category) {
            case Notification.CATEGORY_PROGRESS:
            case Notification.CATEGORY_SERVICE:
            case Notification.CATEGORY_TRANSPORT:
            case Notification.CATEGORY_CALL:
            case Notification.CATEGORY_SYSTEM:
            case Notification.CATEGORY_NAVIGATION:
            case Notification.CATEGORY_ERROR:
            case "stopwatch":
            case "missed_call":
            case "voicemail":
                return true;
            default:
                return false;
        }
    }

    private static String messageSender(Bundle message) {
        String sender = charSequence(message, "sender");
        if (!sender.isEmpty()) return sender;
        if (Build.VERSION.SDK_INT >= 28) {
            try {
                Object person = message.get("sender_person");
                if (person instanceof android.app.Person) {
                    CharSequence name = ((android.app.Person) person).getName();
                    // A person without a name is still someone else, not the user.
                    return name == null ? "" : name.toString().trim();
                }
            } catch (Throwable ignored) {
                // An unreadable parcel is treated like a missing sender.
            }
        }
        return null;
    }

    private static String lines(Bundle extras) {
        try {
            CharSequence[] lines = extras.getCharSequenceArray(Notification.EXTRA_TEXT_LINES);
            if (lines == null || lines.length == 0) return "";
            StringBuilder sb = new StringBuilder();
            for (CharSequence line : lines) {
                if (line == null) continue;
                String s = line.toString().trim();
                if (s.isEmpty()) continue;
                if (sb.length() > 0) sb.append(' ');
                sb.append(s);
            }
            return sb.toString();
        } catch (Throwable t) {
            return "";
        }
    }

    private static Parcelable[] parcelables(Bundle extras, String key) {
        try {
            return extras.getParcelableArray(key);
        } catch (Throwable t) {
            return null;
        }
    }

    private static String text(Bundle extras, String key) {
        return charSequence(extras, key);
    }

    private static String charSequence(Bundle b, String key) {
        try {
            CharSequence cs = b.getCharSequence(key);
            return cs == null ? "" : cs.toString().trim();
        } catch (Throwable t) {
            return "";
        }
    }

    private static String firstNonEmpty(String... candidates) {
        for (String c : candidates) {
            if (c != null && !c.isEmpty()) return c;
        }
        return "";
    }
}
