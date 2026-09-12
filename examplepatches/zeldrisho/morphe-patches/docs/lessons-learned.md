# Lessons learned

Short, reusable rules from incidents in this repository. Procedures belong in
[development](development.md), [patch development](patch-development.md), and
[QA](qa-checklist.md).

## Patching

| Rule | Why |
| --- | --- |
| Prove a client-side gate before bypassing a server response or telemetry signal. | Otherwise the proposed patch has no effect or suppresses harmless reporting. |
| Preserve initialization and error handling; patch the narrow predicate or callsite. | Shared helpers and lifecycle code have broad, hard-to-test consequences. |
| Filter returned collections rather than mutating unknown list implementations. | Immutable or shared lists can reject in-place edits or corrupt later consumers. |
| Guard version, ABI, and method-shape assumptions in native and bytecode patches. | A patch that matches the wrong artifact can crash or silently do nothing. |
| Treat a successful build as necessary, not sufficient. | Runtime behavior can differ after signing, installation, optimization, or data restoration. |

## Analysis and diagnostics

| Rule | Why |
| --- | --- |
| Establish a stock control before interpreting a patched run. | It separates app/device/toolchain failures from the change under test. |
| Use staged isolation: loader, entrypoint, helper, then predicate. | Broad stubs can hide the failure while also removing required setup. |
| Record exact artifact hashes, version, ABI, offsets, bytes, and raw logs. | Findings are otherwise not reproducible or portable to another build. |
| Prefer fail-loud diagnostic probes over broad hooks. | Broad instrumentation can perturb timing, loading, or register state. |
| Do not retain a diagnostic mutation as a production patch. | Stubs and NOPs commonly remove registration, cleanup, or required state. |
| When isolating native startup failures, preserve setup and neutralize only the failing dispatch. | Bypassing an entire initializer can remove required TLS/JNI state and create misleading secondary crashes. |
| Treat native calls that populate shared configuration as required initialization until proven otherwise. | Replacing a configuration call with a NOP can leave downstream key/API fields null and turn the original failure into unrelated request-construction crashes. |
| When a native routine resolves a framework method through JNI, trace the JNIEnv table call and its argument setup before changing Java callers. | Nearby smali `System.exit` callers may be unrelated; a JNI-dispatched exit can survive broad bytecode suppression. |
| For a surgical native fix, validate both the preserved prerequisite instruction and the replaced terminal dispatch bytes. | Checking only the mutation can silently break required initialization or apply to the wrong ABI/build. |
| Treat process survival and UI reachability as separate from initialization correctness. | A suppressed exit can expose later null shared state; validate required fields and request construction before calling the run successful. |
| Restore the stock initializer before diagnosing later lifecycle or authentication failures. | A valid control distinguishes a patch regression from the app's independent integrity or device behavior. |

## Device diagnostics

