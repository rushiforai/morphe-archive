/*
 * Copyright 2026 xboyrex contributors
 * https://github.com/xboyrex/xboyrex
 */
package app.morphe.extension.suite.instagram.stories;

/**
 * The longest side Upload stories at full quality lets a photo go up at ({@link StoryUploadQuality},
 * #37). Each is one of the sizes Instagram's own photo size step knows, and a photo never goes past
 * its own size.
 */
public enum UploadPhotoSize {
    INSTAGRAM(0),
    E3072(3072),
    E4096(4096),
    E8192(8192);

    /** Longest side in pixels, 0 for Instagram's own. */
    public final int edge;

    UploadPhotoSize(int edge) {
        this.edge = edge;
    }
}
