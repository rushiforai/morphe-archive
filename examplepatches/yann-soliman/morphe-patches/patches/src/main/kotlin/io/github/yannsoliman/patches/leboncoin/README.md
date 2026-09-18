# Leboncoin patches

## Remove ads

Targets: Leboncoin `100.124.1` and `100.125.0` (`fr.leboncoin`, XAPK).

Leboncoin exposes an application-owned advertising entitlement as a shared
Boolean flow. The home, search, ad-detail and interstitial advertising paths
observe that value and already stop loading placements when it is true.

The patch changes only the false result of the entitlement's date-window
combiner to true. It deliberately leaves Google Mobile Ads, Amazon APS,
Prebid, Equativ and their initialization code intact so that application code
can perform its normal cleanup instead of encountering partially initialized
SDKs.

The patch does not grant a server-side subscription or alter classified-ad
data. Editorial sponsored content and Leboncoin's own promotional surfaces may
use separate feature paths and must be evaluated independently after device
testing.

Recommended device checks:

- home header and discovery sections;
- long search result lists;
- classified-ad detail pages;
- repeated navigation that would normally show an interstitial;
- signed-in and signed-out sessions.

## Privacy mode

Target: Leboncoin `100.125.0` (`fr.leboncoin`, XAPK).

The patch suppresses behavioral analytics and attribution events at their
central dispatch points:

- Firebase Analytics events and user properties;
- Piano Analytics events;
- Adjust conversion events;
- mParticle behavior events and screen views;
- Datadog telemetry through its application-owned `isEnabled` gate.

Firebase, Adjust, mParticle, Batch and Didomi remain initialized. This preserves
Remote Config, consent, push notifications and integrations that share those
SDKs while preventing the targeted event dispatchers from transmitting data.
The patch does not alter API requests required for classifieds, accounts,
messaging, payments or remote feature configuration.

Recommended device checks:

- cold start while signed out and signed in;
- home, search and classified-ad detail navigation;
- account login and logout;
- messaging and push-notification opening;
- consent and privacy settings screens.

## Persistent search filters

Target: Leboncoin `100.125.0` (`fr.leboncoin`, XAPK).

When a new search is opened without an explicit existing search identifier, the
stock application loads the latest `SearchRequestModel` but copies only its
location into an otherwise empty model. The patch keeps the complete previous
model and clears its database identifier, so the next search is still stored as
a new entry while retaining:

- category and keywords;
- location and radius;
- seller and delivery choices;
- price and category-specific dynamic filters;
- sort order and other search toggles.

Opening an existing recent or saved search by its identifier is unchanged.

Recommended device checks:

- configure several filters, run the search, return home and open a new search;
- verify that category, keywords, location, price and sort are restored;
- change the restored filters and verify that the previous recent search still
  exists unchanged;
- open a saved search and verify that its own criteria take priority;
- fully stop and restart the application, then open a new search again.
