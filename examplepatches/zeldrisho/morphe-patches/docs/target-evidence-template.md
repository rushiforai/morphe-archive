# Target evidence record

Copy this template to `analysis/<app>/<version>/notes/<topic>.md`. Keep APKs,
smali excerpts, mappings, logs, and all app-specific evidence in the ignored analysis
workspace. A candidate is not ready for patch-writing unless its target is verified
against the exact input's smali.

```markdown
# <App> — <Target>

- Status: uninvestigated | needs runtime proof | ready to implement | server-dependent | rejected
- Package / versionCode:
- Input artifact SHA-256 (and base APK SHA-256 when split):
- DEX directory / smali path:
- Java orientation (navigation only):
- Exact `.method` signature:
- Access flags / return type / parameter descriptors:
- Registers or locals:
- Callers and consumers traced:

## Evidence

<Ordered relevant smali instructions and concise explanation of control/data flow.>

## Proposed change

<Smallest patch-time fingerprint and mutation. State expected local effect.>

## Uniqueness and limitations

<Why the fingerprint resolves uniquely; version/split limitations; local vs server behavior.>

## Validation plan

- Positive behavior:
- Negative/control behavior:
- Regression risks and checks:
- Runtime proof required (yes/no; why):

## Decision

<Ready to implement / needs runtime proof / server-dependent / rejected, with rationale.>
```

Do not call a fingerprint match, patch application, app launch, target-path execution,
or observed outcome equivalent evidence; record each validation stage separately.
