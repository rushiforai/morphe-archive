## [1.1.0](https://github.com/weird-aftertaste/quetta-privacy-patches/compare/v1.0.3...v1.1.0) (2026-11-01)

### ✨ New Features

* support the official 2.0.9 APK from quetta.net ([3ea1258](https://github.com/weird-aftertaste/quetta-privacy-patches/commit/3ea1258d9736a6c1525847f4084973de6e36f07b))

## [1.0.3](https://github.com/weird-aftertaste/quetta-privacy-patches/compare/v1.0.2...v1.0.3) (2026-11-01)

### 🐛 Bug Fixes

* re-patching an already processed APK is a no-op ([cba482e](https://github.com/weird-aftertaste/quetta-privacy-patches/commit/cba482ef3130537bced83b509a1201f4fdb74d22))

## [1.0.2](https://github.com/weird-aftertaste/quetta-privacy-patches/compare/v1.0.1...v1.0.2) (2026-11-01)

### 🐛 Bug Fixes

* stage the root bundle manifest so the release commit carries it ([a061f04](https://github.com/weird-aftertaste/quetta-privacy-patches/commit/a061f04d1a50ac013b730719c36bae4a480159f3))

## [1.0.1](https://github.com/weird-aftertaste/quetta-privacy-patches/compare/v1.0.0...v1.0.1) (2026-11-01)

### 🐛 Bug Fixes

* publish the bundle manifest at the repository root and detect releases by tag ([d5c1690](https://github.com/weird-aftertaste/quetta-privacy-patches/commit/d5c1690f89dc46be41dbf4753a7f3ee2584a4bb1))

## 1.0.0 (2026-11-01)

### ⚠ BREAKING CHANGES

* patch names changed. "Strip telemetry endpoints" and "Strip
telemetry endpoints from native libraries" no longer exist; enable the new
per-group patches instead.

### ✨ New Features

* scope patches to Quetta 2.2.0, split endpoints, add release pipeline ([cd97a68](https://github.com/weird-aftertaste/quetta-privacy-patches/commit/cd97a686fad9b4ba252fa48980135f3682e0e13e))
