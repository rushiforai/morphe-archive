/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.userfriendshipstatus

import app.rex.utils.changeString
import app.rex.utils.classNameToExtension
import app.morphe.patcher.patch.patch

@Suppress("unused")
val userFriendshipStatusEntity =
    patch(
        description = "Used to decode user friendship status",
    ) {

        execute {
            runCatching {

            val mapping = FriendshipStatusMapperFingerprint.originalMethod
            GetMappingsFingerprint.changeString("classname", classNameToExtension(mapping.definingClass))
            GetMappingsFingerprint.changeString("methodname", mapping.name)
            GetMappingsFingerprint.changeString("friendshipstatusclass", classNameToExtension(FRIENDSHIP_STATUS_CLASS))
        
            }
        }
    }
