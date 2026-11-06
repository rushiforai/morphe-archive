# Instagram Patches

Custom Morphe patches for Instagram:
- **Keep screen on while playing video**: Keeps the screen on while a video is playing in the feed, stories and other places, like in Reels.
- **Carousel auto scroll**: Scrolls a feed carousel to the next item when a video completes. Images reached this way stay for 5 seconds. Can be turned on/off from the post **⋯** menu (**Carousel auto scroll: on/off**).

Target Instagram versions: **439.0.0.37.89**, **447.0.0.55.81**, **452.1.0.53.64**.

## Using with Morphe Manager

1. In Morphe Manager settings, add a custom patches source pointing to:
   - Owner: `warleysr`
   - Repository: `instagram-patches`
2. Select Instagram (version 439.0.0.37.89) to patch.
3. Select the patches and proceed with patching.

## Building Locally

```bash
./gradlew clean :patches:buildAndroid
```

The resulting `.mpp` package will be in `patches/build/libs/patches-<version>.mpp`.

## CI & Releases

A GitHub Actions workflow (`.github/workflows/build_mpp.yml`) is included to:
- Automatically build the `.mpp` with DEX on push and `workflow_dispatch`.
- Release the `.mpp` as a GitHub release (and update `patches-bundle.json`) when `workflow_dispatch` is triggered with `release: true`.
