package dev.skulldogged.cobalt.extension;

import android.app.DownloadManager;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

final class CobaltDownloadRepository {
    static final String STATE_AUTHORIZING = "authorizing";
    static final String STATE_PREPARING = "preparing";
    static final String STATE_DOWNLOADING = "downloading";
    static final String STATE_FINALIZING = "finalizing";
    static final String STATE_COMPLETE = "complete";
    static final String STATE_FAILED = "failed";

    private static final String PREFS = "cobalt_download_history";
    private static final String KEY_RECORDS = "records";
    private static final int MAX_RECORDS = 100;
    private static final Object LOCK = new Object();

    private CobaltDownloadRepository() {
    }

    static String create(Context context, String sourceUrl) {
        String id = UUID.randomUUID().toString();
        Record record = new Record();
        record.id = id;
        record.sourceUrl = sourceUrl;
        record.filename = videoIdFrom(sourceUrl);
        record.state = STATE_PREPARING;
        record.createdAt = System.currentTimeMillis();
        record.updatedAt = record.createdAt;
        saveRecord(context, record);
        return id;
    }

    static void prepareRetry(Context context, String id) {
        update(context, id, record -> {
            record.state = STATE_PREPARING;
            record.progress = 0;
            record.receivedBytes = 0;
            record.totalBytes = -1;
            record.outputUri = null;
            record.downloadManagerId = -1;
            record.error = null;
        });
    }

    static void setAuthorizing(Context context, String id) {
        update(context, id, record -> {
            record.state = STATE_AUTHORIZING;
            record.progress = 0;
            record.receivedBytes = 0;
            record.totalBytes = -1;
            record.error = null;
        });
    }

    static void setFilename(Context context, String id, String filename) {
        update(context, id, record -> {
            if (filename != null && !filename.trim().isEmpty()) {
                record.filename = filename.trim();
            }
        });
    }

    static void setDownloading(
            Context context,
            String id,
            String filename,
            long received,
            long total,
            int progress
    ) {
        update(context, id, record -> {
            record.state = STATE_DOWNLOADING;
            if (filename != null && !filename.trim().isEmpty()) {
                record.filename = filename.trim();
            }
            record.receivedBytes = Math.max(0, received);
            record.totalBytes = total;
            record.progress = Math.max(0, Math.min(99, progress));
            record.error = null;
        });
    }

    static void setFinalizing(Context context, String id, String filename, int progress) {
        update(context, id, record -> {
            record.state = STATE_FINALIZING;
            if (filename != null && !filename.trim().isEmpty()) {
                record.filename = filename.trim();
            }
            record.progress = Math.max(0, Math.min(99, progress));
            record.error = null;
        });
    }

    static void setDirect(Context context, String id, String filename, long downloadManagerId) {
        update(context, id, record -> {
            record.state = STATE_DOWNLOADING;
            record.filename = filename;
            record.downloadManagerId = downloadManagerId;
            record.progress = 0;
            record.error = null;
        });
    }

    static void setComplete(Context context, String id, String filename, Uri outputUri) {
        update(context, id, record -> {
            record.state = STATE_COMPLETE;
            record.filename = filename;
            record.outputUri = outputUri == null ? null : outputUri.toString();
            record.progress = 100;
            record.error = null;
        });
    }

    static void setFailed(Context context, String id, String error) {
        update(context, id, record -> {
            record.state = STATE_FAILED;
            record.error = error;
        });
    }

    static Record find(Context context, String id) {
        synchronized (LOCK) {
            for (Record record : read(context)) {
                if (record.id.equals(id)) {
                    return record;
                }
            }
            return null;
        }
    }

    static List<Record> list(Context context) {
        synchronized (LOCK) {
            List<Record> records = read(context);
            refreshDownloadManager(context, records);
            Collections.sort(records, (left, right) -> Long.compare(right.createdAt, left.createdAt));
            return records;
        }
    }

    static void delete(Context context, String id, boolean deleteFile) {
        synchronized (LOCK) {
            List<Record> records = read(context);
            Record target = null;
            for (Record record : records) {
                if (record.id.equals(id)) {
                    target = record;
                    break;
                }
            }
            if (target == null) {
                return;
            }
            if (deleteFile) {
                deleteOutput(context, target);
            }
            records.remove(target);
            write(context, records);
        }
    }

    private static void deleteOutput(Context context, Record record) {
        try {
            if (record.downloadManagerId >= 0) {
                DownloadManager manager = context.getSystemService(DownloadManager.class);
                if (manager != null) {
                    manager.remove(record.downloadManagerId);
                }
            } else if (record.outputUri != null) {
                context.getContentResolver().delete(Uri.parse(record.outputUri), null, null);
            }
        } catch (RuntimeException ignored) {
            // The file may already have been removed outside the app.
        }
    }

