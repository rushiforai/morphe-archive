package app.warreth.patches.screenzen

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * The static method in the accessibility service that maps a browser package name
 * to the resource id of that browser's address bar.
 *
 * The method builds a `Map<packageName, viewId>` and looks the foreground package up
 * in it. Browsers that are not in the map are ignored, which is why website blocking
 * only works in the browsers ScreenZen ships support for.
 *
 * Matching on the two address bar ids keeps this stable even though the method name
 * and the map builder class are obfuscated.
 */
internal object BrowserUrlMapFingerprint : Fingerprint(
    definingClass = "Lcom/screenzen/service/MyAccessibilityService;",
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("com.android.chrome:id/url_bar"),
        string("com.hsv.freeadblockerbrowser:id/url_bar")
    )
)
