package app.morphe.extension.reddit.nsfw;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

/**
 * Dependency-free self-test for {@link NsfwCellScanner}. Runs with a plain JDK:
 *
 * <pre>
 *   cd extensions/reddit/src
 *   javac main/java/app/morphe/extension/reddit/nsfw/NsfwCellScanner.java -d /tmp/nsfw
 *   javac -cp /tmp/nsfw test/java/app/morphe/extension/reddit/nsfw/NsfwCellScannerSelfTest.java -d /tmp/nsfw
 *   java  -cp /tmp/nsfw app.morphe.extension.reddit.nsfw.NsfwCellScannerSelfTest
 * </pre>
 *
 * <p>The fakes mirror the shape of Reddit's home feed response: obfuscated field names, a
 * {@code t3_} post id among the strings, and the indicators buried nine levels down, which is
 * where the real thing keeps them.
 */
public final class NsfwCellScannerSelfTest {
    private static int pass = 0, fail = 0;

    private static void check(boolean cond, String name) {
        if (cond) pass++; else fail++;
        System.out.printf("%s  %s%n", cond ? "PASS" : "FAIL", name);
    }

    /** Stands in for com.reddit.type.CellIndicatorType. */
    public enum CellIndicatorType { NSFW, SPOILER, ORIGINAL, QUARANTINED }

    /** Stands in for com.reddit.type.NSFWState, which spells the same flag a second way. */
    public enum NSFWState { NONE, NSFW }

    /** Stands in for com.reddit.type.PostStatusIndicatorType, which has no NSFW constant. */
    public enum PostStatusIndicatorType { PINNED, LOCKED, MOD }

    /** IndicatorsCellFragment, with the renamed fields a real build has. */
    public static final class IndicatorsCell {
        public final String f1;
        public final List<?> f2;
        public IndicatorsCell(String id, List<?> indicators) { this.f1 = id; this.f2 = indicators; }
    }

    /** One member of the Cell union. Every other member is null on a given cell. */
    public static final class Cell {
        public final String a;
        public final Object o;
        public final Object p;
        public Cell(String typename, Object metadata, Object indicators) {
            this.a = typename;
            this.o = metadata;
            this.p = indicators;
        }
    }

    /** MetadataCellFragment: carries the post id but none of the tags. */
    public static final class MetadataCell {
        public final String f1;
        public final List<?> f2;
        public MetadataCell(String id, List<?> statusIndicators) {
            this.f1 = id;
            this.f2 = statusIndicators;
        }
    }

    public static final class GroupFragment {
        public final Object adPayload;
        public final List<?> cells;
        public GroupFragment(List<?> cells) { this.adPayload = null; this.cells = cells; }
    }

    public static final class CellGroup {
        public final String a;
        public final String b;
        public final GroupFragment e;
        public CellGroup(String typename, String groupId, GroupFragment fragment) {
            this.a = typename;
            this.b = groupId;
            this.e = fragment;
        }
    }

    public static final class Node {
        public final String a;
        public final String b;
        public final CellGroup c;
        public final Object d;
        public Node(String typename, String id, CellGroup group) {
            this.a = typename;
            this.b = id;
            this.c = group;
            this.d = null;
        }
    }

    public static final class EdgeFragment {
        public final Node node;
        public EdgeFragment(Node node) { this.node = node; }
    }

    public static final class Edge {
        public final String a;
        public final EdgeFragment b;
        public Edge(String typename, EdgeFragment fragment) { this.a = typename; this.b = fragment; }
    }

    /** Builds an edge shaped exactly like the one the home feed delivers. */
    private static Edge feedEdge(String postId, Object... indicators) {
        Cell metadata = new Cell("Cell", new MetadataCell(postId,
                Arrays.asList(PostStatusIndicatorType.PINNED)), null);
        Cell tags = new Cell("Cell", null,
                new IndicatorsCell(postId, Arrays.asList(indicators)));
        return new Edge("FeedElementEdge", new EdgeFragment(new Node("PostFeedElement", postId,
                new CellGroup("CellGroup", "group1", new GroupFragment(
                        Arrays.asList(metadata, tags))))));
    }

    /** Self-referencing, to prove the walk terminates. */
    public static final class Cyclic {
        public Object self;
        public String id = "t3_cycle";
    }

