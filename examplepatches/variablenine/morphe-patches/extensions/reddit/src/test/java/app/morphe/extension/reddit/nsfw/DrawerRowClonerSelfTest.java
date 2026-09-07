package app.morphe.extension.reddit.nsfw;

/**
 * Dependency-free self-test for {@link DrawerRowCloner}. Runs with a plain JDK:
 *
 * <pre>
 *   cd extensions/reddit/src
 *   javac main/java/app/morphe/extension/reddit/nsfw/DrawerRowCloner.java -d /tmp/nsfw
 *   javac -cp /tmp/nsfw test/java/app/morphe/extension/reddit/nsfw/DrawerRowClonerSelfTest.java -d /tmp/nsfw
 *   java  -cp /tmp/nsfw app.morphe.extension.reddit.nsfw.DrawerRowClonerSelfTest
 * </pre>
 *
 * <p>The fakes stand in for Reddit's obfuscated drawer row across the shapes it plausibly takes
 * between app versions - reordered fields, reordered constructor parameters, extra fields. The
 * cloner only ever sees them through reflection, so this exercises the real code path.
 */
public final class DrawerRowClonerSelfTest {
    private static int pass = 0, fail = 0;

    private static final int POPULAR = 0x7f131d8b;
    private static final int NSFW = 0x7f139999;
    private static final int ICON = 0x7f08032b;
    private static final long NEW_ID = Long.MIN_VALUE + 1;

    private static void check(boolean cond, String name) {
        if (cond) pass++; else fail++;
        System.out.printf("%s  %s%n", cond ? "PASS" : "FAIL", name);
    }

    // --- fakes ---------------------------------------------------------------------------

    /** The 2026.35.0 shape: fields (long, int title, int icon, boolean), ctor (Z I I J). */
    public static final class StandardRow {
        public final long uniqueId;
        public final int titleRes;
        public final int iconRes;
        public final boolean flag;

        public StandardRow(boolean flag, int titleRes, int iconRes, long uniqueId) {
            this.uniqueId = uniqueId;
            this.titleRes = titleRes;
            this.iconRes = iconRes;
            this.flag = flag;
        }
    }

    /** Same data, but the constructor takes the icon before the title. */
    public static final class IconFirstRow {
        public final long uniqueId;
        public final int titleRes;
        public final int iconRes;

        public IconFirstRow(int iconRes, int titleRes, long uniqueId) {
            this.uniqueId = uniqueId;
            this.titleRes = titleRes;
            this.iconRes = iconRes;
        }
    }

    /** Fields declared icon before title. */
    public static final class IconFirstFieldsRow {
        public final int iconRes;
        public final int titleRes;
        public final long uniqueId;

        public IconFirstFieldsRow(int titleRes, int iconRes, long uniqueId) {
            this.iconRes = iconRes;
            this.titleRes = titleRes;
            this.uniqueId = uniqueId;
        }
    }

    /** Carries an extra reference field, as a later version might. */
    public static final class ExtraFieldRow {
        public final long uniqueId;
        public final int titleRes;
        public final int iconRes;
        public final String tag;

        public ExtraFieldRow(int titleRes, int iconRes, long uniqueId, String tag) {
            this.uniqueId = uniqueId;
            this.titleRes = titleRes;
            this.iconRes = iconRes;
            this.tag = tag;
        }
    }

    /** A reference field that is null, which must not be mistaken for "nothing to consume". */
    public static final class NullFieldRow {
        public final int titleRes;
        public final int iconRes;
        public final long uniqueId;
        public final String tag;

        public NullFieldRow(int titleRes, int iconRes, long uniqueId, String tag) {
            this.titleRes = titleRes;
            this.iconRes = iconRes;
            this.uniqueId = uniqueId;
            this.tag = tag;
        }
    }

    /** Only a title, no icon. */
    public static final class TitleOnlyRow {
        public final int titleRes;
        public final long uniqueId;

        public TitleOnlyRow(int titleRes, long uniqueId) {
            this.titleRes = titleRes;
            this.uniqueId = uniqueId;
        }
    }

    /** No constructor matching the field count. */
    public static final class UnbuildableRow {
        public final int titleRes;
        public final int iconRes;
        public final long uniqueId;

        public UnbuildableRow(int titleRes) {
            this.titleRes = titleRes;
            this.iconRes = 0;
            this.uniqueId = 0;
        }
    }

