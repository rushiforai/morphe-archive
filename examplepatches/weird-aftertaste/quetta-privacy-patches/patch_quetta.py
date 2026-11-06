#!/usr/bin/env python3
"""Rebuild Quetta Browser APKs with telemetry endpoints neutralised.

Accepts a single split APK or a bundle archive (.zip / .xapk / .apks) that
contains base.apk + split APKs. Edits are same-length byte substitutions inside
existing string data plus binary-XML element/attribute surgery, so dex/ELF
layout, string-pool indices and resource tables stay intact. Each APK is then
re-aligned (16 KiB pages) and signed with one key of your own, which split sets
require.

Tiers:
  base    Firebase/GA4 upload, Crashlytics, Sentry minidumps, Chromium reporting.
  --strict  base + favicon proxy, start page/suggestions, video AI, ads beacon
            (favicons go blank, start page loses suggestions).
  --kill-updater        Omaha/update hosts (component + filter-list updates stop).
  --kill-push           FCM / Firebase Installations (push notifications die).
  --drop-query-all-packages   remove android.permission.QUERY_ALL_PACKAGES.
  always: network_security_config -> cleartext off, user CAs untrusted.

Usage:
    python patch_quetta.py net.quetta.browser.zip --strict
    python patch_quetta.py app.apk --strict --kill-updater -o out.apk
    python patch_quetta.py bundle.zip --strict --kill-updater --kill-push \
        --drop-query-all-packages

Exit code 0 only if every output APK re-scans clean, is aligned and is signed.
"""

import argparse
import glob
import hashlib
import urllib.request
import json
import os
import shutil
import struct
import subprocess
import zlib
import hashlib
import tempfile
import zipfile

BASE_HOSTS = [
    b"app-measurement.com",                # GA4 upload
    b"google-analytics.com",               # legacy GA
    b"firebase-settings.crashlytics.com",  # Crashlytics settings + upload
    b"sentry.thefrodo.com",                # crashpad minidump uploader
    b"chromereporting-pa.googleapis.com",  # Chromium reporting
]
STRICT_HOSTS = [
    b"crashpad.chromium.org",              # Chromium native crash uploader
    b"bcp.quetta.net",                     # unattributed vendor endpoint
    b"go.quetta.net",                      # share links
    b"f.quetta.net",                       # favicon / extension-icon proxy
    b"qt.quetta.net",                      # start page, search suggestions
    b"ai.quetta.net",                      # server-side video sniffing
    b"pagead2.googlesyndication.com",      # ads beacon
]
UPDATER_HOSTS = [
    b"test-omaha.quetta.net",              # before omaha.* (substring order)
    b"test-update.quetta.net",
    b"omaha.quetta.net",
    b"update.quetta.net",
]
PUSH_HOSTS = [
    b"fcmregistrations.googleapis.com",
    b"firebaseinstallations.googleapis.com",
    b"firebaseperusertopics-pa.googleapis.com",
]
QUERY_ALL_PACKAGES = "android.permission.QUERY_ALL_PACKAGES"
NSC_STRINGS = ("network-security-config", "trust-anchors")


def dead_host(n):
    """Same-length host guaranteed not to resolve (.invalid is reserved, RFC 2606)."""
    if n < 10:
        raise SystemExit(f"host too short to neutralise: {n} bytes")
    return ("b" + "0" * (n - 9) + ".invalid").encode()


def host_patches(args):
    if args.passthrough:
        return []
    hosts = list(BASE_HOSTS)
    if args.strict:
        hosts += STRICT_HOSTS
    if args.kill_updater:
        hosts += UPDATER_HOSTS
    if args.kill_push:
        hosts += PUSH_HOSTS
    ordered = sorted(dict.fromkeys(hosts), key=len, reverse=True)  # longest first: no substring cascades
    return [(h, dead_host(len(h))) for h in ordered]


# --------------------------------------------------------------------------- AXML

def _u16(d, o):
    return struct.unpack_from("<H", d, o)[0]


def _u32(d, o):
    return struct.unpack_from("<I", d, o)[0]