| Rule | Why |
| --- | --- |
| Confirm the device is awake, unlocked, and displaying the app before diagnosing a startup stall. | A locked or dozing device can leave the foreground activity unchanged while the app is healthy and interactive underneath. |
| Distinguish an activity's registered/alias name from the screen currently rendered. | Launchers and aliases can continue to report an entry activity after navigation into an in-app flow. |
| Treat worker-thread exceptions and noisy system logs as evidence to correlate, not proof of the root cause. | Background failures may be recoverable or unrelated; correlate them with UI state, activity history, and process health. |
| Record device state, app state, exact commands, and bounded log evidence for runtime findings. | This makes failures reproducible without turning feature-specific observations into permanent QA procedure. |
| Start logcat capture before reproducing an error and stop it immediately afterward. | A post hoc buffer can omit the request, response, and client decision that caused the visible error. |
| Treat a startup-integrity bypass and authentication trust as separate gates. | A re-signed app can boot normally while a Java or server-side certificate check rejects login. |
| Treat third-party account/Drive authorization as a separate signing-identity gate. | A re-signed client may reach its UI and authenticate to its own service while Google token issuance still rejects its certificate. |
| Trace the provider boundary before redirecting a third-party SDK. | A client can use standard `AccountManager` account types and a hard-coded GMS component even when the installed implementation uses a different package identity; blind string replacement can break account selection or service binding. |
| Keep provider package identity separate from compatibility API namespaces. | A package-renamed GMS implementation may expose `com.google.android.gms.*` API/service descriptors while its actual Android application package and namespaced intent actions differ; redirect only the proven boundary. |
| Validate account type independently of provider package redirection. | `AccountManager` discovery and token lookup can fail even when the redirected token service is reachable if the client and provider use different account-type strings. |
| Distinguish account existence from account visibility. | `dumpsys account` can show an account while `getAccountsByType()` returns an empty array because the caller is not listed in that account's visibility settings; inspect visibility before adding or re-creating an account. |
| Match framework API overloads to the device runtime, not only the compile SDK. | Android 16 exposed the `newChooseAccountIntent` overload accepting `List<Account>`; emitting the `Account[]` overload caused a runtime `NoSuchMethodError` despite successful compilation. |
| Treat picker success and OAuth authorization as separate gates. | On SM-S936B the picker returned the selected account and MicroG received the `drive.appdata` request through `app.revanced.android.gms`; the remaining `UNREGISTERED_ON_API_CONSOLE` failure was the Morphe signing certificate not being registered for the OAuth client. |
| Keep configuration cache separate from the build cache. | `org.gradle.caching=true` caches task outputs; configuration cache is opt-in via `--configuration-cache` or `org.gradle.configuration-cache=true`, and custom/plugin tasks must be verified before enabling it by default. |
| If a request fails with a local exception before an HTTP response is logged, classify it as client-side first. | Generic UI error numbers do not establish a server response; capture the request lifecycle before attributing a failure to the endpoint. |
| Confirm the runtime path before attributing a string or native offset to a failure. | Native strings and nearby helpers can be unused, while the active path may be ordinary Java code. |
| Separate provider transport success from upstream authorization. | A successful account picker, IPC bind, and token-service request do not prove that the upstream OAuth client accepts the installed package and certificate. |
| Treat re-signing as an authentication boundary. | OAuth clients commonly bind authorization to package identity and signing certificate; a locally valid APK can still be rejected upstream. |
| Validate signing inputs before attributing failures to runtime code. | Keystore format, password, and alias errors can prevent a reproducible install; verify the selected entry and APK certificate before device QA. |
| Treat Morphe keystore aliases as case-sensitive. | `morphe` and `Morphe` are different aliases; pass the exact alias with its matching key password or signing will be non-reproducible. |
| Keep microG signature formats distinct. | The `SPOOFED_PACKAGE_SIGNATURE` metadata uses the stock certificate's raw DER hex for signature spoofing, while Google OAuth client registration uses the lowercase 40-character SHA-1 fingerprint (`9487ba76b32e9e36785fb4c3540021f85af8d7b7`). |

## OAuth-dependent device QA finding

A re-signed build can launch without crashes and reach a Drive restore flow while the provider still returns `UNREGISTERED_ON_API_CONSOLE`. A captured `drive.appdata` request may contain both `client_sig` and `callerSig` as raw stock-certificate DER hex, proving the transport path but not upstream authorization. The account picker and OAuth authorization are separate gates. Drive backup/restore remains unverified until the OAuth project accepts the package and certificate, and may remain unavailable for re-signed clients when server-side project-key attestation is enforced.

If authentication fails before the main UI is available, record ad and feature checks as BLOCKED rather than treating the startup result as full functional QA.

## Compatibility and QA

| Rule | Why |
| --- | --- |
| Keep package identity and signing assumptions explicit. | Renaming or re-signing can break authentication, app links, or native checks. |
| Test cold start, foreground/background transitions, and the main user flow. | Startup success alone does not prove lifecycle or feature compatibility. |
| Verify backup and restore with the app's supported mechanism. | External files are not necessarily a complete application-data backup. |
| Keep risky patches disabled until device QA proves the default path. | A patch should fail safely and remain easy to remove. |
| Do not infer an endpoint or server rejection from a generic UI error alone. | Reproduce with bounded network/client logs or a controlled response capture before selecting a patch target. |
