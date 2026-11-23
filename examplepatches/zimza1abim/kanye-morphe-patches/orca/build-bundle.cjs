// Rebuild only the Android JS/assets adapter. Never builds or installs the app.
// node orca/build-bundle.cjs <Orca android source> <original APK>
const fs = require('node:fs')
const path = require('node:path')
const crypto = require('node:crypto')
const { execFileSync } = require('node:child_process')

const [sourceArg, apkArg] = process.argv.slice(2)
if (!sourceArg || !apkArg) throw Error('Supply the Orca android source directory and original APK')
const source = path.resolve(sourceArg)
const apk = path.resolve(apkArg)
const mobile = path.join(source, 'mobile')
// The patch loads its adapter by the APK's own versionName, so this script tracks the
// source's version instead of pinning one; a new Orca release builds a new adapter.
const appJson = JSON.parse(fs.readFileSync(path.join(mobile, 'app.json'), 'utf8'))
const version = appJson.expo && appJson.expo.version
if (typeof version !== 'string' || version.length === 0) throw Error('mobile/app.json: no expo.version')

const sha256 = (bytes) => crypto.createHash('sha256').update(bytes).digest('hex')
const adapters = path.resolve(__dirname, '..', 'patches', 'src', 'main', 'resources', 'orca', 'adapters')
const propertiesFile = path.join(adapters, `${version}.properties`)

function readProperties(file) {
  const entries = []
  for (const line of fs.readFileSync(file, 'utf8').split('\n')) {
    const separator = line.indexOf('=')
    if (separator > 0) entries.push([line.slice(0, separator), line.slice(separator + 1)])
  }
  return entries
}

function propertyValue(entries, key) {
  const entry = entries.find(([name]) => name === key)
  return entry ? entry[1] : ''
}

const original = execFileSync('unzip', ['-p', apk, 'assets/index.android.bundle'], { maxBuffer: 128 * 1024 * 1024 })
const originalSha256 = sha256(original)
const properties = readProperties(propertiesFile)
if (propertyValue(properties, 'originalSha256') !== originalSha256)
  throw Error(`APK bundle differs from the ${version} bundle registered in ${path.basename(propertiesFile)}`)

require('./prepare-source.cjs')(source)

// Home draws the uploaded pictures this bundle carries; a tree that still paints initials is stale.
const rowView = fs.readFileSync(path.join(mobile, 'src/home/bots/MobileHomeBotRow.tsx'), 'utf8')
if (rowView.includes('mobileBotAvatarSource(row.bot, undefined)'))
  throw Error('Home bot rows still draw the initial for an uploaded picture')

// The rows' tests prove an upload draws once Home has its bytes, and its initial before that.
execFileSync(process.execPath,
  [path.join(mobile, 'node_modules', 'vitest', 'vitest.mjs'), 'run', 'src/home/bots', '--reporter=dot'],
  { cwd: mobile, stdio: 'inherit', env: { ...process.env, CI: '1' } })

const output = path.resolve(__dirname, 'build', 'bundle')
// A stale export could leak old assets into the adapter zip; start clean.
fs.rmSync(output, { recursive: true, force: true })
fs.mkdirSync(output, { recursive: true })
const bundle = path.join(output, 'assets', 'index.android.bundle')
const nativeAssets = path.join(output, 'res')
fs.mkdirSync(path.dirname(bundle), { recursive: true })
const expo = path.join(mobile, 'node_modules', 'expo', 'bin', 'cli')
execFileSync(process.execPath, [expo, 'export:embed', '--platform', 'android', '--dev', 'false',
  '--entry-file', 'index.js',
  '--bundle-output', bundle, '--assets-dest', nativeAssets,
  '--bytecode', '--minify', 'true', '--max-workers', '2'], {
  cwd: mobile, stdio: 'inherit',
  env: { ...process.env, NODE_ENV: 'production', EXPO_PUBLIC_APP_ENV: 'production', CI: '1' },
})
const patched = fs.readFileSync(bundle)
const hermesMagic = Buffer.from([0xc6, 0x1f, 0xbc, 0x03, 0xc1, 0x03, 0x19, 0x1f])
if (!original.subarray(0, 8).equals(hermesMagic)) throw Error('The APK bundle is not Hermes bytecode')
if (!patched.subarray(0, 8).equals(hermesMagic) || patched.readUInt32LE(8) !== original.readUInt32LE(8))
  throw Error('Generated bundle has a different Hermes bytecode format')
// The content authority string only exists inside the injected font screen and bridge.
if (!patched.includes(Buffer.from('dev.orca.app.morphe.fonts')) || !patched.includes(Buffer.from('morphe-font')))
  throw Error('Generated bundle is missing the font picker screen')
// Home's rows read every uploaded picture and keep it; the bytecode keeps the new module's names.
for (const name of ['readHomeBotAvatarUploads', 'keptHomeBotAvatars', 'createHomeBotAvatarFiles']) {
  if (!patched.includes(Buffer.from(name))) throw Error(`Generated bundle is missing ${name}`)
}

const overlay = path.join(output, 'overlay')
fs.rmSync(overlay, { recursive: true, force: true })
fs.mkdirSync(overlay, { recursive: true })
// Expo emits native assets beside the bundle; the patch writes res/ and assets/ entries only.
if (fs.existsSync(nativeAssets)) {
  for (const entry of fs.readdirSync(nativeAssets, { withFileTypes: true })) {
    // DOM components use generated HTML names; keep web files with this bundle's export.
    const dest = entry.name === 'www.bundle' ? path.join(overlay, 'assets', 'www.bundle')
      : path.join(overlay, 'res', entry.name)
    fs.cpSync(path.join(nativeAssets, entry.name), dest, { recursive: true })
  }
}
fs.mkdirSync(adapters, { recursive: true })
const assetsZip = path.join(adapters, `${version}.assets.zip`)
fs.rmSync(assetsZip, { force: true })
if (fs.readdirSync(overlay).length > 0) {
  execFileSync('zip', ['-q', '-r', assetsZip, '.'], { cwd: overlay })
} else {
  // An empty zip is just its end-of-central-directory record; the patch reads no entries.
  fs.writeFileSync(assetsZip, Buffer.from([0x50, 0x4b, 0x05, 0x06, ...new Array(18).fill(0)]))
}
fs.copyFileSync(bundle, path.join(adapters, `${version}.bundle`))

// Keep the registered identity keys; only the adapter's own checksums are ours to write.
const updates = { patchedSha256: sha256(patched), assetsSha256: sha256(fs.readFileSync(assetsZip)) }
const lines = []
const seen = new Set()
for (const [name, value] of properties) {
  if (name in updates) {
    seen.add(name)
    lines.push(`${name}=${updates[name]}`)
  } else {
    lines.push(`${name}=${value}`)
  }
}
for (const [name, value] of Object.entries(updates)) {
  if (!seen.has(name)) lines.push(`${name}=${value}`)
}
fs.writeFileSync(propertiesFile, lines.join('\n') + '\n')
console.log(`Orca ${version} adapter ready: ${path.relative(process.cwd(), adapters)}`)
console.log(`bundle ${(patched.length / 1024 / 1024).toFixed(1)} MB sha256=${sha256(patched)}`)
