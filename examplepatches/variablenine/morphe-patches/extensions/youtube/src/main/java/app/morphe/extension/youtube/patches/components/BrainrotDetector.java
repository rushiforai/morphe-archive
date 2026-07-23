package app.morphe.extension.youtube.patches.components;

import java.text.Normalizer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Pure, Android-free detection core for "brainrot" spam comments
 * (e.g. "anti spiral viral", "anti anti spiral", "fix mojang bedrock" and endless
 * obfuscated reshuffles of that tiny meme vocabulary).
 *
 * <p>Unlike a keyword blacklist, the spam is not a fixed phrase but a combinatorial
 * mash-up of a small vocabulary, so we:
 * <ol>
 *   <li>de-obfuscate the text (NFKD, leetspeak/homoglyph folding, zero-width strip,
 *       letter-spacing and concatenation splitting, repeat collapsing), then</li>
 *   <li>score how much of the comment is meme vocabulary vs. real content and hide only
 *       short, meme-dominated comments.</li>
 * </ol>
 * A substantive comment that merely mentions "anti-spiral" or "fix bedrock" is kept.
 *
 * <p>This class has no Android dependencies and is unit-testable in isolation
 * (see {@code BrainrotDetectorSelfTest}). All tuning knobs are constructor parameters.
 */
public final class BrainrotDetector {

    /** Weighted meme lexicon. Strong tokens (weight&gt;=2) stand alone; weak ones need a partner. */
    private final Map<String, Integer> lexicon;

    // Tuning knobs.
    private final int hideWeight;       // summed meme weight that alone justifies hiding
    private final double minDensity;    // meme tokens / total tokens
    private final int maxRealContent;   // allowed substantive non-meme words
    private final int maxTokens;        // "short comment" ceiling

    public BrainrotDetector() {
        this(defaultLexicon(), 3, 0.5, 2, 12);
    }

    public BrainrotDetector(Map<String, Integer> lexicon, int hideWeight,
                            double minDensity, int maxRealContent, int maxTokens) {
        this.lexicon = lexicon;
        this.hideWeight = hideWeight;
        this.minDensity = minDensity;
        this.maxRealContent = maxRealContent;
        this.maxTokens = maxTokens;
    }

    public static Map<String, Integer> defaultLexicon() {
        Map<String, Integer> m = new HashMap<>();
        m.put("spiral", 2);
        m.put("mojang", 2);
        m.put("bedrock", 2);
        m.put("anti", 1);
        m.put("viral", 1);
        m.put("fix", 1);
        return m;
    }

    /** Convenience entry point: true if the comment text should be hidden. */
    public boolean shouldHide(String commentText) {
        return evaluate(commentText).hide;
    }

    /**
     * Evaluate delimited buffer text one segment at a time and hide if <b>any</b> segment is
     * brainrot. A Litho component buffer yields many strings — the comment text, but also the
     * author, "Reply"/"Like", timestamps and internal layout identifiers. Scoring the whole
     * concatenation dilutes the meme density so real spam scores too low; scoring each segment
     * in isolation keeps the comment-text segment (a full sentence stays one segment, since
     * spaces are ASCII) separate from the surrounding noise.
     *
     * @param delimitedText {@code BufferAsciiStrings.getStrings()} output (segments joined by
     *                      the {@code ❙} U+2759 delimiter).
     */
    public boolean shouldHideAnySegment(String delimitedText) {
        if (delimitedText == null || delimitedText.isEmpty()) return false;
        for (String segment : delimitedText.split("[❙\\n\\r]+")) {
            if (shouldHide(segment)) return true;
        }
        return false;
    }

    // ---- normalization -------------------------------------------------------

    /** Per-char homoglyph / leetspeak folding to a base latin letter. */
    private static char fold(char c) {
        switch (c) {
            case '0': return 'o';
            case '1': case '|': case '!': return 'i';
            case '3': return 'e';
            case '4': case '@': return 'a';
            case '5': case '$': return 's';
            case '7': return 't';
            case '8': return 'b';
            case '9': return 'g';
            // common cyrillic / greek look-alikes
            case 'а': return 'a'; // а
            case 'е': return 'e'; // е
            case 'о': return 'o'; // о
            case 'р': return 'p'; // р
            case 'с': return 'c'; // с
            case 'х': return 'x'; // х
            case 'ѕ': return 's'; // ѕ
            case 'α': return 'a'; // α
            case 'ο': return 'o'; // ο
            default: return c;
        }
    }