    public static void main(String[] args) {
        // --- the flag itself ---
        check(NsfwCellScanner.isNsfwIndicator(CellIndicatorType.NSFW),
                "CellIndicatorType.NSFW is recognised");
        check(NsfwCellScanner.isNsfwIndicator(NSFWState.NSFW),
                "NSFWState.NSFW is recognised, since the schema spells it in more than one enum");
        check(!NsfwCellScanner.isNsfwIndicator(CellIndicatorType.SPOILER),
                "SPOILER is not NSFW");
        check(!NsfwCellScanner.isNsfwIndicator(NSFWState.NONE), "NONE is not NSFW");
        check(!NsfwCellScanner.isNsfwIndicator("NSFW"),
                "the bare string NSFW is not an indicator");
        check(!NsfwCellScanner.isNsfwIndicator(null), "null is not an indicator");

        // --- a whole feed edge, at the depth the real one uses ---
        NsfwCellScanner.Scan nsfw = NsfwCellScanner.scan(
                feedEdge("t3_abc123", CellIndicatorType.NSFW, CellIndicatorType.SPOILER));
        check(nsfw != null && "t3_abc123".equals(nsfw.postId) && nsfw.nsfw,
                "an NSFW feed edge is read through all nine levels");

        NsfwCellScanner.Scan sfw = NsfwCellScanner.scan(feedEdge("t3_def456"));
        check(sfw != null && "t3_def456".equals(sfw.postId) && !sfw.nsfw,
                "an edge with no indicators is not NSFW");

        NsfwCellScanner.Scan spoiler = NsfwCellScanner.scan(
                feedEdge("t3_ghi", CellIndicatorType.SPOILER));
        check(spoiler != null && !spoiler.nsfw, "a spoiler-only post is not NSFW");

        NsfwCellScanner.Scan quarantined = NsfwCellScanner.scan(
                feedEdge("t3_jkl", CellIndicatorType.QUARANTINED, CellIndicatorType.NSFW));
        check(quarantined != null && quarantined.nsfw,
                "NSFW is found among several indicators");

        // --- the shallow case still works ---
        NsfwCellScanner.Scan flat = NsfwCellScanner.scan(
                new IndicatorsCell("t3_flat", Arrays.asList(CellIndicatorType.NSFW)));
        check(flat != null && "t3_flat".equals(flat.postId) && flat.nsfw,
                "a flat cell is read too");

        // --- id detection ---
        check(NsfwCellScanner.scan(new MetadataCell("not-a-fullname",
                Collections.emptyList())) == null,
                "a fragment with no t3_ id yields null");
        check(NsfwCellScanner.scan(null) == null, "null fragment yields null");
        check(NsfwCellScanner.scan("t3_bare") == null, "a bare string is not a fragment");
        check(NsfwCellScanner.scan(Arrays.asList("t3_in_a_list")) == null,
                "a bare list is not a fragment");

        // --- termination ---
        Cyclic cyclic = new Cyclic();
        cyclic.self = cyclic;
        NsfwCellScanner.Scan cyc = NsfwCellScanner.scan(cyclic);
        check(cyc != null && "t3_cycle".equals(cyc.postId), "a self-referencing model terminates");

        // --- depth limit ---
        Object deep = new IndicatorsCell("t3_deep", Arrays.asList(CellIndicatorType.NSFW));
        for (int i = 0; i < 30; i++) deep = new EdgeFragment2(deep);
        NsfwCellScanner.Scan tooDeep = NsfwCellScanner.scan(deep);
        check(tooDeep == null, "the walk stops rather than recursing without bound");

        // --- diagnostics ---
        Set<String> names = new TreeSet<>();
        NsfwCellScanner.scan(feedEdge("t3_diag", CellIndicatorType.NSFW), names);
        check(names.contains("CellIndicatorType.NSFW")
                        && names.contains("PostStatusIndicatorType.PINNED"),
                "collecting enum names reports every tag the edge carried");

        Set<String> none = new TreeSet<>();
        NsfwCellScanner.scan(feedEdge("t3_diag2"), none);
        check(!none.contains("CellIndicatorType.NSFW"),
                "collecting enum names does not invent tags");

        System.out.printf("%nRESULT: %d passed, %d failed%n", pass, fail);
        if (fail > 0) System.exit(1);
    }

    /** A one-field wrapper, for building a graph deeper than the walk is willing to follow. */
    public static final class EdgeFragment2 {
        public final Object next;
        public EdgeFragment2(Object next) { this.next = next; }
    }
}
