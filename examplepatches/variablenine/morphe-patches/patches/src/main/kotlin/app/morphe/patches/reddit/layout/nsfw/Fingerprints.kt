package app.morphe.patches.reddit.layout.nsfw

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.parametersMatch
import app.morphe.patches.all.misc.resources.ResourceType
import app.morphe.patches.all.misc.resources.resourceLiteral
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * The static helper that turns one drawer section into rows. Deliberately a separate instance
 * from the identical fingerprint in the 'Hide sidebar components' patch: a [Fingerprint] caches
 * its match, so a shared instance would hand the second patch to run indices the first had
 * already shifted. Both inject at the head of this method and chain in either order, one
 * dropping sections and the other appending a row.
 */
private object DrawerSectionBuilderParentFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = $$"Lcom/reddit/navdrawer/analytics/CommunityDrawerAnalytics$Section;",
    parameters = listOf("Lcom/reddit/screens/drawer/community/HeaderItem;"),
    filters = listOf(
        methodCall("Ljava/lang/Enum;->ordinal()I"),
        fieldAccess(
            $$"Lcom/reddit/navdrawer/analytics/CommunityDrawerAnalytics$Section;->" +
                    $$"ABOUT:Lcom/reddit/navdrawer/analytics/CommunityDrawerAnalytics$Section;"
        )
    )
)

internal object NsfwDrawerSectionFingerprint : Fingerprint(
    classFingerprint = DrawerSectionBuilderParentFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    filters = listOf(
        methodCall("Ljava/util/Collection;->isEmpty()Z"),
    ),
    custom = { method, _ ->
        parametersMatch(
            method.parameters,
            listOf(
                "L",
                "Ljava/util/List;",
                "Ljava/util/Collection;",
                "L",
                "L",
                "Z",
                "I"
            )
        ) || parametersMatch( // 2026.12.0+
            method.parameters,
            listOf(
                "Ljava/util/List;",
                "Ljava/util/Collection;",
                "L",
                "L",
                "Z",
                "I"
            )
        )
    }
)

/**
 * The drawer's click router.
 *
 * The previous anchor here assumed the tapped row was fetched from a map and cast, which is how
 * a later app version does it. On 2026.14.0 the router instead receives an *action* carrying an
 * index and reads the row out of its own list, so nothing matched and the row was never added
 * either - the two hooks used to be applied together.
 *
 * Anchoring on the lambda class Reddit leaves unobfuscated avoids guessing at either shape; the
 * extension resolves the row from the action reflectively and only acts when it finds its own
 * title resource id, so a wrong guess is inert rather than harmful.
 */
internal object NsfwDrawerItemClickFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        newInstance(
            type = $$"Lcom/reddit/screens/drawer/community/CommunityDrawerPresenter$handleGenericItemClicked$1;"
        )
    )
)

/**
 * The feed view model, captured as it is built so the mode switch can reload the home feed.
 *
 * Reddit does not obfuscate this class, and it declares exactly one constructor, so no signature
 * is needed to pin it. Everything the extension needs is reachable from the instance by shape:
 * a `com.reddit.feeds.data.FeedType` field says which feed it is, and the pager is the field
 * whose class takes a `com.reddit.feeds.ui.events.FeedRefreshType`.
 */
internal object NsfwFeedViewModelFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/feeds/impl/ui/RedditFeedViewModel;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR)
)

/**
 * The home feed's page builder: it takes the GraphQL response, walks its edges into feed
 * elements, and returns a page.
 *
 * This is the patch's only feed hook. Two earlier ones were dropped: the `Listing` model is the
 * cache path shared by every screen that reads a listing, and `RedditListingFeedElementMapper`
 * `.getFeedElements` has exactly one real caller - the History feed. Neither reaches the home
 * feed, and both could empty an unrelated screen. Filtering the response's edges here, before
 * they become elements, is also the only place a post's NSFW state is still visible: the
 * elements themselves carry only a link id, a unique id, an "is promoted" flag and an
 * identifier.
 *
 * Anchored on the package (Reddit does not obfuscate `com/reddit/feeds/home/impl/data/paging/`)
 * plus the two unobfuscated enum constants the method reads, which pin it precisely.
 */
internal object NsfwHomeFeedPageFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/feeds/home/impl/data/paging/",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("L", "Ljava/lang/Integer;", "L"),
    filters = listOf(
        fieldAccess(
            smali = "Lcom/reddit/feeds/data/FeedType;->HOME:Lcom/reddit/feeds/data/FeedType;"
        )
    )
)

/**
 * The home app bar's search field, which draws Reddit's brand mark to the left of the hint.
 *
 * The bar is Compose, so there is no view to reach for: the mark is one `painterResource` call
 * on `icon_brand_full_color`, and the swap is done by rewriting that one resource id. Anchored on
 * the package - Reddit does not obfuscate
 * `com/reddit/feedslegacy/switcher/impl/homepager/compose/composables/revamp/rplcustom/` - plus
 * the drawable itself, resolved by name so the match does not depend on an id that moves every
 * release.
 */
internal object NsfwHomeAppBarBrandIconFingerprint : Fingerprint(
    definingClass =
        "Lcom/reddit/feedslegacy/switcher/impl/homepager/compose/composables/revamp/rplcustom/",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    filters = listOf(
        resourceLiteral(ResourceType.DRAWABLE, "icon_brand_full_color")
    )
)
