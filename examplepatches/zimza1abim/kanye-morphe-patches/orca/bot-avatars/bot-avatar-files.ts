// Keeps each bot's uploaded picture in the app's cache, so a later launch draws it at once instead
// of waiting for the upload to be read again over the link, and drops the picture it replaced.
// The file system is loaded on first use: the read path is imported by tests that have none.
type ExpoFileSystem = typeof import('expo-file-system')

declare const require: (id: string) => unknown

const FOLDER = 'morphe-bot-avatars'
const PNG_PREFIX = 'data:image/png;base64,'
const UPLOAD_PREFIX = 'upload:'

// Read once per bot and upload version, so a row drawn again does not touch the file system.
const looked = new Map<string, string | undefined>()
let fileSystem: ExpoFileSystem | null = null

function files(): ExpoFileSystem | null {
  if (fileSystem) {
    return fileSystem
  }
  try {
    // eslint-disable-next-line @typescript-eslint/no-require-imports
    fileSystem = require('expo-file-system') as ExpoFileSystem
    return fileSystem
  } catch {
    // The web build has no device file system: every picture is read again.
    return null
  }
}

function safe(value: string): string {
  return value.replace(/[^A-Za-z0-9._-]/g, '_').slice(0, 120)
}

/** Its id and the upload's version: a replaced picture is a new file, never a stale face. */
function fileName(botId: string, avatar: string): string {
  return `${safe(botId)}-${safe(avatar.slice(UPLOAD_PREFIX.length))}.png`
}

function folder(fs: ExpoFileSystem, create: boolean): InstanceType<ExpoFileSystem['Directory']> {
  const directory = new fs.Directory(fs.Paths.cache, FOLDER)
  if (create) {
    directory.create({ idempotent: true, intermediates: true })
  }
  return directory
}

function pngBytes(dataUrl: string): Uint8Array | null {
  if (!dataUrl.startsWith(PNG_PREFIX)) {
    return null
  }
  try {
    const binary = atob(dataUrl.slice(PNG_PREFIX.length))
    const bytes = new Uint8Array(binary.length)
    for (let at = 0; at < binary.length; at += 1) {
      bytes[at] = binary.charCodeAt(at)
    }
    return bytes
  } catch {
    return null
  }
}

/** Forgets what this bot kept, so the next look reads the folder again. */
function forget(botId: string, avatar: string): void {
  looked.delete(`${botId}\n${avatar}`)
}

function forgetBot(botId: string): void {
  const prefix = `${botId}\n`
  for (const key of [...looked.keys()]) {
    if (key.startsWith(prefix)) {
      looked.delete(key)
    }
  }
}

/** The kept URI for this bot's current upload, or undefined when it was never kept here. */
export function keptAvatarUri(botId: string, avatar: string): string | undefined {
  const key = `${botId}\n${avatar}`
  if (looked.has(key)) {
    return looked.get(key)
  }
  let uri: string | undefined
  try {
    const fs = files()
    if (fs) {
      const file = new fs.File(folder(fs, false), fileName(botId, avatar))
      uri = file.exists ? file.uri : undefined
    }
  } catch {
    uri = undefined
  }
  looked.set(key, uri)
  return uri
}

/** Keeps this picture for the next launch and removes the upload it replaced. */
export function keepAvatar(botId: string, avatar: string, uri: string | null): void {
  const fs = files()
  if (!fs) {
    return
  }
  const key = `${botId}\n${avatar}`
  const name = fileName(botId, avatar)
  if (uri === null) {
    // The host no longer serves this picture: nothing kept here should outlive it.
    forget(botId, avatar)
    try {
      const file = new fs.File(folder(fs, false), name)
      if (file.exists) {
        file.delete()
      }
    } catch {
      // A file that cannot be removed just means the read is tried again next launch.
    }
    return
  }
  looked.set(key, uri)
  const bytes = pngBytes(uri)
  if (!bytes) {
    return
  }
  try {
    const directory = folder(fs, true)
    // A failed keep is dropped here: the read already drew the picture.
    void new fs.File(directory, name).write(bytes).catch(() => undefined)
    // One picture per bot: an earlier upload's file goes, never kept beside the new one.
    const prefix = `${safe(botId)}-`
    for (const entry of directory.list()) {
      if (entry instanceof fs.File && entry.name !== name && entry.name.startsWith(prefix)) {
        entry.delete()
      }
    }
    forgetBot(botId)
    looked.set(key, uri)
  } catch {
    // Keeping the picture is best effort; the read itself already drew it.
  }
}
