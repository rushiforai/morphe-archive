import { useRouter } from 'expo-router'
import { memo, useCallback, useEffect, useMemo, useRef, useState } from 'react'
import {
  ActivityIndicator,
  Image,
  PixelRatio,
  processColor,
  RefreshControl,
  SectionList,
  StyleSheet,
  View,
  type LayoutChangeEvent,
  type SectionListData,
  type SectionListRenderItemInfo
} from 'react-native'
import { SafeAreaView, useSafeAreaInsets } from 'react-native-safe-area-context'
import { ListGroup, ListRow, LIST_ROW_PADDING, SectionHeader } from '../components/list/ListGroup'
import { useMobileTranslation } from '../i18n/use-mobile-translation'
import { colors, radii, spacing } from '../theme/mobile-theme'
import { themedStyleSheet } from '../theme/themed-styles'
import { useMobileColorScheme } from '../theme/use-mobile-color-scheme'
import {
  importMorpheFont,
  loadMorpheFont,
  type MorpheDeviceFont,
  morphePreviewUri,
  restartMorpheApp,
  saveMorpheFont,
  scanMorpheFonts
} from './morphe-font'
import { getMorpheFontSelection, useMorpheFontSelection } from './morphe-font-store'
import { SettingsNavBar, SettingsNote, settingsScreenStyles } from './settings-screen-frame'

type FontSection = {
  key: string
  title: string
  data: MorpheDeviceFont[]
}

// Only rows that stay on screen for a moment decode a preview; scrolling past does not.
const VIEWABILITY = { itemVisiblePercentThreshold: 10, minimumViewTime: 80 }

// A one-line strip under the font name. Native caps one bitmap at 1536×256 px.
const PREVIEW_HEIGHT = 30
const PREVIEW_TEXT = 18
const MAX_PREVIEW_PX = 1536

type FacePreviewProps = {
  font: MorpheDeviceFont
  visible: boolean
  color: number
}

/**
 * No font file reaches JS: each row decodes one native PNG of its own face, so
 * the selected font never changes another row's preview. The width is measured
 * once per layout and only visible rows request an image.
 */
const FacePreview = memo(
  function FacePreview({ font, visible, color }: FacePreviewProps) {
    const [failedUri, setFailedUri] = useState<string | null>(null)
    const [width, setWidth] = useState(0)
    const onLayout = useCallback((event: LayoutChangeEvent) => {
      const next = Math.round(event.nativeEvent.layout.width)
      setWidth((current) => (Math.abs(current - next) > 1 ? next : current))
    }, [])
    const density = Math.min(PixelRatio.get(), MAX_PREVIEW_PX / Math.max(width, 1), 3)
    const uri =
      visible && width >= 64
        ? morphePreviewUri(
            font,
            Math.round(width * density),
            Math.round(PREVIEW_HEIGHT * density),
            Math.round(PREVIEW_TEXT * density),
            color
          )
        : null
    // A failed URI stays failed while mounted so scrolling never retries it every frame.
    return (
      <View style={fontScreenStyles.previewFrame} onLayout={onLayout}>
        {uri !== null && failedUri !== uri ? (
          <Image
            source={{ uri }}
            style={fontScreenStyles.previewImage}
            resizeMode="contain"
            accessible={false}
            fadeDuration={0}
            onError={() => setFailedUri(uri)}
          />
        ) : null}
      </View>
    )
  },
  (previous: FacePreviewProps, next: FacePreviewProps) =>
    previous.font.key === next.font.key &&
    previous.font.generation === next.font.generation &&
    previous.visible === next.visible &&
    previous.color === next.color
)

type FontRowProps = {
  font: MorpheDeviceFont
  selected: boolean
  disabled: boolean
  busy: boolean
  visible: boolean
  color: number
  onChoose: (key: string) => void
}

// Keyed by font key and inventory generation: selection or scroll changes must not
// swap one face's preview URI for another's, or re-request previews already shown.
const FontRow = memo(
  function FontRow({ font, selected, disabled, busy, visible, color, onChoose }: FontRowProps) {
    return (
      <ListRow
        title={font.label}
        subtitle={font.detail}
        detail={<FacePreview font={font} visible={visible} color={color} />}
        selected={selected}
        busy={busy}
        disabled={disabled && !busy}
        accessibilityLabel={`${font.label}, ${font.detail}`}
        onPress={() => onChoose(font.key)}
      />
    )
  },
  (previous: FontRowProps, next: FontRowProps) =>
    previous.font.key === next.font.key &&
    previous.font.generation === next.font.generation &&
    previous.selected === next.selected &&
    previous.disabled === next.disabled &&
    previous.busy === next.busy &&
    previous.visible === next.visible &&
    previous.color === next.color &&
    previous.onChoose === next.onChoose
)

