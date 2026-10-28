/*
 * Copyright 2026 wchill.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.patches.reddit.customclients.boostforreddit.misc.extension

import app.morphe.patches.reddit.customclients.boostforreddit.bindings.BoostApi

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.extension.SHARED_UTILS_EXTENSION_CLASS
import app.morphe.patches.all.misc.extension.activityOnCreateExtensionHook
import app.morphe.patches.reddit.customclients.boostforreddit.misc.extension.mapping.verifyBoostLibraryReferences
import app.morphe.util.returnEarly
import java.net.JarURLConnection

internal val boostExtensionPatch = bytecodePatch {
    dependsOn(boostNativeLibrariesPatch, boostPrivateLibraryResourcesPatch)
    extendWith {
        val input = checkNotNull(object {}.javaClass.classLoader.getResourceAsStream("extensions/boost.mpe")) {
            "Boost extension payload was not found"
        }
        prepareBoostExtension(input)
    }

    execute {
        classDefBy(SHARED_UTILS_EXTENSION_CLASS)
    }

    finalize {
        activityOnCreateExtensionHook(BoostApi.MyApplication.type)(SHARED_UTILS_EXTENSION_CLASS)
        val marker = object {}.javaClass
        val resource = checkNotNull(marker.classLoader.getResource(marker.name.replace('.', '/') + ".class")) {
            "Cannot locate the patch bundle for its version"
        }
        val connection = resource.openConnection()
        require(connection is JarURLConnection) { "Boost patches are not running from a patch bundle" }
        val version = checkNotNull(connection.manifest.mainAttributes.getValue("Version")) {
            "Patch bundle has no version"
        }
        Fingerprint(
            definingClass = SHARED_UTILS_EXTENSION_CLASS,
            name = "getPatchesReleaseVersion",
            parameters = emptyList(),
            returnType = "Ljava/lang/String;",
        ).method.returnEarly(version)
        val classes = buildList { classDefForEach(::add) }
        val nativeTypes = BoostNativeLibraries.classes.mapTo(HashSet()) { it.type }
        val extensionTypes = classes.filter { it.type !in nativeTypes }.mapTo(HashSet()) { it.type }
        verifyBoostLibraryReferences(classes, extensionTypes)
    }
}
