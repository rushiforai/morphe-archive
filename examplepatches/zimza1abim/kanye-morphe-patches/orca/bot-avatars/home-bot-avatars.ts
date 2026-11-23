import { readBotAvatarUploads } from '../../bots/bot-avatar-uploads'
import type { PhoneBot } from '../../bots/host-bots-operations'
import type { RpcClient } from '../../transport/rpc/rpc-client-contract'

/** No upload read yet: every bot draws its mascot, emoji or initial. */
export const NO_AVATAR_URIS: ReadonlyMap<string, string> = new Map()

/** A bot's uploaded picture, as `mobileBotAvatarSource` reads it. */
type UploadedBot = Pick<PhoneBot, 'id' | 'avatar'>

/** One paired computer's connection, and the bots its answer listed. */
export type HomeBotAvatarRound = {
  client: RpcClient
  bots: readonly PhoneBot[]
}

/** The pictures kept on the device: what an earlier launch already read. */
export type HomeBotAvatarFiles = {
  /** The kept picture's URI, or undefined when this bot's upload was never read here. */
  read(bot: UploadedBot): string | undefined
  /** Keeps this launch's picture for the next one. */
  write(bot: UploadedBot, dataUrl: string): void
}

/** Whether a bot's avatar is an upload, whose bytes have to be read. */
export function isUploadedAvatar(avatar: null | string | undefined): boolean {
  return typeof avatar === 'string' && avatar.startsWith('upload:')
}

/** Every listed bot's kept picture, read without waiting, so the first paint already shows it.
 *  A bot whose bytes were never read here draws its initial until the read returns. */
export function keptHomeBotAvatars(
  rounds: readonly { bots: readonly PhoneBot[] }[],
  files: HomeBotAvatarFiles | null
): ReadonlyMap<string, string> {
  const uris = new Map<string, string>()
  if (!files) {
    return uris
  }
  for (const { bots } of rounds) {
    for (const bot of bots) {
      if (!isUploadedAvatar(bot.avatar)) {
        continue
      }
      const uri = files.read(bot)
      if (uri) {
        uris.set(bot.id, uri)
      }
    }
  }
  return uris
}

/** Each bot's uploaded picture: one already kept draws at once and is not read again; the rest
 *  are asked for together rather than one after another, then kept for the next launch. */
export async function readHomeBotAvatarUploads(
  rounds: readonly HomeBotAvatarRound[],
  cache: Map<string, string>,
  files: HomeBotAvatarFiles | null
): Promise<ReadonlyMap<string, string>> {
  const uris = new Map<string, string>()
  const asked: { bot: PhoneBot; client: RpcClient }[] = []
  for (const { client, bots } of rounds) {
    for (const bot of bots) {
      if (!isUploadedAvatar(bot.avatar)) {
        continue
      }
      // The avatar names the upload's bytes, so a kept picture is never stale.
      const cacheKey = `${bot.id}\n${bot.avatar}`
      const kept = cache.get(cacheKey) ?? files?.read(bot)
      if (kept) {
        cache.set(cacheKey, kept)
        uris.set(bot.id, kept)
      } else {
        asked.push({ bot, client })
      }
    }
  }
  await Promise.all(
    asked.map(async ({ bot, client }) => {
      const read = await readBotAvatarUploads(client, [bot], cache)
      const uri = read.get(bot.id)
      if (uri) {
        uris.set(bot.id, uri)
        files?.write(bot, uri)
      }
    })
  )
  return uris
}

/** Whether two reads found the same pictures: a row redraws only when one changes. */
export function sameAvatarUris(
  a: ReadonlyMap<string, string>,
  b: ReadonlyMap<string, string>
): boolean {
  if (a.size !== b.size) {
    return false
  }
  for (const [botId, uri] of a) {
    if (b.get(botId) !== uri) {
      return false
    }
  }
  return true
}
