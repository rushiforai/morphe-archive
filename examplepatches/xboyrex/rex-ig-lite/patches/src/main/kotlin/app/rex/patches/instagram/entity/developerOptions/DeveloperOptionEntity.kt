/*
 * Copyright (C) 2026 rex <https://github.com/xboyrex/rex-ig-lite>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.rex.patches.instagram.entity.developerOptions

import app.rex.utils.changeFirstString
import app.rex.utils.classNameToExtension
import app.morphe.patcher.patch.patch

val developerOptionsEntity =
    patch(
        description = "This patch is used for decoding obfuscated code of developer options items",
    ) {
        execute {
            runCatching {
            GetQuickExperimentHelperClassExtension.changeFirstString(
                classNameToExtension(GetAllExperimentsFingerprint.originalClassDef.type),
            )
            GetAllExperimentsClassExtension.changeFirstString(GetAllExperimentsFingerprint.originalMethod.name)

            ExperimentsGetMobileConfigSpecifier.let {
                GetExperimentItemHelperClassExtension.changeFirstString(classNameToExtension(it.originalClassDef.type))
                GetUniversalIdHelperClassExtension.changeFirstString(
                    classNameToExtension(it.instructionMatches[1].methodReference.definingClass),
                )
            }
        
            }
        }
    }
