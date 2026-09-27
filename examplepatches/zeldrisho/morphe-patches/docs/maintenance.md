# Remaining repository maintenance

Cross-app backlog only. Validation: [device and build checks](validation.md).
Zalo candidates: [plan](plan.md). Publishing: [release](release.md).

## Outstanding private validation

These require devices/private artifacts; documentation and synthetic tests do not complete them.

| Priority | Work | Procedure |
| --- | --- | --- |
| P1 | Stock/control/patched Zalo and Threads journeys, including malformed intents and access boundaries | [Device scope](validation.md#device-validation-scope), [pinned-target assertions](validation.md#repeatable-device-journeys) |
| P2 | Cold-launch/Threads-scroll baselines; backup scheduling when implemented | [Performance baseline](validation.md#controlled-performance-baseline) |
| P2 | Pinned input qualification and repeated output-signing checks | [Build qualification](validation.md#build-validation), [signed output](validation.md#re-patch-and-install) |

No private APK results are recorded here. Keep stock and output signing identities
distinct; retain sanitized results in the release/PR record and raw artifacts outside Git.

## Outstanding CI validation

CI/release workflow updates enable Gradle caching; CI also caches uv environments.
They pass local workflow linting, but the updated workflows have not yet completed
on GitHub. Check the next hosted run for cache restore/save behavior and expected
verification results.

## Coverage and test architecture

Synthetic DEX/resource fixtures cover representative patch transformations and
metadata; APK-dependent tests remain opt-in. Coverage floors and reports are
managed by the verification task (see [development](development.md#verify)).

Remaining work is behavioral, not percentage-driven:

- **P1 — Close synthetic fingerprint gaps:** add positive and one-constraint
  near-miss DEX cases for remaining Zalo media, Business Box, and telemetry
  fingerprints. The descriptor inventory initializes definitions but does not
  validate every filter against both matching and mutated methods.
- **P1 — Exercise remaining Morphe lifecycle closures:** synthetic helper tests
  do not run every registered `bytecodePatch` / `resourcePatch` callback. Prioritize
  package-resource finalization and option application, AD_ID resource callbacks,
  the complete Send Original Media callback, and telemetry orchestration, including
  missing/ambiguous target failures where meaningful.
- **P2 — Preserve the 80% baseline:** add focused tests for observable behavior
  and regressions; raise the floor only after a stable measured increase, not to
  chase coverage alone.
- **P3 — Keep Threads coverage healthy:** preserve meaningful ad-filter edge
  coverage while adding future runtime features; avoid tests that only defend a
  percentage target.

## Deferred until a concrete trigger

- **Shrinker safety/size:** establish whether extension packaging invokes R8.
  If enabled, protect injected names, descriptors/flags, and reflection contracts;
  extend embedded-Dex checks and measure savings before narrowing keep rules.
  Never shrink the proprietary host APK.
- **Resource mapping:** resolve names to IDs when a UI fingerprint needs it;
  test missing resources, lifecycle, and repeated sessions.
- **README/catalog split:** defer `PATCHES.md` until the two-app catalog is unwieldy.

## Boundaries

No global entitlement spoofing, HTTP-header OAuth fixes, broad MicroG rewrites,
unrelated app ports, or shared runtime infrastructure without a concrete consumer
and independent evidence.

## Code provenance

Borrowed or adapted code must carry attribution next to the implementation and
be recorded here with its upstream URL, revision, local deviations, and update
policy before it is changed. `shared/bytecode/MethodExtensions.kt` adapts a
method-body cleanup pattern from doom-patches, with patterns also derived from
ReVanced/BiliRoamingX. It remains a dependency-free local implementation using
Morphe's mutable-method API; re-check upstream and resolved dexlib2 layout before
changing it. Extension modules contain project-owned runtime code, not vendored
third-party executable source. Executable filtering rules are updated only via
reviewed source changes and bundle releases, never fetched at runtime.

## Acceptance

Use focused branches, targeted regression tests, and [canonical verification](development.md#verify).
Documentation changes do not prove compatibility. No maintenance-only changelog
entries or hand-edited release metadata; follow [release rules](release.md#rules).