def axml_strings(d):
    """Decode an AXML string pool; handles both UTF-8 and UTF-16 pools."""
    if _u16(d, 8) != 0x0001:
        raise ValueError("string pool is not the first chunk")
    count, _styles, flags, start = struct.unpack_from("<IIII", d, 16)
    base = 8 + start
    out = []
    for off in struct.unpack_from("<%dI" % count, d, 8 + 28):
        p = base + off
        if flags & 0x100:
            p += 1 if not d[p] & 0x80 else 2          # UTF-16 length, unused
            blen = d[p]
            p += 1
            if blen & 0x80:
                blen = ((blen & 0x7f) << 8) | d[p]
                p += 1
            out.append(d[p:p + blen].decode("utf-8", "replace"))
        else:
            size = _u16(d, p)
            p += 2
            if size & 0x8000:
                size = ((size & 0x7fff) << 16) | _u16(d, p)
                p += 2
            out.append(d[p:p + size * 2].decode("utf-16-le", "replace"))
    return out


def axml_walk(d):
    """Yield (offset, type, size, element_name_index, [(attr_name_idx, type, data, data_off)])."""
    off = 8
    while off < len(d):
        ctype, size = _u16(d, off), _u32(d, off + 4)
        if size == 0:
            raise SystemExit("AXML: zero-sized chunk")
        name, attrs = None, []
        if ctype == 0x0102:
            name = _u32(d, off + 20)
            attr_start, attr_size = _u16(d, off + 24), _u16(d, off + 26)
            a = off + 16 + attr_start
            for _ in range(_u16(d, off + 28)):
                # Stride comes from the element header: these builds write a
                # per-attribute size of 8, which real parsers ignore.
                _ns, nm, _raw, _vsize, _res, dtype, data = struct.unpack_from("<IIIHBBI", d, a)
                attrs.append((nm, dtype, data, a + 16))
                a += attr_size
        yield off, ctype, size, name, attrs
        off += size
    if off != len(d):
        raise SystemExit("AXML: chunk sizes do not add up")


def _element_span(chunks, index):
    """Total byte span of the element starting at chunks[index], END_TAG included."""
    depth = 0
    for j in range(index, len(chunks)):
        if chunks[j][1] == 0x0102:
            depth += 1
        elif chunks[j][1] == 0x0103:
            depth -= 1
            if depth == 0:
                return chunks[j][0] + chunks[j][2] - chunks[index][0]
    raise SystemExit("AXML: unterminated element")


def nsc_candidates(zf):
    """All network-security-config files; the resource path is resource-shrunk, the
    referenced one is the variant that still permits cleartext."""
    out = []
    for name in zf.namelist():
        if not (name.startswith("res/") and name.endswith(".xml")):
            continue
        if zf.getinfo(name).file_size > 4096:
            continue
        data = zf.read(name)
        try:
            strings = axml_strings(data)
        except (ValueError, struct.error, IndexError):
            continue
        if all(s in strings for s in NSC_STRINGS):
            out.append(name)
    return out


def patch_nsc(original):
    """Disable cleartext traffic and drop user-installed CA trust. Returns None if nothing to do."""
    d = bytearray(original)
    if _u32(d, 4) != len(d):
        raise SystemExit("network_security_config: root size mismatch")
    strings = axml_strings(d)
    chunks = list(axml_walk(d))

    flipped = 0
    for _off, ctype, _size, name, attrs in chunks:
        if ctype != 0x0102 or name is None or strings[name] not in ("base-config", "domain-config"):
            continue
        for nm, dtype, data, data_off in attrs:
            if strings[nm] != "cleartextTrafficPermitted" or dtype != 0x12:
                continue
            if data == 0xFFFFFFFF:
                struct.pack_into("<I", d, data_off, 0)
                flipped += 1

    removed = []
    for i, (off, ctype, _size, name, attrs) in enumerate(chunks):
        if ctype != 0x0102 or name is None or strings[name] != "certificates":
            continue
        for nm, dtype, data, _data_off in attrs:
            if strings[nm] == "src" and dtype == 0x03 and strings[data] == "user":
                removed.append((off, _element_span(chunks, i)))

    if not flipped and not removed:
        return None
    for off, span in sorted(removed, reverse=True):
        d = d[:off] + d[off + span:]
        struct.pack_into("<I", d, 4, len(d))
    axml_walk(d)
    return bytes(d)


