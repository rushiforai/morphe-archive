# Remaining work

Zalo **26.08.01** (`260801903`) roadmap. Keep APKs and evidence in ignored
`analysis/zalo/26.08.01/`. Cross-app engineering belongs in [maintenance](maintenance.md);
release execution and evidence requirements belong in [validation](validation.md).

## Feature feasibility investigations

These are **not implemented behavior or release expectations**. Before implementation,
record each candidate using the [target-evidence record](target-evidence-template.md)
in ignored local notes. Include exact smali gate, callers/consumers, local data flow,
server dependencies, narrow change, uniqueness rationale, and regression risks. Use
these statuses: **uninvestigated**, **ready to implement**, **needs runtime proof**,
**server-dependent**, or **rejected**. Every active investigation should name one
concrete next experiment and positive, negative/control, and regression checks. Use
patch-time fingerprints and app-specific extensions, not broad runtime plumbing or
remote symbol catalogs.

| Candidate | Status | Next experiment |
| --- | --- | --- |
| Inactivity deletion | Uninvestigated | Trace the pinned app's activity-state reads/writes and deletion trigger; establish whether the gate is local or server-managed. |
| Local backup/export | Uninvestigated | Trace native transfer/export and restore paths, including messages, media associations, snapshots/WAL, schema, keys, and restore ordering. |

### Inactivity deletion

Do not treat server-managed deletion as a local unlock or silently generate
activity. A local mitigation is only viable if the pinned app exposes a verified
local policy gate. Positive evidence must show the local gate and its callers;
controls must leave server-managed expiry untouched; regressions must preserve
ordinary activity state, reminders, and backups.

### Local backup/export

Private-file access does not prove portability. Prove stock-to-patched migration,
patched reinstall, and cross-device restore separately. Export only to a
user-selected external destination. Test unauthorized access, unexpected
destinations, and excessive URI grants. Require integrity/version checks, bounded
extraction, recoverable staging, and corrupt-archive, low-space, and
interrupted-transfer tests. See [local-data investigation rules](reverse-engineering.md#learning-from-other-patch-projects).

## Boundaries

- zStyle and Video Original quality are excluded: the pinned APK has `VIDEO` and
  `VIDEO_HD`, not `VIDEO_ORIGINAL`.
- Forced-update suppression needs a traced trigger chain. The permission audit
  found no safe zero-usage removal candidates.
- Catalog, username changes, badge entitlement, local export, inactivity prevention,
  zCloud capacity, and business quotas remain unproven or server-dependent.
- No HTTP-header OAuth fixes, global paid-account spoofing, broad MicroG rewrites,
  unrelated app ports, or generic shared runtime infrastructure. Pairip/native/Hermes
  infrastructure requires a demonstrated consumer.

## Acceptance evidence

Follow [validation](validation.md): positive and control checks, remote visibility
or restore round trips where relevant, then repeat build/repatch/install/device
checks with the published `.mpp`. Keep hashes, patch selection, device/Android,
signing identity, and sanitized evidence outside Git. Unexecuted candidates are
not validated features.
