import { afterEach, beforeEach, describe, expect, it, vi } from 'vitest'

// The module loads the device file system on first use with a lazy require. These tests stand a
// cache folder in for it through Node's module cache, so no native module and no device is needed.
declare const require: {
  (id: string): unknown
  resolve(id: string): string
  cache: Record<string, unknown>
}

const FOLDER_URI = 'file:///cache/morphe-bot-avatars/'
const PNG = 'data:image/png;base64,AAAA'

let files: Map<string, Uint8Array>
let looks: number

/** The cache folder: which files are in it, and how often one was asked about. */
function deviceFiles(): void {
  files = new Map()
  looks = 0
  class File {
    readonly name: string
    constructor(_directory: unknown, name: string) {
      this.name = name
    }
    get uri(): string {
      return `${FOLDER_URI}${this.name}`
    }
    get exists(): boolean {
      looks += 1
      return files.has(this.name)
    }
    write(bytes: Uint8Array): Promise<void> {
      files.set(this.name, bytes)
      return Promise.resolve()
    }
    delete(): void {
      files.delete(this.name)
    }
  }
  class Directory {
    constructor(_base: unknown, _name: string) {}
    create(_options: unknown): void {}
    list(): File[] {
      return [...files.keys()].map((name) => new File(this, name))
    }
  }
  require.cache[require.resolve('expo-file-system')] = {
    exports: { Paths: { cache: { uri: 'file:///cache/' } }, File, Directory }
  }
}

/** A fresh module, as a relaunched app has: nothing kept is remembered in memory. */
async function load() {
  vi.resetModules()
  return await import('./bot-avatar-files')
}

describe('kept bot pictures', () => {
  beforeEach(deviceFiles)
  // The stand-in lives in Node's own module cache; leave nothing of it for another test file.
  afterEach(() => {
    delete require.cache[require.resolve('expo-file-system')]
  })

  it('draws the kept picture on the first paint after a restart, and looks once', async () => {
    files.set('bot-one-v1.png', new Uint8Array([1]))
    const { keptAvatarUri } = await load()
    expect(keptAvatarUri('bot-one', 'upload:v1')).toBe(`${FOLDER_URI}bot-one-v1.png`)
    // A row drawn again in the same launch does not ask the file system again.
    expect(keptAvatarUri('bot-one', 'upload:v1')).toBe(`${FOLDER_URI}bot-one-v1.png`)
    expect(looks).toBe(1)
    // Another upload has nothing kept yet, so the initial is drawn until the read answers.
    expect(keptAvatarUri('bot-one', 'upload:v2')).toBeUndefined()
  })

  it('keeps the picture it drew and removes the upload it replaced', async () => {
    files.set('bot-one-v1.png', new Uint8Array([1]))
    files.set('bot-two-v1.png', new Uint8Array([2]))
    const { keepAvatar, keptAvatarUri } = await load()
    keepAvatar('bot-one', 'upload:v2', PNG)
    // One picture per bot: the upload it replaced is gone, another bot's stays.
    expect([...files.keys()].sort()).toEqual(['bot-one-v2.png', 'bot-two-v1.png'])
    expect([...(files.get('bot-one-v2.png') ?? [])]).toEqual([0, 0, 0])
    // The picture that was just kept is served from the device from now on.
    expect(keptAvatarUri('bot-one', 'upload:v2')).toBe(PNG)
  })

  it('removes the kept file when the read reports no picture', async () => {
    files.set('bot-one-v1.png', new Uint8Array([1]))
    files.set('bot-two-v1.png', new Uint8Array([2]))
    const { keepAvatar, keptAvatarUri } = await load()
    // The row drew the kept copy before the read answered; the answer says there is none.
    expect(keptAvatarUri('bot-one', 'upload:v1')).toBe(`${FOLDER_URI}bot-one-v1.png`)
    keepAvatar('bot-one', 'upload:v1', null)
    expect([...files.keys()]).toEqual(['bot-two-v1.png'])
    // Nothing is kept any more, so the next launch draws the initial again.
    expect(keptAvatarUri('bot-one', 'upload:v1')).toBeUndefined()
  })

  it('does not write a picture that is not PNG bytes', async () => {
    const { keepAvatar, keptAvatarUri } = await load()
    // The read drew it already; it is only not kept for the next launch.
    keepAvatar('bot-one', 'upload:v1', 'data:image/jpeg;base64,AAAA')
    expect(files.size).toBe(0)
    expect(keptAvatarUri('bot-one', 'upload:v1')).toBe('data:image/jpeg;base64,AAAA')
    // A PNG header with bytes that do not decode is not written either.
    keepAvatar('bot-one', 'upload:v2', 'data:image/png;base64,!!!!')
    expect(files.size).toBe(0)
    expect(keptAvatarUri('bot-one', 'upload:v2')).toBe('data:image/png;base64,!!!!')
  })

  it('keeps every bot in the one folder, whatever its id carries', async () => {
    files.set('.._evil_bot-v1.png', new Uint8Array([1]))
    const { keptAvatarUri } = await load()
    // Every name stays inside the folder: a slash in the id cannot make a path.
    expect(keptAvatarUri('../evil/bot', 'upload:v1')).toBe(`${FOLDER_URI}.._evil_bot-v1.png`)
  })
})
