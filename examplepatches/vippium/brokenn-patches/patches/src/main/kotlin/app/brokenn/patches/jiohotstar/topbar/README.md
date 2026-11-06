# Remove top bar switcher (JioHotstar)

Removes the whole mode-switcher row at the top of the home screen — both
the "JioHotstar" pill and the "TADKA" pill — so the home feed starts
directly, with no switcher above it.

## Target (verified by smali analysis, 2026-11-03)

- App: JioHotstar, package `in.startv.hotstar`
- Version: **26.08.17.3** (versionCode 13019, APKM bundle from APKMirror)
- TopBar composable: `Ldn/j0;->f(Llm/e; LEm/q; LVe/c; Ldn/P; Landroidx/compose/runtime/b; I)V`
  in `classes11.dex` of the base APK. The switcher is Jetpack Compose, not
  an XML layout, and the tabs are server-supplied
  (`BffMenuWidgetTab` list in `Lef/q;->a`).
- v10 (current): v9 with the gap reduced to 1dp, to test. Both height
  constants (`e()` and the `b()` container) now use `0x3F800000`
  (1.0f) instead of `0x40800000` (4.0f). Nothing else changed. Note:
  the container still adds its own padding on top of that 1dp, so
  the visible space at the top is 1dp plus padding, not 1dp total.
- v9: v8 with the gap reduced to 4dp. Both height constants
  (`e()` and the `b()` container) now use `0x40800000` (4.0f) instead
  of `0x41000000` (8.0f). Nothing else changed. Note: the container
  still adds its own padding on top of that 4dp, so the visible space
  at the top is 4dp plus padding, not 4dp total.
- v8 (old-layout approach): v7 plus one more scroll change.
  In the old app (25.09.29.0, checked 2026-11-03) the top was a feed
  widget (`LandingPageHeaderUi` / `TitleBarHeaderWidget`), not a fixed
  container: it scrolled away with the page and only came back at the
  very top. There is no old TopBar container, height, or scroll gate
  to copy back — the old code is not in the new APK at all (zero
  occurrences of `TopBarKt`, `Tadka`, `BffMenuWidgetTab`, or
  `TopBarHeight` in 25.09.29.0) — so v8 makes the new fixed container
  *behave* like that scrolling header instead. The remaining early
  show was the first-item branch of `LEm/j$a`: `if (delta <=
  -threshold || previousOffset == 0) show`. The delta arm brought
  the bar back partway through the first item, before the offset was
  actually 0. v8 nop-s out just that `if-le` (found by the
  `neg-int` + `if-le` pattern in `j$a`, not a hardcoded index), so
  the bar now comes back only via the `previousOffset == 0` arm —
  i.e. when the feed genuinely reaches the top. If neither arm
  fires, `z2` is left unchanged, exactly as before. This does NOT
  bring back the old header's visuals (logo, cast, search row) —
  that code does not exist in 26.08.17.3, and at the top you still
  get the 8dp gap from v6/v7, not a full old header.
- v7: v6 with one bug fix. v6 failed in Morphe Manager
  with `IndexOutOfBoundsException` at the container-height scan loop
  (patch line 91), because it scanned only for `ADD_FLOAT`, but
  `b()` uses `add-float/2addr` (`ADD_FLOAT_2ADDR`, a
  TwoRegisterInstruction) at instruction 49 — so the scan ran past
  the end of the method. v7 scans for both opcodes, bounded to 20
  instructions, and reads the destination register via the matching
  instruction interface. No other v6 change.
- v6: v5 plus two more changes, both requested by the user.
  (a) Height 16dp -> 8dp: `e()` now gets `0x41000000` (8.0f) instead
  of `0x41800000`, AND the container `Ldn/j0;->b()` gets the same
  treatment — its static branch sizes the container from its own
  calculation (2*12dp + `j()` = 78dp), not from `e()`'s height, so
  changing `e()` alone would have left a 78dp container around an
  8dp child. v6 overwrites `b()`'s add-float result with 8.0f as
  well (the later "if hidden, height = 0" step still runs, so a
  hidden bar stays 0). (b) Top-only: the scroll listener
  `LEm/j$a;->invokeSuspend` (BottomNavController) used to call
  `z2(true)` when scrolling up mid-feed (delta < -50, first item
  index != 0), which made the empty bar jump back and push content
  down before the user reached the top. v6 forces just that one
  call (the z2 after the -50 literal) to false, leaving the
  index == 0 branch untouched. So mid-feed, content scrolls
  naturally from behind the status bar; the small gap only comes
  back when the user is back on the first item, which is also where
  it is present on launch. `y2` in that branch is unchanged.
- v5: the patch removes the content call from
  `Ldn/j0;->e()`, the layout that holds the pills, AND overwrites the
  height that `e()` passes to `Modifier.height(...)` with 16dp. In
  `e()`, `Ldn/j0;->j()` (54dp portrait / 64dp otherwise) is called at
  instruction 48, its result lands in a register at 49, and that
  register is passed to `Modifier.height` at 50 — v5 inserts
  `const <that register>, 0x41800000` (the bit pattern for 16.0f)
  right after the move-result. `e()` is called only from the TopBar
  renderers `Ldn/j0;->g` and `Ldn/j0;->h`, so nothing else loses
  content. Superseded by v6 (see above) — v5 did not touch `b()`'s
  own height or the scroll-up reappearance.
- v4: same as v5 minus the height change — hid only `e()`'s content
  and kept the full 54/64dp height. v4 fixed v3's fingerprint filter
  order (the `j()` call at 48 comes before the -673482817 literal at
  53; v3 listed them swapped, so the fingerprint could never match
  and Morphe reported "Failed to match TopBarContentFingerprint").
- v2 bug, fixed in v3: v2 forced `Ldn/j0;->f` to return early, which
  hid the pills but also removed the whole TopBar container, so the
  feed slid up under the status bar. v2 is superseded, do not go back
  to it.
- v1 bug, fixed in v2: v1 forced `LEm/q;->s2()Z` to true, which is the
  *render* branch — that is why the switcher was still present after
  the first test. Dalvik `if-nez` branches when the register is NOT
  zero; reading it as "branch if zero" inverts the whole patch.

## Build

From the repo root, as in the main README:

```sh
./gradlew buildAndroid
```

The `.mpp` lands in `patches/build/libs/`. Apply it with Morphe
Manager / Morphe Desktop against a stock JioHotstar 26.08.17.3 APKM.

Note: building needs the Morphe registry setup from the main README
(GitHub PAT for `maven.pkg.github.com/MorpheApp/registry`).
`patches-list.json` / `patches-bundle.json` are generated by release
and must not be edited by hand.

## Test checklist (untested — confirm in the real app)

1. Patch applies cleanly to stock 26.08.17.3, no fingerprint failure.
2. Home opens with no JioHotstar / Tadka switcher pills, but a small
   gap (1dp + the container's own padding) is still there at the very
   top — the top banner does not slide up under the status bar.
3. Scroll down, then scroll up mid-feed: the gap must NOT come back.
   Content should scroll back from behind the status bar. Scroll up
   within the first item: the gap must NOT come back early either —
   only when you reach the very top (offset 0) does the small gap
   return.
3. The "For You" feed below, search, bottom nav, and playback still work.
4. No crash on recomposition: rotate, switch tabs, go back home, reopen the app.
5. If the patch fails on a newer JioHotstar version, send the Morphe
   patcher log — the class/method names are R8-obfuscated and will need
   re-fingerprinting for that build.
