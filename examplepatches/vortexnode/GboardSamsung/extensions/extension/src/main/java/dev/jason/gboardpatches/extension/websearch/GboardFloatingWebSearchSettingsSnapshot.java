package dev.jason.gboardpatches.extension.websearch;

public final class GboardFloatingWebSearchSettingsSnapshot {
    private final boolean enabled;
    private final String startPageMode;
    private final String startPageUrl;
    private final String customStartPageUrl;
    private final int initialHeightPercent;
    private final String browserProvider;

    public GboardFloatingWebSearchSettingsSnapshot(boolean enabled, String startPageMode,
            String startPageUrl, String customStartPageUrl, int initialHeightPercent,
            String browserProvider) {
        this.enabled = enabled;
        this.startPageMode = startPageMode;
        this.startPageUrl = startPageUrl;
        this.customStartPageUrl = customStartPageUrl;
        this.initialHeightPercent = initialHeightPercent;
        this.browserProvider = browserProvider;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public String getStartPageMode() {
        return startPageMode;
    }

    public String getStartPageUrl() {
        return startPageUrl;
    }

    public String getCustomStartPageUrl() {
        return customStartPageUrl;
    }

    public int getInitialHeightPercent() {
        return initialHeightPercent;
    }

    public String getBrowserProvider() {
        return browserProvider;
    }
}
