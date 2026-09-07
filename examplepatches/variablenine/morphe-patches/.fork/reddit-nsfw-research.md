# Reddit NSFW mode — APK research notes

Findings from decompiling **Reddit 2026.35.0** (`com.reddit.frontpage`, the newest experimental
target in `COMPATIBILITY_REDDIT`). Recorded so the next session does not have to redo the work.

Method: apkcombo serves the `.xapk` over a signed R2 URL that this environment can reach
(most APK mirrors are blocked by the egress proxy, apkcombo is not). `unzip` the xapk →
`com.reddit.frontpage.apk` → `classes*.dex` (13 files, 97 MB), then jadx 1.5.3
(`--single-class` for one class, or a whole dex at a time; `classes6.dex` holds the feed code).

## Confirmed: the shipped `Listing` hook is correct for 2026.35.0

- `com.reddit.domain.model.listing.Listing<T>` is still a Kotlin data class whose constructor
  writes `children`, `after`, `before`, `adDistance`, `geoFilter`, `hasRecommendations`,
  `uxExperiences`. `NsfwListingFingerprint` (IPUT `children` → IPUT `after` → IPUT `before`)
  still matches.
- `com.reddit.domain.model.Link` declares **`public final boolean getOver18()`** over an
  `over18` field. That is the first accessor `NsfwPostDetector` tries, so detection resolves on
  the first candidate with no fallback needed.

Not yet confirmed on-device: whether the **home feed** is actually built from `Listing` in this
version, or only subreddit/user listings are. That needs a patched install, not a decompile.

## The modern (section-backed) feed carries no NSFW flag

The section/element classes are obfuscated but their `toString` prefixes survive:

- Post sections: `FeedPostSection(linkId=` (`defpackage.wki` in `classes6.dex`),
  plus `ClassicPostSection`, `ChromelessCustomPostSection`, `PostTitleWithThumbnailSection`,
  `TitleWithLinkedPreviewSection`. Ad equivalent: `AdPostSection(linkId=` (what `Hide ads` hooks).
- `FeedPostSection` fields: `linkId, sections, uniqueId, identifier, promoted, recommended,
  removed, isSubredditFeed, isVideo, disabledA11yLabels, cachingMetadata`.
- `PostElement(linkId=` (`defpackage.gy10`) fields: `linkId, feedElements, identifier,
  groupRecommendationContext, gilded, isGildable, removed, crosspostSeedLinkId, dataSourceType,
  cachingMetadata`.

**Neither exposes an NSFW flag**, so the `Hide ads` trick of hooking the section constructor does
not transfer: `promoted` is a section field, `over18` is not. Filtering the modern feed needs the
flag looked up upstream of section construction (by `linkId`, or in the GraphQL post fragment)
rather than read off the section. This is the open problem for Popular/Latest coverage.

## The home feed selector has no "Popular" in this version

`com.reddit.feedslegacy.switcher.*` is unobfuscated:

- `HomePagerScreenTab` is a sealed `Parcelable` with exactly two subclasses: `HomeTab` (id
  `"home"`) and `FollowingTab`.
- `HomePagerScreenPresenter` (`defpackage`-renamed to `.impl.homepager.b`) builds the visible
  tabs in `l(List)`: it maps `HomeTab` → string res `2131955469`/`2131955707`, `FollowingTab` →
  `2131955463`, and calls `zeq.d()` (unreachable) for anything else, producing
  `HomePagerScreenTabUiModel(id, displayName, isBadged, tab)`.
- Popular is not one of these tabs. It lives on its own screen — resources
  `popular_app_bar_title`, `popular_feed_label`, `discover_all_nav_popular_title`.
- `feed_switcher` / `feed_switcher_menu` exist only as analytics event names
  (`com.reddit.data.events.feed_switcher.*`), not as a UI the tabs come from.

So "add an entry next to Popular in the feed dropdown" does not map onto 2026.35.0 as described.
Adding a **third home tab** is tractable — new `HomePagerScreenTab` subclass, inject it into the
list `l()` receives, extend `l()`'s branch, and give the pager a screen for it — but it is a
different, larger change than adding a row to an existing menu, and it needs the target version
pinned first.

