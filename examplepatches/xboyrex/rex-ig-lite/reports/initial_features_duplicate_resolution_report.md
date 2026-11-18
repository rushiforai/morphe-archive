# Initial Features — Duplicate & Variant Resolution Report

- **Repository**: [xboyrex/rex-ig-lite](https://github.com/xboyrex/rex-ig-lite)

## Resolution of Variant & Multi-Entry Flags
1. **`thread header calling button icon variant` (`init_036`)**:
   - Listed 4 times in raw experimental flag lists (`variant = 1`, `variant = 2`, `variant = 3`, `variant = 4`).
   - Consolidated into a single `ENUM_SINGLE_SELECT` entry (`init_036`) with options `Variant 1 (Default)`, `Variant 2 (Compact)`, `Variant 3 (Modern Rounded)`, and `Variant 4 (Minimal Outline)`.
2. **`notes reply cta` (`init_059`)**:
   - Listed 3 times in raw experimental flag lists (`Variant 1`, `Variant 2`, `Variant 3`).
   - Consolidated into a single `ENUM_SINGLE_SELECT` entry (`init_059`) with options `Variant 1 (Default Pill)`, `Variant 2 (Expanded Bar)`, and `Variant 3 (Compact Icon CTA)`.
3. **`Image Upload Debug Settings` (`init_003`)**:
   - Listed with two mutually exclusive codecs (`WebP` vs `HEIC`).
   - Consolidated into a single `ENUM_SINGLE_SELECT` entry (`init_003`) with options `WebP (Default Lossless-ish)` and `HEIC (High Efficiency)`.
4. **`panavision nav3` (`init_055` vs `init_056`)**:
   - Preserved as two distinct entries (`init_055` with `is_swipable = false` and `init_056` with `is_swipable = true`) linked by mutual exclusion (`conflictsWith`) so enabling one automatically disables the other.
