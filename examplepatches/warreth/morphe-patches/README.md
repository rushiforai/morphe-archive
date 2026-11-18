# Warreth Patches

Morphe patches for apps I use.

## Add to Morphe

1. Open Morphe Manager.
2. Go to **Patches** → **Sources** (or **Settings** → **Patch sources**).
3. Add this repo: `warreth/morphe-patches`
4. Refresh, then patch the app from the **Patches** tab.

Or use the button: [Add to Morphe](https://morphe.software/add-source?github=warreth/morphe-patches)

## Apps

| App | Package | Version | Patches |
| --- | --- | --- | --- |
| ScreenZen | `com.screenzen` | 2.9.4 | Add Vanadium and Cromite support |

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/warreth/morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 ScreenZen&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.screenzen`

**🎯 Supported versions:**

| 2.9.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Add Vanadium and Cromite support](#add-vanadium-and-cromite-support) | Adds Vanadium and Cromite to the browsers whose address bar ScreenZen reads, so website blocking also works in those browsers. |  |

</details>

<!-- PATCHES_END -->

## Notes

- **Status:** tested and confirmed working on ScreenZen 2.9.4 with Vanadium 157.0.8103.50.0
  and Cromite 153.0.8010.37.
- ScreenZen is distributed as an XAPK (split APK bundle). Use the XAPK, not a single APK.
- The patch adds Vanadium (`app.vanadium.browser`) and Cromite (`org.cromite.cromite`) to the
  browsers ScreenZen reads the address bar from, so website blocking works there too.
- ScreenZen still needs its Accessibility service enabled for website blocking to work.
- The in-app "Supported Browsers" dialog still shows the original list; only the actual
  blocking behaviour is patched.

## License

GPLv3. Based on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template).