## The target UI is the navigation drawer, not a tab row

A screenshot from the user's own install shows the left nav drawer: **Popular**, **Latest**,
then a divider, then *Discover communities*, *Start a community*, then the `Games on Reddit`,
`Recently Visited`, `Favorites` and `Moderating` sections. "The feed dropdown menu" means this
drawer, and "next to Popular" means a new row under Popular/Latest.

This is a surface the fork already reaches. `hideSidebarComponentsPatch` hooks
`CommunityDrawerBuilderFingerprint` — a static method taking a `Collection` of drawer items —
and `HideSidebarComponentsPatch.hideComponents(Collection, HeaderItemInterface)` returns a
replacement collection. Adding a row is the same hook used to *add* rather than *drop*.

Note `HeaderItem` (the enum that patch filters on: ABOUT, COMMUNITIES, FAVORITES,
GAMES_ON_REDDIT, MODERATING, RECENTLY_VISITED, REDDIT_PRO, RESOURCES) covers the *section
headers* only. Popular/Latest are top-level rows built elsewhere;
`com.reddit.screens.drawer.community.CommunityDrawerPresenter` (largely unobfuscated method
names — `handleGenericItemClicked`, `handleCtaItemClicked`, `handlePredefinedItemFavUnfavClicked`,
`loadAboutDrawerItems`) is where they are assembled and where their clicks are routed.
`GenericPredefinedUiModelType` is **not** it — that enum holds only `CUSTOM_FEEDS`.

## Reddit has a first-class MATURE feed

Both feed enums carry a mature entry:

- `com.reddit.feeds.data.FeedType`: `NEWS, HOME, POPULAR, LATEST, MATURE, SUBREDDIT,
  COMMUNITIES, TOPIC, ALL, CUSTOM, SAVED_POSTS, ARENA, GAMES, CLUB, CATEGORY,
  CONTRIBUTION_COPILOT, DYNAMIC, INTERESTS, FOLLOWING`
- `com.reddit.listing.common.ListingType`: `HOME, POPULAR, LATEST, MATURE, ...`

`MATURE` is live, not dead code: it appears in the generated `WhenMappings` ordinal tables
(`defpackage.api`, `defpackage.bpi`) beside HOME/POPULAR/LATEST, `defpackage.zfi` branches on
`feedType == FeedType.MATURE` for post navigation, and `com.reddit.feeds.impl.ui.h` treats
`{POPULAR, MATURE}` as one set when deciding overflow-menu behaviour.

That reframes the feature. Instead of client-side filtering of the home feed, NSFW mode could be
a drawer row that opens Reddit's **own** mature feed — the app already knows how to render it,
and the result is a real paginated feed rather than a thinned-out Home. Open questions before
committing to that: which navigator builds a feed screen from a `FeedType` (several
`defpackage` classes take a `FeedType` parameter), and whether the mature listing endpoint still
returns anything server-side for an account with 18+ browsing enabled.

## How the drawer's Popular / Latest rows are actually built

`CommunityDrawerPresenter` is `com.reddit.screens.drawer.community.c` in `classes6.dex`
(the class keeps its name; its members are obfuscated). Drawer rows are plain constructor calls
carrying **resource ids**, which makes them cheap to imitate:

```java
new qt6(boolean, int titleRes, int iconRes, long uniqueId)   // simple row
new u7k(long uniqueId, int titleRes, int iconRes, boolean, GenericPredefinedUiModelType, int)
```

The Home/Popular/Watch/Latest rows come from one merged synthetic `Function0` in `c`, switched on
a lambda index — each is a lazily built field of the presenter:

| case | titleRes | resolves to | iconRes |
|---|---|---|---|
| 1 | 2131956125 | (home) | 2131231656 |
| 2 | 2131959179 | `popular_feed_label` | 2131231831 |
| 3 | 2131958780 | (watch) | 2131231761 |
| default | 2131956400 | `latest_feed_label` | 2131231755 |

Other rows, for reference: `communities_cta_title` + `icon_communities` (Discover communities),
`label_custom_feeds`, `label_start_a_community`, `label_mail`, `label_mod_mail`,
`label_manage_moderated_communities`.

Rows reach the visible list through two static helpers, both already in fingerprint range:

