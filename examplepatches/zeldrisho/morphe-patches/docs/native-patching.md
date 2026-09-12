# Native patching

Guidance for repository patches that modify native libraries inside split APKs.

## Safe workflow

1. Establish a stock control and record the exact version, ABI, input hash, and
   native-library hash.
2. Isolate the failure in stages: library loading, constructors, entrypoint,
   helper calls, and finally the failing predicate.
3. Preserve registration, TLS, JNI environment setup, cleanup, and normal error
   paths. Do not replace an entire initializer when only one dispatch is faulty.
4. Use a version/ABI-gated raw-resource patch with an exact original-byte guard.
   Fail closed when the library, offset, or surrounding instructions differ.
5. Test the smallest mutation first, then test it composed with the other
   patches and on a cold start.

## Diagnostics and release

Diagnostic stubs and NOPs are evidence-gathering tools, not release patches;
they may remove required initialization and create misleading secondary
crashes. A release patch should change only the verified instruction and keep
its original call context intact.

For split APKs, patch the native library in its owning ABI split and verify the
resulting signed bundle, not just an extracted `base.apk`. Record the patch
name, guarded byte pattern, ABI, signing result, runtime logs, foreground
activity, and any remaining QA limitations.
