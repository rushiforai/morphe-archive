# 🧩 ynotzort's morphe patches

Patches for apps I like.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/ynotzort/morphe-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Symfonium&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 15.0.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable Symfonium beta expiry](#disable-symfonium-beta-expiry) | Stops the intermittent "this beta version has expired" screen. The navigation resolver randomly (≈10% of screen changes, when in a particular licence state) hijacks navigation to the ExpiredBeta destination; this forces the guard that enables that redirect to fail, so navigation always goes to the requested screen. Nothing else (licence state, the random source) is modified. Validated on 15.0.1 (versionCode 127798). |  |
| [Disable Symfonium trial expiry](#disable-symfonium-trial-expiry) | Neutralises the expired-trial block screen. The welcome screen gates entry with a single `state instanceof ExpiredTrial` check; this forces that check to false, so the app proceeds on every launch (online, offline, or with a server-expired trial). The server handshake, billing/licence machinery and the offline fail-open path are left untouched. Validated on 15.0.1 (versionCode 127798). |  |

</details>

<details open>
<summary>📦 TARGOBANK&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| V12.68.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable TargoBank root check](#disable-targobank-root-check) | Neutralises the splash 'rooted device' block by forcing the security verdict getters (o.aNj.con/Aux/AuX) to return false, so the app proceeds to the login screen. Validated on V12.68.1 (versionCode 2019102761). Note: re-signing breaks Play Integrity app-recognition; keep the app in the Magisk denylist. |  |

</details>

<!-- PATCHES_END -->

#### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=ynotzort/morphe-patches

Or manually add this repository url as a patch source in Morphe: https://github.com/ynotzort/morphe-patches

### 📙 Contributing

Thank you for considering contributing to ynotzort's morphe patches.
You can find the contribution guidelines [here](CONTRIBUTING.md).

### 🛠️ Building

To build ynotzort's morphe patches,
you can follow the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

## 📜 License

ynotzort's morphe patches are licensed under the [GNU General Public License v3.0](LICENSE)
