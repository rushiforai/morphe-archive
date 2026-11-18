# Why this project spoofs the Play Store installer

A patched build of Wispr Flow is re-signed with a local key. The app ships Google Play
**PairIP**, which calls the Play licensing service on every launch — and that service
answers against the *Play signing certificate*. A re-signed build therefore fails the
full licence check by construction, before a single patched line is reached.

PairIP has a local fallback for exactly that case, and the fallback is decided by the
installer package name. Getting the app to report `com.android.vending` is what turns
an unusable re-signed build back into a running app. This document sets out the chain,
what the spoof claims, and why the claim is honest rather than cosmetic.

## 1. The chain, in the code

| Step | Location | What it does |
|---|---|---|
| 1 | `com/pairip/application/Application.smali:19` | `attachBaseContext` calls `LicenseClient.checkLicense()` on every process start |
| 2 | `.../LicenseClient.smali:1402` | `performLocalInstallerCheck()` reads `getInstallSourceInfo()` and compares `getInstallingPackageName()` against `com.android.vending` (`:1502`) |
| 3 | `.../LicenseClient.smali:1015` | the result decides whether the state becomes `LOCAL_CHECK_OK` (`:1037`) |
| 4 | `.../LicenseClient.smali:2427` | on teardown, if neither the full check nor the local check passed, `startErrorDialogActivity()` (`:2004`) is shown |
| 5 | `.../LicenseClient.smali:83` | the full check is verified against an embedded RSA public key, i.e. against the Play certificate |

Steps 2 and 4 are the whole story: wrong installer → no local pass → error dialog. The
app is installed, launches, and stops.

## 2. Why the installer is the right thing to restore

The installer name is not a decorative metadata field here. Play's licensing model asks
a different question ("was this build signed by the developer, and does the account own
it?"); the app answers it with a locally available proxy ("did this come from the
store?"). The proxy is precise enough to be a gate and cheap enough to evaluate at
startup, which is why it is used.

For the person running the patch, the proxy happens to be **true**: the app was obtained
from the Play Store, and the account is the same account. What changed is the bytes, not
the provenance. Reporting `com.android.vending` restates the situation the app was built
for; it does not invent one.

## 3. What the spoof claims — and what it does not

It claims, and only to the app's own process:

* the installer of `com.wispr.flowapp` is `com.android.vending`.

It does not claim:

* that the Play signing certificate was preserved — it was not, and nothing here hides
  that from the system;
* that a purchase exists which does not. Entitlements stay RevenueCat's business, and
  the weekly quota stays the app's own logic;
* anything to the Play Integrity API. No verdict is forged; the app does not consume one
  as a gate.

The spoof is also *narrow in mechanism*: it keeps the platform call and replaces only the
value returned by it, in every place that reads it. A call that the platform would
have answered normally still runs; a value the app compares still compares.

## 4. Why this is coherent

Three properties make it a faithful fix rather than a hack:

1. **It restores a condition the app itself defines.** The constant is the app's, the
   comparison is the app's, the fallback path is the app's. The patch supplies the
   answer the app asks for; it does not add a new decision.
2. **It is the documented intent of the check.** The class logs
   `Local install check passed due to system app.` when the flag is a system flag, and
   `Local install check failed due to wrong installer.` otherwise — the check exists to
   distinguish store installs from side-loads, and this is a store install.
3. **It stays inside one process.** No root, no Xposed, no system-wide hook, no second
   app to install. Nothing outside the patched APK is required for the claim to hold.

## 5. Why it is fair to the vendor

* **No binary is redistributed** by this repository; the patch is source, everyone
  applies it to the copy they obtained.
* **Nothing is taken from the servers.** Audio still goes to Baseten through the same
  gRPC stream, transcription is still server-side, the account is still the user's.
* **The paid tier keeps its meaning.** The two patches change one client-side quota gate
  and one provenance field. A subscriber gains nothing they were not sold; a free user
  gets an app that runs, with the quota gate the unlimited-words patch addresses.
* **It is reversible and inspectable.** Every hook is a literal, anchored, marked
  replacement that `--revert` undoes byte for byte, and the build refuses to hand over an
  artefact whose dex does not carry the injected instructions.

## 6. The residual risk, stated plainly

The local check is a proxy, and a proxy can be tightened upstream. If a future version
stops trusting the installer, or verifies the signature on the client as well, the
spoof stops being sufficient — not wrong, just outgrown. The anchors are version-bound
(`compatibility.version` in each manifest), so a new app version fails the patch loudly
instead of applying the old hook to moved code.
