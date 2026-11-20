# OpenBot patch validation

Recorded on 2026-11-19 (Asia/Seoul).

## Artifact identity

- Official release: `android-v1.4.11`, package `run.openbot.mobile`.
- Original APK SHA-256:
  `e20f9d502ed83ac8a6e38b4422290e5a9a03e0ea241045a3a6061d040ba0b285`.
- Original embedded Hermes SHA-256:
  `c63a667c377a141c6bfcbd6177a7c5ca5db4c7d65b28a39e94a67a9854d41c33`.
- Patched Hermes SHA-256:
  `c985d6fcec8aec8e1739f615f6293a86f3adbe1456bc2e09531ebea3fd5d7b7b`.
- Original and patched Hermes bytecode version: **99**.
- Exact adapter and asset checksums are in `resources/openbot/adapters/1.4.11.properties`.

## Completed checks

| Check | Result |
| --- | --- |
| Repository `buildAndroid` | Passed; Kotlin patch and Android runtime DEX packaged |
| Official APK patch application | `PATCH OpenBot custom font: OK` |
| Rewritten DEX verification | `SMOKE_OK`; 4 DEX files, zero new verification issues |
| Original APK verification baseline | 5 pre-existing WebRTC/JNI optional-class issues; the same five remain |
| Font parser/import regression checks | 32 passed: SFNT/TTC metadata/extraction/checksums, malformed data and TTF import validation |
| Source transformation checks | 4 passed: repeatability, unknown-layout rejection, partial-edit rejection, catalog upgrade |
| Preview/request policy checks | 18 passed: per-face keys, bitmap bounds, request probe/read coalescing, queue bounds and retry |
| Narrow package API type probe | Passed against installed RN 0.88, Expo Image 58 and modern File API |
| UI source lint and syntax | Five templates passed targeted upstream Biome rules and Bun parsing |
| Embedded adapter output | Patched bundle SHA-256 matches metadata in patch output |
| Packaged DOM pages | Seven rebuilt HTML pages contain the render-blocking local stylesheet link |
| Manifest output | Non-exported private font provider registered; Expo updates disabled |
| Host path scan | No `/Users/`, local user name, or `/private/tmp/` in generated Hermes/web assets |

The patcher's resource encoder fell back to a full resource-table rebuild; that
rebuild completed successfully. Original asset files that the new bundle no
longer references are preserved. Rebuilt DOM files ship with the adapter.

## Static hook evidence

The original APK was inspected with REA archive inventory (Evidence
`ev_e494e627aea29a000380106690047590951b0ab2e242272a353191d4e1aa7f52`).
REA's Android provider was unavailable because its separate JADX MCP JAR was
not configured; focused ordinary JADX, DEX parsing and matching upstream source
provided the following code evidence. No tool configuration was changed.

- `Ll4d;->b(Typeface,int,int,String,AssetManager):Typeface`: React Native
  typeface resolver, called by text spans, Fabric paragraphs, TextInput and
  native screen headers. Patch matching uses the Android ABI, not this R8 name.
- `FabricUIManager.prepareTextLayout`: explicit default TextPaint hook, also
  covering the resolver's unstyled path. Eleven default construction sites
  exist across the original DEX files.
- RN WebView client `Lc88;`: retained `RNCWebViewClient` tag plus Android
  superclass/callback structure.
- Expo DOM client `Lgy2;`: `DomWebView` field plus Android superclass/callback
  structure. Release builds use this client for packaged DOM components.
- Exact trusted local page path:
  `file:///android_asset/www.bundle/<32 lowercase hex characters>.html`.
  Remote URLs and `about:blank` user/agent content do not receive device fonts.
- Matching Expo FileSystem source supports content-provider pipe reads through
  `copyAsync`; the UI reads and deletes a unique private cache file afterward.
- Matching Expo Updates source selects the embedded bundle when manifest
  `expo.modules.updates.ENABLED` is false, including when a cached OTA exists.

## Preview and memory update

The user confirmed the original font switching works on their Galaxy. This
update addresses the following source-level findings:

| Finding | Change |
| --- | --- |
| Show more appends rows permanently to a ScrollView | One virtualized SectionList, a three-viewport window and four-item render batches |
| Row text inherits the selected global font | Each visible row draws its own font file into an independent native PNG |
| Loading all preview fonts into JS would retain many typefaces | No JS font registration; 1 MiB native PNG cache, one preview worker, bounded queue, explicit bitmap recycle |
| Legacy content copy does not close its input/output streams | Modern File.text() uses scoped streams and no cache-file copies |
| File.text() checks existence before reading, reopening a command URI | A two-entry native future cache coalesces the probe and read into one operation |
| Revision family names can accumulate in ReactFontManager | Resolve only Morphe revision aliases before that registry; preserve the original path for other fonts |
| Disk commit can succeed while its response is lost | Recover native state before reporting failure and update the checkmark accordingly |
| Reopening the picker repeats a full font scan | Reuse metadata for 30 seconds; coalesce scans; allow forced and pull-to-refresh |

The newer MPP has local version `2.10.11-openbot.2`; repository release settings
were not changed. The official APK passed compatibility again with four DEX
files and the same five original WebRTC/JNI issues, zero new issues. The rebuilt
adapter and asset checksums match the MPP resources, and the generated bundle
does not contain host filesystem paths. Total focused regression checks: 48.

The older `copyAsync` note above describes the first patch. The new bridge uses
`File.text()`. Matching ContentProviderFile/FileSystemFile source closes both the
existence-probe stream and the text reader. The native operation cache is tested
to execute a mutation once across those two opens.

## Remaining device checks

`adb devices -l` reported no attached device. No runtime or visual result is
claimed. On a Galaxy, verify initial system font, installed-font enumeration,
search, selection and reset, restart persistence, header/body/input consistency,
input selection/focus, light/dark mode, emoji/math, and existing packaged DOM
views. The static and compilation checks do not establish those observations.

For the preview update the Galaxy was attached for file transfer, but this agent
did not install or launch the updated app. Verify individual face previews,
long-list scrolling, search, refresh, dark/light colors, and font switching after
applying the new MPP. No before/after RSS or frame-time measurement is claimed.

## TTF import update

Local MPP version `2.10.11-openbot.3` adds a system document picker, persistent
private imported-font library and immediate application. Input must canonicalize
below the app cache directory. Extension, TrueType signature, text coverage and
native loading are checked before importing. Renamed OTF/TTC files are rejected.
SHA-256 filenames deduplicate files; the import buffer is reused for application.
Imports reuse the existing preview and startup paths; selection record version
remains 1. User originals are unchanged and picker cache copies are cleaned up.

The user confirmed the previous update works. For TTF import, 54 focused checks,
targeted UI lint, the document-picker/File API type probe, Android build and
official APK/DEX compatibility passed. The same five original WebRTC/JNI issues
remain, with zero new issues. Interactive picking/cancellation, real-file import,
restart and imported-font previews remain for on-device validation after applying
the new MPP. No installation was performed by the agent.
