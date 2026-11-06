package io.github.warleysr.instagram.patches

import io.github.warleysr.instagram.patches.Constants.CAROUSEL_AUTO_SCROLL_EXTENSION_CLASS
import io.github.warleysr.instagram.patches.Constants.COMPATIBILITY_INSTAGRAM
import io.github.warleysr.instagram.patches.Constants.EXTENSION_PATH
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

@Suppress("unused")
val carouselAutoScrollPatch =
    bytecodePatch(
        name = "Carousel auto scroll",
        description =
            "Adds a post menu button to turn on scrolling carousels to the next item when a video ends. " +
                "Images in between are shown for 5 seconds.",
    ) {
        dependsOn(hookOverflowMenuButton)
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        extendWith(EXTENSION_PATH)

        execute {

            SmoothScrollToPageExtensionFingerprint.method.addInstructions(
                0,
                """
                invoke-virtual {p0, p1}, ${ReboundViewPagerSmoothScrollFingerprint.method}
                return-void
                """.trimIndent(),
            )

            val playerClass = playerSetKeepScreenOnMethod().parameterTypes[0].toString()

            // The player turns keep screen on on and off on the view the video is rendered on:
            //
            //   iget-object v1, v0, Player;->videoView:Landroid/view/View;
            //   if-eqz v1, :cond_0
            //   iget-boolean v0, p0, Runnable;->keepScreenOn:Z
            //   invoke-virtual {v1, v0}, Landroid/view/View;->setKeepScreenOn(Z)V
            val videoViewField =
                Fingerprint(
                    returnType = "V",
                    filters =
                        listOf(
                            fieldAccess(
                                definingClass = playerClass,
                                type = "Landroid/view/View;",
                                opcode = Opcode.IGET_OBJECT,
                            ),
                            methodCall(
                                definingClass = "Landroid/view/View;",
                                name = "setKeepScreenOn",
                                location = InstructionLocation.MatchAfterWithin(3),
                            ),
                        ),
                ).instructionMatches
                    .first()
                    .instruction
                    .getReference<FieldReference>()
                    ?: throw PatchException("Could not find the player video view field")

            VideoCompletionFingerprint.method.apply {
                val (stopIndex, stopCall) = videoCompletionStopCall(playerClass)
                val freeRegister = stopCall.registerD

                addInstructions(
                    stopIndex + 1,
                    """
                    iget-object v$freeRegister, v${stopCall.registerC}, $videoViewField
                    invoke-static {v$freeRegister}, $CAROUSEL_AUTO_SCROLL_EXTENSION_CLASS->onVideoCompleted(Landroid/view/View;)V
                    """.trimIndent(),
                )
            }

            addOverflowMenuButtonAttributes("CAROUSEL_AUTO_SCROLL", "carouselAutoScrollOverflowButton")
        }
    }
