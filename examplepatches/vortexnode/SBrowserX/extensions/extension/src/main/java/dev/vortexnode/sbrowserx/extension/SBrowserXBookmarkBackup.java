package dev.vortexnode.sbrowserx.extension;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.provider.DocumentsContract;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Date;
import java.util.Deque;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Standalone native Bookmarks export/import engine for SBrowserX.
 *
 * - Exports to universal Netscape Bookmark HTML (compatible with Chrome, Firefox, Edge, Brave, Opera, Vivaldi, Safari).
 * - Imports automatically from Netscape HTML, Chromium/Chrome/Edge/Brave Bookmarks JSON, Firefox JSON, or plain URL lists.
 * - Merges cleanly into Samsung Internet's native SBrowserProvider without wiping existing bookmarks or duplicating items.
 * - Skips Secret Mode ("P") bookmarks on export for privacy.
 */
public final class SBrowserXBookmarkBackup {
    private static final String TAG = "SBrowserXBookmarks";
    private static final long FALLBACK_MY_DEVICE_ROOT_ID = -3L;

    private static final Pattern TAG_TOKEN = Pattern.compile(
            "(?is)<(/?)(dl|h3|a)(?:\\s+([^>]*))?>([^<]*)");
    private static final Pattern ATTR_HREF = Pattern.compile(
            "(?i)\\bhref\\s*=\\s*(?:\"([^\"]*)\"|'([^']*)'|([^\\s>]+))");
    private static final Pattern ATTR_ADD_DATE = Pattern.compile(
            "(?i)\\badd_date\\s*=\\s*(?:\"(\\d+)\"|'(\\d+)'|(\\d+))");
    private static final Pattern PLAIN_URL = Pattern.compile(
            "(?i)(https?://[^\\s\"'<>]+)");

    private SBrowserXBookmarkBackup() {}

    public static final class ExportResult {
        public final String html;
        public final int bookmarkCount;
        public final int folderCount;

        public ExportResult(String html, int bookmarkCount, int folderCount) {
            this.html = html;
            this.bookmarkCount = bookmarkCount;
            this.folderCount = folderCount;
        }
    }

    public static final class ImportResult {
        public final int addedBookmarks;
        public final int addedFolders;
        public final int skippedDuplicates;

        public ImportResult(int addedBookmarks, int addedFolders, int skippedDuplicates) {
            this.addedBookmarks = addedBookmarks;
            this.addedFolders = addedFolders;
            this.skippedDuplicates = skippedDuplicates;
        }
    }

    private static final class DbNode {
        long id;
        long parentId;
        boolean isFolder;
        String title;
        String url;
        long createdSec;
    }

    private static final class ParsedNode {
        boolean isFolder;
        String title;
        String url;
        long addDateMs;
        List<ParsedNode> children;

        static ParsedNode folder(String title, long addDateMs) {
            ParsedNode n = new ParsedNode();
            n.isFolder = true;
            n.title = title != null ? title.trim() : "";
            n.addDateMs = addDateMs;
            n.children = new ArrayList<>();
            return n;
        }

        static ParsedNode bookmark(String title, String url, long addDateMs) {
            ParsedNode n = new ParsedNode();
            n.isFolder = false;
            n.title = title != null ? title.trim() : "";
            n.url = url != null ? url.trim() : "";
            n.addDateMs = addDateMs;
            return n;
        }
    }

    public static String suggestedHtmlFileName() {
        String date = new SimpleDateFormat("yyyy-MM-dd", Locale.US).format(new Date());
        return "sbrowserx-bookmarks-" + date + ".html";
    }

    private static Uri getBookmarkUri(Context ctx) {
        try {
            Class<?> cls = Class.forName("com.sec.android.app.sbrowser.common.constants.sites.SBrowserProviderConstants");
            Field f = cls.getField("BOOKMARK_CONTENT_URI");
            Object val = f.get(null);
            if (val instanceof Uri) return (Uri) val;
        } catch (Throwable ignored) {}
        return Uri.parse("content://" + ctx.getPackageName() + "/bookmarks");
    }

