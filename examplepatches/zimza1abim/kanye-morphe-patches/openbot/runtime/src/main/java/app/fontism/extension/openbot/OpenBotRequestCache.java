package app.fontism.extension.openbot;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import java.util.concurrent.FutureTask;
import java.util.concurrent.RejectedExecutionException;

/** File.text() probes existence before reading. One URI must execute its command only once. */
final class OpenBotRequestCache {
    private final int capacity;
    private final Map<String, FutureTask<byte[]>> responses = new LinkedHashMap<>();

    OpenBotRequestCache(int capacity) { this.capacity = capacity; }

    synchronized FutureTask<byte[]> get(String request, Callable<byte[]> operation, Executor worker) {
        FutureTask<byte[]> existing = responses.get(request);
        if (existing != null) return existing;
        Iterator<FutureTask<byte[]>> iterator = responses.values().iterator();
        while (responses.size() >= capacity && iterator.hasNext()) {
            if (iterator.next().isDone()) iterator.remove();
        }
        if (responses.size() >= capacity) throw new RejectedExecutionException("Font settings are busy");
        FutureTask<byte[]> task = new FutureTask<>(operation);
        responses.put(request, task);
        try { worker.execute(task); }
        catch (RuntimeException rejected) { responses.remove(request); throw rejected; }
        return task;
    }
}
