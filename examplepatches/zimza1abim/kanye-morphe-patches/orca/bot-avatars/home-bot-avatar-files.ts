// Keeps each bot's uploaded picture in the app's cache, so a later launch draws it at once
// instead of waiting for the upload to be read again.
import { Directory, File, Paths } from 'expo-file-system'
import type { HomeBotAvatarFiles } from './home-bot-avatars'

const FOLDER = 'morphe-bot-avatars'
const PNG_PREFIX = 'data:image/png;base64,'
const UPLOAD_PREFIX = 'upload:'

function safe(value: string): string {
  return value.replace(/[^A-Za-z0-9._-]/g, '_').slice(0, 120)
}

/** Its id and the upload's version, so a replaced picture is a new file, never a stale face. */
function fileName(bot: { id: string; avatar: null | string }): string {
  return `${safe(bot.id)}-${safe((bot.avatar ?? '').slice(UPLOAD_PREFIX.length))}.png`
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

/** The kept pictures, or null where the device file system is unavailable (the web build). */
export function createHomeBotAvatarFiles(): HomeBotAvatarFiles | null {
  try {
    const folder = new Directory(Paths.cache, FOLDER)
    return {
      read(bot) {
        try {
          const file = new File(folder, fileName(bot))
          return file.exists ? file.uri : undefined
        } catch {
          // A cache that cannot be read just means the upload is read again.
          return undefined
        }
      },
      write(bot, dataUrl) {
        const bytes = pngBytes(dataUrl)
        if (!bytes) {
          return
        }
        try {
          folder.create({ idempotent: true, intermediates: true })
          const name = fileName(bot)
          // A failed keep is dropped here: the read already drew the picture, and the
          // sweep below deletes the earlier file, so an unhandled rejection would surface.
          void new File(folder, name).write(bytes).catch(() => undefined)
          // One picture per bot: an earlier upload's file goes.
          const prefix = `${safe(bot.id)}-`
          for (const entry of folder.list()) {
            if (entry instanceof File && entry.name !== name && entry.name.startsWith(prefix)) {
              entry.delete()
            }
          }
        } catch {
          // Keeping the picture is best effort; the read itself already drew it.
        }
      }
    }
  } catch {
    return null
  }
}