    private static long getRootFolderId(Context ctx, Uri bookmarkUri) {
        try {
            Class<?> cls = Class.forName("com.sec.android.app.sbrowser.common.sites.BookmarkRootIDManager");
            Object mgr = cls.getMethod("getInstance", Context.class).invoke(null, ctx.getApplicationContext());
            if (mgr != null) {
                Object res = cls.getMethod("getBookmarkRootId", Uri.class).invoke(mgr, bookmarkUri);
                if (res instanceof Long) {
                    return (Long) res; // 0L (SAMSUNG) and -3L (MY_DEVICE) are both valid root IDs
                }
            }
        } catch (Throwable ignored) {}
        // Fallback: inspect an existing visible normal bookmark (e.g. Google / Galaxy Shop)
        Cursor c = null;
        try {
            c = ctx.getApplicationContext().getContentResolver().query(
                    bookmarkUri,
                    new String[] { "PARENT" },
                    "FOLDER = 0 AND DELETED = 0 AND IS_COMMITED = 0",
                    null,
                    "_ID ASC");
            if (c != null && c.moveToFirst()) {
                return c.getLong(0);
            }
        } catch (Throwable ignored) {
        } finally {
            if (c != null) try { c.close(); } catch (Throwable ignored) {}
        }
        return 0L;
    }

    private static int getRootAccountType(Context ctx, Uri bookmarkUri, long rootId) {
        try {
            Class<?> cls = Class.forName("com.sec.android.app.sbrowser.common.sites.BookmarkRootIDManager");
            Object mgr = cls.getMethod("getInstance", Context.class).invoke(null, ctx.getApplicationContext());
            if (mgr != null) {
                Object rootItem = cls.getMethod("getBookmarkRoot", Uri.class).invoke(mgr, bookmarkUri);
                if (rootItem != null) {
                    Object accType = rootItem.getClass().getMethod("getAccountType").invoke(rootItem);
                    if (accType != null) {
                        Object numVal = accType.getClass().getMethod("getNumVal").invoke(accType);
                        if (numVal instanceof Integer) return (Integer) numVal;
                    }
                }
            }
        } catch (Throwable ignored) {}
        return rootId == 0L ? 2 : 0; // 2 = AccountType.SAMSUNG, 0 = AccountType.DEVICE
    }

    public static int repairOrphanedImportedBookmarks(Context ctx) {
        if (ctx == null) return 0;
        try {
            ContentResolver cr = ctx.getApplicationContext().getContentResolver();
            Uri uri = getBookmarkUri(ctx);
            long rootId = getRootFolderId(ctx, uri);
            int accountType = getRootAccountType(ctx, uri, rootId);
            if (rootId == FALLBACK_MY_DEVICE_ROOT_ID) return 0;
            ContentValues cv = new ContentValues();
            cv.put("PARENT", rootId);
            cv.put("IS_COMMITED", 0);
            cv.put("bookmark_type", accountType);
            cv.put("SYNC3", "");
            int updated = cr.update(
                    uri,
                    cv,
                    "PARENT = ? AND TAGS = ? AND DELETED = 0",
                    new String[] { String.valueOf(FALLBACK_MY_DEVICE_ROOT_ID), "NP" });
            if (updated > 0) {
                try { cr.notifyChange(uri, null); } catch (Throwable ignored) {}
                Log.i(TAG, "Repaired " + updated + " previously imported bookmarks to rootId=" + rootId);
            }
            return updated;
        } catch (Throwable t) {
            Log.w(TAG, "repairOrphanedImportedBookmarks failed", t);
            return 0;
        }
    }

    // --- EXPORT (Universal Netscape Bookmark HTML) ---

