package app.waylo.extension.podcastaddict;

/**
 * Implemented (added by the patch) by Podcast Addict's own "remove listener" class that is
 * registered on the Playlist screen's list. Its presence tells {@link PlaylistSwipeToRemove}
 * that a touched list is the Playlist, and it performs the removal using the app's own
 * "Remove from Playlist" code path.
 */
@SuppressWarnings("unused")
public interface PlaylistRemoveHost {

    /**
     * Removes the episode at the given adapter position from the playlist.
     */
    void swipeRemoveAt(int position);
}
