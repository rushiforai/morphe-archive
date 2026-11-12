package app.variablenine.patches.duet

import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.patch

private const val DESCRIPTION =
    "Keeps reminders from Claude Duet in a small tab at the edge of the screen until you " +
        "mark them done. Meant to be used together with the official Morphe patches. " +
        "Needs notification access, which the app asks for the first time it is opened. " +
        "Does not work with root mount installs."

// No app versions are listed on purpose. The patch does not depend on any code of the
// app, so it applies to whatever version the official patches recommend. The names
// must stay exactly "YouTube" and "Reddit": Morphe Manager matches them against the
// changelog to tell which app a release is for.

@Suppress("unused")
val duetRemindersYouTubePatch = patch(
    name = "Duet reminders",
    description = DESCRIPTION,
    default = true,
) {
    compatibleWith(Compatibility(name = "YouTube", packageName = "com.google.android.youtube"))

    extendWith(EXTENSION)

    execute {
        addReminderSpot(siblingPackages = REDDIT_PACKAGES)
    }
}

@Suppress("unused")
val duetRemindersRedditPatch = patch(
    name = "Duet reminders",
    description = DESCRIPTION,
    default = true,
) {
    compatibleWith(Compatibility(name = "Reddit", packageName = "com.reddit.frontpage"))

    extendWith(EXTENSION)

    execute {
        addReminderSpot(siblingPackages = YOUTUBE_PACKAGES)
    }
}