    /** 3+ repeats of a letter -&gt; 1 (obfuscation); 1-2 repeats kept (legit doubles). */
    private static String capRuns(String s) {
        StringBuilder sb = new StringBuilder(s.length());
        int i = 0;
        while (i < s.length()) {
            char c = s.charAt(i);
            int j = i;
            while (j < s.length() && s.charAt(j) == c) j++;
            int len = j - i;
            sb.append(c);
            if (len == 2) sb.append(c); // keep legit doubles, collapse 3+ to 1
            i = j;
        }
        return sb.toString();
    }

    /** Result of normalization: word tokens plus whether obfuscation was observed. */
    static final class Norm {
        final List<String> tokens = new ArrayList<>();
        boolean obfuscated; // leet/homoglyph fold, letter-spacing, concatenation, or repeats seen
    }

    Norm normalize(String text) {
        Norm n = new Norm();
        if (text == null) return n;

        // 1. Unicode NFKD, drop combining marks and zero-width chars, fold look-alikes.
        String d = Normalizer.normalize(text, Normalizer.Form.NFKD);
        StringBuilder cleaned = new StringBuilder(d.length());
        for (int i = 0; i < d.length(); i++) {
            char c = d.charAt(i);
            int type = Character.getType(c);
            if (type == Character.NON_SPACING_MARK || type == Character.ENCLOSING_MARK
                    || c == '​' || c == '‌' || c == '‍' || c == '﻿') {
                continue; // strip combining / zero-width
            }
            char lower = Character.toLowerCase(c);
            char f = fold(lower);
            if (f != lower) n.obfuscated = true;
            if (f >= 'a' && f <= 'z') {
                cleaned.append(f);
            } else {
                cleaned.append(' '); // any non-letter becomes a boundary
            }
        }

        // 2. Tokenize on whitespace.
        String[] raw = cleaned.toString().trim().split("\\s+");

        // 3. Coalesce runs of single-letter tokens (defeats "s p i r a l"); a coalesced
        //    blob is known-obfuscated, so segment it into lexicon words unconditionally.
        List<String> merged = new ArrayList<>();
        StringBuilder acc = new StringBuilder();
        int singleRun = 0;
        for (String t : raw) {
            if (t.isEmpty()) continue;
            if (t.length() == 1) {
                acc.append(t);
                singleRun++;
            } else {
                flushSingles(merged, acc, singleRun, n);
                acc.setLength(0);
                singleRun = 0;
                merged.add(t);
            }
        }
        flushSingles(merged, acc, singleRun, n);

        // 4. Collapse obfuscation-repeats, then split deliberate concatenations
        //    ("fixmojangbedrock", "antispiral") back into meme words when clearly spam.
        for (String t : merged) {
            String capped = capRuns(t);
            if (!capped.equals(t)) n.obfuscated = true;
            List<String> seg = segment(capped);
            if (seg != null && (seg.size() >= 3 || containsStrong(seg))) {
                n.tokens.addAll(seg);
                n.obfuscated = true;
            } else {
                n.tokens.add(capped);
            }
        }
        return n;
    }

    private void flushSingles(List<String> out, StringBuilder acc, int singleRun, Norm n) {
        if (singleRun >= 3) {
            String blob = capRuns(acc.toString());
            List<String> seg = segment(blob);
            if (seg != null) out.addAll(seg);
            else out.add(blob);
            n.obfuscated = true;
        } else if (acc.length() > 0) {
            for (char c : acc.toString().toCharArray()) out.add(String.valueOf(c));
        }
    }