/** One scroll owner: system default, the device's installed fonts and imported TTFs. */
export function MorpheFontScreen() {
  const t = useMobileTranslation()
  const router = useRouter()
  useMobileColorScheme()
  const insets = useSafeAreaInsets()
  const selection = useMorpheFontSelection()
  const [fonts, setFonts] = useState<MorpheDeviceFont[]>([])
  const [loading, setLoading] = useState(true)
  const [loadFailed, setLoadFailed] = useState(false)
  const [saveFailed, setSaveFailed] = useState(false)
  const [importFailed, setImportFailed] = useState(false)
  const [busyKey, setBusyKey] = useState<string | null>(null)
  const [visibleKeys, setVisibleKeys] = useState<ReadonlySet<string>>(new Set())
  const scanId = useRef(0)
  // The revision this screen opened with: a later commit means open screens still
  // show the previous face until the app starts again.
  const openedRevision = useRef<number | null>(selection.ready ? selection.revision : null)
  useEffect(() => {
    if (openedRevision.current === null && selection.ready) openedRevision.current = selection.revision
  }, [selection.ready, selection.revision])
  const changed =
    selection.ready && openedRevision.current !== null && selection.revision !== openedRevision.current

  const refresh = useCallback(async (force: boolean) => {
    const id = ++scanId.current
    setLoading(true)
    setLoadFailed(false)
    try {
      await loadMorpheFont()
      const next = await scanMorpheFonts(force)
      if (id === scanId.current) {
        setFonts(next)
      }
    } catch {
      if (id === scanId.current) {
        setLoadFailed(true)
      }
    } finally {
      if (id === scanId.current) {
        setLoading(false)
      }
    }
  }, [])

  useEffect(() => {
    void refresh(false)
    return () => {
      scanId.current += 1
    }
  }, [refresh])

  const choose = useCallback(
    (key: string) => {
      const current = getMorpheFontSelection()
      if (!current.ready || current.saving || current.key === key) {
        return
      }
      setSaveFailed(false)
      setBusyKey(key)
      void saveMorpheFont(key)
        .catch(() => setSaveFailed(true))
        .finally(() => setBusyKey(null))
    },
    []
  )

  const addFont = useCallback(() => {
    setImportFailed(false)
    void importMorpheFont()
      .then((applied) => (applied ? refresh(true) : undefined))
      .catch(() => setImportFailed(true))
  }, [refresh])

  // Recomputed per render: a scheme change must repaint previews in the new text color.
  const colorValue = processColor(colors.textPrimary)
  const color = typeof colorValue === 'number' ? colorValue : -16777216

  const sections = useMemo(() => {
    const builtIn: MorpheDeviceFont[] = []
    const installed: MorpheDeviceFont[] = []
    const system: MorpheDeviceFont[] = []
    const imported: MorpheDeviceFont[] = []
    for (const entry of fonts) {
      if (entry.imported) {
        imported.push(entry)
      } else if (entry.fromPackage) {
        installed.push(entry)
      } else if (entry.key.startsWith('pkg:android:')) {
        system.push(entry)
      } else {
        // The phone default and the bundled Pretendard face.
        builtIn.push(entry)
      }
    }
    return [
      { key: 'built-in', title: t('settings.morpheFont.sections.default', 'Default'), data: builtIn },
      { key: 'installed', title: t('settings.morpheFont.sections.installed', 'Installed fonts'), data: installed },
      { key: 'imported', title: t('settings.morpheFont.sections.imported', 'Imported fonts'), data: imported },
      { key: 'system', title: t('settings.morpheFont.sections.system', 'System fonts'), data: system }
    ].filter((section) => section.data.length > 0)
  }, [fonts, t])

  const renderItem = useCallback(
    ({ item, index, section }: SectionListRenderItemInfo<MorpheDeviceFont, FontSection>) => {
      const selected =
        item.key === 'system' ? selection.key === null || selection.key === 'system' : selection.key === item.key
      return (
        <View
          style={[
            fontScreenStyles.groupRow,
            index === 0 && fontScreenStyles.groupTop,
            index === section.data.length - 1 && fontScreenStyles.groupBottom
          ]}
        >
          {index > 0 ? <View style={fontScreenStyles.separator} /> : null}
          <FontRow
            font={item}
            selected={selected}
            disabled={selection.saving || !selection.ready}
            busy={busyKey === item.key}
            visible={visibleKeys.has(item.key)}
            color={color}
            onChoose={choose}
          />
        </View>
      )
    },
    [busyKey, choose, color, selection.key, selection.ready, selection.saving, visibleKeys]
  )

  const onViewableItemsChanged = useRef(
    ({ viewableItems }: { viewableItems: Array<{ key: string; isViewable: boolean }> }) => {
      const next = new Set(viewableItems.filter((token) => token.isViewable).map((token) => token.key))
      setVisibleKeys((current) =>
        current.size === next.size && [...current].every((key) => next.has(key)) ? current : next
      )
    }
  ).current

  return (
    <SafeAreaView style={settingsScreenStyles.container} edges={['top']}>
      <SettingsNavBar title={t('settings.morpheFont.title', 'Font')} onBack={() => router.back()} />
      <SectionList<MorpheDeviceFont, FontSection>
        style={settingsScreenStyles.fill}
        contentContainerStyle={[settingsScreenStyles.scrollContent, { paddingBottom: insets.bottom + spacing.xl }]}
        showsVerticalScrollIndicator={false}
        stickySectionHeadersEnabled={false}
        sections={sections}
        keyExtractor={(item) => item.key}
        extraData={{ selected: selection.key, busyKey, disabled: selection.saving || !selection.ready, visibleKeys }}
        initialNumToRender={8}
        maxToRenderPerBatch={4}
        windowSize={5}
        viewabilityConfig={VIEWABILITY}
        onViewableItemsChanged={onViewableItemsChanged}
        refreshControl={
          <RefreshControl
            refreshing={loading && fonts.length > 0}
            onRefresh={() => void refresh(true)}
            tintColor={colors.textSecondary}
          />
        }
        renderSectionHeader={({ section }) => (
          <SectionHeader title={section.title} first={sections.length > 0 && section.key === sections[0].key} />
        )}
        renderItem={renderItem}
        // Scanning installed and system fonts can take a few seconds; a labelled row
        // makes it clear this is the font screen and that it is still working.
        ListHeaderComponent={
          loading ? (
            <View style={fontScreenStyles.loading}>
              <ListGroup>
                <ListRow
                  title={t('settings.morpheFont.loading', 'Loading fonts…')}
                  accessory={<ActivityIndicator size="small" color={colors.textSecondary} />}
                  accessibilityLabel={t('settings.morpheFont.loading', 'Loading fonts…')}
                />
              </ListGroup>
            </View>
          ) : undefined
        }
        ListEmptyComponent={
          loading ? undefined : (
            <View style={fontScreenStyles.empty}>
              <SettingsNote>
                {loadFailed
                  ? t('settings.morpheFont.loadFailed', 'Couldn’t read the font list.')
                  : t('settings.morpheFont.empty', 'No fonts found on this device.')}
              </SettingsNote>
            </View>
          )
        }
        ListFooterComponent={
          <View style={fontScreenStyles.footer}>
            {changed ? (
              <>
                <ListGroup>
                  <ListRow
                    title={t('settings.morpheFont.restart', 'Restart Orca')}
                    disabled={selection.saving}
                    onPress={restartMorpheApp}
                  />
                </ListGroup>
                <SettingsNote>
                  {t(
                    'settings.morpheFont.restartHint',
                    'New screens use the font now. Restart to redraw the ones already open.'
                  )}
                </SettingsNote>
              </>
            ) : null}
            <ListGroup>
              <ListRow
                title={t('settings.morpheFont.add', 'Add TTF file…')}
                disabled={selection.saving || !selection.ready}
                onPress={addFont}
              />
              <ListRow
                title={t('settings.morpheFont.refresh', 'Refresh')}
                disabled={loading || selection.saving}
                onPress={() => void refresh(true)}
              />
            </ListGroup>
            {saveFailed ? (
              <SettingsNote alert error>
                {t('settings.morpheFont.saveFailed', 'Couldn’t apply this font. Try again.')}
              </SettingsNote>
            ) : null}
            {importFailed ? (
              <SettingsNote alert error>
                {t('settings.morpheFont.importFailed', 'Couldn’t import that file. Choose a valid TTF.')}
              </SettingsNote>
            ) : null}
            {loadFailed && fonts.length > 0 ? (
              <SettingsNote alert error>
                {t('settings.morpheFont.loadFailed', 'Couldn’t read the font list.')}
              </SettingsNote>
            ) : null}
            <SettingsNote>
              {t(
                'settings.morpheFont.importHint',
                'Imported fonts are copied into the app; your original file is left alone.'
              )}
            </SettingsNote>
          </View>
        }
      />
    </SafeAreaView>
  )
}

const fontScreenStyles = themedStyleSheet(() => ({
  groupRow: { backgroundColor: colors.sheetGroup, overflow: 'hidden' },
  groupTop: { borderTopLeftRadius: radii.surface, borderTopRightRadius: radii.surface },
  groupBottom: { borderBottomLeftRadius: radii.surface, borderBottomRightRadius: radii.surface },
  separator: {
    height: StyleSheet.hairlineWidth,
    backgroundColor: colors.borderSubtle,
    marginLeft: LIST_ROW_PADDING
  },
  previewFrame: {
    alignSelf: 'stretch',
    height: PREVIEW_HEIGHT,
    marginTop: spacing.xs,
    overflow: 'hidden',
    justifyContent: 'center'
  },
  previewImage: { width: '100%', height: '100%' },
  empty: { paddingTop: spacing.lg },
  loading: { marginTop: spacing.lg },
  footer: { marginTop: spacing.lg, gap: spacing.sm }
}))
