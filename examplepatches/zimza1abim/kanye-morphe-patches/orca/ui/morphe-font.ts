import * as DocumentPicker from 'expo-document-picker'
import { File, Paths } from 'expo-file-system'
import { getMorpheFontSelection, setMorpheFontSelection } from './morphe-font-store'
import { setMorpheTerminalFontCss } from './morphe-font-terminal'

export type MorpheFontSnapshot = {
  key: string | null
  label: string
  revision: number
}

export type MorpheDeviceFont = {
  key: string
  label: string
  detail: string
  hangul: boolean
  fromPackage: boolean
  imported: boolean
  weight: number
  italic: boolean
  /** Native preview generation. Every preview URI carries it, so faces never mix. */
  generation: number
}

const AUTHORITY = 'content://dev.orca.app.morphe.fonts/'
const MAX_IMPORT_BYTES = 48 * 1024 * 1024

let requestId = 0
let loading: Promise<void> | null = null
let inventory: MorpheDeviceFont[] | null = null
let scanning: Promise<MorpheDeviceFont[]> | null = null
let inventoryLoadedAt = 0

function asRecord(value: unknown): Record<string, unknown> {
  if (typeof value !== 'object' || value === null || Array.isArray(value)) {
    throw Error('Unexpected font provider response')
  }
  return value as Record<string, unknown>
}

function stringField(record: Record<string, unknown>, name: string, fallback: string): string {
  const value = record[name]
  return typeof value === 'string' ? value : fallback
}

function numberField(record: Record<string, unknown>, name: string, fallback: number): number {
  const value = record[name]
  return typeof value === 'number' && Number.isFinite(value) ? value : fallback
}

function booleanField(record: Record<string, unknown>, name: string, fallback: boolean): boolean {
  const value = record[name]
  return typeof value === 'boolean' ? value : fallback
}

// Tolerant parsing: optional fields fall back instead of failing the whole read,
// but a provider error message always surfaces to the caller.
function readSnapshot(value: unknown): MorpheFontSnapshot {
  const record = asRecord(value)
  if (typeof record.error === 'string') {
    throw Error(record.error)
  }
  return {
    key: typeof record.key === 'string' ? record.key : null,
    label: stringField(record, 'label', ''),
    revision: Math.max(0, Math.trunc(numberField(record, 'revision', 0)))
  }
}

function readSnapshotOrNull(value: unknown): MorpheFontSnapshot | null {
  try {
    return readSnapshot(value)
  } catch {
    return null
  }
}

function readFont(value: unknown, generation: number): MorpheDeviceFont | null {
  const record = asRecord(value)
  const key = stringField(record, 'key', '')
  if (key === '') {
    return null
  }
  return {
    key,
    label: stringField(record, 'label', key),
    detail: stringField(record, 'detail', ''),
    hangul: booleanField(record, 'hangul', false),
    fromPackage: booleanField(record, 'fromPackage', false),
    imported: booleanField(record, 'imported', false),
    weight: numberField(record, 'weight', 400),
    italic: booleanField(record, 'italic', false),
    generation
  }
}

function readInventory(value: unknown): {
  fonts: MorpheDeviceFont[]
  snapshot: MorpheFontSnapshot | null
  generation: number
} {
  const record = asRecord(value)
  if (typeof record.error === 'string') {
    throw Error(record.error)
  }
  const generation = Math.max(1, Math.trunc(numberField(record, 'generation', 1)))
  const fonts: MorpheDeviceFont[] = []
  const rawFonts = Array.isArray(record.fonts) ? record.fonts : []
  for (const raw of rawFonts) {
    // One unreadable entry must not empty the whole inventory.
    let font: MorpheDeviceFont | null = null
    try {
      font = readFont(raw, generation)
    } catch {
      font = null
    }
    if (font !== null) {
      fonts.push(font)
    }
  }
  const snapshot = record.state === undefined ? null : readSnapshotOrNull(record.state)
  return { fonts, snapshot, generation }
}

/**
 * The modern reader closes content streams. A unique request URI makes its
 * existence probe and content read share one native operation.
 */
async function request(route: string): Promise<unknown> {
  const separator = route.includes('?') ? '&' : '?'
  const id = `${Date.now().toString(36)}-${(++requestId).toString(36)}`
  const text = await new File(`${AUTHORITY}${route}${separator}request=${id}`).text()
  try {
    return JSON.parse(text)
  } catch {
    throw Error('Unreadable font provider response')
  }
}

/**
 * Open screens keep the text layouts React Native already measured; starting the
 * app process again is what brings every screen onto the new face. The process
 * ends before a reply can arrive, so nothing is awaited.
 */
export function restartMorpheApp(): void {
  void request('restart').catch(() => undefined)
}

let terminalRevision = -1

/**
 * The terminal page is an HTML string built synchronously, so its inline face is
 * fetched ahead of time, off the boot path, and again after every commit.
 */