- `hh3.q(ListBuilder, Collection, HeaderItemUiModel, PaginationType, boolean, int)` — a whole
  section. This is what `CommunityDrawerBuilderFingerprint` matches and what
  `HideSidebarComponentsPatch.hideComponents` already intercepts.
- `hh3.r(ListBuilder, item)` — a single row.

`HeaderItemUiModel` is `defpackage.ion` (`uniqueId`, `HeaderItem`, boolean, String, boolean).

Clicks land in `CommunityDrawerPresenter.handleGenericItemClicked`, which does **identity**
comparisons (`Intrinsics.areEqual(item, this.B1)` and so on) against those presenter fields, then
calls a navigator interface (`defpackage.hox`: `.d()` create community, `.e()` custom feeds,
`.k()` login, `.l()` mod queue, `.m()`, `.r()` recap). An injected row will match none of them and
fall through, so recognising it is better done by **comparing its title resource id** to the one
Morphe adds than by identity.

### Sketch for the NSFW row

1. Add a Morphe string, take its generated id via `resourceMappingPatch`, and reuse Reddit's own
   `2131231831` (the Popular icon) so no drawable has to be shipped.
2. Hook `hh3.r` (or the presenter method that adds the Latest row) and append
   `new qt6(false, <morphe title id>, 2131231831, <uniqueId>)`. Constructor descriptor is
   `(ZIIJ)V`.
3. Hook `handleGenericItemClicked`, match on the title id, and run the NSFW action.

### Still open: how to navigate to the MATURE feed

Step 3's action is the unresolved piece. `hox`'s methods are the drawer's navigation surface but
the interface is split across dex files and decompiles empty in `classes4.dex`, so the call that
opens a feed for a given `FeedType` has not been pinned down yet. Several `defpackage` classes
take a `FeedType` parameter (`w1o, z570, nug, xoi, gd3, t570, p110, i8h0, n9i, omi`) and are the
place to look next.

Strongest evidence yet that MATURE is renderable client-side: `defpackage.vh40.L(FeedType)`
maps **every** feed type to a `com.reddit.qsf.screens.QsfScreenType`, and `MATURE` has its own
`MATURE_FEED` entry sitting in the same complete `switch` as `HOME_FEED`, `POPULAR_FEED`,
`LATEST_FEED` and `ALL_FEED`. It is not a leftover constant.

Two navigation helpers the drawer already uses look like an easier action than the internal
navigator, since both take a plain destination rather than an obfuscated screen type:
`defpackage.hrx.d(..., Activity, Uri, ..., int)` (used for the Reddit Rules / Privacy Policy /
User Agreement rows) and `com.reddit.deeplink.a.a(deeplinkNav, Context, String, int)` (used for
link rows). No `/mature`-style route showed up in the deeplink path strings, though, so whether
either can address the mature feed is still unproven.

One caution found along the way: `QsfScreenType.MATURE_FEED` exists alongside
`RESOLVER_GATE_PRESENTATION_MATURE_DESTINATION` and
`CHECKPOINT_GATE_PRESENTATION_MATURE_DESTINATION`, which look like age-verification gates in front
of a mature destination. So even if the navigation is wired up, the feed may demand verification
before it renders — one more reason the fallback path has to exist and has to say which branch it
took.


## Settled: the MATURE feed is not reachable, and the row toggles the filter

Every feed the app can show has its own screen class — `HomeFeedScreen`, `PopularFeedScreen`,
`LatestFeedScreen`, `AllFeedScreen`, `NewsFeedScreen`, `GamesFeedScreen`, `FollowingFeedScreen`,
`HistoryFeedScreen`, `SavedPostsFeedScreen`, `InterestsFeedScreen`. **There is no
`MatureFeedScreen`**, and nothing constructs a feed for `FeedType.MATURE`.

The drawer's navigator confirms it from the other direction: each feed row calls its own no-arg
method (`hox.p()` Popular, `hox.n()` Watch, `hox.h()` Latest). There is no "open feed by type"
call to pass MATURE to, and no mature method to call. Several feed-behaviour sets
(`d670`, `RedditFeedViewModel`) list the feed types they apply to and simply omit MATURE.

