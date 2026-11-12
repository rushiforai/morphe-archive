# Theme and Appearance resources

`JoplinThemeResourcesPatch.kt` selects and verifies the matching release's
Appearance/Blush Pink bundle. Bundled JavaScript currently includes the font
menu/runtime as well, so the shared bundle is written once by this dependency.

Adapter resources remain under `patches/src/main/resources/joplin/adapters`;
existing adapter generation scripts keep working. The native font patch lives
in `../fontswap` and shares compatibility metadata from the parent directory.

## Baby pink themes

`scripts/joplin/pink-themes.cjs` adds three themes beside Blush Pink during
`build-bundle.cjs` (guarded, repeatable source edits; ids 24–26):

- **Baby Pink** (light): baby pink (`#f8c8dc`) header and primary button with
  deep plum ink, near-white pink-tinted note background, deep rose links.
- **Baby Pink Night** (dark): warm dark surfaces, baby pink header icons, links
  and primary button.
- **Baby Pink OLED**: the night palette on pure black.

Status bar icons now follow the header luminance (dark icons on a light header)
instead of always being white; existing themes keep white icons.
`node scripts/joplin/contrast.test.cjs` gates every text/surface pair at WCAG AA
(body text 7:1 where it matters). Run it after changing any color.
