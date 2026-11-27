package dev.vortexnode.sbrowserx.patches.appearance

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.vortexnode.sbrowserx.patches.core.sbrowserXCorePatch
import dev.vortexnode.sbrowserx.shared.Constants.COMPATIBILITY_SBROWSER
import dev.vortexnode.sbrowserx.shared.findMethodOrThrow

private const val DEVICE_FEATURE_UTILS_CLASS =
    "Lcom/sec/android/app/sbrowser/common/device/DeviceFeatureUtils;"
private const val BOTTOMBAR_CLASS =
    "Lcom/sec/android/app/sbrowser/toolbar/Bottombar;"
private const val TOOLBAR_CLASS =
    "Lcom/sec/android/app/sbrowser/toolbar/Toolbar;"
private const val TOOLBAR_LAYOUT_CLASS =
    "Lcom/sec/android/app/sbrowser/toolbar/ToolbarLayout;"
private const val TOOLBAR_BG_DRAWABLE_CLASS =
    "Lcom/sec/android/app/sbrowser/toolbar/ToolbarBackgroundDrawable;"
private const val MORE_MENU_HANDLER_CLASS =
    "Lcom/sec/android/app/sbrowser/toolbar/MoreMenuHandler;"
private const val MORE_MENU_ADAPTER_CLASS =
    "Lcom/sec/android/app/sbrowser/toolbar/MoreMenuRecyclerAdapter;"
private const val GRADIENT_DRAWABLE_FACTORY_CLASS =
    "Lcom/sec/android/app/sbrowser/toolbar/blur/GradientDrawableFactory;"
private const val GRADIENT_BITMAP_FACTORY_CLASS =
    "Lcom/sec/android/app/sbrowser/hide_toolbar/GradientBitmapFactory;"
private const val TIN_CONTENT_VIEW_CORE_CLASS =
    "Lcom/sec/terrace/content/browser/TinContentViewCore;"

