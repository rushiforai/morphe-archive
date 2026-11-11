package app.ysamjo.extension.youtubetv;

/**
 * Per-channel playback-speed overrides injected into the Cobalt web app.
 *
 * <p>YouTube TV runs as a leanback web app inside the Cobalt engine. When a user opens a
 * channel, the player inherits the global speed setting set by TizenTube's speed mod
 * ({@code videoSpeed} via {@code setClientSettingEndpoint}). Some channels — notably live
 * sports streams from Sky Sport, DAZN, RTL Sport, NBA and NFL — must always play at normal speed
 * regardless of any global override. This class injects a JavaScript snippet that reads the
 * current channel from the URL and enforces the per-channel speed before the player starts.
 *
 * <p>Detection is by URL path ({@code /channel/<id>}) which is stable across app versions.
 * If the {@code setClientSettingEndpoint} bridge is not present (TizenTube speed mod not
 * installed), the snippet degrades silently without affecting playback.
 *
 * <p>Each rule is declared as two constants below.  Run the following once to capture the
 * real IDs from the live app:
 * <pre>
 * adb logcat -s ysamjo-tv-adblock | grep channel
 * </pre>
 * Navigate to each channel in the app and note the ID from the URL (the part after
 * {@code /channel/}), then replace the placeholder values.
 */
public final class ChannelSpeedPayload {

    private ChannelSpeedPayload() {
    }

    // ---------------------------------------------------------------------------
    // Channel → speed rules.  Replace the placeholder IDs with the real UC-prefixed
    // identifiers from the live app (see capture instructions above).
    // Speed values must be bare Java numbers (no quotes).
    // ---------------------------------------------------------------------------

    private static final String SKY_SPORT_CHANNEL_ID = "REPLACE_WITH_SKY_SPORT_ID";
    private static final String DAZN_CHANNEL_ID = "REPLACE_WITH_DAZN_ID";
    private static final String RTL_SPORT_CHANNEL_ID = "REPLACE_WITH_RTL_SPORT_ID";
    private static final String NBA_CHANNEL_ID = "REPLACE_WITH_NBA_ID";
    private static final String NFL_CHANNEL_ID = "REPLACE_WITH_NFL_ID";

    private static final float SKY_SPORT_SPEED = 1.0f;
    private static final float DAZN_SPEED = 1.0f;
    private static final float RTL_SPORT_SPEED = 1.0f;
    private static final float NBA_SPEED = 1.0f;
    private static final float NFL_SPEED = 1.0f;

    /**
     * Injected script that reads the current channel from the URL and calls the speed bridge.
     * Degrades silently if the bridge is not present (TizenTube speed mod not installed).
     *
     * <p>The script is guarded by the callers' own flag so re-injection in the same document
     * is always a no-op.
     */
    public static final String SCRIPT =
            "var __yscs=window.__ysamjoChannelSpeed||(function(){"
            + "var r={};"
            + "r['" + SKY_SPORT_CHANNEL_ID + "']=" + SKY_SPORT_SPEED + ";"
            + "r['" + DAZN_CHANNEL_ID + "']=" + DAZN_SPEED + ";"
            + "r['" + RTL_SPORT_CHANNEL_ID + "']=" + RTL_SPORT_SPEED + ";"
            + "r['" + NBA_CHANNEL_ID + "']=" + NBA_SPEED + ";"
            + "r['" + NFL_CHANNEL_ID + "']=" + NFL_SPEED + ";"
            + "window.__ysamjoChannelSpeed=r;"
            + "var m=location.pathname.match(/\\/channel\\/([^/]+)/);"
            + "if(!m) return;"
            + "var id=m[1],s=r[id];"
            + "if(typeof s==='number'){"
            + "if(typeof setClientSettingEndpoint==='function'){"
            + "setClientSettingEndpoint('videoSpeed',s);"
            + "}else if(window.configWrite&&typeof configWrite==='function'){"
            + "configWrite('videoSpeed',s);"
            + "}"
            + "}"
            + "})();";
}
