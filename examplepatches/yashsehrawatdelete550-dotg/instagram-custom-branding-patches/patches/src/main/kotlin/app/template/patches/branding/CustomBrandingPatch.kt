package app.template.patches.branding

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import org.w3c.dom.Element
import java.io.ByteArrayOutputStream
import java.io.File
import java.util.zip.CRC32
import java.util.zip.Deflater

private val instagramCompatibility = Compatibility(
    name = "Instagram",
    packageName = "com.instagram.android",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xD62976,
    targets = listOf(AppTarget(version = null, isExperimental = true))
)

private fun be32(v: Int) = byteArrayOf((v ushr 24).toByte(), (v ushr 16).toByte(), (v ushr 8).toByte(), v.toByte())
private fun pngChunk(out: ByteArrayOutputStream, type: String, data: ByteArray) {
    out.write(be32(data.size)); val b = type.toByteArray(Charsets.US_ASCII) + data; out.write(b)
    val crc = CRC32(); crc.update(b); out.write(be32(crc.value.toInt()))
}
private fun rgbaPng(w: Int, h: Int, rgba: ByteArray): ByteArray {
    val raw = ByteArray((w * 4 + 1) * h)
    for (y in 0 until h) System.arraycopy(rgba, y * w * 4, raw, y * (w * 4 + 1) + 1, w * 4)
    val d = Deflater(9); d.setInput(raw); d.finish(); val z = ByteArrayOutputStream(); val buf = ByteArray(8192)
    while (!d.finished()) z.write(buf, 0, d.deflate(buf)); d.end()
    val o = ByteArrayOutputStream(); o.write(byteArrayOf(0x89.toByte(),80,78,71,13,10,26,10))
    pngChunk(o,"IHDR",be32(w)+be32(h)+byteArrayOf(8,6,0,0,0)); pngChunk(o,"IDAT",z.toByteArray()); pngChunk(o,"IEND",byteArrayOf())
    return o.toByteArray()
}
private fun color(s0: String?): IntArray {
    val s=(s0?: "#6E7F8D").trim().lowercase()
    val names=mapOf("gold" to "FFD700","white" to "FFFFFF","black" to "000000","red" to "FF0000","green" to "008000","blue" to "0000FF","yellow" to "FFFF00","orange" to "FFA500","pink" to "FFC0CB","purple" to "800080")
    val hex=names[s] ?: s.removePrefix("#")
    val n=hex.toLongOrNull(16)?.takeIf { hex.length==6 }?.toInt() ?: 0x6E7F8D
    return intArrayOf((n shr 16) and 255,(n shr 8) and 255,n and 255)
}
// Minimal built-in 5x7 ASCII font for splash text; no external binary resources required.
private val glyphs = mapOf(
'A' to listOf("01110","10001","10001","11111","10001","10001","10001"), 'B' to listOf("11110","10001","10001","11110","10001","10001","11110"),
'C' to listOf("01111","10000","10000","10000","10000","10000","01111"), 'D' to listOf("11110","10001","10001","10001","10001","10001","11110"),
'E' to listOf("11111","10000","10000","11110","10000","10000","11111"), 'F' to listOf("11111","10000","10000","11110","10000","10000","10000"),
'G' to listOf("01111","10000","10000","10111","10001","10001","01111"), 'H' to listOf("10001","10001","10001","11111","10001","10001","10001"),
'I' to listOf("11111","00100","00100","00100","00100","00100","11111"), 'J' to listOf("00111","00010","00010","00010","10010","10010","01100"),
'K' to listOf("10001","10010","10100","11000","10100","10010","10001"), 'L' to listOf("10000","10000","10000","10000","10000","10000","11111"),
'M' to listOf("10001","11011","10101","10101","10001","10001","10001"), 'N' to listOf("10001","11001","10101","10011","10001","10001","10001"),
'O' to listOf("01110","10001","10001","10001","10001","10001","01110"), 'P' to listOf("11110","10001","10001","11110","10000","10000","10000"),
'Q' to listOf("01110","10001","10001","10001","10101","10010","01101"), 'R' to listOf("11110","10001","10001","11110","10100","10010","10001"),
'S' to listOf("01111","10000","10000","01110","00001","00001","11110"), 'T' to listOf("11111","00100","00100","00100","00100","00100","00100"),
'U' to listOf("10001","10001","10001","10001","10001","10001","01110"), 'V' to listOf("10001","10001","10001","10001","10001","01010","00100"),
'W' to listOf("10001","10001","10001","10101","10101","10101","01010"), 'X' to listOf("10001","10001","01010","00100","01010","10001","10001"),
'Y' to listOf("10001","10001","01010","00100","00100","00100","00100"), 'Z' to listOf("11111","00001","00010","00100","01000","10000","11111"),
'0' to listOf("01110","10001","10011","10101","11001","10001","01110"), '1' to listOf("00100","01100","00100","00100","00100","00100","01110"),
'2' to listOf("01110","10001","00001","00010","00100","01000","11111"), '3' to listOf("11110","00001","00001","01110","00001","00001","11110"),
'4' to listOf("00010","00110","01010","10010","11111","00010","00010"), '5' to listOf("11111","10000","10000","11110","00001","00001","11110"),
'6' to listOf("01110","10000","10000","11110","10001","10001","01110"), '7' to listOf("11111","00001","00010","00100","01000","01000","01000"),
'8' to listOf("01110","10001","10001","01110","10001","10001","01110"), '9' to listOf("01110","10001","10001","01111","00001","00001","01110"),
' ' to listOf("00000","00000","00000","00000","00000","00000","00000"), '.' to listOf("00000","00000","00000","00000","00000","00110","00110"),
'-' to listOf("00000","00000","00000","11111","00000","00000","00000"), '_' to listOf("00000","00000","00000","00000","00000","00000","11111"),
'!' to listOf("00100","00100","00100","00100","00100","00000","00100"), '?' to listOf("01110","10001","00001","00010","00100","00000","00100")
)
private fun renderSplash(w: Int, h: Int, text: String, rgb: IntArray): ByteArray {
    val out=ByteArray(w*h*4); for (i in 0 until w*h) { out[i*4]=rgb[0].toByte(); out[i*4+1]=rgb[1].toByte(); out[i*4+2]=rgb[2].toByte() }
    val chars=text.uppercase().map { glyphs[it] ?: glyphs['?']!! }; val scale=minOf(3,maxOf(1,h/12)); val cw=6*scale
    val total=chars.size*cw; val startX=maxOf(0,(w-total)/2); val startY=maxOf(0,(h-7*scale)/2)
    for ((i,g) in chars.withIndex()) for (y in 0..6) for (x in 0..4) if(g[y][x]=='1') for (dy in 0 until scale) for(dx in 0 until scale) {
        val px=startX+i*cw+x*scale+dx; val py=startY+y*scale+dy
        if(px in 0 until w && py in 0 until h) out[(py*w+px)*4+3]=255.toByte()
    }
    return out
}
private fun pngDimensions(f: File): Pair<Int,Int>? = try { val b=f.readBytes(); if(b.size<24 || b[0]!=0x89.toByte() || b[1]!=80.toByte() || b[2]!=78.toByte() || b[3]!=71.toByte()) null else Pair(((b[16].toInt() and 255) shl 24) or ((b[17].toInt() and 255) shl 16) or ((b[18].toInt() and 255) shl 8) or (b[19].toInt() and 255),((b[20].toInt() and 255) shl 24) or ((b[21].toInt() and 255) shl 16) or ((b[22].toInt() and 255) shl 8) or (b[23].toInt() and 255)) } catch(_:Exception){null}

