# Known Limitations & Environment Notes (`v3.15.0`)

1. **Sandbox VM Network / Gradle Constraint**: Outbound internet access is disabled in the local verification container, so full Gradle `.mpp` packaging runs in GitHub Actions CI (`build.yml`), while JDK 17 `JavacTask` AST/symbol verification and the 39-check `verify_rex_ig_lite.py` suite run locally.
2. **Instagram Server-Side Experiments**: Certain MetaConfig flags in `Recommended flags` and `INSTAREX_PRO_CONFIG_V6.json` depend on Instagram client version (`439.x`–`455.x`) and require an app restart (prompted automatically via `SettingsRestart`) to take full effect.