    private static void refreshDownloadManager(Context context, List<Record> records) {
        DownloadManager manager = context.getSystemService(DownloadManager.class);
        if (manager == null) {
            return;
        }
        boolean changed = false;
        for (Record record : records) {
            if (record.downloadManagerId < 0 || STATE_COMPLETE.equals(record.state)
                    || STATE_FAILED.equals(record.state)) {
                continue;
            }
            try (Cursor cursor = manager.query(
                    new DownloadManager.Query().setFilterById(record.downloadManagerId))) {
                if (cursor == null || !cursor.moveToFirst()) {
                    continue;
                }
                int status = cursor.getInt(cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_STATUS));
                long received = cursor.getLong(cursor.getColumnIndexOrThrow(
                        DownloadManager.COLUMN_BYTES_DOWNLOADED_SO_FAR));
                long total = cursor.getLong(cursor.getColumnIndexOrThrow(
                        DownloadManager.COLUMN_TOTAL_SIZE_BYTES));
                record.receivedBytes = received;
                record.totalBytes = total;
                record.progress = total > 0 ? (int) Math.min(99, received * 100 / total) : 0;
                record.updatedAt = System.currentTimeMillis();
                if (status == DownloadManager.STATUS_SUCCESSFUL) {
                    Uri uri = manager.getUriForDownloadedFile(record.downloadManagerId);
                    record.outputUri = uri == null ? null : uri.toString();
                    record.state = STATE_COMPLETE;
                    record.progress = 100;
                } else if (status == DownloadManager.STATUS_FAILED) {
                    int reason = cursor.getInt(cursor.getColumnIndexOrThrow(DownloadManager.COLUMN_REASON));
                    record.state = STATE_FAILED;
                    record.error = "Android DownloadManager failed (reason " + reason + ")";
                }
                changed = true;
            } catch (RuntimeException ignored) {
                // Leave the last known state visible.
            }
        }
        if (changed) {
            write(context, records);
        }
    }

    private static void saveRecord(Context context, Record record) {
        synchronized (LOCK) {
            List<Record> records = read(context);
            records.add(record);
            Collections.sort(records, (left, right) -> Long.compare(right.createdAt, left.createdAt));
            if (records.size() > MAX_RECORDS) {
                records = new ArrayList<>(records.subList(0, MAX_RECORDS));
            }
            write(context, records);
        }
    }

    private static void update(Context context, String id, RecordUpdate update) {
        if (id == null) {
            return;
        }
        synchronized (LOCK) {
            List<Record> records = read(context);
            for (Record record : records) {
                if (record.id.equals(id)) {
                    update.apply(record);
                    record.updatedAt = System.currentTimeMillis();
                    write(context, records);
                    return;
                }
            }
        }
    }

    private static List<Record> read(Context context) {
        List<Record> records = new ArrayList<>();
        String raw = preferences(context).getString(KEY_RECORDS, "[]");
        try {
            JSONArray array = new JSONArray(raw);
            for (int index = 0; index < array.length(); index++) {
                JSONObject json = array.optJSONObject(index);
                if (json != null) {
                    records.add(Record.fromJson(json));
                }
            }
        } catch (Exception ignored) {
            // A corrupt history should not prevent new downloads.
        }
        return records;
    }

    private static void write(Context context, List<Record> records) {
        JSONArray array = new JSONArray();
        for (Record record : records) {
            array.put(record.toJson());
        }
        preferences(context).edit().putString(KEY_RECORDS, array.toString()).apply();
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
    }

    private static String videoIdFrom(String url) {
        if (url == null) {
            return "YouTube video";
        }
        int marker = url.indexOf("v=");
        return marker >= 0 ? url.substring(marker + 2) : "YouTube video";
    }

    private interface RecordUpdate {
        void apply(Record record);
    }

    static final class Record {
        String id;
        String sourceUrl;
        String filename;
        String state;
        String outputUri;
        String error;
        int progress;
        long receivedBytes;
        long totalBytes = -1;
        long downloadManagerId = -1;
        long createdAt;
        long updatedAt;

        JSONObject toJson() {
            JSONObject json = new JSONObject();
            try {
                json.put("id", id);
                json.put("sourceUrl", sourceUrl);
                json.put("filename", filename);
                json.put("state", state);
                json.put("outputUri", outputUri);
                json.put("error", error);
                json.put("progress", progress);
                json.put("receivedBytes", receivedBytes);
                json.put("totalBytes", totalBytes);
                json.put("downloadManagerId", downloadManagerId);
                json.put("createdAt", createdAt);
                json.put("updatedAt", updatedAt);
            } catch (Exception ignored) {
                // JSONObject only rejects non-finite numbers, none are stored here.
            }
            return json;
        }

        static Record fromJson(JSONObject json) {
            Record record = new Record();
            record.id = json.optString("id", UUID.randomUUID().toString());
            record.sourceUrl = json.optString("sourceUrl", "");
            record.filename = json.optString("filename", "YouTube video");
            record.state = json.optString("state", STATE_FAILED);
            record.outputUri = nullable(json, "outputUri");
            record.error = nullable(json, "error");
            record.progress = json.optInt("progress", 0);
            record.receivedBytes = json.optLong("receivedBytes", 0);
            record.totalBytes = json.optLong("totalBytes", -1);
            record.downloadManagerId = json.optLong("downloadManagerId", -1);
            record.createdAt = json.optLong("createdAt", System.currentTimeMillis());
            record.updatedAt = json.optLong("updatedAt", record.createdAt);
            return record;
        }

        private static String nullable(JSONObject json, String key) {
            return json.isNull(key) ? null : json.optString(key, null);
        }
    }
}
