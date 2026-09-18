# Repository maintenance plan

Cross-app engineering backlog; Zalo feature investigations remain in
[the feature roadmap](plan.md). These are planned changes, not implemented or
validated fixes. Release policy remains owned by [release.md](release.md).

Keep the existing app-specific patch folders, independent Threads/Zalo runtime
extensions, and small app-agnostic shared helpers. Prefer targeted safeguards and
tests over a framework rewrite.

## Evidence and priorities

The first group comes from inspection of this repository. Reference comparisons
use `~/Projects/morphe-patches-doom/` at commit `51561b0` (`v1.22.0`) and
`~/Projects/morphe-patches-hoodles/` at commit `f7a88fc` (`v1.44.0`).
Upstream references are source-inspection leads, not evidence of runtime correctness.
Preserve file-specific license notices and attribution when reusing source.

P1 items address release or bytecode correctness and verification gaps. P2 items
improve maintainability and support. P3 items are deferred until scale warrants
implementation. Effort estimates are relative: small or medium.

## Findings in this repository

### P1: Release preflight and failure recovery — medium

Targets: `scripts/prepare_release.py`, `scripts/tests/test_release.py`, and
`docs/release.md`.

- Bound the Unreleased bullet check to that section; historical release bullets
  must not satisfy it.
- Implement the documented validation of malformed/out-of-order headings,
  duplicate target entries, previous-tag existence/reachability, and agreement
  with the highest reachable stable tag. Cover first-release conditions too.
- Complete preflight before modifying files. Stage generated content safely and
  define recoverable behavior for generation, extraction, and commit failures;
  do not silently discard unrelated user changes during recovery.
- Add temporary-repository tests for rejection cases, valid first/subsequent
  releases, and partial failures. Assert rejected preflight leaves files intact.
- Keep release documentation aligned with executable checks; do not weaken
  published policy merely to match missing safeguards.

### P1: Shared bytecode-helper contracts — medium

Target: `patches/src/main/kotlin/com/zeldrisho/patches/shared/bytecode/MethodExtensions.kt`.

- Separate whole-body replacement from instruction-preserving injection contracts.
  Increasing register count does not rewrite existing encoded parameter operands.
- Correct contradictory register-growth comments and verify claims about register
  typing against actual DEX/ART behavior rather than inherited comments.
- Harden reflected dexlib field selection and fail clearly on incompatible layouts.
- Add focused tests for zero-local methods, parameter aliases, wide values,
  register encoding boundaries, and try/catch removal. Exercise actual consumers.
- Compare the inherited implementation with Doom's
  `patches/src/main/kotlin/app/template/patches/shared/MethodExtensions.kt`;
  the same contradictory comments exist there, so copying it again is not a fix.

### P1: One local/CI verification contract — small

Targets: root `build.gradle.kts`, workflows, and `docs/development.md`.

- Introduce one Gradle verification task covering quality checks, patch tests,
  both extension unit-test tasks, and embedded-extension bundle verification.
- Use it consistently in local instructions and CI where appropriate. The current
  canonical local Verify command omits extension unit tests that CI runs.
- Keep Python tests and pre-commit checks explicit companion commands.
- Verify task dependencies and failure propagation; successful verification still
  does not establish real-APK or device compatibility.

### P2: Synthetic tests versus APK qualification — medium

Targets: `patches/src/test/`, Gradle test wiring, and `docs/validation.md`.

- Inventory synthetic transformation, negative-match, and ambiguity coverage;
  fill gaps rather than duplicating existing tests.
- Separate opt-in APK qualification from public synthetic CI. For example,
  `ZaloMediaFingerprintsTest` skips without `ZALO_TEST_APK`.
- Add an explicit local qualification task that fails when required APK input is
  missing and checks the pinned target metadata.
- Summarize passed, failed, and skipped qualification separately; never equate a
  skipped target check with compatibility proof.