def check_nsc(d):
    strings = axml_strings(d)
    cleartext, user_ca = None, False
    for _off, ctype, _size, name, attrs in axml_walk(d):
        if ctype != 0x0102 or name is None:
            continue
        if strings[name] == "base-config":
            for nm, _dtype, data, _o in attrs:
                if strings[nm] == "cleartextTrafficPermitted":
                    cleartext = data
        if strings[name] == "certificates":
            for nm, _dtype, data, _o in attrs:
                if strings[nm] == "src" and strings[data] == "user":
                    user_ca = True
    return cleartext, user_ca


def manifest_permissions(manifest):
    strings = axml_strings(manifest)
    out = []
    for _off, ctype, _size, name, attrs in axml_walk(manifest):
        if ctype != 0x0102 or name is None or strings[name] not in ("uses-permission", "uses-permission-sdk-23"):
            continue
        for nm, _dtype, data, _o in attrs:
            if strings[nm] == "name":
                out.append(strings[data])
    return out


def drop_permission(original, permission):
    d = bytearray(original)
    if _u32(d, 4) != len(d):
        raise SystemExit("AndroidManifest: root size mismatch")
    strings = axml_strings(d)
    chunks = list(axml_walk(d))
    for i, (off, ctype, _size, name, attrs) in enumerate(chunks):
        if ctype != 0x0102 or name is None or strings[name] not in ("uses-permission", "uses-permission-sdk-23"):
            continue
        for nm, _dtype, data, _o in attrs:
            if strings[nm] == "name" and strings[data] == permission:
                out = d[:off] + d[off + _element_span(chunks, i):]
                struct.pack_into("<I", out, 4, len(out))
                axml_walk(out)
                return bytes(out)
    return None


# --------------------------------------------------------------------------- zip / tools


def fix_dex_header(data):
    """Recompute the DEX Adler-32 checksum and SHA-1 signature after in-place edits.

    ART verifies both; a stale header makes the whole file unloadable
    ("Bad checksum" -> ClassNotFoundException at application start).
    """
    if data[:4] != b"dex\n":
        raise SystemExit("expected a dex file")
    struct.pack_into("<I", data, 32, len(data))                      # file_size
    data[12:32] = hashlib.sha1(bytes(data[32:])).digest()            # signature
    struct.pack_into("<I", data, 8, zlib.adler32(bytes(data[12:])) & 0xFFFFFFFF)


def dex_header_ok(data):
    if data[:4] != b"dex\n":
        return True
    if struct.unpack_from("<I", data, 32)[0] != len(data):
        return False
    if data[12:32] != hashlib.sha1(bytes(data[32:])).digest():
        return False
    return struct.unpack_from("<I", data, 8)[0] == (zlib.adler32(bytes(data[12:])) & 0xFFFFFFFF)



TOOL_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "tools")
BAKSMALI = os.path.join(TOOL_DIR, "baksmali.jar")
SMALI = os.path.join(TOOL_DIR, "smali.jar")

# smali 3.0.10 release assets; pinned so a rebuild uses the exact same assembler.
TOOLS = {
    BAKSMALI: ("https://github.com/baksmali/smali/releases/download/3.0.10/baksmali-3.0.10-fat.jar",
               "37ae4a41a8886e15c20b8362fa4250f96bbdb55e1a608199ad8b5dff068b588f"),
    SMALI: ("https://github.com/baksmali/smali/releases/download/3.0.10/smali-3.0.10-fat.jar",
            "32fa0e88a6c397b3922201adf5f3e534fbaed5a663c71d0c558c3ddce0af844a"),
}


def ensure_tools():
    """Fetch the pinned smali/baksmali jars if missing and verify their digests.

    DEX edits go through this assembler (a byte patch cannot keep string_ids sorted),
    so a missing jar is fatal rather than silently degrading the patch.
    """
    os.makedirs(TOOL_DIR, exist_ok=True)
    for path, (url, expected) in TOOLS.items():
        name = os.path.basename(path)
        if os.path.exists(path):
            actual = hashlib.sha256(open(path, "rb").read()).hexdigest()
            if actual != expected:
                raise SystemExit(f"{name}: sha256 {actual} does not match the pinned {expected}; delete it to redownload")
            continue
        print(f"fetching {name} ...")
        try:
            with urllib.request.urlopen(url, timeout=120) as response:
                blob = response.read()
        except OSError as error:
            raise SystemExit(f"{name} missing and download failed ({error}). "
                             f"Fetch {url} into {TOOL_DIR} manually.") from error
        actual = hashlib.sha256(blob).hexdigest()
        if actual != expected:
            raise SystemExit(f"{name}: downloaded sha256 {actual} does not match the pinned {expected}")
        with open(path, "wb") as f:
            f.write(blob)



