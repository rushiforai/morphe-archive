# 🧩 Zeldris Patches

Patches for apps I like, built for [Morphe](https://morphe.software).

## ❓ About

Personal Morphe patch bundle maintained by Zeldris ([@zeldrisho](https://github.com/zeldrisho)).
Patches, compatible app versions, and options are listed below; the list is
regenerated on every release.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=zeldrisho/morphe-patches

Or add the source URL manually in Morphe Manager → Sources.

Contributor docs: [development guide](docs/development.md) (start here),
[toolchain setup](docs/toolchain.md) (installs), [QA checklist](docs/qa-checklist.md) (device testing),
[release process](docs/release.md) (publishing).

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/zeldrisho/morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 Threads&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 434.0.0.41.74 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| Change app name | Changes the app name shown under the launcher icon. Set the desired name in the patch options. | • App name |
| Change package name | Changes the app package name so the patched app installs alongside the original Threads. Set the desired package name in the patch options. WARNING: Meta apps hardcode many component/provider references — renaming the package can break Facebook login (SSO), content providers, or push. Disable this patch if you hit such issues. | • Package name |
| Hide ads | Removes sponsored posts from the Threads feed by filtering ad feed units (detected via Media.DED) out of the list merged into the feed cache, before they can render. Feed-scoped; other surfaces (clips/reels) are not affected. |  |
| Remove AD_ID permission | Removes the advertising-id (AD_ID) permissions so the device advertising id cannot be read for ad tracking. Does not disable Meta's core analytics. |  |

</details>

<!-- PATCHES_END -->

## 📜 License

Zeldris Patches are licensed under the [GNU General Public License v3.0](LICENSE)
