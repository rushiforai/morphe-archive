import { useSyncExternalStore } from 'react'

// No native imports: the boot read and every settings screen share this mirror of
// the native selection, and tests must be able to load it without a native runtime.

export type MorpheFontSelection = {
  key: string | null
  label: string
  revision: number
  ready: boolean
  saving: boolean
}

let selection: MorpheFontSelection = {
  key: null,
  label: '',
  revision: 0,
  ready: false,
  saving: false
}

const listeners = new Set<() => void>()

export function getMorpheFontSelection(): MorpheFontSelection {
  return selection
}

export function setMorpheFontSelection(patch: Partial<MorpheFontSelection>): void {
  selection = { ...selection, ...patch }
  for (const listener of listeners) {
    listener()
  }
}

function subscribeMorpheFontSelection(listener: () => void): () => void {
  listeners.add(listener)
  return () => {
    listeners.delete(listener)
  }
}

export function useMorpheFontSelection(): MorpheFontSelection {
  return useSyncExternalStore(subscribeMorpheFontSelection, getMorpheFontSelection)
}
