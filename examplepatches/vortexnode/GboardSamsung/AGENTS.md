# Agent instructions

- This is **GboardSamsung**, a downstream Morphe patch project maintained by **Vortex Node** for the installed Gboard app (derived from Jason Wu's `jasonwu1994/Gboard-patches`). It is not a standalone keyboard app and does not contain Google's proprietary Gboard source code.
- Read `README.md`, `docs/PROJECT_SCOPE.md`, and `docs/UPSTREAM.md` before making architectural changes.
- Do not touch upstream repositories (`jasonwu1994/Gboard-patches`) or `vortexnode/GbSu`; this repository is the only write target.
- Preserve all kept GboardSamsung features, GPL-3.0 notices (`LICENSE`, `NOTICE`), and Jason Wu upstream attribution (`UPSTREAM_COMMIT.txt`, `UPSTREAM_README.md`).
- Keep technical extension namespaces (`dev.jason.gboardpatches`, `extensions/gboard-patches.rve`) intact unless a deliberate compatibility migration is requested. The default `Package Rename` Android package ID is `gboardsamsung.com.google.android.inputmethod.latin` (with official `com.google.android.inputmethod.latin` and custom package IDs supported, and legacy `dev.jason.com.google.android.inputmethod.latin` kept compatible in runtime helpers).
- Do not commit proprietary Gboard APKs, extracted proprietary assets, secrets, API keys, or tokens.
- Do not invent support for fonts, Samsung layout details, or Gboard versions; verify against source, bindings, and tests.
- Spacebar gesture work (`samsung_spacebar_gestures`) must preserve tap-to-space, bidirectional language switching, and long-press cursor control, and remain independent of `swipe_down_to_dismiss_keyboard`.
- Build outputs are Morphe `.mpp` patch bundles and metadata (`patches-list.json`, `patches-bundle.json`), not a standalone keyboard APK. Do not claim Gradle/Morphe builds or tests passed unless they actually executed in the current environment.
- Commit in small, reviewable changes with descriptive messages.

## Token & quota efficiency rules (AI Studio)

- **Strict file scope:** Read and edit only files directly required for the current task. Do not scan the whole project or inspect large bytecode/research dumps (`docs/research/`, `public/assets/aistudio/`, `docs/*BYTECODE_REFERENCE_EXTRACT.md`, `CHANGELOG.md`) unless the prompt explicitly requires them. Task-specific instructions to inspect a listed file take precedence.
- **No duplicate chat reports:** Put detailed implementation or audit reports only in the specifically requested file under `docs/reports/`. Keep reports concise: (1) modified files, (2) summary of changes, (3) what to test.
- **Minimal chat output:** Do not repeat reports, code snippets, or full file lists in chat. When the task is complete, reply with exactly one line: `Готово.` On failure, reply with exactly one line: `Ошибка: <причина>`.
