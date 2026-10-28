/*
 * Copyright 2026 wchill.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.extension.boost.media

import MorpheBoostNativeStatics
import android.app.Activity
import android.content.Context
import android.widget.ImageView
import androidx.fragment.app.Fragment
import com.rubenmayayo.reddit.models.generic.ImageModel
import com.rubenmayayo.reddit.ui.customviews.FormattingBar
import com.rubenmayayo.reddit.ui.customviews.menu.MenuOption
import com.rubenmayayo.reddit.ui.fragments.imagemodel.ImageModelFragment
import com.bumptech.glide.RequestManager

object MediaNativeBindings {
    @JvmStatic
    fun galleryModel(fragment: Any): ImageModel? = (fragment as ImageModelFragment).imageModel

    @JvmStatic
    fun fragmentActivity(fragment: Any): Activity? = (fragment as Fragment).getActivity()

    @JvmStatic
    fun fragmentTag(fragment: Any): String? = (fragment as Fragment).getTag()

    @JvmStatic
    fun fragmentVisible(fragment: Any): Boolean = (fragment as Fragment).getUserVisibleHint()

    @JvmStatic
    fun loadImage(manager: Any?, context: Context, url: String, image: ImageView) {
        val requestManager = if (manager == null) {
            requireNotNull(MorpheBoostNativeStatics.Glide_with(context))
        } else {
            manager as RequestManager
        }
        requireNotNull(requestManager.load(url)).into(image)
    }

    @JvmStatic
    fun imageMenuOptionId(option: Any): Int = (option as MenuOption).id

    @JvmStatic
    fun attachCamera(formattingBar: Any) {
        (formattingBar as FormattingBar).attachmentCallback?.attachCamera()
    }

    @JvmStatic
    fun attachGallery(formattingBar: Any) {
        (formattingBar as FormattingBar).attachmentCallback?.attachGallery()
    }

    @JvmStatic
    fun insertRawUrl(formattingBar: Any, url: String) {
        val editor = requireNotNull((formattingBar as FormattingBar).editor) {
            "FormattingBar has no editor"
        }
        editor.text.replace(editor.selectionStart, editor.selectionEnd, url)
    }
}
