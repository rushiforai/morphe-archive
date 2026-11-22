import { useRouter } from 'expo-router'
import { useEffect } from 'react'
import { ListRow } from '../components/list/ListGroup'
import { useMobileTranslation } from '../i18n/use-mobile-translation'
import { loadMorpheFont } from './morphe-font'
import { useMorpheFontSelection } from './morphe-font-store'
import { SettingsSection } from './settings-screen-frame'

/** The Appearance entry: the current font opens the picker screen. */
export function MorpheFontSection() {
  const t = useMobileTranslation()
  const router = useRouter()
  const selection = useMorpheFontSelection()
  useEffect(() => {
    // The boot read can fail without a visible trace; this row keeps one source of truth.
    void loadMorpheFont().catch(() => undefined)
  }, [])
  return (
    <SettingsSection title={t('settings.morpheFont.heading', 'FONT')}>
      <ListRow
        title={t('settings.morpheFont.title', 'Font')}
        value={
          selection.ready
            ? selection.key === null
              ? t('settings.morpheFont.systemDefault', 'System default')
              : selection.label
            : undefined
        }
        navigates
        onPress={() => router.push('/morphe-font')}
      />
    </SettingsSection>
  )
}
