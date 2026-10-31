# Implementation research

Checked on 2026-07-12 before implementing the first milestone.

## Morphe

- Patch source: `MorpheApp/morphe-patches` at commit
  `ebd1d868a8ee8f5e796cae2434a315a8f9461efa`.
- Template source: `MorpheApp/morphe-patches-template` at commit
  `762d7ab96954b3afd76d63492882fb9a99f68e21`.
- The upstream `Downloads` patch hooks `OfflineVideoEndpointFingerprint` at
  method entry. Parameter `p3` is the video ID. Its extension returns `true` to
  consume the action or `false` to continue YouTube's native downloader.
- The application-context fingerprint is the same one used by Morphe's shared
  YouTube extension hook: the matched method contains both
  `Application.onCreate` and `Application creation`.
- Supported versions and Google signing-certificate hashes in this bundle were
  copied from upstream's current YouTube compatibility declaration.

## cobalt

- Official API contract: `POST /` with JSON `Accept` and `Content-Type` headers.
- No instance is shipped as the default. The API endpoint is required and must
  be configured by the user.
- Turnstile-enabled APIs expose a site key in their server information. Their
  web frontend solves the browser challenge, then sends the result to
  `POST /session` as the `cf-turnstile-response` header. The returned token is
  sent to the processing endpoint as `Authorization: Bearer <token>`.
- The injected client recreates that browser step in an on-demand Android
  WebView. Session tokens are cached in memory only and discarded when expired
  or rejected by the API.
- The client accepts `tunnel`, `redirect`, and two-stream `local-processing`
  merge responses. It rejects picker results, other local-processing operations,
  unknown statuses, and non-HTTPS result URLs.
- MP4 finalization uses Media3 `MediaMuxerCompat`, which implements its own MP4
  muxing and supports AV1, VP9, H.264, AAC, and Opus. It does not need the
  platform `MediaMuxer` codec support that restricted AV1 muxing to Android 14.

## Verification boundary

`buildAndroid` and `generatePatchesList` produce an MPP containing the compiled
patch plus `extensions/cobalt-downloads.mpe`. Release candidates are also
patched into a clean compatible YouTube APK before publication.