    public static ExportResult exportBookmarksToHtml(Context ctx) throws Exception {
        ContentResolver cr = ctx.getApplicationContext().getContentResolver();
        Uri uri = getBookmarkUri(ctx);
        long rootId = getRootFolderId(ctx, uri);

        String[] projection = new String[] {
                "_ID", "TITLE", "URL", "FOLDER", "PARENT", "CREATED", "MODIFIED", "TAGS"
        };

        List<DbNode> allNodes = new ArrayList<>();
        Set<Long> knownFolderIds = new HashSet<>();

        Cursor c = null;
        try {
            c = cr.query(uri, projection, "DELETED = 0 AND IS_COMMITED = 0", null, "POSITION ASC, _ID ASC");
            if (c != null) {
                int idxId = c.getColumnIndex("_ID");
                int idxTitle = c.getColumnIndex("TITLE");
                int idxUrl = c.getColumnIndex("URL");
                int idxFolder = c.getColumnIndex("FOLDER");
                int idxParent = c.getColumnIndex("PARENT");
                int idxCreated = c.getColumnIndex("CREATED");
                int idxModified = c.getColumnIndex("MODIFIED");
                int idxTags = c.getColumnIndex("TAGS");

                while (c.moveToNext()) {
                    long id = idxId >= 0 ? c.getLong(idxId) : 0L;
                    if (id <= 0L) continue; // skip virtual root rows (-3, -4, -5, etc.)
                    String tags = idxTags >= 0 ? c.getString(idxTags) : null;
                    if ("P".equalsIgnoreCase(tags)) continue; // never export Secret Mode bookmarks

                    boolean isFolder = idxFolder >= 0 && c.getInt(idxFolder) != 0;
                    String title = idxTitle >= 0 ? c.getString(idxTitle) : "";
                    String url = idxUrl >= 0 ? c.getString(idxUrl) : "";
                    if (!isFolder && (url == null || url.trim().isEmpty())) continue;

                    DbNode node = new DbNode();
                    node.id = id;
                    node.parentId = idxParent >= 0 ? c.getLong(idxParent) : rootId;
                    node.isFolder = isFolder;
                    node.title = (title != null && !title.trim().isEmpty()) ? title.trim() : (isFolder ? "Folder" : url);
                    node.url = url != null ? url.trim() : "";

                    long ts = idxCreated >= 0 ? c.getLong(idxCreated) : 0L;
                    if (ts <= 0L && idxModified >= 0) ts = c.getLong(idxModified);
                    node.createdSec = ts > 100000000000L ? (ts / 1000L) : (ts > 0L ? ts : (System.currentTimeMillis() / 1000L));

                    allNodes.add(node);
                    if (isFolder) knownFolderIds.add(id);
                }
            }
        } finally {
            if (c != null) {
                try { c.close(); } catch (Throwable ignored) {}
            }
        }

        // Group nodes by parent; orphan nodes whose parent isn't a real folder attach to top-level
        Map<Long, List<DbNode>> byParent = new HashMap<>();
        List<DbNode> topLevel = new ArrayList<>();
        for (DbNode n : allNodes) {
            if (n.parentId == rootId || !knownFolderIds.contains(n.parentId)) {
                topLevel.add(n);
            } else {
                List<DbNode> list = byParent.get(n.parentId);
                if (list == null) {
                    list = new ArrayList<>();
                    byParent.put(n.parentId, list);
                }
                list.add(n);
            }
        }

        StringBuilder sb = new StringBuilder(4096);
        sb.append("<!DOCTYPE NETSCAPE-Bookmark-file-1>\n");
        sb.append("<!-- Exported by SBrowserX -->\n");
        sb.append("<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html; charset=UTF-8\">\n");
        sb.append("<TITLE>Bookmarks</TITLE>\n");
        sb.append("<H1>Bookmarks</H1>\n");
        sb.append("<DL><p>\n");

        int[] counts = new int[2]; // [0] = bookmarks, [1] = folders
        Set<Long> visited = new HashSet<>();
        writeHtmlNodes(sb, topLevel, byParent, visited, 1, counts);

        sb.append("</DL><p>\n");
        return new ExportResult(sb.toString(), counts[0], counts[1]);
    }

    private static void writeHtmlNodes(
            StringBuilder sb,
            List<DbNode> nodes,
            Map<Long, List<DbNode>> byParent,
            Set<Long> visited,
            int depth,
            int[] counts) {
        if (nodes == null || depth > 24) return;
        String indent = repeatIndent(depth);
        for (DbNode n : nodes) {
            if (n.isFolder) {
                if (!visited.add(n.id)) continue; // cycle guard
                counts[1]++;
                sb.append(indent)
                        .append("<DT><H3 ADD_DATE=\"").append(n.createdSec).append("\">")
                        .append(escapeHtml(n.title))
                        .append("</H3>\n");
                sb.append(indent).append("<DL><p>\n");
                writeHtmlNodes(sb, byParent.get(n.id), byParent, visited, depth + 1, counts);
                sb.append(indent).append("</DL><p>\n");
            } else {
                counts[0]++;
                sb.append(indent)
                        .append("<DT><A HREF=\"").append(escapeHtml(n.url)).append("\"")
                        .append(" ADD_DATE=\"").append(n.createdSec).append("\">")
                        .append(escapeHtml(n.title))
                        .append("</A>\n");
            }
        }
    }

