package app.fontism.extension.orca;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.FutureTask;
import java.util.concurrent.RejectedExecutionException;

/**
 * File.text() probes existence before reading. One URI must execute its command
 * only once; a finished response is reused only while the store's epoch is
 * unchanged, so repeated mutations always observe their own commit. In-flight
 * work is shared by both opens of the same read.
 */
final class OrcaRequestCache {
    interface Epoch {
        long current();
    }

    private static final class Entry {
        FutureTask<byte[]> task;
        volatile long stamp = Long.MIN_VALUE;
    }

    private final int capacity;
    private final Epoch epoch;
    private final Map<String, Entry> responses = new LinkedHashMap<>();

    OrcaRequestCache(int capacity, Epoch epoch) {
        this.capacity = capacity;
        this.epoch = epoch;
    }

    synchronized FutureTask<byte[]> get(String request, Callable<byte[]> operation, Executor worker) {
        Entry existing = responses.get(request);
        if (existing != null && (!existing.task.isDone() || existing.stamp == epoch.current()))
            return existing.task;
        Iterator<Entry> iterator = responses.values().iterator();
        while (responses.size() >= capacity && iterator.hasNext()) {
            if (iterator.next().task.isDone()) iterator.remove();
        }
        if (responses.size() >= capacity) throw new RejectedExecutionException("Font settings are busy");
        final Entry entry = new Entry();
        entry.task = new FutureTask<>(() -> {
            byte[] response = operation.call();
            // The worker is single-threaded, so no commit can interleave this stamp.
            entry.stamp = epoch.current();
            return response;
        });
        responses.put(request, entry);
        try { worker.execute(entry.task); }
        catch (RuntimeException rejected) { responses.remove(request); throw rejected; }
        return entry.task;
    }
}