@Suppress("unused")
val customAppNamePatch = resourcePatch(name="Custom app name", description="Changes the launcher label.") {
    compatibleWith(instagramCompatibility)
    val style by stringOption(key="appNameStyle", default="Instagram PRO 👑", values=mapOf("Instagram PRO 👑" to "Instagram PRO 👑","InstagramPRO👑" to "InstagramPRO👑","Custom name" to "custom"), title="App name", required=true)
    val custom by stringOption(key="customAppName", default="", title="Custom app name", required=false)
    execute {
        val label=if(style=="custom") custom?.trim().orEmpty().ifEmpty{"Instagram PRO 👑"} else style ?: "Instagram PRO 👑"
        document("AndroidManifest.xml").use { d ->
            val apps=d.getElementsByTagName("application")
            if(apps.length>0){ val app=apps.item(0) as Element; val old=app.getAttribute("android:label"); app.setAttribute("android:label",label)
                for(tag in listOf("activity","activity-alias")) { val nodes=d.getElementsByTagName(tag); for(i in 0 until nodes.length){ val e=nodes.item(i) as Element; if(old.isNotEmpty() && e.getAttribute("android:label")==old) e.setAttribute("android:label",label) } }
            }
        }
    }
}

@Suppress("unused")
val customAppIconPatch = resourcePatch(name="Custom app icon", description="Replaces launcher icon image resources with a PNG you select.") {
    compatibleWith(instagramCompatibility)
    val path by stringOption(key="iconPath", default="", title="Icon PNG file", description="PNG path on the patching device; e.g. /storage/emulated/0/Download/icon.png. Leave blank to keep icons.", required=false)
    execute {
        val p=path?.trim().orEmpty(); if(p.isEmpty()) return@execute
        val supplied=File(p)
        val f=when {
            supplied.isFile -> supplied
            supplied.isDirectory -> {
                val pngs=supplied.listFiles()?.filter { it.isFile && it.extension.equals("png", ignoreCase=true) }.orEmpty()
                    .sortedBy { if(it.name.equals("icon.png", ignoreCase=true)) 0 else 1 }
                pngs.firstOrNull() ?: error("No PNG icon found in folder: $p. Put a .png file in this folder or enter the full PNG file path.")
            }
            else -> error("Icon path does not exist: $p. Enter a full .png file path or a folder containing a PNG.")
        }
        val b=f.readBytes()
        check(b.size>24 && b[0]==0x89.toByte() && b[1]==80.toByte() && b[2]==78.toByte() && b[3]==71.toByte()){"Selected icon is not a valid PNG: ${f.absolutePath}"}
        var n=0; val res=get("res")
        res.walkTopDown().filter{it.isFile && it.extension=="png" && it.nameWithoutExtension in setOf("ig_launcher_foreground","ig_launcher_background","instagram")}.forEach{it.writeBytes(b);n++}
        check(n>0){"No known launcher icon PNG resources found in this APK"}
    }
}

