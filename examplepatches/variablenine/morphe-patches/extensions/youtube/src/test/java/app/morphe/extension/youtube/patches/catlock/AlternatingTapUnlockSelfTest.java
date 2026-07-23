package app.morphe.extension.youtube.patches.catlock;

import app.morphe.extension.youtube.patches.catlock.AlternatingTapUnlock.Side;

/**
 * Dependency-free self-test for {@link AlternatingTapUnlock}. Runs with a plain JDK:
 *
 * <pre>
 *   cd extensions/youtube/src
 *   javac main/java/app/morphe/extension/youtube/patches/catlock/AlternatingTapUnlock.java -d /tmp/cl
 *   javac -cp /tmp/cl test/java/app/morphe/extension/youtube/patches/catlock/AlternatingTapUnlockSelfTest.java -d /tmp/cl
 *   java  -cp /tmp/cl app.morphe.extension.youtube.patches.catlock.AlternatingTapUnlockSelfTest
 * </pre>
 */
public final class AlternatingTapUnlockSelfTest {
    private static int pass = 0, fail = 0;

    private static void check(boolean cond, String name) {
        if (cond) pass++; else fail++;
        System.out.printf("%s  %s%n", cond ? "PASS" : "FAIL", name);
    }

    /** Feed a side sequence at a fixed cadence; return true if unlock fires on any tap. */
    private static boolean feed(AlternatingTapUnlock u, long stepMs, Side... sides) {
        long t = 1000;
        boolean fired = false;
        for (Side s : sides) {
            fired |= u.onTap(t, s);
            t += stepMs;
        }
        return fired;
    }

    public static void main(String[] args) {
        Side L = Side.LEFT, R = Side.RIGHT, M = Side.MIDDLE;

        // --- SHOULD UNLOCK ---
        check(feed(new AlternatingTapUnlock(), 150, L, R, L, R, L, R), "fast L-R x6 unlocks");
        check(feed(new AlternatingTapUnlock(), 150, R, L, R, L, R, L), "fast R-L x6 unlocks");
        check(feed(new AlternatingTapUnlock(), 300, L, R, L, R, L, R), "300ms cadence still within window");
        // middle taps interspersed are ignored, real alternations still count
        check(feed(new AlternatingTapUnlock(), 150, L, M, R, M, L, R, L, R), "middle taps ignored, still unlocks");

        // --- SHOULD NOT UNLOCK ---
        check(!feed(new AlternatingTapUnlock(), 150, L, L, L, L, L, L, L, L), "same side (cat pawing) never unlocks");
        check(!feed(new AlternatingTapUnlock(), 150, L, R, L, L, R, L), "a same-side break resets the run");
        check(!feed(new AlternatingTapUnlock(), 1500, L, R, L, R, L, R), "too-slow alternation never unlocks");
        check(!feed(new AlternatingTapUnlock(), 150, L, R, L, R, L), "only 5 taps (need 6) does not unlock");
        check(!feed(new AlternatingTapUnlock(), 150, M, M, M, M, M, M), "all middle taps never unlock");

        // --- recovery: a broken run followed by a clean run unlocks ---
        AlternatingTapUnlock u = new AlternatingTapUnlock();
        feed(u, 150, L, L, L);                 // garbage
        boolean later = feed(u, 150, R, L, R, L, R, L); // clean run after
        check(later, "clean run after garbage still unlocks");

        // --- sideForX zoning ---
        AlternatingTapUnlock z = new AlternatingTapUnlock();
        check(z.sideForX(50, 1000) == L && z.sideForX(950, 1000) == R && z.sideForX(500, 1000) == M,
                "sideForX zones left/right/middle correctly");

        System.out.printf("%nRESULT: %d passed, %d failed%n", pass, fail);
        if (fail > 0) System.exit(1);
    }
}
