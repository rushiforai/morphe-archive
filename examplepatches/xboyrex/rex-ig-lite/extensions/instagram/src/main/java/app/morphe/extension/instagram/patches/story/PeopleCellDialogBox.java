/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.morphe.extension.instagram.patches.story;

import static app.morphe.extension.instagram.utils.IgStr.str;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.instagram.igds.components.peoplecell.IgdsPeopleCell;

import java.util.ArrayList;

import app.morphe.extension.instagram.entity.InstagramDialogBox;
import app.morphe.extension.instagram.settings.preference.widgets.RexDialogs;
import app.morphe.extension.instagram.settings.preference.widgets.RexIcon;
import app.morphe.extension.instagram.settings.preference.widgets.RexVectorIcons;

public class PeopleCellDialogBox {
    public static void showPeopleDialog(@NonNull Context context,
                                       @Nullable ArrayList<IgdsPeopleCell> peopleCells,
                                       @Nullable DialogInterface.OnDismissListener onDismiss) {
        boolean hasMentions = peopleCells != null && !peopleCells.isEmpty();
        if (!hasMentions) {
            try {
                final AlertDialog emptyDialog = new AlertDialog.Builder(context).create();
                LinearLayout sheet = RexDialogs.createDialogSheet(context, "at-sign", str("rex_vsm_title"));

                LinearLayout emptyBox = new LinearLayout(context);
                emptyBox.setOrientation(LinearLayout.VERTICAL);
                emptyBox.setGravity(Gravity.CENTER);
                int pad = RexVectorIcons.dp(context, 18);
                emptyBox.setPadding(pad, pad, pad, pad);

                ImageView emptyIcon = new ImageView(context);
                emptyIcon.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
                emptyIcon.setImageDrawable(RexIcon.getDrawable(context, "users", RexDialogs.TEXT_SECONDARY, 36));
                LinearLayout.LayoutParams iLp = new LinearLayout.LayoutParams(
                        RexVectorIcons.dp(context, 36), RexVectorIcons.dp(context, 36));
                iLp.bottomMargin = RexVectorIcons.dp(context, 10);
                emptyBox.addView(emptyIcon, iLp);

                TextView msg = new TextView(context);
                msg.setText(str("rex_vsm_no_mentions"));
                msg.setTextColor(RexDialogs.TEXT_SECONDARY);
                msg.setTextSize(TypedValue.COMPLEX_UNIT_SP, 14.5f);
                msg.setGravity(Gravity.CENTER);
                emptyBox.addView(msg);

                sheet.addView(emptyBox);
                RexDialogs.addDialogCloseFooter(context, sheet, emptyDialog);
                emptyDialog.setView(sheet);
                if (onDismiss != null) {
                    emptyDialog.setOnDismissListener(onDismiss);
                }
                RexDialogs.showBlurredDialog(context, emptyDialog);
                return;
            } catch (Throwable ignored) {}
        }

        InstagramDialogBox builder = new InstagramDialogBox(context);
        builder.setTitle(str("rex_vsm_title"));
        builder.setNegativeButton(str("rex_close"), (dialog, which) -> dialog.dismiss());
        builder.setCancelable(true);
        builder.setCanceledOnTouchOutside(true);

        if (hasMentions) {
            CharSequence[] names = new CharSequence[peopleCells.size()];
            for (int index = 0; index < peopleCells.size(); index++) {
                IgdsPeopleCell cell = peopleCells.get(index);
                ViewGroup parent = (ViewGroup) cell.getParent();
                if (parent != null) parent.removeView(cell);
                names[index] = cell.getPrimaryTextView().getText();
            }
            builder.addDialogMenuItems(names, (dialog, which) -> peopleCells.get(which).performClick());
        } else {
            builder.setMessage(str("rex_vsm_no_mentions"));
        }

        builder.setOnDismissListener(onDismiss);
        Dialog dialog = builder.getDialog();
        if (hasMentions) {
            ListView list = dialog.findViewById(android.R.id.list);
            if (list == null) {
                throw new IllegalStateException("Instagram dialog list is unavailable");
            }
            list.setAdapter(new BaseAdapter() {
                @Override
                public int getCount() {
                    return peopleCells.size();
                }

                @Override
                public IgdsPeopleCell getItem(int position) {
                    return peopleCells.get(position);
                }

                @Override
                public long getItemId(int position) {
                    return position;
                }

                @Override
                public View getView(int position, View convertView, ViewGroup parent) {
                    return getItem(position);
                }
            });
            list.setOnItemClickListener((parent, view, position, id) -> peopleCells.get(position).performClick());
        }

        RexDialogs.attachBlurBehind(dialog, context);
        dialog.show();
        Window window = dialog.getWindow();
        if (window != null) {
            window.setGravity(Gravity.CENTER);
        }
    }
}
