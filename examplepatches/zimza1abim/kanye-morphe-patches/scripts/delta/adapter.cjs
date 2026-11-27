// Shared steps of the JS adapter builds (Joplin, Notesnook, Orca, OpenBot).
// - compile(): bytecode with the flags the React Native Gradle plugin uses for releases,
//   so the adapter matches the official bundle except for the patch's own edits.
// - assertStripped(): the debug section must stay as small as the official one.
// - writeDelta(): stores the adapter as a WDLT delta against the APK's own bundle.
const fs = require('node:fs');
const os = require('node:os');
const path = require('node:path');
const crypto = require('node:crypto');
const { execFileSync } = require('node:child_process');

const sha256 = bytes => crypto.createHash('sha256').update(bytes).digest('hex');
const tool = path.join(__dirname, 'BundleDelta.java');
// Official release bundles keep only a few dozen bytes of debug data.
const MAX_DEBUG_BYTES = 1024;

function hermesc(reactNative) {
  const host = process.platform === 'darwin' ? 'osx-bin' : 'linux64-bin';
  // React Native up to 0.7x ships hermesc in sdks/; newer releases depend on hermes-compiler.
  const candidates = [path.join(reactNative, 'sdks/hermesc', host, 'hermesc')];
  try {
    const pkg = require.resolve('hermes-compiler/package.json', { paths: [fs.realpathSync(reactNative)] });
    candidates.push(path.join(path.dirname(pkg), 'hermesc', host, 'hermesc'));
  } catch {}
  const binary = candidates.find(file => fs.existsSync(file));
  if (!binary) throw Error('hermesc not found under ' + reactNative);
  return binary;
}

function compile(reactNative, js, out) {
  execFileSync(hermesc(reactNative),
    ['-w', '-emit-binary', '-max-diagnostic-width=80', '-out', out, js, '-O', '-output-source-map'],
    { stdio: 'inherit' });
  // The source map is only a build by-product; it must not land in the patch resources.
  fs.rmSync(out + '.map', { force: true });
  return fs.readFileSync(out);
}

/** Bytes after debugInfoOffset (header field 18 in bytecode 96, 19 from 97 on). */
function debugBytes(bundle) {
  const version = bundle.readUInt32LE(8);
  const field = version >= 97 ? 19 : 18;
  return bundle.length - bundle.readUInt32LE(32 + 4 * field);
}

function assertStripped(bundle, label) {
  const debug = debugBytes(bundle);
  if (debug > MAX_DEBUG_BYTES) throw Error(`${label}: ${debug} bytes of debug info; compile with -output-source-map`);
}

/** Writes <base>.bdelta and returns its sha256. The full bundle is not kept. */
function writeDelta(original, patched, base) {
  const temp = fs.mkdtempSync(path.join(os.tmpdir(), 'adapter-delta-'));
  try {
    const oldFile = path.join(temp, 'original.bundle');
    const newFile = path.join(temp, 'patched.bundle');
    fs.writeFileSync(oldFile, original);
    fs.writeFileSync(newFile, patched);
    const java = ['-Xmx2g', '-Xss16m', tool];
    execFileSync('java', [...java, 'diff', oldFile, newFile, base + '.bdelta'], { stdio: 'inherit' });
    execFileSync('java', [...java, 'check', oldFile, base + '.bdelta', sha256(patched)], { stdio: 'inherit' });
  } finally {
    fs.rmSync(temp, { recursive: true, force: true });
  }
  fs.rmSync(base + '.bundle', { force: true });
  return sha256(fs.readFileSync(base + '.bdelta'));
}

module.exports = { sha256, compile, debugBytes, assertStripped, writeDelta };
