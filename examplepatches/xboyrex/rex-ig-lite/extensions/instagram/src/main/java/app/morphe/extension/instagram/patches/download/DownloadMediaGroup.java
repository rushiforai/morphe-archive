/*
 * Copyright (C) 2026 xboyrex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.download;

import com.instagram.common.session.UserSession;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import app.morphe.extension.instagram.entity.MediaData;
import app.morphe.extension.instagram.entity.UserData;
import app.morphe.extension.shared.Logger;

public final class DownloadMediaGroup {
    // Carousel items share their parent post's metadata. Each story is its own post.
    public final MediaData carouselParent;
    private final List<MediaData> stories;
    private final int currentStoryIndex;

    private DownloadMediaGroup(MediaData carouselParent, List<MediaData> stories, int currentStoryIndex) {
        this.carouselParent = carouselParent;
        this.stories = stories;
        this.currentStoryIndex = currentStoryIndex;
    }

    public static DownloadMediaGroup carousel(MediaData parent) {
        return new DownloadMediaGroup(parent, null, 0);
    }

    public static DownloadMediaGroup stories(MediaData current, Object reel, UserSession session) {
        if (reel != null && session != null) {
            try {
                UserData currentOwner = current.getUserData();
                String ownerId = currentOwner == null ? null : currentOwner.getUserId();
                String currentId = current.getMediaPkId();
                if (ownerId != null && !ownerId.isEmpty() && currentId != null && !currentId.isEmpty()) {
                    List<MediaData> stories = new ArrayList<>();
                    int currentIndex = -1;
                    Set<String> ids = new HashSet<>();
                    for (Object media : StoryDownloadMedia.items(reel, session)) {
                        MediaData item = new MediaData(media, session);
                        UserData owner = item.getUserData();
                        if (owner == null || !ownerId.equals(owner.getUserId())) continue;
                        String id = item.getMediaPkId();
                        if (id == null || id.isEmpty() || !ids.add(id)) continue;
                        if (id.equals(currentId)) currentIndex = stories.size();
                        stories.add(item);
                    }
                    if (currentIndex >= 0 && !stories.isEmpty()) {
                        return new DownloadMediaGroup(null, stories, currentIndex);
                    }
                }
            } catch (Exception | LinkageError e) {
                Logger.printException(() -> "Could not read story download items", e);
            }
        }
        return new DownloadMediaGroup(null, Collections.singletonList(current), 0);
    }

    public boolean isStoryGroup() {
        return carouselParent == null;
    }

    public int currentFilenameIndex(int position) {
        return carouselParent == null ? currentStoryIndex : Math.max(0, position);
    }

    public int size() throws Exception {
        int rawSize = carouselParent == null ? stories.size() : carouselParent.getCarouselSize();
        return Math.max(1, rawSize);
    }

    public MediaData itemAt(int index) throws Exception {
        if (carouselParent == null) {
            int safeIndex = Math.max(0, Math.min(index, stories.size() - 1));
            return stories.get(safeIndex);
        }
        return carouselParent.getMediaAt(index);
    }

    public String username() throws Exception {
        MediaData authorSource = carouselParent == null ? stories.get(0) : carouselParent;
        UserData userData = authorSource.getUserData();
        String name = userData == null ? null : userData.getUsername();
        return (name == null || name.isEmpty()) ? "instagram" : name;
    }
}