@Suppress("unused")
val customSplashTextPatch = resourcePatch(name="Custom splash text", description="Keep, replace or hide the splash screen branding text.") {
    compatibleWith(instagramCompatibility)
    val mode by stringOption(key="splashMode", default="keep", values=mapOf("Keep original" to "keep","Custom text" to "custom","Hide" to "hide"), title="From Meta branding", required=true)
    val text by stringOption(key="splashText", default="Instagram PRO", title="Splash text (ASCII)", required=false)
    val tint by stringOption(key="splashTextColor", default="#FFD700", title="Splash text color", description="Color name or #RRGGBB.", required=false)
    execute {
        val m=mode ?: "keep"; if(m=="keep") return@execute
        val label=if(m=="hide") "" else text?.trim().orEmpty()
        if(m=="custom" && label.isEmpty()) return@execute
        val rgb=color(tint); var n=0
        get("res").walkTopDown().filter{it.isFile && it.extension=="png" && it.nameWithoutExtension=="from_meta_gradient"}.forEach { f ->
            val dim=pngDimensions(f) ?: return@forEach
            if(dim.first in 1..2048 && dim.second in 1..2048) { f.writeBytes(rgbaPng(dim.first,dim.second,renderSplash(dim.first,dim.second,label,rgb))); n++ }
        }
        check(n>0){"Could not find the from_meta_gradient splash image in this APK"}
    }
}
