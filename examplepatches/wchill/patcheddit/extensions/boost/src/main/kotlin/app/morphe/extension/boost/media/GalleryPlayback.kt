/*
 * Copyright 2026 wchill.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.extension.boost.media

import MorpheBoostNativeStatics
import android.content.Context
import android.content.pm.PackageManager
import android.graphics.Color
import android.net.Uri
import android.os.Build
import android.view.View
import com.google.android.exoplayer2.ExoPlayerImpl
import com.google.android.exoplayer2.source.BaseMediaSource
import com.google.android.exoplayer2.source.dash.DashMediaSource
import com.google.android.exoplayer2.source.hls.HlsMediaSource
import com.google.android.exoplayer2.source.ProgressiveMediaSource.Factory as ProgressiveMediaSourceFactory
import com.google.android.exoplayer2.ui.PlayerView
import app.morphe.extension.boost.api.HttpClient
import app.morphe.extension.boost.api.DefaultExtractorsFactory
import app.morphe.extension.boost.api.ExoPlayerBuilder
import com.google.android.exoplayer2.ext.okhttp.OkHttpDataSource.Factory as OkHttpDataSourceFactory

class GalleryPlayback private constructor(private val player: ExoPlayerImpl) {
    fun attach(view: View) {
        (view as PlayerView).setPlayer(player)
    }

    fun prepare(context: Context, url: String, sourceType: Int) {
        val dataSource = OkHttpDataSourceFactory(HttpClient.client)
        dataSource.userAgent = userAgent(context)
        val item = requireNotNull(MorpheBoostNativeStatics.MediaItem_fromUri(Uri.parse(url)))
        val source = when (sourceType) {
            2 -> DashMediaSource.Factory(dataSource).createMediaSource(item)
            3 -> HlsMediaSource.Factory(dataSource).createMediaSource(item)
            else -> ProgressiveMediaSourceFactory(dataSource, DefaultExtractorsFactory()).createMediaSource(item)
        }

        player.setVolume(0.0f)
        player.setRepeatMode(2)
        player.setMediaSource(source as BaseMediaSource)
        player.prepare()
        player.setPlayWhenReady(true)
    }

    fun getPlaybackState(): Int = player.getPlaybackState()

    fun release() {
        player.release()
    }

    companion object {
        @JvmStatic
        fun create(context: Context): GalleryPlayback =
            GalleryPlayback(requireNotNull(ExoPlayerBuilder(context).build()))

        @JvmStatic
        fun createView(context: Context): View =
            PlayerView(context, null).apply {
                setUseController(false)
                setResizeMode(0)
                setShutterBackgroundColor(Color.TRANSPARENT)
                setBackgroundColor(Color.TRANSPARENT)
                isClickable = false
                isFocusable = false
            }

        @JvmStatic
        fun detach(view: View) {
            (view as PlayerView).setPlayer(null)
        }

        private fun userAgent(context: Context): String {
            val version = try {
                context.packageManager.getPackageInfo(context.packageName, 0).versionName
            } catch (_: PackageManager.NameNotFoundException) {
                "?"
            }
            return "Boost/$version (Linux;Android ${Build.VERSION.RELEASE}) "
        }
    }
}
