# Project scope and implementation brief

## Product definition

**GboardSamsung** is an active downstream Morphe patch project maintained by **Vortex Node** (`https://github.com/vortexnode/GboardSamsung`), derived from Jason Wu's [Gboard Patches](https://github.com/jasonwu1994/Gboard-patches) (`GPL-3.0`). It customizes the real installed Gboard app (`18.5.4.993608717-release-arm64-v8a`) while preserving Gboard's input engine. It is not a new Android `InputMethodService` and is not a fork of Google's proprietary Gboard application source.

## Core goals

- Retain Gboard's native typing engine and built-in capabilities: autocorrection, spelling/grammar support, next-word prediction, suggestions, dictionaries/language models, multilingual typing, voice typing, emoji, GIFs, stickers, clipboard, and other native features.
- Provide Samsung Keyboard-like spacebar interaction via the independent `Samsung Spacebar Gestures` (`samsung_spacebar_gestures`) patch:
  - short tap inserts a space;
  - horizontal left/right swipe switches between enabled languages in a unified cycle;
  - hold (~300 ms) followed by horizontal drag moves the text cursor.
- Preserve curated upstream customization capabilities (33 upstream patches + 1 downstream patch = 34 active patches): Custom Theme, Frosted Glass, Custom Symbols, Clipboard Enhancements, Clipboard Custom Character Limit, Rounded Keyboard Panel, Enable split keyboard, Change emoji size, Top Toolbar Item Count, Access Points menu style, Key Shape Selection, Close Proactive Suggestions, Emojis, stickers & GIFs Tab Order, Long-Press Editing Shortcuts, Toolbar Editing Buttons, Quick Insert, Swipe Down to Dismiss Keyboard, Keypress Vibration Intensity Control, Floating Web Search, Simple Calculator, Incognito Mode Toggle, AI Writing Tools, Advanced Voice Typing, Grammar Checker, Inline Suggestions, Enable Inline Autofill Suggestions, Use Bluetooth Microphone, Dictionaries & Predictions, Package Rename (default `GboardSamsung`), Add Gboard Signature Bypass, Backup & Restore, Settings Homepage Override, and Developer options.
- Keep evaluating future Samsung visual/layout refinements and any separate opt-in integration of the Gemini-powered Rambler feature from `vortexnode/GbSu` without replacing native Gboard voice typing.

## Current downstream status

- **Upstream import:** completed from `jasonwu1994/Gboard-patches` commit `463269a0f315ef9cee749e10d155af1aedaa49ad` (`2026-11-12`).
- **Samsung Spacebar Gestures:** implemented as a standalone public patch (`samsung_spacebar_gestures`) independent from `swipe_down_to_dismiss_keyboard`, with dedicated state machine, resource patching, and unit tests.
- **Repository cleanup:** 12 unused upstream features (Latin Globe Key Ignore Interval, Web Clipboard, Zhuyin Bottom Row Key Sizes, Zhuyin Quick Traditional/Simplified Toggle, Zhuyin Slide Input, G Logo on Spacebar, English QWERTY Up-Flick Uppercase, FTP Server, Swipeable Custom Top Row, Enable OCR / Scan Text, Enable accessibility layout, Enable cursor trackpad mode) and their exclusive dependencies/payloads (Apache FTPServer/MINA, QuickJS native payload, G Logo image payload) have been cleanly removed while preserving shared infrastructure and all 34 active patches.

## Non-negotiable engineering rules

- Work only in this downstream repository. Never modify upstream `jasonwu1994/Gboard-patches` or `vortexnode/GbSu`.
- Retain upstream attribution, `LICENSE`, `NOTICE`, `UPSTREAM_COMMIT.txt`, and `UPSTREAM_README.md`.
- Keep technical extension namespaces (`dev.jason.gboardpatches`, `extensions/gboard-patches.rve`) stable to avoid breaking extension/runtime ABI compatibility. The default `Package Rename` Android package ID is `gboardsamsung.com.google.android.inputmethod.latin` (with official `com.google.android.inputmethod.latin` and custom package IDs supported, plus legacy `dev.jason.com.google.android.inputmethod.latin` runtime compatibility).
- Keep `gboard-port-product-catalog.json`, `gboard-port-product-catalog.sha256`, `gboard-version-bindings.json`, `RuntimeAbi.kt`, `GboardPatchRegistry.kt`, `patches-list.json`, and `patches-bundle.json` strictly synchronized.
- Validate against an explicitly supported Gboard version (`18.5.4`). Do not claim compatibility with arbitrary versions or unproven font/layout capabilities.
- Do not download, commit, or redistribute Google's proprietary Gboard APK, extracted proprietary assets, or private user data.
- Do not put credentials, API keys, signing keys, or tokens in the repository.
- Do not claim a successful `.mpp` build or Gradle test run unless CI or a full Gradle/Morphe environment actually executed it.

## Target device

Samsung Galaxy S22 5G, model `SM-S901U1`, Android 16 / One UI 8.

## Acceptance criteria

- The patch project builds `.mpp` bundles cleanly in CI and unit tests pass.
- Existing Gboard native input behavior remains intact on Gboard `18.5.4`.
- Spacebar tap inserts a space; horizontal swipe left/right switches enabled languages consistently; hold + drag moves the cursor.
- `Samsung Spacebar Gestures` and `Swipe down to dismiss keyboard` can be toggled independently.
- Custom Theme, Frosted Glass, Custom Symbols, Clipboard Enhancements, Package Rename (`GboardSamsung`), and Backup & Restore remain functional.
- Any future font or Samsung layout customization is verified on-device or clearly documented as unsupported.