- Keep proprietary APKs out of Git and public CI. Retain control/device validation
  as a separate release requirement.

### P2: Documentation consistency and checks — small

- Correct the single-extension wording in `docs/development.md` and
  `docs/release.md`; Gradle verifies both embedded app artifacts.
- Replace the "account-spoof patch" troubleshooting claim in
  `docs/patch-development.md` with the existing provider-boundary guidance.
- Remove stale shfmt references and distinguish Ruff check-only commands from
  formatting commands. Describe hook mutation behavior accurately.
- Replace blanket catch-every-`Throwable` guidance with scoped host-protection
  boundaries, defined fallbacks, and bounded, non-sensitive diagnostics.
- Correct blanket reflection guidance: resolving names at runtime does not
  automatically survive obfuscation changes. Explain when inline smali,
  reflection, or app-specific compile-only stubs fit the integration. If stubs
  become necessary, verify they are excluded from shipped extensions; do not add
  a stub module without a consumer. Hoodles' `extensions/primevideo/build.gradle.kts`
  is a reference for compile-only wiring, not a requirement to adopt it.
- Replace blanket `v0` injection examples with register-aware examples and
  distinguish immutable configuration from settings requiring runtime refresh.
- Add local Markdown link/anchor checking with tests for the repository's heading
  and relative-link conventions; avoid requiring network access for local links.
- Link canonical procedures instead of creating competing verification, signing,
  or release instructions.

### P2: Selective structural cleanup — small to medium

- Extract the nearly identical app-label XML rewrite into `shared/resources/`;
  retain app-specific launcher constants and regression tests.
- Keep package-renaming logic app-specific unless equivalent semantics are proven.
- Retain separate runtime extension modules; avoid artifact/class-descriptor
  renames solely for symmetry.
- On its next substantive change, move `zalo/ZaloMicroGSupportPatch.kt` into
  `zalo/microg/` and separate matching/contracts from manifest and bytecode
  transformations. Move tests correspondingly; preserve public patch identity,
  artifact names, and injected descriptors. Avoid a broad cosmetic reshuffle.
- Keep cross-app maintenance here and Zalo feature work in `plan.md`. Do not add
  unrelated app ports to the Zalo roadmap.

## Ideas from Doom to adapt

Paths in this section are relative to the Doom checkout root.

### P1: Better bug-report provenance — small

Reference: `.github/ISSUE_TEMPLATE/patch_broken_after_update.yml`.

- Extend our existing bug form with failing and last-working app versions,
  APK source/format, and Manager/CLI version; retain versionCode, bundle version,
  selected patches/options, and reproduction fields already present.
- Request bounded, redacted patching/runtime logs with capture guidance. Do not
  request credentials, account contents, or proprietary APK uploads.
- Prefer one improved form initially; add a separate update-regression form only
  if triage volume justifies it. Validate the issue-template YAML.

### P2: Dependency-update automation — small

Reference: `.github/dependabot.yml`.

- Add monthly Actions and Gradle update PRs targeting our normal development flow.
- Preserve SHA-pinned Actions and review Morphe/Kotlin/detekt compatibility
  together; do not auto-merge toolchain changes.
- Keep updates scoped and require the normal verification gate. Do not add npm
  solely because Doom uses it for releases.

### P2: Release checksums — medium

Reference: `.releaserc`, which generates and publishes `SHA256SUMS.txt`.

- Publish a checksum for the exact released `.mpp`, alongside existing provenance
  attestations; document verification and generated-file ownership.
- Use portable asset basenames in the checksum file.
- On retries, verify against the existing published asset; never publish a hash
  from a different rebuild or replace an existing immutable release asset.
- Test first publication, missing-checksum recovery, and mismatched-asset failure.
  Checksums complement provenance; they do not independently authenticate a build.

### P2: Pure runtime decisions and adversarial tests — medium, alongside features