    private static String repeatIndent(int depth) {
        StringBuilder sb = new StringBuilder(depth * 4);
        for (int i = 0; i < depth; i++) sb.append("    ");
        return sb.toString();
    }

    private static String escapeHtml(String s) {
        if (s == null) return "";
        StringBuilder out = new StringBuilder(s.length() + 16);
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            switch (ch) {
                case '&': out.append("&amp;"); break;
                case '<': out.append("&lt;"); break;
                case '>': out.append("&gt;"); break;
                case '"': out.append("&quot;"); break;
                default: out.append(ch); break;
            }
        }
        return out.toString();
    }

    private static String unescapeHtml(String s) {
        if (s == null || s.isEmpty()) return "";
        String r = s.replace("&quot;", "\"")
                .replace("&#34;", "\"")
                .replace("&#39;", "'")
                .replace("&apos;", "'")
                .replace("&lt;", "<")
                .replace("&gt;", ">")
                .replace("&nbsp;", " ")
                .replace("&amp;", "&");
        // Decode numeric entities like &#1055; or &#x041F;
        if (r.contains("&#")) {
            Matcher m = Pattern.compile("&#(x?[0-9a-fA-F]+);").matcher(r);
            StringBuffer sb = new StringBuffer();
            while (m.find()) {
                try {
                    String num = m.group(1);
                    int cp = (num.startsWith("x") || num.startsWith("X"))
                            ? Integer.parseInt(num.substring(1), 16)
                            : Integer.parseInt(num, 10);
                    m.appendReplacement(sb, Matcher.quoteReplacement(new String(Character.toChars(cp))));
                } catch (Throwable ignored) {}
            }
            m.appendTail(sb);
            r = sb.toString();
        }
        return r.trim();
    }

    // --- IMPORT (Auto-detect HTML / Chromium JSON / Firefox JSON / Plain URL list) ---

    public static ImportResult importBookmarksFromText(Context ctx, String rawContent) throws Exception {
        if (rawContent == null) throw new IllegalArgumentException("Empty file");
        String content = rawContent;
        if (content.startsWith("\uFEFF")) content = content.substring(1);
        String trimmed = content.trim();
        if (trimmed.isEmpty()) throw new IllegalArgumentException("Empty bookmarks file");

        List<ParsedNode> rootItems;
        if (trimmed.startsWith("{") || trimmed.startsWith("[")) {
            rootItems = parseJsonBookmarks(trimmed);
        } else if (trimmed.toLowerCase(Locale.US).contains("<a ")
                || trimmed.toLowerCase(Locale.US).contains("<dl")
                || trimmed.toLowerCase(Locale.US).contains("<dt")) {
            rootItems = parseNetscapeHtml(trimmed);
        } else {
            rootItems = parsePlainUrls(trimmed);
        }

        if (rootItems.isEmpty()) {
            throw new IllegalArgumentException("No bookmarks found in file");
        }

        repairOrphanedImportedBookmarks(ctx);
        ContentResolver cr = ctx.getApplicationContext().getContentResolver();
        Uri uri = getBookmarkUri(ctx);
        long rootId = getRootFolderId(ctx, uri);
        int accountType = getRootAccountType(ctx, uri, rootId);

        int[] stats = new int[3]; // [0]=addedBookmarks, [1]=addedFolders, [2]=skippedDuplicates
        insertNodesRecursive(cr, uri, rootId, accountType, rootItems, stats, 0);

        try {
            cr.notifyChange(uri, null);
        } catch (Throwable ignored) {}

        fetchMissingBookmarkIconsAsync(ctx);
        return new ImportResult(stats[0], stats[1], stats[2]);
    }

    private static List<ParsedNode> parseNetscapeHtml(String html) {
        ParsedNode virtualRoot = ParsedNode.folder("", 0L);
        Deque<ParsedNode> stack = new ArrayDeque<>();
        stack.push(virtualRoot);
        ParsedNode pendingFolder = null;

        Matcher m = TAG_TOKEN.matcher(html);
        while (m.find()) {
            boolean closing = "/".equals(m.group(1));
            String tag = m.group(2).toLowerCase(Locale.US);
            String attrs = m.group(3) != null ? m.group(3) : "";
            String text = m.group(4) != null ? unescapeHtml(m.group(4)) : "";

            if ("dl".equals(tag)) {
                if (!closing) {
                    if (pendingFolder != null) {
                        stack.push(pendingFolder);
                        pendingFolder = null;
                    }
                } else {
                    if (stack.size() > 1) {
                        stack.pop();
                    }
                    pendingFolder = null;
                }
            } else if ("h3".equals(tag) && !closing) {
                long addDateMs = parseAddDateMs(attrs);
                String folderName = text.isEmpty() ? "Bookmarks" : text;
                ParsedNode folder = ParsedNode.folder(folderName, addDateMs);
                stack.peek().children.add(folder);
                pendingFolder = folder;
            } else if ("a".equals(tag) && !closing) {
                pendingFolder = null;
                String href = extractAttr(ATTR_HREF, attrs);
                if (href != null) {
                    href = unescapeHtml(href).trim();
                    if (!href.isEmpty() && !href.toLowerCase(Locale.US).startsWith("place:")) {
                        long addDateMs = parseAddDateMs(attrs);
                        String title = text.isEmpty() ? href : text;
                        stack.peek().children.add(ParsedNode.bookmark(title, href, addDateMs));
                    }
                }
            }
        }
        return virtualRoot.children;
    }

    private static String extractAttr(Pattern p, String attrs) {
        Matcher m = p.matcher(attrs);
        if (!m.find()) return null;
        for (int i = 1; i <= m.groupCount(); i++) {
            String g = m.group(i);
            if (g != null) return g;
        }
        return null;
    }

    private static long parseAddDateMs(String attrs) {
        String raw = extractAttr(ATTR_ADD_DATE, attrs);
        if (raw == null || raw.isEmpty()) return System.currentTimeMillis();
        try {
            long val = Long.parseLong(raw);
            return val < 100000000000L ? (val * 1000L) : val;
        } catch (Throwable ignored) {
            return System.currentTimeMillis();
        }
    }

    private static List<ParsedNode> parseJsonBookmarks(String jsonStr) throws Exception {
        List<ParsedNode> out = new ArrayList<>();
        if (jsonStr.startsWith("[")) {
            JSONArray arr = new JSONArray(jsonStr);
            parseJsonArray(arr, out, 0);
            return out;
        }
        JSONObject obj = new JSONObject(jsonStr);
        // Chromium / Chrome / Edge / Brave Bookmarks JSON ("roots": { "bookmark_bar": ..., "other": ..., "synced": ... })
        JSONObject roots = obj.optJSONObject("roots");
        if (roots != null) {
            Iterator<String> it = roots.keys();
            while (it.hasNext()) {
                String k = it.next();
                JSONObject child = roots.optJSONObject(k);
                if (child == null) continue;
                JSONArray children = child.optJSONArray("children");
                if (children != null && children.length() > 0) {
                    parseJsonArray(children, out, 0);
                }
            }
            return out;
        }
        // Firefox bookmarks JSON ("children": [...])
        JSONArray children = obj.optJSONArray("children");
        if (children != null) {
            parseJsonArray(children, out, 0);
            return out;
        }
        // Single bookmark object fallback
        String url = obj.optString("url", obj.optString("uri", ""));
        if (!url.isEmpty()) {
            out.add(ParsedNode.bookmark(obj.optString("title", obj.optString("name", url)), url, System.currentTimeMillis()));
        }
        return out;
    }

    private static void parseJsonArray(JSONArray arr, List<ParsedNode> out, int depth) {
        if (arr == null || depth > 24) return;
        for (int i = 0; i < arr.length(); i++) {
            JSONObject item = arr.optJSONObject(i);
            if (item == null) continue;
            String type = item.optString("type", "");
            JSONArray kids = item.optJSONArray("children");
            String url = item.optString("url", item.optString("uri", ""));
            String title = item.optString("name", item.optString("title", ""));

            if ("folder".equalsIgnoreCase(type) || kids != null) {
                // Skip empty Firefox system root wrappers if unnamed
                if (title.isEmpty() && kids != null) {
                    parseJsonArray(kids, out, depth + 1);
                } else {
                    ParsedNode folder = ParsedNode.folder(title.isEmpty() ? "Folder" : title, System.currentTimeMillis());
                    parseJsonArray(kids, folder.children, depth + 1);
                    if (!folder.children.isEmpty()) {
                        out.add(folder);
                    }
                }
            } else if (!url.isEmpty() && !url.toLowerCase(Locale.US).startsWith("place:")) {
                out.add(ParsedNode.bookmark(title.isEmpty() ? url : title, url, System.currentTimeMillis()));
            }
        }
    }

    private static List<ParsedNode> parsePlainUrls(String text) {
        List<ParsedNode> out = new ArrayList<>();
        Set<String> seen = new HashSet<>();
        String[] lines = text.split("\\r?\\n");
        String pendingTitle = null;

        for (String rawLine : lines) {
            String line = rawLine != null ? rawLine.trim() : "";
            if (line.isEmpty()) {
                pendingTitle = null;
                continue;
            }
            Matcher m = PLAIN_URL.matcher(line);
            if (m.find()) {
                String url = m.group(1);
                if (url != null) {
                    // Trim trailing punctuation sometimes attached in plain-text lists
                    while (url.length() > 8 && (url.endsWith(",") || url.endsWith(")") || url.endsWith("]"))) {
                        url = url.substring(0, url.length() - 1);
                    }
                    if (seen.add(url)) {
                        String before = line.substring(0, m.start()).trim();
                        before = before.replaceAll("[\\s\\-:|—–]+$", "").trim();
                        String title;
                        if (!before.isEmpty() && before.length() <= 200) {
                            title = before;
                        } else if (pendingTitle != null && !pendingTitle.isEmpty()) {
                            title = pendingTitle;
                        } else {
                            title = url;
                        }
                        out.add(ParsedNode.bookmark(title, url, System.currentTimeMillis()));
                    }
                }
                pendingTitle = null;
            } else {
                // Non-URL line (e.g. Samsung Browser shared text format: Title on line N, URL on line N+1)
                if (line.length() <= 240 && !line.matches("^[-=_*#]{3,}$")) {
                    pendingTitle = line;
                } else {
                    pendingTitle = null;
                }
            }
        }
        return out;
    }

    private static int getNextPosition(ContentResolver cr, Uri uri, long parentId) {
        Cursor c = null;
        try {
            c = cr.query(
                    uri,
                    new String[] { "POSITION" },
                    "PARENT = ? AND DELETED = 0 AND IS_COMMITED = 0",
                    new String[] { String.valueOf(parentId) },
                    "POSITION DESC");
            if (c != null && c.moveToFirst()) {
                return Math.max(0, c.getInt(0)) + 1;
            }
        } catch (Throwable ignored) {
        } finally {
            if (c != null) try { c.close(); } catch (Throwable ignored) {}
        }
        return 1;
    }

    private static void insertNodesRecursive(
            ContentResolver cr,
            Uri uri,
            long parentId,
            int accountType,
            List<ParsedNode> nodes,
            int[] stats,
            int depth) {
        if (nodes == null || depth > 24) return;
        long now = System.currentTimeMillis();
        int nextPos = getNextPosition(cr, uri, parentId);

        for (ParsedNode n : nodes) {
            if (n.isFolder) {
                String folderName = (n.title != null && !n.title.isEmpty()) ? n.title : "Imported";
                long existingFolderId = findExistingFolder(cr, uri, parentId, folderName);
                long targetFolderId;
                if (existingFolderId > 0L) {
                    targetFolderId = existingFolderId;
                } else {
                    ContentValues cv = new ContentValues();
                    cv.put("TITLE", folderName);
                    cv.put("FOLDER", 1);
                    cv.put("PARENT", parentId);
                    cv.put("POSITION", nextPos++);
                    cv.put("EDITABLE", 1);
                    cv.put("DELETED", 0);
                    cv.put("IS_COMMITED", 0);
                    cv.put("bookmark_type", accountType);
                    cv.put("SYNC3", "");
                    cv.put("EXPAND", 0);
                    cv.put("CREATED", n.addDateMs > 0L ? n.addDateMs : now);
                    cv.put("MODIFIED", now);
                    cv.put("TAGS", "NP");
                    Uri inserted = cr.insert(uri, cv);
                    targetFolderId = inserted != null ? ContentUris.parseId(inserted) : -1L;
                    if (targetFolderId > 0L) {
                        stats[1]++;
                    } else {
                        targetFolderId = parentId;
                    }
                }
                insertNodesRecursive(cr, uri, targetFolderId, accountType, n.children, stats, depth + 1);
            } else {
                if (n.url == null || n.url.isEmpty()) continue;
                if (bookmarkExists(cr, uri, parentId, n.url)) {
                    stats[2]++;
                    continue;
                }
                ContentValues cv = new ContentValues();
                cv.put("TITLE", (n.title != null && !n.title.isEmpty()) ? n.title : n.url);
                cv.put("URL", n.url);
                cv.put("SURL", n.url);
                cv.put("FOLDER", 0);
                cv.put("PARENT", parentId);
                cv.put("POSITION", nextPos++);
                cv.put("EDITABLE", 1);
                cv.put("DELETED", 0);
                cv.put("IS_COMMITED", 0);
                cv.put("bookmark_type", accountType);
                cv.put("SYNC3", "");
                cv.put("EXPAND", 0);
                cv.put("CREATED", n.addDateMs > 0L ? n.addDateMs : now);
                cv.put("MODIFIED", now);
                cv.put("TAGS", "NP");
                Uri inserted = cr.insert(uri, cv);
                if (inserted != null) {
                    stats[0]++;
                }
            }
        }
    }

    private static long findExistingFolder(ContentResolver cr, Uri uri, long parentId, String title) {
        Cursor c = null;
        try {
            c = cr.query(
                    uri,
                    new String[] { "_ID" },
                    "PARENT = ? AND TITLE = ? AND FOLDER = 1 AND DELETED = 0 AND IS_COMMITED = 0",
                    new String[] { String.valueOf(parentId), title },
                    null);
            if (c != null && c.moveToFirst()) {
                return c.getLong(0);
            }
        } catch (Throwable ignored) {
        } finally {
            if (c != null) try { c.close(); } catch (Throwable ignored) {}
        }
        return -1L;
    }

    private static boolean bookmarkExists(ContentResolver cr, Uri uri, long parentId, String url) {
        Cursor c = null;
        try {
            c = cr.query(
                    uri,
                    new String[] { "_ID" },
                    "PARENT = ? AND URL = ? AND FOLDER = 0 AND DELETED = 0 AND IS_COMMITED = 0",
                    new String[] { String.valueOf(parentId), url },
                    null);
            return c != null && c.moveToFirst();
        } catch (Throwable ignored) {
            return false;
        } finally {
            if (c != null) try { c.close(); } catch (Throwable ignored) {}
        }
    }

    // --- SAF / Tree I/O helpers ---

    public static ExportResult writeBookmarksToUri(Context ctx, Uri uri) throws Exception {
        ExportResult res = exportBookmarksToHtml(ctx);
        ContentResolver cr = ctx.getContentResolver();
        try (OutputStream os = cr.openOutputStream(uri, "wt")) {
            if (os == null) throw new IllegalStateException("Cannot open output stream");
            os.write(res.html.getBytes(StandardCharsets.UTF_8));
            os.flush();
        }
        return res;
    }

    public static ImportResult readBookmarksFromUri(Context ctx, Uri uri) throws Exception {
        ContentResolver cr = ctx.getContentResolver();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try (InputStream is = cr.openInputStream(uri)) {
            if (is == null) throw new IllegalStateException("Cannot open input stream");
            byte[] buf = new byte[4096];
            int n;
            while ((n = is.read(buf)) > 0) {
                baos.write(buf, 0, n);
            }
        }
        String raw = baos.toString("UTF-8");
        return importBookmarksFromText(ctx, raw);
    }

    public static boolean writeBookmarksToTreeUri(Context ctx, Uri treeUri, String fileName) {
        try {
            ContentResolver cr = ctx.getContentResolver();
            String docId = DocumentsContract.getTreeDocumentId(treeUri);
            Uri parentDocUri = DocumentsContract.buildDocumentUriUsingTree(treeUri, docId);
            Uri created = DocumentsContract.createDocument(cr, parentDocUri, "text/html", fileName);
            if (created == null) return false;
            writeBookmarksToUri(ctx, created);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "writeBookmarksToTreeUri failed", t);
            return false;
        }
    }

    private static final java.util.concurrent.atomic.AtomicBoolean sFetchingIcons =
            new java.util.concurrent.atomic.AtomicBoolean(false);

    public static void fetchMissingBookmarkIconsAsync(final Context ctx) {
        if (ctx == null) return;
        if (!sFetchingIcons.compareAndSet(false, true)) return;
        final Context appCtx = ctx.getApplicationContext();
        Thread t = new Thread(() -> {
            try {
                ContentResolver cr = appCtx.getContentResolver();
                Uri uri = getBookmarkUri(appCtx);
                Map<String, List<Long>> idsByHost = new HashMap<>();
                Cursor c = null;
                try {
                    c = cr.query(
                            uri,
                            new String[] { "_ID", "URL", "TOUCH_ICON" },
                            "FOLDER = 0 AND DELETED = 0 AND IS_COMMITED = 0",
                            null,
                            "_ID ASC");
                    if (c != null) {
                        while (c.moveToNext()) {
                            long id = c.getLong(0);
                            String url = c.getString(1);
                            byte[] icon = c.getBlob(2);
                            if (icon != null && icon.length > 0) continue;
                            if (url == null || url.isEmpty()) continue;
                            String host = null;
                            try {
                                host = Uri.parse(url).getHost();
                            } catch (Throwable ignored) {}
                            if (host == null || host.trim().isEmpty()) continue;
                            host = host.trim().toLowerCase(Locale.US);
                            List<Long> list = idsByHost.get(host);
                            if (list == null) {
                                list = new ArrayList<>();
                                idsByHost.put(host, list);
                            }
                            list.add(id);
                        }
                    }
                } finally {
                    if (c != null) try { c.close(); } catch (Throwable ignored) {}
                }

                if (idsByHost.isEmpty()) return;
                int updatedHosts = 0;
                for (Map.Entry<String, List<Long>> entry : idsByHost.entrySet()) {
                    byte[] png = downloadFaviconBytes(entry.getKey());
                    if (png == null || png.length < 32) continue;
                    for (Long id : entry.getValue()) {
                        try {
                            ContentValues cv = new ContentValues();
                            cv.put("TOUCH_ICON", png);
                            cv.put("FAVICON", png);
                            cr.update(uri, cv, "_ID = ?", new String[] { String.valueOf(id) });
                        } catch (Throwable ignored) {}
                    }
                    updatedHosts++;
                    if (updatedHosts % 12 == 0) {
                        try { cr.notifyChange(uri, null); } catch (Throwable ignored) {}
                    }
                }
                if (updatedHosts > 0) {
                    try { cr.notifyChange(uri, null); } catch (Throwable ignored) {}
                    Log.i(TAG, "Fetched favicons for " + updatedHosts + " bookmark domains");
                }
            } catch (Throwable tErr) {
                Log.w(TAG, "fetchMissingBookmarkIconsAsync failed", tErr);
            } finally {
                sFetchingIcons.set(false);
            }
        }, "SBrowserX-Favicons");
        t.setPriority(Thread.MIN_PRIORITY);
        t.setDaemon(true);
        t.start();
    }

    private static byte[] downloadFaviconBytes(String host) {
        java.net.HttpURLConnection conn = null;
        try {
            String urlStr = "https://www.google.com/s2/favicons?domain="
                    + java.net.URLEncoder.encode(host, "UTF-8") + "&sz=64";
            conn = (java.net.HttpURLConnection) new java.net.URL(urlStr).openConnection();
            conn.setConnectTimeout(3500);
            conn.setReadTimeout(3500);
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Linux; Android 15) AppleWebKit/537.36 Chrome/131.0");
            int code = conn.getResponseCode();
            if (code < 200 || code >= 300) return null;
            try (InputStream is = conn.getInputStream();
                 ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
                byte[] buf = new byte[2048];
                int n;
                int total = 0;
                while ((n = is.read(buf)) > 0) {
                    total += n;
                    if (total > 131072) return null;
                    baos.write(buf, 0, n);
                }
                return baos.toByteArray();
            }
        } catch (Throwable ignored) {
            return null;
        } finally {
            if (conn != null) conn.disconnect();
        }
    }
}
