# Wouter's bol Patches

Morphe-patches voor de **bol**-app (`com.bol.shop`). Getest op versie **2026.22.1**.

### Toevoegen aan Morphe Manager

https://morphe.software/add-source?github=wouter075/bol-patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/wouter075/bol-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 bol&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 2026.22.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable Play license check](#disable-play-license-check) | Required for a patched (re-signed) app: skips the Google Play license check that would otherwise close the app. |  |
| [Disable tracking](#disable-tracking) | Disables analytics and tracking: RudderStack, AppsFlyer, Firebase Analytics, Crashlytics, Firebase Performance, Sentry, Airship analytics and the advertising id. Push notifications keep working. |  |
| [Hide sponsored content](#hide-sponsored-content) | Removes sponsored products from search results, the sponsored and advertisement sections on product pages, and the display ad banners on the home, search and category pages. |  |

</details>

<!-- PATCHES_END -->

## Patch: Hide sponsored content

| Onderdeel | Wat er gebeurt |
|---|---|
| Gesponsorde producten in zoekresultaten | Het GraphQL-veld `SearchInput.enableSponsoredProducts` wordt altijd `false`. De server stopt dan zelf geen advertenties meer tussen de resultaten. |
| Advertentiesecties op productpagina's | De secties `sponsoredproducts`, `productdisplayad`, `considerationDisplayAd` en `advertisement` worden uit de pagina-indeling gefilterd. Dat geldt voor de indeling uit remote config én voor de ingebouwde standaardindeling. |
| Display-ad-banners | Het antwoord op de query `DisplayAdsAndroid` (home, zoeken, categorieën, productpagina) wordt `displayAds = null`, net als wanneer er geen advertentie voor een plek is. |

Getest in een emulator, met dezelfde zoekopdracht ("koptelefoon", 8 pagina's) en dezelfde productpagina:

| | Origineel | Gepatcht |
|---|---|---|
| "Gesponsord" in zoekresultaten | 7 | 0 |
| "Gesponsord" op de productpagina | 6 | 0 |

## Patch: Disable tracking

| Tracker | Aanpak |
|---|---|
| RudderStack (bol's eigen analytics, via `app-api.bol.com/rs/`) | Events worden niet meer in de uploadwachtrij gezet. De header `Bol-App-Rs-Anonymous-Id` gaat niet meer mee met API-verzoeken. |
| AppsFlyer | `init` krijgt een lege dev-key, dus de SDK start niet. `start`, `log*` en `sendPushNotificationData` doen niets en `isStopped()` is altijd `true`. |
| Firebase Analytics | `firebase_analytics_collection_deactivated` (tijdens runtime niet te overschrijven) en alle Google Analytics-consentvlaggen staan op uit. |
| Firebase Crashlytics, Performance, Sessions | Uit via de manifest. `setCrashlyticsCollectionEnabled` wordt altijd `false`, want de app zet het zelf aan. |
| Sentry | `setDsn` krijgt altijd een lege DSN, en dan schakelt de SDK zichzelf uit. |
| Airship | `analyticsEnabled = false`. Pushmeldingen en het berichtencentrum blijven werken. |
| Advertentie-ID | De permissies `AD_ID` en `ACCESS_ADSERVICES_*` zijn verwijderd. |

Gemeten met een pakketcapture van dezelfde sessie (starten, zoeken, product openen), terwijl in de app **"Alles accepteren"** gekozen was:

- **Weg**: `ingest.de.sentry.io`, `app-measurement.com`, `firebaselogging-pa.googleapis.com`, `launches.appsflyersdk.com`, `cdn-settings.appsflyersdk.com`, `combine.asnapieu.com` (Airship analytics).
- **Over**: de bol-API, afbeeldingen, Firebase Remote Config (bepaalt de pagina-indeling), Airship-registratie (voor push) en één configdownload van `api.rudderlabs.com`. Die laatste bevat geen gebruikersgedrag.

Akamai Bot Manager (`cyberfend`) en Firebase App Check blijven staan. Die zijn botbescherming voor de bol-API, en zonder deze werken inloggen en bestellen mogelijk niet meer.

## Patch: Disable Play license check

Nodig voor elke gepatchte versie. De app bevat Google Play's PairIP-licentiecheck. Een opnieuw ondertekende APK toont anders een scherm "Download deze app via Google Play" en sluit dan af. `LicenseClient.checkLicense()` doet nu niets meer.

### Hoe de patches de code vinden

bol is geobfusceerd met R8, dus klassennamen (`hdj`, `rhh`, `sq7`, …) veranderen per versie. De fingerprints gebruiken daarom stabiele kenmerken:

- **SearchInput**: `toString()` met `SearchInput(query=` en `, enableSponsoredProducts=`. Het veld zelf wordt via het argument naast dat label gevonden.
- **Productpaginasecties**: de enum met de waarden `sponsoredproducts`, … en de methode die `android_config_pdp_phone_configuration` leest.
- **Display ads**: de Apollo-adapter waarin `displayAds` de enige string is.
- **Trackers**: niet-geobfusceerde SDK-API's (`AppsFlyerLib`, `FirebaseCrashlytics`, `AirshipConfigOptions`, `setDsn`) en logstrings zoals `RudderStackDataplanePlugin: Enqueuing `.

## Bouwen

1. Maak een GitHub Personal Access Token (classic) aan met de scope `read:packages`. De Morphe Gradle-plugin staat op GitHub Packages.
2. Zet in `~/.gradle/gradle.properties`:
   ```
   gpr.user=jouw-github-gebruikersnaam
   gpr.key=ghp_xxxxxxxxxxxxxxxx
   ```
3. Zorg dat `ANDROID_HOME` naar de Android SDK wijst, want de extension-module heeft die nodig. Bouw daarna de bundle:
   ```
   ./gradlew buildAndroid
   ```
   Het resultaat staat in `patches/build/libs/patches-*.mpp`.

## Gebruiken

- **Morphe Manager (Android)**: voeg de bron toe, kies bol en geef de `.apks` op (base plus splits, bijvoorbeeld van APKMirror).
- **Morphe Desktop/CLI**:
  ```
  java -jar morphe-desktop-all.jar patch -p patches-1.0.0.mpp bol_2026.22.1.apks
  ```

Een gepatchte app heeft een andere handtekening. Verwijder daarom eerst de Play Store-versie. Je moet dan opnieuw inloggen.

## Nieuwe bol-versie?

Voeg de versie toe aan `targets` in `patches/src/main/kotlin/patches/bol/shared/Constants.kt` en test de patches. Als een fingerprint niet meer matcht, faalt de patch met een duidelijke foutmelding. Zoek dan in jadx opnieuw naar de strings die hierboven staan.