References: `extensions/extension/src/main/java/app/template/extension/extension/AmazonUrls.java`
and its corresponding `src/test/java/.../AmazonUrlsTest.java`.

- Separate parsing/filtering decisions from Android integration in new link and
  notification features. Continue existing pure-helper patterns where available.
- Cover hostile/malformed inputs, lookalike hosts, userinfo, non-web schemes,
  unknown event types, and safe fallback behavior as relevant.
- Keep Android dispatch, lifecycle, and remote-behavior checks separate from pure
  unit tests. Feature-specific acceptance remains in `plan.md`.

### P2: Patch-time resource mapping — deferred until a concrete consumer

Reference: `patches/src/main/kotlin/app/template/patches/shared/ResourceMappingPatch.kt`.

- Resolve resource names to IDs instead of hardcoding numeric IDs when a UI patch
  requires resource-literal fingerprinting.
- Assess resource-decoding cost and available patcher APIs before adding a helper.
- Test missing resources, mapping lifecycle, and repeated patch sessions. Do not
  import global mutable mapping state or lazy caches without isolation tests.

### P2: Source provenance and vendored rules — small, alongside reuse

Reference: `patches/src/main/kotlin/app/template/patches/amazon/README.md`.

- Keep attribution, upstream revision, local deviations, and update policy near
  borrowed implementations; preserve mandatory source-file notices.
- Keep executable JS/CSS or filtering rules fixed at build time where used;
  updates require a reviewed commit and bundle release, not runtime code fetching.
- Use short app-specific notes only for exceptional behavior and provenance;
  link central docs and generated metadata instead of duplicating them.

### P3: Compact README and generated patch reference — deferred

Reference: `.github/scripts/generate_patches_readme.py` and `PATCHES.md`.

- When the catalog becomes unwieldy, generate a compact app index in README and
  detailed patch/options/limitations documentation in `PATCHES.md`.
- Generate both from the same metadata through release staging. Test escaping,
  unique anchors, defaults, experimental targets, and missing markers.
- Defer at the current two-app scale; do not hand-maintain a second patch list.

## Ideas from Hoodles to adapt

Paths in this section are relative to the Hoodles checkout root. Documentation
and concern-layout improvements are folded into the existing items above.

### P1: Embedded extension contracts — medium

Reference: `patches/src/main/kotlin/hoodles/morphe/patches/shared/misc/extension/SharedExtensionPatch.kt`,
which checks for an expected extension class.
Target: `patches/build.gradle.kts` and bundle verification tests.

- Extend ZIP-entry presence checks to validate nonempty, readable DEX contents
  in both embedded extension artifacts.
- Verify injected class descriptors and method signatures, including required
  public/static flags, against the built artifacts rather than source text alone.
- Check that app-specific extension classes do not leak into the other app's
  artifact. Add negative fixtures for absent classes, wrong signatures/flags,
  corrupt DEX, and cross-app contamination.
- Keep independent extensions and plug verification into the common verification
  contract. This catches packaging/linkage defects, not device behavior.

### P1: Fresh, structural patch metadata tests — medium

Reference: Hoodles' `patches/build.gradle.kts` patch-list generation wiring.
Targets: our generation task and `PatchesListShapeTest.kt`.

- Generate current-source metadata into an isolated build directory; do not
  overwrite release-owned checked-in metadata during ordinary verification.
- Parse JSON structurally rather than counting indentation or searching globally.
  Assert each patch's app association, exact targets, defaults, options, and
  uniqueness within its app; identical names across different apps can be valid.
- Cover risky defaults for both package-renaming patches, all declared targets,
  and newly added/removed patches. Prevent old release metadata from satisfying
  assertions intended to qualify current sources.
- Avoid generation/build/test dependency cycles; test stale-input and malformed
  metadata rejection separately from release metadata agreement.

### P2: Architecture availability qualification — small

