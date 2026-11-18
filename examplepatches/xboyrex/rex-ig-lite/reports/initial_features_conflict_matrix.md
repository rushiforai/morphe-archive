# Initial Features — Conflict & Mutual Exclusion Matrix

- **Repository**: [xboyrex/rex-ig-lite](https://github.com/xboyrex/rex-ig-lite)

| Conflict Group ID | Mutually Exclusive Entries | Resolution Rule in `InitialFeaturesManager.java` |
|---|---|---|
| `image_upload_codec` | `init_003` (`Image Upload Debug Settings` -> `WebP` vs `HEIC`) | Single-select enum (`ENUM_SINGLE_SELECT`) guarantees only one codec (`WebP (Default Lossless-ish)` or `HEIC (High Efficiency)`) is active at a time. |
| `calling_icon_variant` | `init_036` (`thread header calling button icon variant` -> `Variant 1` .. `Variant 4`) | Single-select enum (`ENUM_SINGLE_SELECT`) writes the chosen integer variant (`1`, `2`, `3`, or `4`) to `ig_direct_thread_header_calling_icon:variant`. |
| `notes_reply_cta_variant` | `init_059` (`notes reply cta` -> `Variant 1` .. `Variant 3`) | Single-select enum (`ENUM_SINGLE_SELECT`) writes the chosen CTA style (`1`, `2`, or `3`) to `ig_notes_reply_cta:variant`. |
| `nav_Swipable_conflict` | `init_055` (`panavision nav3` -> `is_swipable=false`) vs `init_056` (`panavision nav3` -> `is_swipable=true`) | Enabling `init_055` automatically disables `init_056` (and vice versa) via `conflictsWith` in `InitialFeaturesManager.setBooleanEnabled(...)`. |