def rebuild_dex(blob, pairs, work):
    """Replace string constants through smali so string_ids stays sorted and the
    header checksum/signature are regenerated (ART rejects stale dex files)."""
    import binascii
    if any(b in blob for b, _n in pairs) is False:
        return blob
    tag = binascii.hexlify(os.urandom(4)).decode()
    dex_path = os.path.join(work, f"{tag}.dex")
    tree = os.path.join(work, f"smali-{tag}")
    out_path = os.path.join(work, f"{tag}-out.dex")
    with open(dex_path, "wb") as f:
        f.write(blob)
    run(["java", "-jar", BAKSMALI, "d", dex_path, "-o", tree])
    for root, _dirs, files in os.walk(tree):
        for name in files:
            if not name.endswith(".smali"):
                continue
            path = os.path.join(root, name)
            with open(path, "rb") as f:
                data = f.read()
            new = data
            for old, repl in pairs:
                if old in new:
                    new = new.replace(old, repl)
            if new is not data:
                with open(path, "wb") as f:
                    f.write(new)
    run(["java", "-jar", SMALI, "a", tree, "-o", out_path])
    with open(out_path, "rb") as f:
        rebuilt = f.read()
    shutil.rmtree(tree, ignore_errors=True)
    for tmp in (dex_path, out_path):
        os.unlink(tmp)
    return rebuilt


def rewrite_zip(src, dst, replacements):
    with zipfile.ZipFile(src) as zin, zipfile.ZipFile(dst, "w", zipfile.ZIP_DEFLATED, allowZip64=True) as zout:
        for info in zin.infolist():
            new = zipfile.ZipInfo(info.filename, info.date_time)
            new.compress_type = info.compress_type
            new.external_attr = info.external_attr
            new.create_system = info.create_system
            new.internal_attr = info.internal_attr
            data = replacements.get(info.filename)
            if data is None:
                with zout.open(new, "w") as w, zin.open(info) as r:
                    shutil.copyfileobj(r, w, 1 << 20)
            else:
                with zout.open(new, "w") as w:
                    w.write(data)


def sdk_tool(name):
    roots = [os.environ.get("ANDROID_HOME"), os.environ.get("ANDROID_SDK_ROOT"),
             os.path.join(os.environ.get("LOCALAPPDATA", ""), "Android", "Sdk")]
    for root in filter(None, roots):
        build_tools = os.path.join(root, "build-tools")
        if not os.path.isdir(build_tools):
            continue
        for ver in sorted(os.listdir(build_tools), reverse=True):
            exe = os.path.join(build_tools, ver, name)
            for cand in (exe, exe + ".exe", exe + ".bat"):
                if os.path.isfile(cand):
                    return cand
    raise SystemExit(f"{name} not found; set ANDROID_HOME to an SDK with build-tools")


def run(cmd):
    r = subprocess.run(cmd, capture_output=True, text=True, errors="replace")
    if r.returncode != 0:
        raise SystemExit(f"command failed: {' '.join(cmd)}\n{r.stdout}\n{r.stderr}")
    return r.stdout


def ensure_keystore(path):
    if os.path.exists(path):
        return
    run(["keytool", "-genkeypair", "-keystore", path, "-alias", "quetta",
         "-keyalg", "RSA", "-keysize", "4096", "-validity", "10950",
         "-storepass", "quetta-patched", "-keypass", "quetta-patched",
         "-dname", "CN=Quetta Patched, O=Personal Use, C=US"])
    print(f"created signing key {path} (password: quetta-patched)")


KEYSTORE_PASS = "quetta-patched"