@Suppress("unused")
val bottomBarBlurAndAmoledPatch = bytecodePatch(
    name = "AMOLED Black & Bottom Bar Transparency",
    description = "Adds adjustable toolbar and bottom bar transparency with frosted-glass blur and pure AMOLED black mode for the browser interface.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SBROWSER)
    dependsOn(sbrowserXCorePatch)

    execute {
        // 1. DeviceFeatureUtils.isToolbarBlurSupported()Z (.locals 0)
        // Forces real-time blur pipeline ON when user enables it, or OFF when disabled.
        val blurMethod = findMethodOrThrow(
            classType = DEVICE_FEATURE_UTILS_CLASS,
            methodName = "isToolbarBlurSupported",
            parameterTypes = emptyList(),
            returnType = "Z",
        )
        val blurInsns = blurMethod.implementation?.instructions
            ?: error("Missing instructions in isToolbarBlurSupported")
        blurMethod.addInstructions(
            blurInsns.size - 1,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->isToolbarBlurAllowed(Z)Z
                move-result p0
            """.trimIndent(),
        )

        // 2. Bottombar.getBackgroundColor(ThemeParam)I (.locals 1)
        // Uses AMOLED pure black in night mode when enabled, and preserves translucent alpha.
        val bgMethod = findMethodOrThrow(
            classType = BOTTOMBAR_CLASS,
            methodName = "getBackgroundColor",
            parameterTypes = listOf("Lcom/sec/android/app/sbrowser/common/toolbar/ThemeParam;"),
            returnType = "I",
        )
        bgMethod.addInstructions(
            0,
            """
                invoke-virtual {p1}, Lcom/sec/android/app/sbrowser/common/toolbar/ThemeParam;->isNightMode()Z
                move-result v0
                if-eqz v0, :sbrowserx_stock_bg
                invoke-static {}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->isAmoledBlackEnabled()Z
                move-result v0
                if-eqz v0, :sbrowserx_stock_bg
                invoke-static {}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->getAmoledBottomBarColor()I
                move-result v0
                return v0
                :sbrowserx_stock_bg
                nop
            """.trimIndent(),
        )

        // 3. Toolbar.isTranslucentColor(I)Z (.locals 0, p0 unused as 'this' in stock body)
        // Ensures Toolbar always routes through setGradientBackground when blur is ON,
        // even when a website provides an opaque theme-color.
        val translucentMethod = findMethodOrThrow(
            classType = TOOLBAR_CLASS,
            methodName = "isTranslucentColor",
            parameterTypes = listOf("I"),
            returnType = "Z",
        )
        translucentMethod.addInstructions(
            0,
            """
                if-eqz p1, :sbrowserx_stock_translucent
                invoke-static {}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->isBottomBarBlurEnabled()Z
                move-result p0
                if-eqz p0, :sbrowserx_stock_translucent
                const/4 p0, 0x1
                return p0
                :sbrowserx_stock_translucent
                nop
            """.trimIndent(),
        )

        // 4. GradientDrawableFactory.createToolbarGradientDrawable(Context, I)GradientDrawable (.locals 1)
        // Replaces Samsung's nearly-opaque 0xFF->0xFA gradient with true frosted-glass alpha gradient.
        val toolbarGradMethod = findMethodOrThrow(
            classType = GRADIENT_DRAWABLE_FACTORY_CLASS,
            methodName = "createToolbarGradientDrawable",
            parameterTypes = listOf("Landroid/content/Context;", "I"),
            returnType = "Landroid/graphics/drawable/GradientDrawable;",
        )
        toolbarGradMethod.addInstructions(
            0,
            """
                invoke-static {p0, p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->createToolbarGlassDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/GradientDrawable;
                move-result-object v0
                if-eqz v0, :sbrowserx_stock_tb_grad
                return-object v0
                :sbrowserx_stock_tb_grad
                nop
            """.trimIndent(),
        )

        // 5. GradientDrawableFactory.createBottombarGradientDrawable(Context, I)GradientDrawable (.locals 0)
        // Zero new locals: returns glass GradientDrawable when enabled, or stock-equivalent fallback.
        val bottombarGradMethod = findMethodOrThrow(
            classType = GRADIENT_DRAWABLE_FACTORY_CLASS,
            methodName = "createBottombarGradientDrawable",
            parameterTypes = listOf("Landroid/content/Context;", "I"),
            returnType = "Landroid/graphics/drawable/GradientDrawable;",
        )
        bottombarGradMethod.addInstructions(
            0,
            """
                invoke-static {p0, p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->createBottombarGlassDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/GradientDrawable;
                move-result-object p0
                return-object p0
            """.trimIndent(),
        )

        // 6. GradientBitmapFactory.createGradientBitmap(IIIZ)Bitmap (.locals 10)
        // Matches scroll-compositor bitmap gradient alpha to the resting glass alpha (no white flash on scroll).
        val gradBmpMethod = findMethodOrThrow(
            classType = GRADIENT_BITMAP_FACTORY_CLASS,
            methodName = "createGradientBitmap",
            parameterTypes = listOf("I", "I", "I", "Z"),
            returnType = "Landroid/graphics/Bitmap;",
        )
        gradBmpMethod.addInstructions(
            0,
            """
                invoke-static {p0, p1, p2, p3}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->createGlassGradientBitmapOrNull(IIIZ)Landroid/graphics/Bitmap;
                move-result-object v0
                if-eqz v0, :sbrowserx_stock_grad_bmp
                return-object v0
                :sbrowserx_stock_grad_bmp
                nop
            """.trimIndent(),
        )

        // 7. TinContentViewCore.enableBlurEffectOnToolbar(BitmapLayer, IIIIIFI)V (.locals 13)
        // Boosts Chromium compositor GPU blur radius (30 -> 48..68) and lowers tint alpha
        // so it doesn't double-stack with the Android View overlay.
        val nativeBlurMethod = findMethodOrThrow(
            classType = TIN_CONTENT_VIEW_CORE_CLASS,
            methodName = "enableBlurEffectOnToolbar",
            parameterTypes = listOf(
                "Lcom/sec/terrace/content/browser/TerraceBitmapLayer${'$'}BitmapLayer;",
                "I", "I", "I", "I", "I", "F", "I",
            ),
            returnType = "V",
        )
        nativeBlurMethod.addInstructions(
            0,
            """
                invoke-static/range {p7 .. p7}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->adjustToolbarBlurRadius(F)F
                move-result p7
                invoke-static/range {p8 .. p8}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->adjustToolbarBlurTintColor(I)I
                move-result p8
            """.trimIndent(),
        )

        // 8. ToolbarLayout.updateTextFieldBackground(ThemeParam)V (.locals 2)
        // Before return-void, p0 holds LocationBar: applies independent glass alpha to the URL bar capsule.
        val urlBgMethod = findMethodOrThrow(
            classType = TOOLBAR_LAYOUT_CLASS,
            methodName = "updateTextFieldBackground",
            parameterTypes = listOf("Lcom/sec/android/app/sbrowser/common/toolbar/ThemeParam;"),
            returnType = "V",
        )
        val urlBgInsns = urlBgMethod.implementation?.instructions
            ?: error("Missing instructions in updateTextFieldBackground")
        urlBgMethod.addInstructions(
            urlBgInsns.size - 1,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->applyUrlBarGlassStyle(Ljava/lang/Object;)V
            """.trimIndent(),
        )

        // 9. ToolbarBackgroundDrawable.setBackgroundColor(I)V (.locals 0)
        // Applies independent Compact floating-pill translucency and AMOLED black tint.
        val compactBgMethod = findMethodOrThrow(
            classType = TOOLBAR_BG_DRAWABLE_CLASS,
            methodName = "setBackgroundColor",
            parameterTypes = listOf("I"),
            returnType = "V",
        )
        compactBgMethod.addInstructions(
            0,
            """
                invoke-static {p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->adjustCompactBarColor(I)I
                move-result p1
            """.trimIndent(),
        )

        // 10. MoreMenuHandler.showMoreMenuDialog(Z)V (.locals 3)
        // Before return-void, p0 holds mMoreMenuDialog (AppCompatDialog / Dialog).
        val moreMenuShowMethod = findMethodOrThrow(
            classType = MORE_MENU_HANDLER_CLASS,
            methodName = "showMoreMenuDialog",
            parameterTypes = listOf("Z"),
            returnType = "V",
        )
        val moreMenuInsns = moreMenuShowMethod.implementation?.instructions
            ?: error("Missing instructions in showMoreMenuDialog")
        moreMenuShowMethod.addInstructions(
            moreMenuInsns.size - 1,
            """
                invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->applyMoreMenuGlassStyle(Landroid/app/Dialog;)V
            """.trimIndent(),
        )

        // 11. MoreMenuRecyclerAdapter.onBindViewHolder(Landroidx/recyclerview/widget/p1;I)V
        // Enhances menu text/icon crispness (sans-serif-medium & pure high-contrast tint) to match the address bar.
        val menuBindMethod = findMethodOrThrow(
            classType = MORE_MENU_ADAPTER_CLASS,
            methodName = "onBindViewHolder",
            parameterTypes = listOf("Landroidx/recyclerview/widget/p1;", "I"),
            returnType = "V",
        )
        val menuBindInsns = menuBindMethod.implementation?.instructions
            ?: error("Missing instructions in MoreMenuRecyclerAdapter.onBindViewHolder")
        menuBindMethod.addInstructions(
            menuBindInsns.size - 1,
            """
                invoke-static {p1}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->enhanceMoreMenuItemCrispness(Ljava/lang/Object;)V
            """.trimIndent(),
        )

        // 12. ExtensionContainerPopupWindow.show()Z
        // Match the Extensions popup appearance (AMOLED/dark glass, transparency & blur) 1-to-1 with MoreMenu.
        val extPopupShow = findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/extensions/ExtensionContainerPopupWindow;",
            methodName = "show",
            parameterTypes = emptyList(),
            returnType = "Z",
        )
        val extPopupInsns = extPopupShow.implementation?.instructions
            ?: error("Missing instructions in ExtensionContainerPopupWindow.show")
        var extPopupPatched = false
        for (i in extPopupInsns.indices) {
            val mRef = (extPopupInsns[i] as? ReferenceInstruction)?.reference as? MethodReference ?: continue
            if (mRef.name == "showAtLocation") {
                extPopupShow.addInstructions(
                    i,
                    """
                        invoke-static {p0}, Ldev/vortexnode/sbrowserx/extension/SBrowserXHooks;->applyExtensionsPopupGlassStyle(Ljava/lang/Object;)V
                    """.trimIndent(),
                )
                extPopupPatched = true
                break
            }
        }
        check(extPopupPatched) { "Failed to locate showAtLocation in ExtensionContainerPopupWindow.show" }

        // 13. AppMenu.getOptionMenuBadgeCount()I (.locals 2)
        // Hides the persistent orange notification dot on the bottom-right More (⋮) button.
        findMethodOrThrow(
            classType = "Lcom/sec/android/app/sbrowser/main_view/menu/AppMenu;",
            methodName = "getOptionMenuBadgeCount",
            parameterTypes = emptyList(),
            returnType = "I",
        ).addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )
    }
}
