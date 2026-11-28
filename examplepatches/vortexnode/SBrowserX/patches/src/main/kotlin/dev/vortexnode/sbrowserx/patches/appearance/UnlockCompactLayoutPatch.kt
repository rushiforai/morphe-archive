package dev.vortexnode.sbrowserx.patches.appearance

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import dev.vortexnode.sbrowserx.patches.core.sbrowserXCorePatch
import dev.vortexnode.sbrowserx.shared.Constants.COMPATIBILITY_SBROWSER
import dev.vortexnode.sbrowserx.shared.findMethodOrThrow

private const val DEBUG_SETTINGS_CLASS =
    "Lcom/sec/android/app/sbrowser/common/device/DebugSettings;"
private const val MORE_MENU_HANDLER_CLASS =
    "Lcom/sec/android/app/sbrowser/toolbar/MoreMenuHandler;"
private const val HIDE_TOOLBAR_COMPACT_CLASS =
    "Lcom/sec/android/app/sbrowser/hide_toolbar/HideToolbarHandlerCompact;"
private const val CUSTOMIZE_MENU_MODEL_CLASS =
    "Lcom/sec/android/app/sbrowser/common/customize_toolbar/CustomizeMenuModel;"
private const val TOOLBAR_BUTTON_LAYOUT_CLASS =
    "Lcom/sec/android/app/sbrowser/toolbar/ToolbarButtonLayout;"
private const val TOOLBAR_COMPACT_CLASS =
    "Lcom/sec/android/app/sbrowser/toolbar/ToolbarCompact;"
private const val DEVICE_LAYOUT_UTIL_CLASS =
    "Lcom/sec/android/app/sbrowser/common/device/DeviceLayoutUtil;"

