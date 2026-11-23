import { describe, expect, it } from 'vitest'
import type { PhoneBot } from '../../bots/host-bots-operations'
import {
  keptHomeBotAvatars,
  readHomeBotAvatarUploads,
  sameAvatarUris,
  type HomeBotAvatarFiles
} from './home-bot-avatars'

function bot(id: string, avatar: string): PhoneBot {
  // oxlint-disable-next-line typescript/consistent-type-assertions -- SAFETY: the avatar read uses only id and avatar.
  return { id, name: id, avatar } as PhoneBot
}

function files(
  kept: Readonly<Record<string, string>> = {}
): HomeBotAvatarFiles & { written: Record<string, string> } {
  const written: Record<string, string> = {}
  return {
    written,
    read: (each) => kept[each.id] ?? written[each.id],
    write: (each, uri) => {
      written[each.id] = uri
    }
  }
}

describe('Home bot pictures', () => {
  it('asks for every unread upload at once, not one after another', async () => {
    const asked: string[] = []
    const releases: (() => void)[] = []
    const client = {
      sendRequest: async (method: string, params: { botId: string }) => {
        asked.push(params.botId)
        await new Promise<void>((release) => releases.push(release))
        return { id: method, ok: true, result: { png: 'AAAA' } }
      }
    }
    const rounds = [
      {
        // oxlint-disable-next-line typescript/consistent-type-assertions -- SAFETY: the avatar read uses only sendRequest.
        client: client as never,
        bots: [bot('one', 'upload:a'), bot('two', 'upload:b')]
      }
    ]
    const pending = readHomeBotAvatarUploads(rounds, new Map(), files())
    // Both are out before either answers: the second is not waiting on the first.
    await Promise.resolve()
    expect(asked).toEqual(['one', 'two'])
    releases.forEach((release) => release())
    const uris = await pending
    expect([...uris].sort()).toEqual([
      ['one', 'data:image/png;base64,AAAA'],
      ['two', 'data:image/png;base64,AAAA']
    ])
  })

  it('draws a kept picture at once, and does not read it again', async () => {
    const asked: string[] = []
    const client = {
      sendRequest: async (method: string, params: { botId: string }) => {
        asked.push(params.botId)
        return { id: method, ok: true, result: { png: 'BBBB' } }
      }
    }
    const rounds = [
      {
        // oxlint-disable-next-line typescript/consistent-type-assertions -- SAFETY: the avatar read uses only sendRequest.
        client: client as never,
        bots: [bot('one', 'upload:a'), bot('two', 'mascot:A1')]
      }
    ]
    const kept = keptHomeBotAvatars(rounds, files({ one: 'file:///kept/one.png' }))
    expect([...kept]).toEqual([['one', 'file:///kept/one.png']])
    // A mascot is never read, and a kept upload is served from the device.
    const uris = await readHomeBotAvatarUploads(
      rounds,
      new Map(),
      files({ one: 'file:///kept/one.png' })
    )
    expect(asked).toEqual([])
    expect([...uris]).toEqual([['one', 'file:///kept/one.png']])
    expect(sameAvatarUris(uris, kept)).toBe(true)
  })

  it('keeps what it read, and tells a changed picture from an unchanged one', async () => {
    const client = {
      sendRequest: async (method: string) => ({ id: method, ok: true, result: { png: 'CCCC' } })
    }
    const kept = files()
    const rounds = [
      {
        // oxlint-disable-next-line typescript/consistent-type-assertions -- SAFETY: the avatar read uses only sendRequest.
        client: client as never,
        bots: [bot('one', 'upload:a')]
      }
    ]
    const first = await readHomeBotAvatarUploads(rounds, new Map(), kept)
    expect(kept.written).toEqual({ one: 'data:image/png;base64,CCCC' })
    const second = await readHomeBotAvatarUploads(rounds, new Map(), kept)
    expect(sameAvatarUris(first, second)).toBe(true)
    expect(sameAvatarUris(first, new Map([['one', 'file:///other.png']]))).toBe(false)
    expect(sameAvatarUris(first, new Map())).toBe(false)
  })
})
