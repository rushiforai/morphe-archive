package app.variablenine.nudge.core;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Locale;

/**
 * Derives the identity of a reminder from its sender and its wording.
 *
 * <p>Every patched app sees the same notification and has to arrive at the same id
 * without talking to the others, so the id cannot depend on anything local such as
 * arrival order or a random number.
 */
public final class TaskIds {

    /** Longest reminder text that is kept. Anything longer is cut with an ellipsis. */
    public static final int MAX_TEXT = 600;

    private TaskIds() {
    }

    public static String of(String sourcePkg, String text) {
        String basis = (sourcePkg == null ? "" : sourcePkg) + "\n" + fold(text);
        try {
            byte[] hash = MessageDigest.getInstance("SHA-256")
                    .digest(basis.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder(32);
            for (int i = 0; i < 16; i++) {
                sb.append(Character.forDigit((hash[i] >> 4) & 0xF, 16));
                sb.append(Character.forDigit(hash[i] & 0xF, 16));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            // SHA-256 is mandatory on every Android and Java runtime.
            throw new IllegalStateException(e);
        }
    }

    /** Text as shown to the user: whitespace runs collapsed, trimmed, length capped. */
    public static String clean(String text) {
        if (text == null) return "";
        String t = collapse(text);
        if (t.length() > MAX_TEXT) {
            int cut = MAX_TEXT - 1;
            // Do not split a surrogate pair.
            if (Character.isHighSurrogate(t.charAt(cut - 1))) cut--;
            t = t.substring(0, cut).trim() + "…";
        }
        return t;
    }

    /** Text as compared: {@link #clean} plus case folding, so "Hang laundry" equals "hang laundry". */
    static String fold(String text) {
        return clean(text).toLowerCase(Locale.ROOT);
    }

    private static String collapse(String text) {
        StringBuilder sb = new StringBuilder(text.length());
        boolean pendingSpace = false;
        for (int i = 0; i < text.length(); ) {
            int cp = text.codePointAt(i);
            i += Character.charCount(cp);
            // Zero width and directional marks carry no meaning for a reminder and would
            // make two visually identical reminders hash differently.
            boolean invisible = cp == 0x200B || cp == 0x200C || cp == 0x200D || cp == 0xFEFF
                    || cp == 0x200E || cp == 0x200F || cp == 0x2060;
            if (invisible) continue;
            if (Character.isWhitespace(cp) || Character.isSpaceChar(cp) || Character.isISOControl(cp)) {
                pendingSpace = sb.length() > 0;
            } else {
                if (pendingSpace) sb.append(' ');
                pendingSpace = false;
                sb.appendCodePoint(cp);
            }
        }
        return sb.toString();
    }
}
