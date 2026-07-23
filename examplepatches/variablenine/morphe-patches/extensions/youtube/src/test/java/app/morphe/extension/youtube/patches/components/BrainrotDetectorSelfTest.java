package app.morphe.extension.youtube.patches.components;

/**
 * Dependency-free self-test for {@link BrainrotDetector}. Runs with a plain JDK, no Gradle or
 * JUnit required:
 *
 * <pre>
 *   cd extensions/youtube/src
 *   javac main/java/app/morphe/extension/youtube/patches/components/BrainrotDetector.java -d /tmp/bd
 *   javac -cp /tmp/bd test/java/app/morphe/extension/youtube/patches/components/BrainrotDetectorSelfTest.java -d /tmp/bd
 *   java  -cp /tmp/bd app.morphe.extension.youtube.patches.components.BrainrotDetectorSelfTest
 * </pre>
 *
 * Exits non-zero if any case fails.
 */
public final class BrainrotDetectorSelfTest {
    private static int pass = 0, fail = 0;

    private static void check(BrainrotDetector d, boolean expectHide, String comment) {
        BrainrotDetector.Verdict v = d.evaluate(comment);
        boolean ok = v.hide == expectHide;
        if (ok) pass++; else fail++;
        System.out.printf("%s  expect=%-4s got=%-4s | %-42s | %s%n",
                ok ? "PASS" : "FAIL",
                expectHide ? "HIDE" : "keep",
                v.hide ? "HIDE" : "keep",
                comment.length() > 42 ? comment.substring(0, 39) + "..." : comment,
                v.reason);
    }

    private static void checkSeg(BrainrotDetector d, boolean expectHide, String delimited) {
        boolean got = d.shouldHideAnySegment(delimited);
        boolean ok = got == expectHide;
        if (ok) pass++; else fail++;
        System.out.printf("%s  expect=%-4s got=%-4s | %s%n",
                ok ? "PASS" : "FAIL",
                expectHide ? "HIDE" : "keep",
                got ? "HIDE" : "keep",
                delimited.length() > 60 ? delimited.substring(0, 57) + "..." : delimited);
    }

    public static void main(String[] args) {
        BrainrotDetector d = new BrainrotDetector();

        System.out.println("=== SHOULD HIDE (brainrot spam) ===");
        check(d, true, "anti spiral");
        check(d, true, "fix mojang bedrock");
        check(d, true, "anti spiral viral");
        check(d, true, "anti viral");
        check(d, true, "anti anti spiral");
        check(d, true, "anti spiral anti viral spiral");
        check(d, true, "FIX MOJANG BEDROCK");
        check(d, true, "f1x m0jang b3dr0ck");
        check(d, true, "🅰nti sp1ral");
        check(d, true, "s p i r a l");
        check(d, true, "a n t i  s p i r a l");
        check(d, true, "antiiii spiraaaal");
        check(d, true, "anti-spiral!!!");
        check(d, true, "fix bedrock mojang fix bedrock");

        System.out.println();
        System.out.println("=== SHOULD KEEP (legit comments) ===");
        check(d, false, "the anti-spiral arc was peak animation honestly");
        check(d, false, "fix bedrock please mojang the redstone is broken");
        check(d, false, "i love how the spiral power scales in this fight");
        check(d, false, "this antiviral medication actually worked for me");
        check(d, false, "mojang really needs to fix the bedrock parity issues with java redstone");
        check(d, false, "great video, the editing on this is insane");
        check(d, false, "anti");
        check(d, false, "the bedrock of this community is the modders who fix everything");

        System.out.println();
        System.out.println("=== shouldHideAnySegment (real buffer: comment text + surrounding noise) ===");
        // '❙' (U+2759) is the delimiter BufferAsciiStrings.getStrings() joins runs with.
        final String X = "❙";
        // The exact failure from the screenshot: pure brainrot comment amid author/UI/layout runs.
        checkSeg(d, true, "FIX MOJANG BEDROCK" + X + "SomeUser" + X + "Reply" + X + "Like" + X + "comment_thread.eml");
        checkSeg(d, true, "CoolUser" + X + "anti spiral viral" + X + "Reply" + X + "1.2K" + X + "comments_entry_point_teaser");
        // Legit comment mentioning the words, surrounded by the same noise -> must NOT hide.
        checkSeg(d, false, "the anti-spiral arc was peak animation honestly" + X + "GurrenFan" + X + "Reply" + X + "comment_thread.eml");
        checkSeg(d, false, "mojang really needs to fix the bedrock parity issues" + X + "RedstoneNerd" + X + "Reply");
        // Buffer with no comment-text brainrot at all -> keep.
        checkSeg(d, false, "great video" + X + "SpiralStudios" + X + "Reply" + X + "Like" + X + "comment_thread.eml");

        System.out.println();
        System.out.printf("RESULT: %d passed, %d failed%n", pass, fail);
        if (fail > 0) System.exit(1);
    }
}
