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