def sign(apk_in, apk_out, keystore):
    aligned = apk_in + ".aligned"
    run([sdk_tool("zipalign"), "-f", "-P", "16", "4", apk_in, aligned])
    run([sdk_tool("apksigner"), "sign", "--ks", keystore, "--ks-key-alias", "quetta",
         "--ks-pass", f"pass:{KEYSTORE_PASS}", "--key-pass", f"pass:{KEYSTORE_PASS}",
         "--v1-signing-enabled", "false", "--v2-signing-enabled", "true",
         "--v3-signing-enabled", "true", "--v4-signing-enabled", "false",
         "--out", apk_out, aligned])
    os.unlink(aligned)
    run([sdk_tool("apksigner"), "verify", "--verbose", apk_out])
    run([sdk_tool("zipalign"), "-c", "-P", "16", "4", apk_out])
    run([sdk_tool("aapt2"), "dump", "xmltree", "--file", "AndroidManifest.xml", apk_out])


# --------------------------------------------------------------------------- per-APK work

def patch_apk(path, out_path, args, keystore, work, counters):
    """Patch one APK; returns the repeatable report lines and any problems."""
    lines, problems = [], []
    with zipfile.ZipFile(path) as z:
        entries = z.namelist()
        blobs = [n for n in entries if n.endswith((".dex", ".so"))]
        originals = {n: bytes(z.read(n)) for n in blobs}
        counts = {}
        for old, new in host_patches(args):
            for entry in blobs:
                hits = originals[entry].count(old)
                if hits:
                    counts[(entry, old)] = hits
                    counters[(old, new)] = counters.get((old, new), 0) + hits
        for (entry, old), hits in sorted(counts.items()):
            lines.append(f"  {os.path.basename(path):12s} {entry:26s} {old.decode():38s} x{hits}")

        replacements = {}
        for entry in blobs:
            pairs = [(old, new) for (e, old), _h in counts.items() if e == entry
                     for o, new in host_patches(args) if o == old]
            if not pairs:
                continue
            if entry.endswith(".dex"):
                # ART rejects unsorted string_ids and stale headers: rebuild via smali
                replacements[entry] = rebuild_dex(originals[entry], pairs, work)
            else:
                data = bytearray(originals[entry])
                for old, new in pairs:
                    pos = 0
                    for _ in range(data.count(old)):
                        i = data.find(old, pos)
                        data[i:i + len(old)] = new
                        pos = i + len(new)
                replacements[entry] = bytes(data)

        nsc = []
        if not args.no_nsc and not args.passthrough:
            for name in nsc_candidates(z):
                patched = patch_nsc(z.read(name))
                if patched is not None:
                    replacements[name] = patched
                    nsc.append(name)
            for name in nsc:
                lines.append(f"  {os.path.basename(path):12s} {name:26s} cleartext=false, user CAs untrusted")

        if args.drop_query_all_packages:
            manifest = z.read("AndroidManifest.xml")
            if QUERY_ALL_PACKAGES in manifest_permissions(manifest):
                dropped = drop_permission(manifest, QUERY_ALL_PACKAGES)
                if dropped is None:
                    problems.append(f"{os.path.basename(path)}: could not drop {QUERY_ALL_PACKAGES}")
                else:
                    replacements["AndroidManifest.xml"] = dropped
                    lines.append(f"  {os.path.basename(path):14s} AndroidManifest: {QUERY_ALL_PACKAGES} removed")
            elif manifest_permissions(manifest):
                lines.append(f"  {os.path.basename(path):14s} (no {QUERY_ALL_PACKAGES} here)")

        unsigned = os.path.join(work, os.path.basename(path) + ".unsigned")
        rewrite_zip(path, unsigned, replacements)
        sign(unsigned, out_path, keystore)
        os.unlink(unsigned)

        with zipfile.ZipFile(out_path) as zout:
            # apksigner drops a Play source-stamp file and any stale v1 signature
            # files; every other entry must survive untouched.
            expected = [n for n in entries
                        if n != "stamp-cert-sha256"
                        and not (n.startswith("META-INF/") and n.endswith((".SF", ".RSA", ".DSA", ".MF")))]
            if zout.namelist() != expected:
                problems.append(f"{os.path.basename(path)}: entry list changed")
            for entry in blobs:
                data = zout.read(entry)
                for old, _new in host_patches(args):
                    if old in data:
                        problems.append(f"{os.path.basename(path)}:{entry}: {old.decode()} survived")
            for name in (nsc if not args.no_nsc else []):
                cleartext, user_ca = check_nsc(zout.read(name))
                if cleartext == 0xFFFFFFFF:
                    problems.append(f"{os.path.basename(path)}:{name}: cleartext still permitted")
                if user_ca:
                    problems.append(f"{os.path.basename(path)}:{name}: user CAs still trusted")
            for entry in zout.namelist():
                if entry.endswith(".dex") and not dex_header_ok(zout.read(entry)):
                    problems.append(f"{os.path.basename(path)}:{entry}: dex checksum/signature stale")
            if args.drop_query_all_packages and QUERY_ALL_PACKAGES in manifest_permissions(zout.read("AndroidManifest.xml")):
                problems.append(f"{os.path.basename(path)}: {QUERY_ALL_PACKAGES} still declared")
    return lines, problems