So the MATURE constants are exhaustiveness artifacts: Kotlin `when` over an enum must cover every
entry, which is exactly why MATURE shows up in `api`/`bpi`/`vh40` mapping tables and nowhere that
builds UI. `MATURE_DESTINATION` sits among GraphQL enum values, not screens; the only real
`Mature*` screens are age-gating and settings (`MatureContentFlowHostScreen`,
`MatureContentSettingsScreen`, `MatureContentBottomSheetScreen`, `CommunityTypeMatureSettingsScreen`).

The drawer row therefore toggles NSFW mode's feed filter. Reaching a real mature feed would mean
building a feed screen inside the patch, which is out of proportion to the feature.

## Device result (v1.2.1, Reddit 2026.14.0): the Listing hook is the wrong path

Toast on device: `NSFW mode: kept 0 of 6 posts` / `Drawer row: hook never ran`, **with the home
feed still showing its normal SFW posts**.

That is decisive. The listing hook fires and the detector reads the posts fine (0 of 6 classified
as NSFW, not "could not read"), but emptying that listing does not change the feed. So
`com.reddit.domain.model.listing.Listing` is not what renders the modern home feed.

The APK says the same thing independently. The Room schema in `defpackage.g8u` creates
``listing`` and ``link`` tables (`linkId`, `listingPosition`, `linkJson`, `listingId`) — `Listing`
and `Link` are the **cache / legacy** path. Verifying the fingerprint against real bytecode proved
the hook was correctly placed on a code path that is not the one that matters.

### The modern feed carries no NSFW flag anywhere the filter can reach

The live home feed is GraphQL cell-based:

`OnCellGroupFragment` (`defpackage.kvy`) → `CellGroupFragment` (`cc7`) → cells → feed elements.

The feed element base class is `defpackage.qci`, and its whole state is:

| field | meaning |
|---|---|
| `a` | linkId |
| `b` | uniqueId |
| `c` | boolean — isPromoted |
| `d` | `ib70` identifier |

No NSFW flag. Nor do `PostElement` (`gy10`) or `FeedPostSection` (`wki`) carry one — which is
why `Hide ads` can filter on `promoted` but nothing can filter on `over18` at this level.

### The insertion point that would work

`defpackage.zci.b(kvy, kc7, mug)` converts one post model into one feed element, and **already
returns null** when conversion throws — so its callers tolerate a dropped post. Returning null
there for a non-NSFW post is the natural way to filter the modern feed.

What is still missing is the NSFW flag on the input side: it has to be found in the GraphQL cell
fragment chain (`cc7` → cells), which the feed dex's own classes do not expose. That is the next
piece of work, and it needs the APK version actually being patched — every failure in this feature
so far traces to developing against 2026.35.0 while the target install is 2026.14.0.

### Drawer row

`Drawer row: hook never ran` means `NsfwDrawerItemClickFingerprint` (resolved first, so its
failure suppresses both hooks) did not match on 2026.14.0 — most likely the
`CommunityDrawerPresenter$handleGenericItemClicked$1` lambda class or the map-lookup/cast
sequence differs there. The section fingerprint is a copy of the shipping
`hideSidebarComponentsPatch` one and is more likely sound; decoupling the two so a click-hook
miss does not also cost the row would at least distinguish the two failures.

## The silent killer: non-range `invoke-static` cannot reach high parameter registers

Three hooks, one difference, verified by reading register counts straight out of the 2026.14.0 dex
(androguard, `code_item.registers_size` / `ins_size`):

| Method | registers | ins | `p0` | outcome |
|---|---|---|---|---|
| `u.b(List, Collection, ...)` — section builder | 7 | 6 | **v1** | row appeared |
| `y.a(n)` — drawer click router | 36 | 2 | **v34** | hook silently absent |
| `d.a(List, FeedLayout, Continuation)` — `getFeedElements` | 23 | 4 | **v19** | hook silently absent |

`invoke-static {vX}` encodes each register in 4 bits, so it only addresses v0–v15. In a large
method the parameter registers sit at the *top* of the frame, far above that, and the smali
simply fails to assemble. Wrapped in a `try`/`catch`, that failure looks identical to a
fingerprint miss: no hook, no crash, no message.