    /** Greedy longest-match segmentation of a token fully into lexicon words, else null. */
    private List<String> segment(String token) {
        if (token.length() < 4) return null;
        if (lexicon.containsKey(token)) return null; // already a single meme word
        List<String> out = new ArrayList<>();
        int i = 0;
        while (i < token.length()) {
            String best = null;
            for (String w : lexicon.keySet()) {
                if (token.startsWith(w, i) && (best == null || w.length() > best.length())) best = w;
            }
            if (best == null) return null; // not fully segmentable
            out.add(best);
            i += best.length();
        }
        return out.size() >= 2 ? out : null;
    }

    private boolean containsStrong(List<String> seg) {
        for (String w : seg) if (lexicon.getOrDefault(w, 0) >= 2) return true;
        return false;
    }

    // ---- lexicon matching ----------------------------------------------------

    private static boolean hasVowel(String t) {
        for (int i = 0; i < t.length(); i++) if ("aeiou".indexOf(t.charAt(i)) >= 0) return true;
        return false;
    }

    /** @return 0 if within 1 edit, else &gt;1. */
    private static int editDistanceLE1(String a, String b) {
        if (a.equals(b)) return 0;
        int la = a.length(), lb = b.length();
        if (Math.abs(la - lb) > 1) return 2;
        int i = 0, j = 0, edits = 0;
        while (i < la && j < lb) {
            if (a.charAt(i) == b.charAt(j)) { i++; j++; continue; }
            if (++edits > 1) return 2;
            if (la > lb) i++;
            else if (lb > la) j++;
            else { i++; j++; }
        }
        if (i < la || j < lb) edits++;
        return edits <= 1 ? 1 : 2;
    }

    /** @return lexicon weight of token, or 0 if not a meme token. */
    private int lexWeight(String token) {
        Integer w = lexicon.get(token);
        if (w != null) return w;
        if (token.length() >= 5) { // tolerate one leftover typo/obfuscation char on longer words
            for (Map.Entry<String, Integer> e : lexicon.entrySet()) {
                if (e.getKey().length() >= 5 && editDistanceLE1(token, e.getKey()) <= 1) return e.getValue();
            }
        }
        return 0;
    }

    private String canonicalMeme(String t) {
        if (lexicon.containsKey(t)) return t;
        if (t.length() >= 5) {
            for (String k : lexicon.keySet()) {
                if (k.length() >= 5 && editDistanceLE1(t, k) <= 1) return k;
            }
        }
        return t;
    }

    // ---- decision ------------------------------------------------------------

    public static final class Verdict {
        public final boolean hide;
        public final String reason;

        Verdict(boolean hide, String reason) {
            this.hide = hide;
            this.reason = reason;
        }

        @Override
        public String toString() {
            return (hide ? "HIDE" : "keep") + " (" + reason + ")";
        }
    }

    public Verdict evaluate(String comment) {
        Norm n = normalize(comment);
        int total = n.tokens.size();
        if (total == 0) return new Verdict(false, "empty");

        int weight = 0, memeCount = 0, realContent = 0;
        Map<String, Integer> memeCounts = new HashMap<>();
        for (String t : n.tokens) {
            int w = lexWeight(t);
            if (w > 0) {
                weight += w;
                memeCount++;
                memeCounts.merge(canonicalMeme(t), 1, Integer::sum);
            } else if (t.length() >= 3 && hasVowel(t)) {
                realContent++; // a substantive-looking word
            }
        }
        int distinctMeme = memeCounts.size();
        if (distinctMeme == 0) return new Verdict(false, "no meme tokens");

        boolean repetition = memeCounts.values().stream().anyMatch(c -> c >= 2);
        double density = (double) memeCount / total;

        boolean shortAndDominant = total <= maxTokens
                && density >= minDensity
                && realContent <= maxRealContent;

        boolean strongSignal = weight >= hideWeight
                || distinctMeme >= 2
                || repetition
                || n.obfuscated;

        boolean hide = shortAndDominant && strongSignal;
        String reason = String.format(
                "tokens=%d meme=%d distinct=%d weight=%d density=%.2f real=%d rep=%b obf=%b",
                total, memeCount, distinctMeme, weight, density, realContent, repetition, n.obfuscated);
        return new Verdict(hide, reason);
    }
}
