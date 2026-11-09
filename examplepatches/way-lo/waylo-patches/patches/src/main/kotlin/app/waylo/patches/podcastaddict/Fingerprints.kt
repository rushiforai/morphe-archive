package app.waylo.patches.podcastaddict

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.Opcode

/**
 * The drag-sort list library used by the Playlist screen. The library class name is not obfuscated,
 * and neither are the names of the framework methods it overrides or its public setters.
 */
internal const val DRAG_SORT_LIST_CLASS = "Lcom/mobeta/android/dslv/DragSortListView;"

internal object DragSortInterceptTouchFingerprint : Fingerprint(
    definingClass = DRAG_SORT_LIST_CLASS,
    name = "onInterceptTouchEvent",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;")
)

internal object DragSortTouchFingerprint : Fingerprint(
    definingClass = DRAG_SORT_LIST_CLASS,
    name = "onTouchEvent",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;")
)

/**
 * `setRemoveListener(RemoveListener)`. Its parameter type is the (obfuscated) remove listener interface.
 */
internal object DragSortSetRemoveListenerFingerprint : Fingerprint(
    definingClass = DRAG_SORT_LIST_CLASS,
    name = "setRemoveListener",
    returnType = "V",
    parameters = listOf("L")
)

/**
 * The static initializer of the playlist's list adapter, which sets its log tag.
 */
internal object PlaylistAdapterClassFingerprint : Fingerprint(
    name = "<clinit>",
    strings = listOf("PlayListAdapter")
)

internal object PlaylistAdapterGetViewFingerprint : Fingerprint(
    classFingerprint = PlaylistAdapterClassFingerprint,
    name = "getView",
    returnType = "Landroid/view/View;",
    parameters = listOf("I", "Landroid/view/View;", "Landroid/view/ViewGroup;")
)

/**
 * The Playlist fragment's method that removes episodes from the playlist (the one the long press
 * menu "Remove from Playlist" uses). It takes a set of episode ids.
 */
internal object PlaylistDequeueFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/util/Set;"),
    strings = listOf("dequeueEpisode(PlaylistFragment, ")
)

/**
 * The Playlist fragment method that reads the "playlistType" argument and stores whether it is type 0.
 * The long press menu does not offer "Remove from Playlist" for that type, so neither does swiping.
 */
internal object PlaylistTypeFingerprint : Fingerprint(
    classFingerprint = PlaylistDequeueFingerprint,
    returnType = "V",
    strings = listOf("playlistType"),
    filters = listOf(
        fieldAccess(
            opcode = Opcode.IPUT_BOOLEAN,
            definingClass = "this",
            type = "Z"
        )
    )
)

/**
 * The background task that creates an episode list fragment's list view. It logs when the episode
 * grid size preference is missing, right after assigning the list view to the fragment.
 */
internal object EpisodeListCreationFingerprint : Fingerprint(
    strings = listOf("Episode Grid Size default value was NOT set!! - ")
)