The section hook survived only because it was copied from `hideSidebarComponentsPatch`, which
already used `invoke-static/range`.

**Rule: always use `invoke-static/range { pN .. pM }` for parameter registers.** It is correct at
any register number and costs nothing when the register is low. Never assume a parameter is
reachable by the fixed form, and never let a `try`/`catch` hide an assembly error without also
reporting it - the diagnostics were reporting the row's state while saying nothing about the two
hooks that were actually missing.

Fingerprint anchors, verified present in the same dex: `y.a` is `public final void` and contains
exactly one `new-instance CommunityDrawerPresenter$handleGenericItemClicked$1`; `d.a` is
`public final`, returns `Ljava/lang/Object;` and contains exactly one
`new-instance RedditListingFeedElementMapper$getFeedElements$1`. Both fingerprints resolve.

## Where the home feed's NSFW flag actually lives

Three feed hooks were tried before one reached the home feed. Recorded so the dead ends are not
re-explored:

| Hook | Reality |
|---|---|
| `Listing.<init>` children | The **cache** path. Reddit's Room schema names the tables `listing`/`link`. Filtering it empties nothing on screen. |
| `RedditListingFeedElementMapper.getFeedElements(List<Link>)` | Has exactly **one** real caller: `com.reddit.feeds.history.impl.data.b.h` - the **History** feed. |
| `com.reddit.feeds.home.impl.data.paging.d.a(f50, Integer, sw1.b)` | **The home feed.** Walks the GraphQL response's edges into elements and returns a page. |

The home feed never creates `Link` objects at all - none of `GqlPostToLinkDomainModelMapper`'s 30
callers is in the feed path - so `Link.getOver18()` is unavailable there. And the feed element
base class `ym1.g0` carries only `linkId`, `uniqueId`, an `isPromoted` boolean and an identifier.
That is why `Hide ads` can filter on `promoted` and nothing could filter on `over18`.

### Where NSFW actually lives in a cell (2026.14.0)

`MetadataCellFragment.statusIndicators` was the first guess and it is **wrong**.
`com.reddit.type.PostStatusIndicatorType` has no `NSFW` constant at all - its members are
`ADMIN, MOD, PINNED, LOCKED, REPORTED, APPROVED, REMOVED, PROFILE_VERIFIED_AUTHOR, BOT, APP,
UNKNOWN__`. Reading it can only ever answer "not NSFW", which empties the feed.

The real marker is **`com.reddit.type.CellIndicatorType.NSFW`**
(`APP, CLUB_CONTENT, COMMERCIAL_COMMUNICATION, GAME, NSFW, ORIGINAL, QUARANTINED, SPOILER,
UNKNOWN__`), carried in `IndicatorsCellFragment.indicators` - `ep1.wg0`, a member of the shared
`Cell` union `ep1.jm` that every feed query parses through `ep1.nm`. A second enum,
`com.reddit.type.NSFWState`, spells the same flag `NSFW` elsewhere in the schema. Enum constant
names go over the wire, so R8 leaves them alone; the enum *type* is matched on the constant name
rather than the class, which covers both.

The post id travels alongside as a `t3_` fullname. Both are read by shape rather than by field
name, since every field on those fragments is renamed each release.

The feed pipeline's own mirror of that flag confirms the route: the home feed maps the indicators
cell into `com.reddit.feeds.model.IndicatorsElement` via
`com.reddit.feeds.impl.data.mapper.gql.cells.IndicatorsCellDataMapper`, and
`com.reddit.feeds.model.IndicatorType` carries the same five members
(`APP, NSFW, ORIGINAL, QUARANTINED, SPOILER`). Neither name is obfuscated, so if the
response-side filter ever stops finding the tag, filtering the **mapped** elements on
`IndicatorType.NSFW` is the fallback hook - same information, one step further down the pipeline.

**Depth is part of the answer.** An edge reaches its indicators through

```
Edge (d50) -> FeedElementEdgeFragment (a50) -> Node (z40) -> OnCellGroupFragment (jb1)
  -> CellGroupFragment (lm) -> cells -> Cell (jm) -> IndicatorsCellFragment (wg0)
  -> indicators -> CellIndicatorType.NSFW
```

