package app.morphe.extension.youtube.patches.components;

import app.morphe.extension.shared.patches.components.BufferAsciiStrings;
import app.morphe.extension.shared.patches.components.ContextInterface;
import app.morphe.extension.shared.patches.components.Filter;
import app.morphe.extension.shared.patches.components.StringFilterGroup;
import app.morphe.extension.youtube.settings.Settings;

/**
 * Hides "brainrot" spam comments — obfuscated, combinatorial reshuffles of a tiny meme
 * vocabulary ("anti spiral viral", "anti anti spiral", "fix mojang bedrock", ...) — while
 * keeping legitimate comments that merely mention those words. Detection logic lives in
 * {@link BrainrotDetector}; this class only wires it into the Litho filter pipeline.
 *
 * <p>Registered on the {@code comment_thread.eml} component (the same path token the built-in
 * "Hide comments by keywords" uses), so a filtered comment is dropped from the list and the
 * next comment takes its place. Gated by {@link Settings#HIDE_BRAINROT_COMMENTS}.
 */
@SuppressWarnings("unused")
public final class BrainrotCommentFilter extends Filter {

    private final BrainrotDetector detector = new BrainrotDetector();
    private final StringFilterGroup commentThread;

    public BrainrotCommentFilter() {
        commentThread = new StringFilterGroup(
                Settings.HIDE_BRAINROT_COMMENTS,
                // Expanded comment list items,
                "comment_thread.eml",
                // and the collapsed comment preview/teaser shown under the video.
                "comments_entry_point_teaser",
                "comments_entry_point_simplebox"
        );

        addPathCallbacks(commentThread);
    }

    @Override
    public boolean isFiltered(ContextInterface contextInterface, String identifier, String accessibility,
                              String path, byte[] buffer, BufferAsciiStrings asciiStrings,
                              StringFilterGroup matchedGroup, FilterContentType contentType, int contentIndex) {
        if (matchedGroup == commentThread) {
            // asciiStrings holds the printable runs in the component buffer (the comment text,
            // plus author/UI strings and layout identifiers). Evaluate each run separately so the
            // surrounding noise doesn't dilute the comment-text run below the detection threshold.
            return detector.shouldHideAnySegment(asciiStrings.getStrings());
        }

        return false;
    }
}
