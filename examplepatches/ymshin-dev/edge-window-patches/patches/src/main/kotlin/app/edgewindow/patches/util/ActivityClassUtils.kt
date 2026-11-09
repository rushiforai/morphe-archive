package app.edgewindow.patches.util

import com.android.tools.smali.dexlib2.iface.ClassDef

internal const val ANDROID_ACTIVITY = "Landroid/app/Activity;"

// Platform Activity bases are not part of the patched app's dex, so they are
// matched by name when walking an Activity's superclass chain.
internal val platformActivityBases = setOf(
    ANDROID_ACTIVITY,
    "Landroid/app/ActivityGroup;",
    "Landroid/app/ExpandableListActivity;",
    "Landroid/app/LauncherActivity;",
    "Landroid/app/ListActivity;",
    "Landroid/app/NativeActivity;",
    "Landroid/app/TabActivity;",
    "Landroid/preference/PreferenceActivity;",
)

internal fun ClassDef.isActivityClass(classesByType: Map<String, ClassDef>): Boolean {
    val visited = mutableSetOf<String>()
    var currentType: String? = type

    while (currentType != null && visited.add(currentType)) {
        if (currentType in platformActivityBases) return true
        currentType = classesByType[currentType]?.superclass
    }

    return false
}
