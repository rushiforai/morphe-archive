# InstaRex / Rex IG Lite v3.16.0 — Repository & Architecture Audit

- **Repository**: `https://github.com/xboyrex/rex-ig-lite` (`v3.16.0`)
- **Modules**: `:patches`, `:extensions:instagram`, `:extensions:shared:library`, `:extensions:instagram:stub`
- **Total Named Patches (`patches-list.json`)**: `161` (`86` Instagram-only, `74` X-only, `1` shared)
- **Supported Instagram Versions**: `439.0.0.37.89`, `444.0.0.47.66`, `452.1.0.53.64`, `453.0.0.57.79`, `454.0.0.54.77`, `455.0.0.51.72`
- **Tabler SVG & VectorDrawable Pipeline**: `477` SVG master files (`assets/icons/svg/`), `348` Android VectorDrawables (`rex_ic_*.xml`), `186` semantic icons and `255` mapped keys in `RexIcon.java`.
- **Bundled Presets & Flags**: `66` Recommended Flags (`59` Boolean, `7` Long) in `rex_recommended_flags_v3.json` and `3,796` sanitized MobileConfig overrides in `instarex_pro_config_v6.json`.
