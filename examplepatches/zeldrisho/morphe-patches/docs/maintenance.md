# Remaining repository maintenance

Cross-app backlog only. Validation: [device and build checks](validation.md).
Zalo candidates: [plan](plan.md). Publishing: [release](release.md).

## Outstanding private validation

Qualification results belong in the release/PR record, not this backlog. Use the
[qualification record checklist](validation.md#qualification-record) and retain raw
APK, device, log, screenshot, and signing artifacts outside Git.

| Priority | Work | Procedure |
| --- | --- | --- |
| P2 | Cold-launch/Threads-scroll baselines | [Performance baseline](validation.md#controlled-performance-baseline) |

The baseline remains pending local device access. Backup scheduling depends on the
local backup/export feature investigation in [the Zalo plan](plan.md); do not schedule
it before that feature is accepted and implemented.

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