@Suppress("unused")
val unlockCompactLayoutPatch = bytecodePatch(
    name = "Unlock Compact Layout",
    description = "Unlocks the compact floating toolbar layout, smooths scrolling behavior, and lets you customize the extra toolbar button.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SBROWSER)
    dependsOn(sbrowserXCorePatch)

    execute {
        // 1. DebugSettings.isCompactTypeSupported()Z (.locals 2)
        val compactMethod = findMethodOrThrow(
            classType = DEBUG_SETTINGS_CLASS,
            methodName = "isCompactTypeSupported",
            parameterTypes = emptyList(),
            returnType = "Z",
        )
        compactMethod.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )

        // 2. MoreMenuHandler.getHeight()I (.locals 4)
        val menuHeightMethod = findMethodOrThrow(
            classType = MORE_MENU_HANDLER_CLASS,
            methodName = "getHeight",
            parameterTypes = emptyList(),
            returnType = "I",
        )
        menuHeightMethod.addInstructions(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->computeStableCompactMenuHeight(Ljava/lang/Object;)I
                move-result v0
                if-eqz v0, :sbrowserx_stock_menu_height
                return v0
                :sbrowserx_stock_menu_height
                nop
            """.trimIndent(),
        )

        // 3. HideToolbarHandlerCompact.updateToolbarByBottomOffsetY(SBrowserTabDelegate, F, F)Z (.locals 3)
        // Eliminates Android-View <-> GPU-Bitmap swap jitter on all websites by smoothly translating
        // the live Compact pill directly with a 4px deadzone and loading lock.
        val compactOffsetMethod = findMethodOrThrow(
            classType = HIDE_TOOLBAR_COMPACT_CLASS,
            methodName = "updateToolbarByBottomOffsetY",
            parameterTypes = listOf(
                "Lcom/sec/android/app/sbrowser/common/model/sbrowser_tab/SBrowserTabDelegate;",
                "F",
                "F",
            ),
            returnType = "Z",
        )
        compactOffsetMethod.addInstructions(
            0,
            """
                invoke-static {p0, p1, p2}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->handleCompactBottomOffsetY(Ljava/lang/Object;Ljava/lang/Object;F)Z
                move-result v0
                if-eqz v0, :sbrowserx_stock_compact_offset
                return v0
                :sbrowserx_stock_compact_offset
                nop
            """.trimIndent(),
        )

        // 4. HideToolbarHandlerCompact.resetBottomControlViewPosition()V (.locals 1)
        val compactResetMethod = findMethodOrThrow(
            classType = HIDE_TOOLBAR_COMPACT_CLASS,
            methodName = "resetBottomControlViewPosition",
            parameterTypes = emptyList(),
            returnType = "V",
        )
        compactResetMethod.addInstructions(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->resetCompactBarTranslation(Ljava/lang/Object;)V
            """.trimIndent(),
        )

        // 5. HideToolbarHandlerCompact.adjustToolbarScrollByBottomControls(SBrowserTabDelegate, F, F)V (.locals 2)
        // Prevents Samsung's unfinished 0.85x scale/fade jitter from ever firing on the Compact pill.
        val compactScrollMethod = findMethodOrThrow(
            classType = HIDE_TOOLBAR_COMPACT_CLASS,
            methodName = "adjustToolbarScrollByBottomControls",
            parameterTypes = listOf(
                "Lcom/sec/android/app/sbrowser/common/model/sbrowser_tab/SBrowserTabDelegate;",
                "F",
                "F",
            ),
            returnType = "V",
        )
        compactScrollMethod.addInstructions(
            0,
            """
                invoke-static {p0, p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->shouldStabilizeCompactBarOnLoad(Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :sbrowserx_stock_compact_scroll
                return-void
                :sbrowserx_stock_compact_scroll
                nop
            """.trimIndent(),
        )

        // 6. CustomizeMenuModel.getToolbarRightItems()Ljava/util/List; (.locals 0, single return!)
        // Replaces Samsung's Galaxy AI (action_browsing_assist) icon in Compact mode with user-selected button.
        val rightItemsMethod = findMethodOrThrow(
            classType = CUSTOMIZE_MENU_MODEL_CLASS,
            methodName = "getToolbarRightItems",
            parameterTypes = emptyList(),
            returnType = "Ljava/util/List;",
        )
        rightItemsMethod.addInstructions(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->recordCustomizeMenuModel(Ljava/lang/Object;)V
            """.trimIndent(),
        )
        val rightInsns = rightItemsMethod.implementation?.instructions
            ?: error("Missing instructions in getToolbarRightItems")
        rightItemsMethod.addInstructions(
            rightInsns.size - 1,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->replaceCompactAiButton(Ljava/util/List;)Ljava/util/List;
                move-result-object p0
            """.trimIndent(),
        )

        // 7. CustomizeMenuModel.getToolbarLeftItems()Ljava/util/List; (.locals 0, single return!)
        val leftItemsMethod = findMethodOrThrow(
            classType = CUSTOMIZE_MENU_MODEL_CLASS,
            methodName = "getToolbarLeftItems",
            parameterTypes = emptyList(),
            returnType = "Ljava/util/List;",
        )
        leftItemsMethod.addInstructions(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->recordCustomizeMenuModel(Ljava/lang/Object;)V
            """.trimIndent(),
        )
        val leftInsns = leftItemsMethod.implementation?.instructions
            ?: error("Missing instructions in getToolbarLeftItems")
        leftItemsMethod.addInstructions(
            leftInsns.size - 1,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->replaceCompactAiButton(Ljava/util/List;)Ljava/util/List;
                move-result-object p0
            """.trimIndent(),
        )

        // 8. ToolbarButtonLayout.updatePinnedExtensionButtons()V (.locals 11)
        // Eliminates the 1-frame 40dp horizontal phantom gap between Tabs [8] and More (⋮) during page load in Compact mode.
        val pinnedExtMethod = findMethodOrThrow(
            classType = TOOLBAR_BUTTON_LAYOUT_CLASS,
            methodName = "updatePinnedExtensionButtons",
            parameterTypes = emptyList(),
            returnType = "V",
        )
        pinnedExtMethod.addInstructions(
            0,
            """
                invoke-static {}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->isCompactLayoutActivePublic()Z
                move-result v0
                if-eqz v0, :sbrowserx_stock_pinned_ext
                return-void
                :sbrowserx_stock_pinned_ext
                nop
            """.trimIndent(),
        )

        // 9. ToolbarButtonLayout.fitPinnedExtensions()V (.locals 8)
        // Prevents fitPinnedExtensions from toggling any extension button visibility inside the Compact pill.
        findMethodOrThrow(
            classType = TOOLBAR_BUTTON_LAYOUT_CLASS,
            methodName = "fitPinnedExtensions",
            parameterTypes = emptyList(),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->isCompactLayoutActivePublic()Z
                move-result v0
                if-eqz v0, :sbrowserx_stock_fit_ext
                return-void
                :sbrowserx_stock_fit_ext
                nop
            """.trimIndent(),
        )

        // 10. ToolbarCompact.shouldApplyBlurEffect()Z (.locals 1)
        // Disables Samsung's QuickAccess full-width blur strip behind the Compact pill.
        findMethodOrThrow(
            classType = TOOLBAR_COMPACT_CLASS,
            methodName = "shouldApplyBlurEffect",
            parameterTypes = emptyList(),
            returnType = "Z",
        ).addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )

        // 11. DeviceLayoutUtil.setNavigationBarColorApi35(Window, I, Z, NavigationBarState)V (.locals 1, static)
        // Eliminates Android 15/16 edge-to-edge white/grey bottom contrast stripe in Compact mode.
        findMethodOrThrow(
            classType = DEVICE_LAYOUT_UTIL_CLASS,
            methodName = "setNavigationBarColorApi35",
            parameterTypes = listOf(
                "Landroid/view/Window;",
                "I",
                "Z",
                "Lcom/sec/android/app/sbrowser/common/device/DeviceLayoutUtil${'$'}NavigationBarState;",
            ),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->shouldPreserveStartPageSystemBars(Landroid/view/Window;)Z
                move-result v0
                if-eqz v0, :sbrowserx_nav_continue
                return-void
                :sbrowserx_nav_continue
                invoke-static {p0, p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->adjustApi35NavBarColor(Landroid/view/Window;I)I
                move-result p1
                invoke-static {p2}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->adjustApi35NavBarDarkIconFlag(Z)Z
                move-result p2
            """.trimIndent(),
        )

        // 12. DeviceLayoutUtil.setStatusBarColorApi35(Window, I)V (.locals 0, static)
        // Eliminates Android 15/16 edge-to-edge white/grey top status bar stripe in Compact mode.
        val statusBarApi35Method = findMethodOrThrow(
            classType = DEVICE_LAYOUT_UTIL_CLASS,
            methodName = "setStatusBarColorApi35",
            parameterTypes = listOf("Landroid/view/Window;", "I"),
            returnType = "V",
        )
        statusBarApi35Method.addInstructions(
            0,
            """
                invoke-static {p0, p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->adjustApi35StatusBarColor(Landroid/view/Window;I)I
                move-result p1
            """.trimIndent(),
        )
        val statusBarInsns = statusBarApi35Method.implementation?.instructions
            ?: error("Missing instructions in setStatusBarColorApi35")
        val setBgIdx = statusBarInsns.indexOfFirst { insn ->
            insn.opcode.name == "invoke-virtual"
        }
        if (setBgIdx >= 0) {
            statusBarApi35Method.replaceInstruction(
                setBgIdx,
                "invoke-static {p0, p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->setStatusBarViewBgIfNotStartPage(Landroid/view/View;I)V",
            )
        }

        // Prevent startBarColorAnimation from overwriting Start Page wallpaper/glass slices during reload
        findMethodOrThrow(
            classType = DEVICE_LAYOUT_UTIL_CLASS,
            methodName = "startBarColorAnimation",
            parameterTypes = listOf(
                "Landroid/view/Window;",
                "I",
                "I",
                "I",
                "J",
                "Landroid/view/animation/Interpolator;",
                "Ljava/util/function/IntConsumer;",
                "Ljava/lang/Runnable;",
            ),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->shouldPreserveStartPageSystemBars(Landroid/view/Window;)Z
                move-result v0
                if-eqz v0, :sbrowserx_anim_continue
                return-void
                :sbrowserx_anim_continue
                nop
            """.trimIndent(),
        )

        // 13-16. Neutralize Samsung's 4 top/bottom gradient fade methods in bytecode so
        // navigationbar_gradient_background(_dark) & statusbar_gradient_background(_dark) never draw anywhere.
        findMethodOrThrow(
            classType = DEVICE_LAYOUT_UTIL_CLASS,
            methodName = "enableFadeNavigationBar",
            parameterTypes = listOf("Landroid/content/Context;", "Z"),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->clearSystemBarFadeContext(Landroid/content/Context;)V
                return-void
            """.trimIndent(),
        )

        findMethodOrThrow(
            classType = DEVICE_LAYOUT_UTIL_CLASS,
            methodName = "enableFadeStatusBar",
            parameterTypes = listOf("Landroid/content/Context;", "Z"),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->clearSystemBarFadeContext(Landroid/content/Context;)V
                return-void
            """.trimIndent(),
        )

        findMethodOrThrow(
            classType = DEVICE_LAYOUT_UTIL_CLASS,
            methodName = "setFadeNavigationBar",
            parameterTypes = listOf("Landroid/view/Window;"),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->clearSystemBarFadeWindow(Landroid/view/Window;)V
                return-void
            """.trimIndent(),
        )

        findMethodOrThrow(
            classType = DEVICE_LAYOUT_UTIL_CLASS,
            methodName = "setFadeStatusBar",
            parameterTypes = listOf("Landroid/view/Window;"),
            returnType = "V",
        ).addInstructions(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->clearSystemBarFadeWindow(Landroid/view/Window;)V
                return-void
            """.trimIndent(),
        )

        // 17. NativePageToolbarBlur.isBlurEffectEnabled()Z (.locals 0)
        // Disables blurred wallpaper strip behind the bottom Compact pill on QuickAccess.
        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/toolbar/blur/NativePageToolbarBlur;",
            methodName = "isBlurEffectEnabled",
            parameterTypes = emptyList(),
            returnType = "Z",
        ).addInstructions(
            0,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->isNativePageBlurAllowed(Ljava/lang/Object;)Z
                move-result p0
                return p0
            """.trimIndent(),
        )

        // 17b. DeviceLayoutUtil.applyNavigationBarInset(View, WindowInsets, Z)V (.locals 7)
        // Keeps navigation_bar_background_for_multi_tab permanently hidden & transparent on WindowInsets updates.
        findMethodOrThrow(
            classType = DEVICE_LAYOUT_UTIL_CLASS,
            methodName = "applyNavigationBarInset",
            parameterTypes = listOf("Landroid/view/View;", "Landroid/view/WindowInsets;", "Z"),
            returnType = "V",
        ).addInstructionsWithLabels(
            0,
            """
                invoke-static {p0, p2}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->shouldHideMultiTabNavFade(Landroid/view/View;Z)Z
                move-result v0
                if-eqz v0, :sbrowserx_keep_nav_inset
                const/4 v0, 0x0
                invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundColor(I)V
                const/16 v0, 0x8
                invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V
                return-void
                :sbrowserx_keep_nav_inset
                nop
            """.trimIndent(),
        )

        // 18. MainViewTheme.shouldApplyFadeStatusBar()Z (.locals 1)
        // Keeps website status bar matched to page/theme color instead of forcing transparent fade.
        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/main_view/MainViewTheme;",
            methodName = "shouldApplyFadeStatusBar",
            parameterTypes = emptyList(),
            returnType = "Z",
        ).addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )
    }
}