which is nine hops. A walk that stops at four finds the post id (`Node.id`, three hops) and none
of the tags, so every post reads as SFW - the failure looks exactly like a correct filter over a
feed with no 18+ posts.

The page builder is anchored by its package - `com/reddit/feeds/home/impl/data/paging/` survives
obfuscation - plus the unobfuscated `FeedType.HOME` constant it reads. Its edge list is filtered
in place before conversion; the loop already skips null elements, and unreadable edges are kept
rather than dropped. Filtering in place also keeps the two values the builder reads off the same
response - `f50Var.b.a`, the pagination cursor, and `f50Var.a`, the dist - exactly as they
arrived.

### The other two hooks were removed

`Listing.<init>` and `RedditListingFeedElementMapper.getFeedElements` were both hooked while the
home feed path was still being found. Neither reaches it, and both are wider than this mode:
`Listing` is the cache path shared by every screen that reads a listing - subreddits, saved
posts, search, profiles - so filtering it can empty a screen that has nothing to do with NSFW
mode, and the element mapper serves the History feed. They are gone, and should not come back:
the home page builder is the whole hook.

### A page must never come back empty

`d.a` returns `new lk1.b(elements, cursor, ...)`. Hand it a page whose element list is empty and
the feed has nothing to draw and nothing to scroll, which on screen is a spinner that never
resolves - the state the first working build of the home hook shipped in. So when a page filters
down to no posts at all, one post is kept back. It costs a single SFW post per barren page and
it leaves the feed something to render, which is what lets it page on to where the 18+ posts
are.


## The home app bar is Compose (2026.14.0)

The Reddit mark at the top of the home screen is not a view. `toolbar_nav_search.xml` still
exists but is a different, older bar - its hint is `action_search` ("Search"), while the one on
screen reads `search_bar_hint` ("Find anything"), and that string appears in **no layout at all**.
It is loaded from `j22.g0.f(...)`, a composable tagged `home_revamp_m1_app_bar`, which calls

```
com.reddit.feedslegacy.switcher.impl.homepager.compose.composables.revamp.rplcustom.d
    .a(int, Composer, Modifier, String hint, Function0)
```

and that method draws the mark with a single `painterResource(icon_brand_full_color)`. That one
resource id is the whole hook: rewriting it swaps the mark, with nothing added to the tree and
nothing drawn over. The `rplcustom` package is not obfuscated; the class letter (`d`) is, which
is why the fingerprint anchors on the package plus the drawable resolved by name.

`new_reddit_logo` and `reddit_logo_header` are red herrings - neither is referenced from code in
this build.

Reddit's own NSFW colour is `#ff585b`, identical across every theme (`alienblue_nsfw`,
`midnight_nsfw`, `mint_nsfw`, `night_nsfw`, ...).


## The home feed is not only posts

`ep1.z40` (the feed element Node) has **22** alternative fragments, and only a few of them are
posts:

```
onCellGroupFragment          <- a post
postPreviewComponentFragment  onboardingInFeedFragment      topicPickerFeedElement
amaCarouselFragment           carouselCommunityRecommendationsFragment
listStyleCommunityRecommendationsFragment   compactPostCommunityRecommendationsFragment
cardPostCommunityRecommendationsFragment    chatChannelFeedUnitFragment
chatChannelsFeedUnitFragment  taxonomyTopicsFeedElementFragment
exploreFeaturedItemsFragment  topicPillsGroupFragment       rankedCommunityFragment
postCarouselFragment          storyClusterCarouselFragment  linearPostCardFragment
theaterPostCardFragment       profileVisibilityBannerFragment
profileNoContentBannerFragment
```

None of the recommendation, chat, topic or explore units carries a `t3_` id - they reference
subreddits (`t5_`), topics and channels - so the scanner returns null for them. The filter used
to read null as "not a post, leave it alone", which meant every community recommendation
carousel, chat channel unit and topic pill row stayed in a feed that was supposed to hold 18+
posts only. That is what "SFW posts still making it through" was. They are dropped now.

The page-level fail-open still stands and is what it was always for: if **no** edge on a page
carries a post id at all, the response shape has changed, and the page is left alone.
