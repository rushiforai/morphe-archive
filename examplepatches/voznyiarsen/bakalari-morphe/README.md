# Bakaláři Morphe Patches

Morphe patches for **cz.bakalari.mobile** (Bakaláři OnLine) that disable sponsored ad pop-ups and telemetry.

## Patches

### Disable sponsored ads
Blocks sponsored ad pop-ups by targeting the ad-serving CDN URLs directly:
- `campaign.bakalari.cz`
- `campaign-dev.bakalari.cz`
- `netglade.cz`

### Disable telemetry
Blocks telemetry and analytics by targeting the telemetry-serving CDN URLs directly:
- `app-measurement.com` (Google Analytics)
- `firebase-settings.crashlytics.com` (Crashlytics settings)
- `seq.service.bakalari.cz` (SEQ structured logging)
- `bakalari-dec2b.firebasestorage.app` (Firebase Storage)

All patches are **app-version agnostic** — they target stable backend infrastructure endpoints rather than obfuscated in-app code, so they continue to work across app releases.

## Usage

These patches are consumed by the [Morphe](https://github.com/MorpheApp/morphe-patcher) manager app. Add this repository as a patch source in Morphe to apply the patches to `cz.bakalari.mobile`.

**Source URL:**
```
https://raw.githubusercontent.com/voznyiarsen/bakalari-morphe/main/patches-bundle.json
```

## License

GPLv3 — see the NOTICE file.
