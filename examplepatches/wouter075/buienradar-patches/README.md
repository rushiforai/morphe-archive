# Wouter's Buienradar Patches

Morphe-patches voor **Buienradar** (`com.supportware.Buienradar`). Getest op versie **7.4.8**.

### Toevoegen aan Morphe Manager

https://morphe.software/add-source?github=wouter075/buienradar-patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/wouter075/buienradar-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Buienradar&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 7.4.8 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide Premium banner](#hide-premium-banner) | Hides the 'Discover Buienradar Premium' promotion block on the Today screen. |  |
| [Hide ads](#hide-ads) | Removes the banner/native ads between the weather cards and the pre-roll ads in weather videos. |  |

</details>

<!-- PATCHES_END -->

## Patch: Hide ads

| Onderdeel | Wat er gebeurt |
|---|---|
| Reclame tussen de weerkaarten | De methode die de lijst met advertentieplekken opbouwt (`AdvertisementItemDisplay`) krijgt `isAdFree = true`, net als bij een premium-account. Er worden dan geen advertentieplekken toegevoegd of geladen. |
| Pre-roll in weervideo's | Waar de app kiest tussen `AdFree` en `ShowAds(...)` wordt altijd `AdFree` gebruikt, zodat er geen VMAP-advertentie-URL wordt opgebouwd. |

Alle andere functies (radar, widgets, account, meldingen) blijven ongemoeid.

## Patch: Hide Premium banner

Verbergt het blok "Ontdek Buienradar Premium" op het Vandaag-scherm. Het promotieblok heeft drie toestanden: `ShowUI(list, type)`, `Loading` en `Hide`. In de methode die de promoties voor het Vandaag-scherm laadt, worden `ShowUI(…, TODAY)` en `Loading` vervangen door `Hide`. Het promotieoverzicht in Instellingen blijft gewoon werken.

Fingerprints: de enum met de strings `TODAY` en `SETTINGS`, en de `toString()` van `ShowUI(list=`. `Loading` en `Hide` worden gevonden als subklassen van dezelfde sealed class.

### Hoe de patch de code vindt

Buienradar is geobfusceerd met R8, dus klassennamen (`cg`, `nn1`, `nd`, `od`) veranderen per versie. De fingerprints leunen daarom op stabiele kenmerken:

- **AdItemsFingerprint**: parametervorm `(Z, …, String, …, Location, …, String, Continuation)` plus de strings `rect`, `ski`, `top` en `bottom`.
- **AdFree / ShowAds**: gevonden via hun `toString()` (`"AdFree"` en `"ShowAds(allowPersonalizedAds="`). Daarna wordt dynamisch de methode gezocht die `AdFree` leest en `ShowAds` aanmaakt.

## Bouwen

1. Maak een GitHub Personal Access Token (classic) aan met de scope `read:packages`. De Morphe Gradle-plugin staat op GitHub Packages.
2. Zet in `~/.gradle/gradle.properties`:
   ```
   gpr.user=jouw-github-gebruikersnaam
   gpr.key=ghp_xxxxxxxxxxxxxxxx
   ```
3. Bouw de bundle:
   ```
   ./gradlew buildAndroid
   ```
   Het resultaat staat in `patches/build/libs/patches-*.mpp`.

## Gebruiken

- **Morphe Manager (Android)**: voeg de `.mpp` toe als patch-bron, kies Buienradar, en geef de APKM van APKMirror op.
- **Morphe Desktop/CLI**:
  ```
  java -jar morphe-desktop-all.jar patch -p patches-1.0.0.mpp Buienradar_7.4.8.apkm
  ```

Of zet deze repo op GitHub. De meegeleverde `release.yml`-workflow bouwt en publiceert de `.mpp` dan automatisch, en je kunt de repo-URL als bron toevoegen in Morphe Manager.

## Nieuwe Buienradar-versie?

Voeg de versie toe aan `targets` in `patches/src/main/kotlin/patches/buienradar/shared/Constants.kt` en test de patch. Als een fingerprint niet meer matcht, faalt de patch met een duidelijke foutmelding. Zoek dan in jadx opnieuw naar `AdvertisementItemDisplay(` en `ShowAds(allowPersonalizedAds=`.
