/*
 * Copyright 2026 wchill.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

package app.morphe.patches.all.misc.resources

import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.ResourceGroup
import app.morphe.util.copyResources

internal fun addResourcesPatch(sourceDirectory: String, vararg resources: ResourceGroup) =
    resourcePatch(default = false) {
        execute {
            copyResources(sourceDirectory, *resources)
        }
    }
