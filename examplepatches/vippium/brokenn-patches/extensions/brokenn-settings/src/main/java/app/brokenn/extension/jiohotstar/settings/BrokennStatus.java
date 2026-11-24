package app.brokenn.extension.jiohotstar.settings;

// Patch presence flags: each included patch injects its enable call into load().
public final class BrokennStatus {
    private BrokennStatus() {}

    // Set when "Hide player buttons" is included.
    public static boolean hidePlayerButtons = false;
    public static void hidePlayerButtons() { hidePlayerButtons = true; }

    // Set when "Hide watch page elements" is included.
    public static boolean hideWatchPageElements = false;
    public static void hideWatchPageElements() { hideWatchPageElements = true; }

    public static boolean feedFilter = false;
    public static void feedFilter() { feedFilter = true; }

    // Enable-call target; the patcher prepends one call per included patch.
    public static void load() {}
}