Reference: `patches/src/main/kotlin/hoodles/morphe/util/AvailabilityUtils.kt`.
Targets: Zalo compatibility metadata and native startup patch tests.

- Confirm whether the existing arm64 target metadata already provides correct
  Manager/CLI availability; add an explicit resolver only if a gap is proven.
- Test unsupported architecture, missing library, wrong version code, and
  rejection before mutation. Preserve exact native-byte preconditions.
- Do not weaken pinned compatibility or add generic resolver composition solely
  for similarity with upstream.

### P2: Original-APK signing identity qualification — medium

Reference: `patches/src/main/kotlin/hoodles/morphe/patches/all/microg/MicroGMetadataPatch.kt`.
Extend the existing APK-qualification work rather than adding another workflow.

- Validate input signing identity against the expected pinned app identity before
  signature-sensitive patching. Test already-repatched inputs, missing/unexpected
  certificates, and repeated patch sessions.
- Distinguish original certificate DER bytes, SHA-1 digest, and output signing
  identity. Do not copy heuristic certificate rejection or global mutable metadata
  wholesale.
- Keep proprietary inputs private and diagnostics bounded. This is input
  qualification, not a fix for provider authorization or Drive OAuth.

### P2: Short user-facing FAQ — small

Reference: Hoodles' `README.md` FAQ. Target: our hand-maintained README content
outside the generated patch list, linking canonical docs.

- Explain supported version/code/ABI and input format, source refresh versus
  repatching, signature/provider and package-renaming limitations, and reporting
  failures with redacted logs.
- Link authoritative compatibility, CLI, and validation guidance rather than
  maintaining another version table or procedure.
- Avoid broad claims that untested app versions should work or MicroG guarantees
  Google sign-in/Drive access.

## Decisions: do not copy wholesale

- Keep our independent extensions, stable-only release policy, SHA-pinned Actions,
  and test/lint gates. Do not adopt Doom's single extension or semantic-release,
  Node, and dev/main backmerge machinery just for similarity.
- Do not treat environment-provided keys compiled into `BuildSecrets.kt` as
  secrets; generated sources and distributed binaries can expose their values.
- Do not replace narrow register logic with Doom's `FreeRegisterProvider.kt`
  without independent validation. It has explicit switch limitations and lacks
  exception-handler traversal; any adoption needs wide-register, branch, and
  exception-flow tests and preservation of file-specific notices.
- Do not adopt `HexPatchBuilder.kt` first-match replacement as a generic native
  patch guarantee. Require target/ABI validation, exact expected match counts,
  bounds checks, and negative fixtures before any shared native helper.
- Do not copy stale contributor-template wording or links. Adapt only useful
  conventions to this repository's documented branch/release process.
- Do not adopt Hoodles' Pairip code generation, `buildSrc`, shared runtime
  infrastructure, or reflection-based patcher compatibility shims without a
  concrete consumer and supported-version requirement. Preserve our test/lint
  gates rather than replacing them with a build-only PR workflow.
- Global entitlement spoofing, HTTP-header mutation as a supposed OAuth fix, and
  unrelated app ports remain outside the Zalo feature plan's boundaries.

## Delivery order and acceptance

1. Release preflight/recovery, local/CI verification alignment, documentation
   corrections, and bug-report provenance.
2. Bytecode-helper contracts/tests, embedded extension contracts, fresh structural
   metadata tests, synthetic/APK qualification separation, dependency automation,
   and release checksums.
3. Architecture and signing-identity qualification, user-facing FAQ, selective
   deduplication, and feature-driven pure helpers/provenance notes. MicroG layout
   cleanup accompanies its next substantive change; resource mapping and catalog
   splitting wait for their stated triggers.

Implement in focused branches/PRs with targeted regression tests and the canonical
[verification procedure](development.md#verify). Documentation-only changes need
appropriate text/link checks, not APK claims. Do not add maintenance-only entries
to the user-visible changelog or hand-edit release-owned generated metadata.
