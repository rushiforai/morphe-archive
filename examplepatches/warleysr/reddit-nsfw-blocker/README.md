# Reddit NSFW Blocker

A patch bundle for the Reddit Android app that blocks NSFW content.
It is meant for parental control and for people who never want to see NSFW content on Reddit.

The patch is always on. It has no setting to turn it off from inside the app.

## What it does

The **Block NSFW content** patch:

- Hides NSFW posts from all feeds (home, popular, communities and profiles).
- Always turns off **Show mature content (I'm over 18)**.
  If the Reddit account has it turned on, the patch turns it off on the account once,
  so it is also off on the Reddit website and on other devices.
- Always turns on safe search and NSFW image blurring.
- Removes the **Show mature content** and **Blur NSFW images** options from settings
  (logged in, logged out and incognito mode) and from the incognito mode exit dialog.

## Supported versions

| App | Package | Version |
|-----|---------|---------|
| Reddit | `com.reddit.frontpage` | `2026.39.0` |

## How to use

1. In [Morphe Manager](https://morphe.software), add this repository as a patch source:
   `https://github.com/warleysr/reddit-nsfw-blocker`
2. Patch Reddit and select **Block NSFW content**.

The patch uses its own extension, so it can be applied together with the official Morphe Reddit patches.
Apply it together with them: patching Reddit with only this patch has not been tested.

## Building

Building needs a GitHub token with the `read:packages` scope, because the Morphe Gradle plugin
and libraries are published on GitHub Packages.

```bash
GITHUB_ACTOR=<user> GITHUB_TOKEN=<token> ./gradlew :patches:buildAndroid
```

The bundle is saved to `patches/build/libs/patches-<version>.mpp`.

## License

This project is based on [Morphe Patches](https://github.com/MorpheApp/morphe-patches)
and is licensed under the [GNU General Public License v3.0](LICENSE),
with the additional GPLv3 Section 7 terms in the [NOTICE](NOTICE) file.

It is not affiliated with or endorsed by Morphe or Reddit.