    // --- tests ---------------------------------------------------------------------------

    public static void main(String[] args) {
        // --- the shape shipped today ---
        StandardRow standard = new StandardRow(true, POPULAR, ICON, 42L);
        Object clone = DrawerRowCloner.cloneWithTitle(standard, POPULAR, NSFW, NEW_ID);
        check(clone instanceof StandardRow, "standard row clones to the same type");
        if (clone instanceof StandardRow) {
            StandardRow c = (StandardRow) clone;
            check(c.titleRes == NSFW, "title is replaced");
            check(c.iconRes == ICON, "icon is preserved");
            check(c.uniqueId == NEW_ID, "unique id is replaced");
            check(c.flag == standard.flag, "other fields are preserved");
        } else {
            fail += 4;
        }

        // --- reordered constructor: the verify-and-swap path ---
        Object iconFirst = DrawerRowCloner.cloneWithTitle(
                new IconFirstRow(ICON, POPULAR, 7L), POPULAR, NSFW, NEW_ID);
        check(iconFirst instanceof IconFirstRow
                        && ((IconFirstRow) iconFirst).titleRes == NSFW
                        && ((IconFirstRow) iconFirst).iconRes == ICON,
                "icon-first constructor clones correctly, not with the ints swapped");

        // --- reordered fields ---
        Object fieldsSwapped = DrawerRowCloner.cloneWithTitle(
                new IconFirstFieldsRow(POPULAR, ICON, 9L), POPULAR, NSFW, NEW_ID);
        check(fieldsSwapped instanceof IconFirstFieldsRow
                        && ((IconFirstFieldsRow) fieldsSwapped).titleRes == NSFW
                        && ((IconFirstFieldsRow) fieldsSwapped).iconRes == ICON,
                "icon-first field order clones correctly");

        // --- extra fields ---
        Object extra = DrawerRowCloner.cloneWithTitle(
                new ExtraFieldRow(POPULAR, ICON, 3L, "hello"), POPULAR, NSFW, NEW_ID);
        check(extra instanceof ExtraFieldRow
                        && ((ExtraFieldRow) extra).titleRes == NSFW
                        && "hello".equals(((ExtraFieldRow) extra).tag),
                "extra reference field is carried over");

        Object nullField = DrawerRowCloner.cloneWithTitle(
                new NullFieldRow(POPULAR, ICON, 3L, null), POPULAR, NSFW, NEW_ID);
        check(nullField instanceof NullFieldRow
                        && ((NullFieldRow) nullField).titleRes == NSFW
                        && ((NullFieldRow) nullField).tag == null,
                "a null reference field does not abort the clone");

        // --- a row with only a title ---
        Object titleOnly = DrawerRowCloner.cloneWithTitle(
                new TitleOnlyRow(POPULAR, 5L), POPULAR, NSFW, NEW_ID);
        check(titleOnly instanceof TitleOnlyRow && ((TitleOnlyRow) titleOnly).titleRes == NSFW,
                "row with a single int still clones");

        // --- refusals ---
        check(DrawerRowCloner.cloneWithTitle(new UnbuildableRow(POPULAR), POPULAR, NSFW, NEW_ID) == null,
                "no matching constructor yields null rather than a wrong row");
        check(DrawerRowCloner.cloneWithTitle(null, POPULAR, NSFW, NEW_ID) == null,
                "null row yields null");
        check(DrawerRowCloner.cloneWithTitle(standard, POPULAR, POPULAR, NEW_ID) == null,
                "an unchanged title is refused, since it could not be verified");
        check(DrawerRowCloner.cloneWithTitle("a string", POPULAR, NSFW, NEW_ID) == null,
                "unrelated object yields null");

        // --- hasIntField ---
        check(DrawerRowCloner.hasIntField(standard, POPULAR), "hasIntField finds the title");
        check(DrawerRowCloner.hasIntField(standard, ICON), "hasIntField finds the icon");
        check(!DrawerRowCloner.hasIntField(standard, NSFW), "hasIntField rejects an absent value");
        check(!DrawerRowCloner.hasIntField(null, POPULAR), "hasIntField tolerates null");

        // --- the original is untouched ---
        check(standard.titleRes == POPULAR && standard.uniqueId == 42L,
                "the source row is not mutated");

        System.out.printf("%nRESULT: %d passed, %d failed%n", pass, fail);
        if (fail > 0) System.exit(1);
    }
}