# --------------------------------------------------------------------------- main

def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("input", help="split APK or bundle archive containing base.apk + splits")
    ap.add_argument("-o", "--output", help="output APK (single input) or directory (bundle input)")
    ap.add_argument("--strict", action="store_true")
    ap.add_argument("--kill-updater", action="store_true")
    ap.add_argument("--kill-push", action="store_true")
    ap.add_argument("--drop-query-all-packages", action="store_true")
    ap.add_argument("--passthrough", action="store_true",
                    help="no host/NSC/permission edits - only merge/sign (baseline for bisecting)")
    ap.add_argument("--no-nsc", action="store_true",
                    help="leave network_security_config untouched (diagnostic / if the app refuses to start)")
    args = ap.parse_args()
    ensure_tools()

    src = os.path.abspath(args.input)
    suffix = "-strict" if args.strict else "-privacy"
    work = tempfile.mkdtemp(prefix="quetta-patch-")
    keystore = os.path.join(os.path.dirname(src), "quetta-patched.jks")
    ensure_keystore(keystore)

    with zipfile.ZipFile(src) as z:
        members = [n for n in z.namelist() if n.endswith(".apk")]
    bundle = len(members) > 0

    if bundle:
        stage = os.path.join(work, "in")
        os.makedirs(stage)
        with zipfile.ZipFile(src) as z:
            for name in members:
                with open(os.path.join(stage, os.path.basename(name)), "wb") as f:
                    f.write(z.read(name))
        targets = [os.path.join(stage, os.path.basename(n)) for n in members]
        out_dir = os.path.abspath(args.output or src[:-4] + suffix)
        os.makedirs(out_dir, exist_ok=True)
    else:
        targets = [src]
        out_dir = None

    print(f"source : {src}\ninputs : {len(targets)} APK(s)")
    counters, problems = {}, []
    for path in targets:
        out_path = os.path.join(out_dir, os.path.basename(path)) if bundle else os.path.abspath(
            args.output or src[:-4] + suffix + ".apk")
        lines, probs = patch_apk(path, out_path, args, keystore, work, counters)
        for line in lines:
            print(line)
        problems += probs

    print("\nsummary:")
    for (old, new), count in sorted(counters.items(), key=lambda kv: -kv[1]):
        print(f"  {old.decode():40s} x{count:<3d} -> {new.decode()}")

    certs = set()
    outs = sorted(glob.glob(os.path.join(out_dir, "*.apk"))) if bundle else [
        os.path.abspath(args.output or src[:-4] + suffix + ".apk")]
    for apk_path in outs:
        info = run([sdk_tool("apksigner"), "verify", "--print-certs", apk_path])
        for line in info.splitlines():
            if "SHA-256 digest" in line:
                certs.add(line.split(":")[-1].strip())
    if len(certs) != 1:
        problems.append(f"split set signed with {len(certs)} different certificates")

    if bundle and not problems:
        bundle_path = out_dir + ".zip"
        with zipfile.ZipFile(bundle_path, "w", zipfile.ZIP_STORED) as z:
            for apk_path in outs:
                z.write(apk_path, os.path.basename(apk_path))
        print(f"\nbundle : {bundle_path}")
        print("install: adb install-multiple " + " ".join(os.path.basename(p) for p in outs)
              + f"   (from {out_dir})")

    if problems:
        shutil.rmtree(work, ignore_errors=True)
        raise SystemExit("verification failed:\n  " + "\n  ".join(problems))

    shutil.rmtree(work, ignore_errors=True)
    for apk_path in outs:
        print(f"OK  {apk_path}  {os.path.getsize(apk_path)} bytes")
    print("    signed, 16 KiB-aligned, entries preserved, aapt2 manifest parse OK")


if __name__ == "__main__":
    main()
