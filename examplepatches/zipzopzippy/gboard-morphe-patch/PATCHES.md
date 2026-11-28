# Patches

> Generated from `patches-list.json` — **v1.4.0** (`main`) · **3 patches** across **1 app** · back to [README](README.md)

---

## Gboard (com.google.android.inputmethod.latin)

**Supported versions:** `18.6.10.1002251336-release-arm64-v8a`

| Patch | Details |
|---|---|
| **Enable feature flags** | Switches on Gboard features that are off by default and normally enabled remotely by Google, which the network guard prevents. By default: Scan text and inline autofill suggestions (password manager suggestions in the suggestion strip).<br><sub>Options: Flags to enable</sub> |
| **Network guard** | Blocks all network requests from Gboard except for hosts in an allowlist. Adds a 'Network access' screen to Gboard settings to edit the allowlist and view a request log. Emoji Kitchen, language packs, translation and offline voice packs are allowed by default.<br><sub>Options: Default allowlist, Default Play services allowlist, Block Play services hand-offs, +1 more</sub> |
| **Offline voice typing** | Lets Gboard's on-device speech recognizer work for all languages it has speech packs for (not just English (US)), and prefers it over Google's online recognizer. Can be switched in Gboard settings &gt; Network access.<br><sub>Options: Prefer offline voice typing</sub> |

---
