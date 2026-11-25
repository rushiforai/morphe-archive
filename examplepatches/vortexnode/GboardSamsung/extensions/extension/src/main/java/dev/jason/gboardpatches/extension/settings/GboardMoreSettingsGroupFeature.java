package dev.jason.gboardpatches.extension.settings;

import android.content.Context;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import dev.jason.gboardpatches.extension.R;
import dev.jason.gboardpatches.extension.backuprestore.GboardBackupRestoreSettingsFeature;
import dev.jason.gboardpatches.extension.developeroptions.GboardDeveloperOptionsSettingsFeature;
import dev.jason.gboardpatches.extension.settingshomepage.GboardSettingsHomepageSettingsFeature;
import dev.jason.gboardpatches.extension.settings.GboardPatchesSettingsContract;
import dev.jason.gboardpatches.extension.settings.GboardFeatureGroup;
import dev.jason.gboardpatches.extension.settings.GboardSettingsText;

public final class GboardMoreSettingsGroupFeature implements GboardPatchesSettingsContract.Feature {
    private final GboardFeatureGroup delegate;

    public GboardMoreSettingsGroupFeature(Context context) {
        String title = GboardSettingsText.get(context, R.string.gboard_patches_group_more_title);
        String summary = GboardSettingsText.get(context, R.string.gboard_patches_group_more_summary);
        delegate = new GboardFeatureGroup(title, summary,
                GboardSettingsText.get(context, R.string.gboard_patches_header_badge), summary,
                GboardSettingsText.get(context, R.string.gboard_patches_group_more_empty_title),
                GboardSettingsText.get(context, R.string.gboard_patches_group_more_empty_summary),
                List.of(new GboardSettingsHomepageSettingsFeature(),
                        new GboardBackupRestoreSettingsFeature(context),
                        new GboardDeveloperOptionsSettingsFeature(context)));
    }

    @Override public String getEntryTitle() { return delegate.getEntryTitle(); }
    @Override public String getEntrySummary() { return delegate.getEntrySummary(); }
    @Override public int getEntryIcon() { return GboardPatchesIcons.MORE; }
    @Override public String getEntryTone() { return "slate"; }
    @Override public boolean isAvailable(Context context) { return delegate.isAvailable(context); }
    @Override public List<GboardPatchesSettingsContract.Feature> getNavigationChildren() {
        return delegate.getNavigationChildren();
    }

    @Override
    public GboardPatchesSettingsContract.Screen buildScreen(GboardPatchesSettingsContract.FeatureHost host) {
        GboardPatchesSettingsContract.Screen base = delegate.buildScreen(host);
        Context context = host == null ? null : host.getContext();
        List<GboardPatchesSettingsContract.Row> baseRows = base.getRows();
        List<GboardPatchesSettingsContract.Row> rows = new ArrayList<GboardPatchesSettingsContract.Row>();

        // 1. Settings homepage (first row from delegate, when present)
        int startRest = 0;
        if (!baseRows.isEmpty()) {
            rows.add(baseRows.get(0));
            startRest = 1;
        }

        // 2. Highlight new settings (0..10 days, default 7)
        int currentDays = GboardPatchesSettings.getHighlightNewSettingsDays(context);
        String offLabel = GboardSettingsText.get(context, R.string.gboard_patches_highlight_new_settings_off);
        String daysValueLabel = currentDays <= 0
                ? offLabel
                : GboardSettingsText.format(
                        context, R.string.gboard_patches_highlight_new_settings_days_value, currentDays);
        String highlightTitle = GboardSettingsText.get(
                context, R.string.gboard_patches_highlight_new_settings_title);
        String highlightSummary = GboardSettingsText.get(
                context, R.string.gboard_patches_highlight_new_settings_summary);
        GboardPatchesSettingsContract.SelectorRow highlightRow =
                new GboardPatchesSettingsContract.SelectorRow(
                        highlightTitle,
                        highlightSummary,
                        daysValueLabel,
                        true,
                        () -> {
                            GboardNewSettingsHighlight.markItemViewed(
                                    context, GboardNewSettingsHighlight.ITEM_HIGHLIGHT_NEW_SETTINGS);
                            GboardPatchesSettingsContract.refresh(host);
                            GboardPatchesSettingsContract.showSliderDialog(
                                    host,
                                    highlightTitle,
                                    GboardPatchesSettings.HIGHLIGHT_NEW_SETTINGS_MIN_DAYS,
                                    GboardPatchesSettings.HIGHLIGHT_NEW_SETTINGS_MAX_DAYS,
                                    GboardPatchesSettings.HIGHLIGHT_NEW_SETTINGS_DEFAULT_DAYS,
                                    GboardPatchesSettings.getHighlightNewSettingsDays(context),
                                    offLabel,
                                    selectedDays -> {
                                        GboardPatchesSettings.setHighlightNewSettingsDays(
                                                context, selectedDays);
                                        GboardPatchesSettingsContract.refresh(host);
                                    });
                        });
        if (GboardNewSettingsHighlight.isItemHighlighted(
                context, GboardNewSettingsHighlight.ITEM_HIGHLIGHT_NEW_SETTINGS)) {
            highlightRow.setDecoration(new GboardPatchesSettingsContract.RowDecoration()
                    .highlightDot(true));
        }
        rows.add(highlightRow);

        // 3. Mark all settings as viewed (dot shown while any new setting remains unread)
        String markAllTitle = GboardSettingsText.get(
                context, R.string.gboard_patches_mark_all_settings_viewed_title);
        String markAllSummary = GboardSettingsText.get(
                context, R.string.gboard_patches_mark_all_settings_viewed_summary);
        String markAllDone = GboardSettingsText.get(
                context, R.string.gboard_patches_mark_all_settings_viewed_done);
        GboardPatchesSettingsContract.CommandRow markAllRow =
                new GboardPatchesSettingsContract.CommandRow(
                        markAllTitle,
                        markAllSummary,
                        true,
                        () -> {
                            GboardNewSettingsHighlight.markAllViewed(context);
                            GboardPatchesSettingsContract.refresh(host);
                            GboardPatchesSettingsContract.showMessage(host, markAllDone);
                        });
        if (GboardNewSettingsHighlight.hasAnyHighlightedItem(context)) {
            markAllRow.setDecoration(new GboardPatchesSettingsContract.RowDecoration()
                    .highlightDot(true));
        }
        rows.add(markAllRow);

        // 4. Backup & restore, Developer options (remaining rows from delegate)
        for (int i = startRest; i < baseRows.size(); i++) {
            rows.add(baseRows.get(i));
        }

        return new GboardPatchesSettingsContract.Screen(
                base.getToolbarTitle(),
                base.getHeaderBadge(),
                base.getHeaderTitle(),
                base.getHeaderSummary(),
                Collections.emptyList(),
                Collections.singletonList(new GboardPatchesSettingsContract.Section(null, rows)));
    }
}
