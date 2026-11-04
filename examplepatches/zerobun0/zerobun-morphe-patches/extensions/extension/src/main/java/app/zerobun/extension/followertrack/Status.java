/*
 * Zerobun Morphe patches - GPLv3.
 *
 * The capture indicator's state. New in v2.
 *
 * v1.0.0 showed nothing at all, which is why every upload being rejected by Authelia
 * on 2026-11-03 went unnoticed until the server was inspected. The user's words:
 * "there's no thingy or display or whatever that helps me to know".
 *
 * This holds what is happening now, for the on-screen HUD and the profile status
 * sheet to read. In memory only and deliberately so: it describes the capture you
 * are doing at this moment. The durable record is the server's, and the Zerobun app
 * shows that - see the "phone truth vs server truth" split in
 * docs/superpowers/plans/2026-11-03-instagram-patch-v2.md.
 */

package app.zerobun.extension.followertrack;

import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicReference;

@SuppressWarnings("unused")
public final class Status {

    /** Upload state for the current capture. */
    public enum Upload { IDLE, UPLOADING, UPLOADED, QUEUED, FAILED }

    private static final AtomicReference<String> target = new AtomicReference<>(null);
    private static final AtomicReference<String> category = new AtomicReference<>(null);
    private static final AtomicInteger captured = new AtomicInteger(0);
    /** The profile's own count, so progress has an honest denominator - or 0. */
    private static final AtomicInteger expected = new AtomicInteger(0);
    private static final AtomicInteger batches = new AtomicInteger(0);
    private static final AtomicInteger queued = new AtomicInteger(0);
    private static final AtomicReference<Upload> upload =
            new AtomicReference<>(Upload.IDLE);
    private static final AtomicReference<String> lastError = new AtomicReference<>(null);
    private static final AtomicLong changedAt = new AtomicLong(0);
    private static final AtomicReference<Runnable> listener = new AtomicReference<>(null);
    private static final AtomicReference<Boolean> complete = new AtomicReference<>(false);

    private Status() {}

    /** The HUD registers here; null when it goes away. */
    public static void setListener(Runnable r) {
        listener.set(r);
    }

    private static void changed() {
        changedAt.set(System.currentTimeMillis());
        Runnable r = listener.get();
        if (r != null) {
            try {
                r.run();
            } catch (Exception ignored) {
                // A broken HUD must never break a capture.
            }
        }
    }

    public static void beginCapture(String who, String which, int expectedCount) {
        String previous = target.get();
        if (previous == null || !previous.equals(who)
                || category.get() == null || !category.get().equals(which)) {
            captured.set(0);
            batches.set(0);
            complete.set(false);
            lastError.set(null);
            upload.set(Upload.IDLE);
        }
        target.set(who);
        category.set(which);
        if (expectedCount > 0) expected.set(expectedCount);
        changed();
    }

    /**
     * Records how long the list should be, once that is known.
     *
     * Only ever raises it. The number can be read while the list is still paging, and
     * a later, smaller reading (a partially rendered label, a different count on the
     * same screen) must not shrink the target and make a short capture look finished.
     */
    public static void setExpected(int count) {
        if (count > expected.get()) {
            expected.set(count);
            changed();
        }
    }

    public static void rowsCaptured(int total) {
        captured.set(total);
        changed();
    }

    public static void uploading(int rows) {
        upload.set(Upload.UPLOADING);
        changed();
    }

    public static void uploaded(int rows) {
        upload.set(Upload.UPLOADED);
        batches.incrementAndGet();
        lastError.set(null);
        changed();
    }

    public static void uploadFailed(String reason) {
        upload.set(Upload.FAILED);
        lastError.set(reason);
        changed();
    }

    public static void queueDepth(int depth) {
        queued.set(depth);
        if (depth > 0 && upload.get() != Upload.FAILED) upload.set(Upload.QUEUED);
        changed();
    }

    /**
     * Marks the capture complete.
     *
     * Only ever called when the list really reached its end AND the closing drop was
     * acknowledged by the tracker. "Complete" must mean the same thing here as it does
     * on the server, or the indicator becomes a lie: the server applies a capture as a
     * whole list only when the rows are within COMPLETE_RATIO (0.9) of the profile's
     * own count, so the same ratio is checked here.
     */
    public static void markComplete() {
        complete.set(serverWouldAccept());
        changed();
    }

    /** Whether the server will treat this capture as the whole list. */
    public static boolean serverWouldAccept() {
        int rows = captured.get();
        int want = expected.get();
        if (rows <= 0) return false;
        if (want <= 0) return false;  // no denominator: cannot claim completeness
        return rows >= (int) Math.floor(want * 0.9d);
    }

    public static String getTarget() { return target.get(); }

    public static String getCategory() { return category.get(); }

    public static int getCaptured() { return captured.get(); }

    public static int getExpected() { return expected.get(); }

    public static int getBatches() { return batches.get(); }

    public static int getQueued() { return queued.get(); }

    public static Upload getUpload() { return upload.get(); }

    public static String getLastError() { return lastError.get(); }

    public static boolean isComplete() { return Boolean.TRUE.equals(complete.get()); }

    public static boolean isActive() {
        return target.get() != null
                && System.currentTimeMillis() - changedAt.get() < 60_000L;
    }

    /** One line for the HUD, and the same words for the status sheet. */
    public static String headline() {
        if (target.get() == null) return "Not capturing";
        if (isComplete()) {
            return "Complete - " + captured.get() + " of " + expected.get()
                    + " captured and uploaded";
        }
        String base = "Capturing " + (category.get() == null ? "list" : category.get());
        int want = expected.get();
        return base + " - " + captured.get() + (want > 0 ? " / " + want : " so far");
    }

    /** The second line: what the upload is doing, in plain words. */
    public static String uploadLine() {
        Upload state = upload.get();
        switch (state) {
            case UPLOADING:
                return "uploading...";
            case UPLOADED:
                return "uploaded - " + batches.get()
                        + (batches.get() == 1 ? " batch" : " batches");
            case QUEUED:
                return "queued - " + queued.get() + " waiting to send";
            case FAILED:
                String reason = lastError.get();
                return "upload failed: " + (reason == null ? "unknown reason" : reason);
            case IDLE:
            default:
                return "";
        }
    }

    public static void reset() {
        target.set(null);
        category.set(null);
        captured.set(0);
        expected.set(0);
        batches.set(0);
        queued.set(0);
        complete.set(false);
        lastError.set(null);
        upload.set(Upload.IDLE);
        changed();
    }
}
