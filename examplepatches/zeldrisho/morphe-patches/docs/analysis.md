# Analysis workspace

`analysis/` is a local, gitignored scratch workspace for APK reverse engineering. It may contain APKs, decoded source, device logs, and other sensitive artifacts. Do not commit its contents or put secrets, account data, or tokens in notes or logs.

## Layout

```text
analysis/
  <app>/
    <version>/
      apk/                  # Original APK/APKM/XAPK and extracted APK splits
      decoded/              # Complete apktool projects, normally decoded/base/
      smali/                # Standalone smali extraction, if produced separately
      decompiled/           # JADX output
      mapping/              # Recovered Kotlin/obfuscation mappings
      notes/                # Recon, evidence, and investigation notes
      runs/<run-name>/      # Patched APKs, logs, hashes, and test results
```

Use the app name and release version for directory names. Keep the version code,
ABI, source URL, and SHA-256 in `notes/recon.md`. Use `runs/` for disposable
experiments rather than placing outputs beside source analysis.

Current workspaces include:

- `analysis/threads/434.0.0.41.74/`
- `analysis/threads/445/runs/legacy-445-test/`
- `analysis/zalo/26.08.01/`

`decoded/base/` is a complete decoded APK project; its `smali*` directories are
not a separate top-level workspace. Keep split APK inputs together in `apk/`.

## Workflow

From the repository root:

```bash
python3 scripts/apk_recon.py analysis/<app>/<version>/apk/<input>.apkm
python3 scripts/extract_smali.py analysis/<app>/<version>/apk/<input>.apkm analysis/<app>/<version>/smali
python3 scripts/hunt_signals.py analysis/<app>/<version>/decompiled
```

Record verified findings in `notes/<topic>.md`, including the exact smali path,
method signature, ordered instructions, and fingerprint strategy. See
[reverse-engineering.md](reverse-engineering.md) for the full recon-to-validation
workflow and [validation.md](validation.md) for device evidence requirements.

## Cleanup

Normal cleanup keeps `analysis/` intact. To preview deletion of the entire
workspace, including notes and evidence, run:

```bash
python3 scripts/clean_analysis.py --analysis --dry-run
```

Remove it only when all needed evidence has been preserved elsewhere:

```bash
python3 scripts/clean_analysis.py --analysis
```

The cleanup command deletes the whole directory; it does not selectively preserve
`notes/` or `runs/`.
