package app.brokenn.patches.jiohotstar.topbar

import app.brokenn.patches.jiohotstar.shared.Constants
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

// Targets are matched structurally, never by obfuscated names; filter order matters.
internal object TopBarContentFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("L", "Landroidx/compose/runtime/b;", "I"),
    filters = listOf(
        literal(1673754903),
        literal(-673482817)
    )
)

internal object TopBarContainerFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("L", "Z", "L", "Landroidx/compose/runtime/b;", "I"),
    strings = listOf("TopBarHeight"),
    filters = listOf(
        literal(1318644515),
        methodCall(definingClass = "Landroidx/compose/foundation/layout/i;", name = "g")
    )
)

internal object TopBarScrollFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    name = "invokeSuspend",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        literal(-50)
    )
)

// The header composable overload that animates its expand/collapse (only it calls the tween factory).
internal object HeaderTransitionFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf(
        "L",
        "Landroidx/compose/ui/e;",
        "Lcom/hotstar/bff/models/widget/BffBrandedLogoHeaderWidget;",
        "L",
        "L",
        "Landroidx/compose/runtime/b;",
        "I"
    ),
    filters = listOf(
        methodCall(definingClass = Constants.TWEEN_FACTORY_CLASS, name = Constants.TWEEN_FACTORY_METHOD)
    )
)
