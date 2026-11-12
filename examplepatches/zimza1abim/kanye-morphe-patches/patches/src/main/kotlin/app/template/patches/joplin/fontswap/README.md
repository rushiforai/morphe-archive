# Font swap

- `JoplinCustomFontPatch.kt`: public patch entry and dependency composition.
- `JoplinFontSettingsResourcesPatch.kt`: private startup provider and font settings activity registration.
- `NativeFontHooks.kt`: structural Typeface/WebView hooks (font request
  interception plus `onPageCommitVisible`/`onPageFinished` global CSS injection).
- `ReactTypefaceFingerprint.kt`: Android Typeface ABI discovery.

Shared compatibility metadata stays in `../Compatibility.kt`. Runtime Java class
names and private storage paths remain unchanged, preserving installed font data.
The entry depends on the theme/Appearance resource patch as before. This source
folder split does not introduce independent UI feature toggles.
