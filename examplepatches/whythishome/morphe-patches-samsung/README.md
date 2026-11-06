# Samsung Health Health Sharing patch

This repository contains one Morphe bytecode patch for Samsung Health
`7.00.6.011`:

**Show Health Data Sharing on non-Samsung devices**

The patch changes Samsung Health's local My Page manufacturer gate so the Health
Data Sharing tile can appear on non-Samsung Android phones. It does not bypass
Samsung Account, country, database, invitation, or server-side checks.

## Build

Use JDK 21 and a GitHub Actions workflow with package-read access. The release
workflow runs:

```bash
bash ./gradlew :patches:buildAndroid generatePatchesList
```

The generated `.mpp` bundle is published as a GitHub release. Morphe Manager
does not compile Kotlin source directly; import the generated release bundle as
a patch source.

Use a conventional commit such as:

```text
feat(shealth): add Health Sharing visibility patch
```

Then refresh the source in Morphe Manager after the release is published.