function refreshTerminalFont(): void {
  const revision = getMorpheFontSelection().revision
  if (revision === terminalRevision) {
    return
  }
  void request('termcss')
    .then((value) => {
      const record = asRecord(value)
      if (typeof record.error === 'string') {
        return
      }
      setMorpheTerminalFontCss(stringField(record, 'css', ''))
      terminalRevision = Math.trunc(numberField(record, 'revision', revision))
    })
    .catch(() => undefined)
}

/** Never let a delayed startup read replace a selection that the user committed. */
export function loadMorpheFont(): Promise<void> {
  if (getMorpheFontSelection().ready) {
    return Promise.resolve()
  }
  if (loading !== null) {
    return loading
  }
  loading = request('state')
    .then((value) => {
      const snapshot = readSnapshot(value)
      if (!getMorpheFontSelection().ready) {
        setMorpheFontSelection({ ...snapshot, ready: true })
      }
      refreshTerminalFont()
    })
    .finally(() => {
      loading = null
    })
  return loading
}

export function scanMorpheFonts(refresh = false): Promise<MorpheDeviceFont[]> {
  if (scanning !== null) {
    return scanning
  }
  if (inventory !== null && !refresh && Date.now() - inventoryLoadedAt < 30_000) {
    return Promise.resolve(inventory)
  }
  scanning = request('list')
    .then((value) => {
      const result = readInventory(value)
      const current = getMorpheFontSelection()
      if (result.snapshot !== null && !current.saving && result.snapshot.revision >= current.revision) {
        setMorpheFontSelection({ ...result.snapshot, ready: true })
      }
      inventory = result.fonts
      inventoryLoadedAt = Date.now()
      return inventory
    })
    .finally(() => {
      scanning = null
    })
  return scanning
}

function matchesSelection(stateKey: string | null, key: string | null): boolean {
  if (stateKey === key) {
    return true
  }
  // Native stores the system default as either key spelling.
  return (key === 'system' && stateKey === null) || (key === null && stateKey === 'system')
}

/** The native store publishes its selection only after the disk commit succeeds. */
export async function saveMorpheFont(key: string | null): Promise<void> {
  const current = getMorpheFontSelection()
  if (!current.ready || current.saving || current.key === key) {
    return
  }
  setMorpheFontSelection({ saving: true })
  try {
    const snapshot = readSnapshot(await request(key === null ? 'reset' : `select?key=${encodeURIComponent(key)}`))
    setMorpheFontSelection({ ...snapshot, ready: true })
    refreshTerminalFont()
  } catch (failure) {
    // A lost response can follow a successful disk commit. Reconcile before
    // showing an error so the checkmark never knowingly contradicts native text.
    const snapshot = readSnapshotOrNull(await request('state').catch(() => null))
    if (snapshot !== null) {
      setMorpheFontSelection({ ...snapshot, ready: true })
    }
    if (snapshot === null || !matchesSelection(snapshot.key, key)) {
      throw failure
    }
  } finally {
    setMorpheFontSelection({ saving: false })
  }
}

export function morphePreviewUri(
  font: MorpheDeviceFont,
  width: number,
  height: number,
  size: number,
  color: number
): string {
  return (
    `${AUTHORITY}preview?key=${encodeURIComponent(font.key)}` +
    `&generation=${font.generation}&width=${width}&height=${height}&size=${size}&color=${color}`
  )
}

/** The picker grants access; native validation and persistence complete before cache cleanup. */
export async function importMorpheFont(): Promise<boolean> {
  const current = getMorpheFontSelection()
  if (!current.ready || current.saving) {
    return false
  }
  setMorpheFontSelection({ saving: true })
  let picked: File | null = null
  try {
    const result = await DocumentPicker.getDocumentAsync({
      type: '*/*',
      multiple: false,
      copyToCacheDirectory: true
    })
    const asset = result.canceled ? undefined : result.assets[0]
    if (asset === undefined) {
      return false
    }
    if (!asset.uri.startsWith(Paths.cache.uri)) {
      throw Error('Font cache is unavailable')
    }
    picked = new File(asset.uri)
    if (!asset.name.toLowerCase().endsWith('.ttf') || picked.size <= 0 || picked.size > MAX_IMPORT_BYTES) {
      throw Error('Choose a valid TTF file')
    }
    const snapshot = readSnapshot(
      await request(`import?uri=${encodeURIComponent(asset.uri)}&name=${encodeURIComponent(asset.name)}`)
    )
    setMorpheFontSelection({ ...snapshot, ready: true })
    inventory = null
    refreshTerminalFont()
    return true
  } catch (failure) {
    const snapshot = readSnapshotOrNull(await request('state').catch(() => null))
    if (snapshot !== null) {
      setMorpheFontSelection({ ...snapshot, ready: true })
    }
    if (snapshot !== null && snapshot.revision > current.revision && (snapshot.key?.startsWith('import:') ?? false)) {
      inventory = null
      return true
    }
    throw failure
  } finally {
    try {
      if (picked !== null && picked.exists) {
        picked.delete()
      }
    } catch {
      // Cache cleanup must not undo a committed import.
    }
    setMorpheFontSelection({ saving: false })
  }
}
