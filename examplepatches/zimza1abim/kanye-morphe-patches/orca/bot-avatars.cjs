// Keeps each bot's uploaded picture on the device, so Home draws the picture on the first paint
// after a launch instead of its initial, and a replaced picture replaces the kept one.
// Orca 0.0.70 draws uploaded pictures itself; this only adds the device copy behind that read.
// Usage: node orca/bot-avatars.cjs <Orca android source checkout>
// Marker-guarded like prepare-source.cjs: an applied edit is skipped, an unexpected source
// layout stops before anything is written, and re-running on a prepared tree changes nothing.
const fs = require('node:fs')
const path = require('node:path')

const UPLOADS = 'mobile/src/bots/bot-avatar-uploads.ts'
const FILES = 'mobile/src/bots/bot-avatar-files.ts'
const FILES_TEST = 'mobile/src/bots/bot-avatar-files.test.ts'

function applyBotAvatarCache(sourceArg) {
  const source = path.resolve(sourceArg)
  const changes = new Map()
  const read = (relative) =>
    changes.get(path.join(source, relative)) ?? fs.readFileSync(path.join(source, relative), 'utf8')
  const set = (relative, text) => changes.set(path.join(source, relative), text)

  function edit(relative, marker, anchor, replacement) {
    const text = read(relative)
    if (text.includes(marker)) return
    if (text.split(anchor).length !== 2)
      throw Error(`${relative}: expected exactly one insertion anchor for ${JSON.stringify(marker)}`)
    set(relative, text.replace(anchor, replacement))
  }

  // ── a drawn picture falls back to the kept copy ──────────────────────────
  edit(UPLOADS, 'keptAvatarUri(botId, avatar)',
    "import { botAvatarRead, type ListedBot } from './host-bots-operations'\n",
    "import { botAvatarRead, type ListedBot } from './host-bots-operations'\n" +
    "import { keepAvatar, keptAvatarUri } from './bot-avatar-files'\n")

  edit(UPLOADS, '?? keptAvatarUri(botId, avatar)',
    '  const read = () => (botId && avatar ? (uploads.get(botId)?.uri ?? null) : null)\n',
    '  // The kept copy is already on disk, so the first paint after a launch draws the picture\n' +
    '  // instead of the initial; the read below still refreshes it when the host has a newer one.\n' +
    '  const read = () =>\n' +
    '    botId && avatar ? (uploads.get(botId)?.uri ?? keptAvatarUri(botId, avatar) ?? null) : null\n')

  // ── the read keeps what it drew, and drops the upload it replaced ─────────
  edit(UPLOADS, 'keepAvatar(botId, avatar, upload.uri)',
    '      upload.uri = read.value.png ? `data:image/png;base64,${read.value.png}` : null\n',
    '      upload.uri = read.value.png ? `data:image/png;base64,${read.value.png}` : null\n' +
    '      // Kept for the next launch; a replaced upload removes the file it supersedes.\n' +
    '      keepAvatar(botId, avatar, upload.uri)\n')

  // The module and the tests that keep it honest travel with the edits: a build exports all or none.
  const templates = {
    'bot-avatar-files.ts': FILES,
    'bot-avatar-files.test.ts': FILES_TEST
  }
  for (const [template, destination] of Object.entries(templates)) {
    set(destination, fs.readFileSync(path.join(__dirname, 'bot-avatars', template), 'utf8'))
  }

  for (const [file, contents] of changes) {
    fs.mkdirSync(path.dirname(file), { recursive: true })
    if (!fs.existsSync(file) || fs.readFileSync(file, 'utf8') !== contents) fs.writeFileSync(file, contents)
  }
  return { files: [...changes.keys()].map((file) => path.relative(source, file)) }
}

module.exports = applyBotAvatarCache
if (require.main === module) {
  if (process.argv.length !== 3) throw Error('Supply the Orca android source checkout')
  const result = applyBotAvatarCache(process.argv[2])
  process.stdout.write(`Keeps Orca bot pictures (${result.files.length} files).\n`)
}
