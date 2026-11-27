/*
 * The host check and the registration below are adapted from AddOn.kt of
 * https://github.com/MarcaDian/morphe-patches-yavot (GNU General Public License v3.0).
 * Modified for the Watchtime Tracker patches: only the methods this add-on calls are checked.
 */

package io.github.xd33m.watchtime.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags

private const val ADD_ON_MANAGER = "Lapp/morphe/extension/youtube/addon/AddOnManager;"

/** A method of the official Morphe extension that the add-on calls at runtime. */
private class HostMethod(val classDescriptor: String, val signature: String, val isStatic: Boolean = true)

/**
 * Everything the add-on's extension calls in the official extension. The add-on is built against stubs and shipped
 * separately, so a moved or renamed method would patch cleanly and fail on the phone; checking here turns that into
 * a patch-time error.
 */
private val REQUIRED_HOST_METHODS = listOf(
    HostMethod(ADD_ON_MANAGER, "registerAddOns()V"),
    HostMethod("Lapp/morphe/extension/youtube/addon/AddOnApi;", "addVideoTimeListener(Ljava/util/function/LongConsumer;)V"),
    HostMethod("Lapp/morphe/extension/youtube/patches/VideoInformation;", "getVideoId()Ljava/lang/String;"),
    HostMethod("Lapp/morphe/extension/youtube/shared/ShortsPlayerState;", "isOpen()Z"),
    HostMethod(
        "Lapp/morphe/extension/youtube/shared/PlayerType;",
        "getCurrent()Lapp/morphe/extension/youtube/shared/PlayerType;",
    ),
    HostMethod("Lapp/morphe/extension/youtube/shared/PlayerType;", "isNoneOrHidden()Z", isStatic = false),
    HostMethod("Lapp/morphe/extension/shared/Utils;", "getContext()Landroid/content/Context;"),
)

/** Fails the patch unless every [REQUIRED_HOST_METHODS] entry exists as a public method with that exact signature. */
private fun BytecodePatchContext.checkHostCompatibility() {
    val missing = REQUIRED_HOST_METHODS.filter { required ->
        val hostClass = classDefByOrNull(required.classDescriptor) ?: return@filter true
        val method = hostClass.methods.firstOrNull {
            it.name + "(" + it.parameters.joinToString("") + ")" + it.returnType == required.signature
        }
        method == null ||
            !AccessFlags.PUBLIC.isSet(method.accessFlags) ||
            AccessFlags.STATIC.isSet(method.accessFlags) != required.isStatic
    }
    if (missing.isNotEmpty()) throw PatchException(
        "Apply the official Morphe patches in the same run (a version with add-on support). Missing or changed: " +
            missing.joinToString { it.classDescriptor.trim('L', ';').replace('/', '.') + "." + it.signature },
    )
}

/** Adds a call to [registrationMethodDescriptor] to Morphe's add-on manager. Call from a finalize block. */
internal fun BytecodePatchContext.registerAddOn(registrationMethodDescriptor: String) {
    checkHostCompatibility()
    val register = mutableClassDefBy(ADD_ON_MANAGER).methods.first {
        it.name == "registerAddOns" && it.parameters.isEmpty() && it.returnType == "V"
    }
    register.addInstruction(0, "invoke-static { }, $registrationMethodDescriptor")
}
