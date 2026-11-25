# Citizen

[Back to the collection](../../README.md)

Package: `sp0n.citizen`  
Patch: **Unlock Pro**

## Supported version

Citizen **0.1320.0**, version code **1153**. All 34 required targets have been checked against the supplied DEX files; device verification is pending.

Only the latest supported Citizen version is maintained. Compatibility declarations and code for older versions are removed when support is updated.

Use the original APKM bundle, including its splits, when patching in Morphe Manager. You do not need to extract DEX files.

## Behavior and limitations

The patch overrides local Plus/Protect checks and suppresses paywalls. It does not create a subscription on Citizen's servers or establish server-side eligibility for paid services. Successful patching does not guarantee that every server-backed feature is available.

The implementation uses 34 required targets and fails visibly if any cannot be matched. It preserves invitation, education, and challenge handlers, changes only the family collector's entitlement flag, and calls superclass initialization before dismissing the five paywall activities.

The purchase and Protect button helper fingerprints include a paywall-call anchor. The family-plan collector matches its current continuation type and entitlement field, preserving invitation routing and Safety Network navigation.

## Attribution

Adapted from the [Citizen patch in rushiranpise/morphe-patches](https://github.com/rushiranpise/morphe-patches/tree/main/patches/src/main/kotlin/app/template/patches/citizen), commit `92c0fca0ae103a419c7fc61f9c5b8b38b7d6b82a`, with compatibility updates for 0.1320.0.

See the repository's [license](../../LICENSE) and [notices](../../NOTICE).
