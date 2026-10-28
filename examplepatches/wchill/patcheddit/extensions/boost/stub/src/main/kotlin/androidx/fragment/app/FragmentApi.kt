/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package androidx.fragment.app

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

open class BackStackRecord protected constructor(stub: Unit) : androidx.fragment.app.FragmentTransaction(Unit), androidx.fragment.app.FragmentManager.BackStackEntry, androidx.fragment.app.FragmentManager.OpGenerator {
    constructor(p0: androidx.fragment.app.FragmentManager?) : this(Unit) { boostApiStub<Unit>() }
    fun commitInternal(p0: Boolean): Int = boostApiStub()
}

abstract class DialogFragment protected constructor(stub: Unit) : androidx.fragment.app.Fragment(Unit), android.content.DialogInterface.OnCancelListener, android.content.DialogInterface.OnDismissListener {
}

open class Fragment protected constructor(stub: Unit) : android.content.ComponentCallbacks, android.view.View.OnCreateContextMenuListener, androidx.lifecycle.LifecycleOwner, androidx.lifecycle.ViewModelStoreOwner, androidx.lifecycle.HasDefaultViewModelProviderFactory, androidx.savedstate.SavedStateRegistryOwner {
    constructor() : this(Unit) { boostApiStub<Unit>() }
    open fun callStartTransitionListener(p0: Boolean): Unit = boostApiStub()
    open fun createFragmentContainer(): androidx.fragment.app.FragmentContainer? = boostApiStub()
    open fun dump(p0: String?, p1: java.io.FileDescriptor?, p2: java.io.PrintWriter?, p3: Array<String>?): Unit = boostApiStub()
    override fun equals(p0: Any?): Boolean = boostApiStub()
    open fun findFragmentByWho(p0: String?): androidx.fragment.app.Fragment? = boostApiStub()
    open fun generateActivityResultKey(): String? = boostApiStub()
    fun getActivity(): androidx.fragment.app.FragmentActivity? = boostApiStub()
    open fun getAllowEnterTransitionOverlap(): Boolean = boostApiStub()
    open fun getAllowReturnTransitionOverlap(): Boolean = boostApiStub()
    open fun getAnimatingAway(): android.view.View? = boostApiStub()
    fun getArguments(): android.os.Bundle? = boostApiStub()
    fun getChildFragmentManager(): androidx.fragment.app.FragmentManager? = boostApiStub()
    open fun getContext(): android.content.Context? = boostApiStub()
    override fun getDefaultViewModelCreationExtras(): androidx.lifecycle.viewmodel.CreationExtras? = boostApiStub()
    override fun getDefaultViewModelProviderFactory(): androidx.lifecycle.ViewModelProvider.Factory? = boostApiStub()
    open fun getEnterAnim(): Int = boostApiStub()
    open fun getEnterTransition(): Any? = boostApiStub()
    open fun getEnterTransitionCallback(): androidx.core.app.SharedElementCallback? = boostApiStub()
    open fun getExitAnim(): Int = boostApiStub()
    open fun getExitTransition(): Any? = boostApiStub()
    open fun getExitTransitionCallback(): androidx.core.app.SharedElementCallback? = boostApiStub()
    open fun getFocusedView(): android.view.View? = boostApiStub()
    fun getFragmentManager(): androidx.fragment.app.FragmentManager? = boostApiStub()
    fun getHost(): Any? = boostApiStub()
    fun getId(): Int = boostApiStub()
    fun getLayoutInflater(): android.view.LayoutInflater? = boostApiStub()
    open fun getLayoutInflater(p0: android.os.Bundle?): android.view.LayoutInflater? = boostApiStub()
    override fun getLifecycle(): androidx.lifecycle.Lifecycle? = boostApiStub()
    open fun getLoaderManager(): androidx.loader.app.LoaderManager? = boostApiStub()
    open fun getNextTransition(): Int = boostApiStub()
    fun getParentFragment(): androidx.fragment.app.Fragment? = boostApiStub()
    fun getParentFragmentManager(): androidx.fragment.app.FragmentManager? = boostApiStub()
    open fun getPopDirection(): Boolean = boostApiStub()
    open fun getPopEnterAnim(): Int = boostApiStub()
    open fun getPopExitAnim(): Int = boostApiStub()
    open fun getPostOnViewCreatedAlpha(): Float = boostApiStub()
    open fun getReenterTransition(): Any? = boostApiStub()
    fun getResources(): android.content.res.Resources? = boostApiStub()
    fun getRetainInstance(): Boolean = boostApiStub()
    open fun getReturnTransition(): Any? = boostApiStub()
    fun getSavedStateRegistry(): androidx.savedstate.SavedStateRegistry? = boostApiStub()
    open fun getSharedElementEnterTransition(): Any? = boostApiStub()
    open fun getSharedElementReturnTransition(): Any? = boostApiStub()
    open fun getSharedElementSourceNames(): java.util.ArrayList<*>? = boostApiStub()
    open fun getSharedElementTargetNames(): java.util.ArrayList<*>? = boostApiStub()
    fun getString(p0: Int): String? = boostApiStub()
    fun getString(p0: Int, p1: Array<Any>?): String? = boostApiStub()
    fun getTag(): String? = boostApiStub()
    fun getTargetFragment(): androidx.fragment.app.Fragment? = boostApiStub()
    fun getTargetRequestCode(): Int = boostApiStub()
    fun getText(p0: Int): CharSequence? = boostApiStub()
    open fun getUserVisibleHint(): Boolean = boostApiStub()
    open fun getView(): android.view.View? = boostApiStub()
    open fun getViewLifecycleOwner(): androidx.lifecycle.LifecycleOwner? = boostApiStub()
    open fun getViewLifecycleOwnerLiveData(): androidx.lifecycle.LiveData? = boostApiStub()
    override fun getViewModelStore(): androidx.lifecycle.ViewModelStore? = boostApiStub()
    fun hasOptionsMenu(): Boolean = boostApiStub()
    override fun hashCode(): Int = boostApiStub()
    open fun initState(): Unit = boostApiStub()
    fun isAdded(): Boolean = boostApiStub()
    fun isDetached(): Boolean = boostApiStub()
    fun isHidden(): Boolean = boostApiStub()
    fun isInBackStack(): Boolean = boostApiStub()
    fun isInLayout(): Boolean = boostApiStub()
    fun isMenuVisible(): Boolean = boostApiStub()
    open fun isPostponed(): Boolean = boostApiStub()
    fun isRemoving(): Boolean = boostApiStub()
    fun isResumed(): Boolean = boostApiStub()
    fun isStateSaved(): Boolean = boostApiStub()
    fun isVisible(): Boolean = boostApiStub()
    open fun noteStateNotSaved(): Unit = boostApiStub()
    open fun onActivityCreated(p0: android.os.Bundle?): Unit = boostApiStub()
    open fun onActivityResult(p0: Int, p1: Int, p2: android.content.Intent?): Unit = boostApiStub()
    open fun onAttach(p0: android.app.Activity?): Unit = boostApiStub()
    open fun onAttach(p0: android.content.Context?): Unit = boostApiStub()
    open fun onAttachFragment(p0: androidx.fragment.app.Fragment?): Unit = boostApiStub()
    override fun onConfigurationChanged(p0: android.content.res.Configuration): Unit = boostApiStub()
    open fun onContextItemSelected(p0: android.view.MenuItem?): Boolean = boostApiStub()
    open fun onCreate(p0: android.os.Bundle?): Unit = boostApiStub()
    open fun onCreateAnimation(p0: Int, p1: Boolean, p2: Int): android.view.animation.Animation? = boostApiStub()
    open fun onCreateAnimator(p0: Int, p1: Boolean, p2: Int): android.animation.Animator? = boostApiStub()
    override fun onCreateContextMenu(p0: android.view.ContextMenu?, p1: android.view.View?, p2: android.view.ContextMenu.ContextMenuInfo?): Unit = boostApiStub()
    open fun onCreateOptionsMenu(p0: android.view.Menu?, p1: android.view.MenuInflater?): Unit = boostApiStub()
    open fun onCreateView(p0: android.view.LayoutInflater?, p1: android.view.ViewGroup?, p2: android.os.Bundle?): android.view.View? = boostApiStub()
    open fun onDestroy(): Unit = boostApiStub()
    open fun onDestroyOptionsMenu(): Unit = boostApiStub()
    open fun onDestroyView(): Unit = boostApiStub()
    open fun onDetach(): Unit = boostApiStub()
    open fun onGetLayoutInflater(p0: android.os.Bundle?): android.view.LayoutInflater? = boostApiStub()
    open fun onHiddenChanged(p0: Boolean): Unit = boostApiStub()
    open fun onInflate(p0: android.app.Activity?, p1: android.util.AttributeSet?, p2: android.os.Bundle?): Unit = boostApiStub()
    open fun onInflate(p0: android.content.Context?, p1: android.util.AttributeSet?, p2: android.os.Bundle?): Unit = boostApiStub()
    override fun onLowMemory(): Unit = boostApiStub()
    open fun onMultiWindowModeChanged(p0: Boolean): Unit = boostApiStub()
    open fun onOptionsItemSelected(p0: android.view.MenuItem?): Boolean = boostApiStub()
    open fun onOptionsMenuClosed(p0: android.view.Menu?): Unit = boostApiStub()
    open fun onPause(): Unit = boostApiStub()
    open fun onPictureInPictureModeChanged(p0: Boolean): Unit = boostApiStub()
    open fun onPrepareOptionsMenu(p0: android.view.Menu?): Unit = boostApiStub()
    open fun onPrimaryNavigationFragmentChanged(p0: Boolean): Unit = boostApiStub()
    open fun onRequestPermissionsResult(p0: Int, p1: Array<String>?, p2: IntArray?): Unit = boostApiStub()
    open fun onResume(): Unit = boostApiStub()
    open fun onSaveInstanceState(p0: android.os.Bundle?): Unit = boostApiStub()
    open fun onStart(): Unit = boostApiStub()
    open fun onStop(): Unit = boostApiStub()
    open fun onViewCreated(p0: android.view.View?, p1: android.os.Bundle?): Unit = boostApiStub()
    open fun onViewStateRestored(p0: android.os.Bundle?): Unit = boostApiStub()
    open fun performActivityCreated(p0: android.os.Bundle?): Unit = boostApiStub()
    open fun performAttach(): Unit = boostApiStub()
    open fun performConfigurationChanged(p0: android.content.res.Configuration?): Unit = boostApiStub()
    open fun performContextItemSelected(p0: android.view.MenuItem?): Boolean = boostApiStub()
    open fun performCreate(p0: android.os.Bundle?): Unit = boostApiStub()
    open fun performCreateOptionsMenu(p0: android.view.Menu?, p1: android.view.MenuInflater?): Boolean = boostApiStub()
    open fun performCreateView(p0: android.view.LayoutInflater?, p1: android.view.ViewGroup?, p2: android.os.Bundle?): Unit = boostApiStub()
    open fun performDestroy(): Unit = boostApiStub()
    open fun performDestroyView(): Unit = boostApiStub()
    open fun performDetach(): Unit = boostApiStub()
    open fun performGetLayoutInflater(p0: android.os.Bundle?): android.view.LayoutInflater? = boostApiStub()
    open fun performLowMemory(): Unit = boostApiStub()
    open fun performMultiWindowModeChanged(p0: Boolean): Unit = boostApiStub()
    open fun performOptionsItemSelected(p0: android.view.MenuItem?): Boolean = boostApiStub()
    open fun performOptionsMenuClosed(p0: android.view.Menu?): Unit = boostApiStub()
    open fun performPause(): Unit = boostApiStub()
    open fun performPictureInPictureModeChanged(p0: Boolean): Unit = boostApiStub()
    open fun performPrepareOptionsMenu(p0: android.view.Menu?): Boolean = boostApiStub()
    open fun performPrimaryNavigationFragmentChanged(): Unit = boostApiStub()
    open fun performResume(): Unit = boostApiStub()
    open fun performSaveInstanceState(p0: android.os.Bundle?): Unit = boostApiStub()
    open fun performStart(): Unit = boostApiStub()
    open fun performStop(): Unit = boostApiStub()
    open fun performViewCreated(): Unit = boostApiStub()
    open fun postponeEnterTransition(): Unit = boostApiStub()
    fun postponeEnterTransition(p0: Long, p1: java.util.concurrent.TimeUnit?): Unit = boostApiStub()
    fun registerForActivityResult(p0: androidx.activity.result.contract.ActivityResultContract?, p1: androidx.activity.result.ActivityResultRegistry?, p2: androidx.activity.result.ActivityResultCallback?): androidx.activity.result.ActivityResultLauncher? = boostApiStub()
    fun registerForActivityResult(p0: androidx.activity.result.contract.ActivityResultContract?, p1: androidx.activity.result.ActivityResultCallback?): androidx.activity.result.ActivityResultLauncher? = boostApiStub()
    open fun registerForContextMenu(p0: android.view.View?): Unit = boostApiStub()
    fun requestPermissions(p0: Array<String>?, p1: Int): Unit = boostApiStub()
    fun requireActivity(): androidx.fragment.app.FragmentActivity? = boostApiStub()
    fun requireArguments(): android.os.Bundle? = boostApiStub()
    fun requireContext(): android.content.Context? = boostApiStub()
    fun requireFragmentManager(): androidx.fragment.app.FragmentManager? = boostApiStub()
    fun requireHost(): Any? = boostApiStub()
    fun requireParentFragment(): androidx.fragment.app.Fragment? = boostApiStub()
    fun requireView(): android.view.View? = boostApiStub()
    open fun restoreChildFragmentState(): Unit = boostApiStub()
    fun restoreViewState(p0: android.os.Bundle?): Unit = boostApiStub()
    open fun setAllowEnterTransitionOverlap(p0: Boolean): Unit = boostApiStub()
    open fun setAllowReturnTransitionOverlap(p0: Boolean): Unit = boostApiStub()
    open fun setAnimations(p0: Int, p1: Int, p2: Int, p3: Int): Unit = boostApiStub()
    open fun setArguments(p0: android.os.Bundle?): Unit = boostApiStub()
    open fun setEnterSharedElementCallback(p0: androidx.core.app.SharedElementCallback?): Unit = boostApiStub()
    open fun setEnterTransition(p0: Any?): Unit = boostApiStub()
    open fun setExitSharedElementCallback(p0: androidx.core.app.SharedElementCallback?): Unit = boostApiStub()
    open fun setExitTransition(p0: Any?): Unit = boostApiStub()
    open fun setFocusedView(p0: android.view.View?): Unit = boostApiStub()
    open fun setHasOptionsMenu(p0: Boolean): Unit = boostApiStub()
    open fun setInitialSavedState(p0: androidx.fragment.app.Fragment.SavedState?): Unit = boostApiStub()
    open fun setMenuVisibility(p0: Boolean): Unit = boostApiStub()
    open fun setNextTransition(p0: Int): Unit = boostApiStub()
    open fun setPopDirection(p0: Boolean): Unit = boostApiStub()
    open fun setPostOnViewCreatedAlpha(p0: Float): Unit = boostApiStub()
    open fun setReenterTransition(p0: Any?): Unit = boostApiStub()
    open fun setRetainInstance(p0: Boolean): Unit = boostApiStub()
    open fun setReturnTransition(p0: Any?): Unit = boostApiStub()
    open fun setSharedElementEnterTransition(p0: Any?): Unit = boostApiStub()
    open fun setSharedElementNames(p0: java.util.ArrayList<String>?, p1: java.util.ArrayList<String>?): Unit = boostApiStub()
    open fun setSharedElementReturnTransition(p0: Any?): Unit = boostApiStub()
    open fun setTargetFragment(p0: androidx.fragment.app.Fragment?, p1: Int): Unit = boostApiStub()
    open fun setUserVisibleHint(p0: Boolean): Unit = boostApiStub()
    open fun shouldShowRequestPermissionRationale(p0: String?): Boolean = boostApiStub()
    open fun startActivity(p0: android.content.Intent?): Unit = boostApiStub()
    open fun startActivity(p0: android.content.Intent?, p1: android.os.Bundle?): Unit = boostApiStub()
    open fun startActivityForResult(p0: android.content.Intent?, p1: Int): Unit = boostApiStub()
    open fun startActivityForResult(p0: android.content.Intent?, p1: Int, p2: android.os.Bundle?): Unit = boostApiStub()
    open fun startIntentSenderForResult(p0: android.content.IntentSender?, p1: Int, p2: android.content.Intent?, p3: Int, p4: Int, p5: Int, p6: android.os.Bundle?): Unit = boostApiStub()
    open fun startPostponedEnterTransition(): Unit = boostApiStub()
    override fun toString(): String = boostApiStub()
    open fun unregisterForContextMenu(p0: android.view.View?): Unit = boostApiStub()
    companion object {
        @JvmStatic fun instantiate(p0: android.content.Context?, p1: String?): androidx.fragment.app.Fragment? = boostApiStub()
        @JvmStatic fun instantiate(p0: android.content.Context?, p1: String?, p2: android.os.Bundle?): androidx.fragment.app.Fragment? = boostApiStub()
    }
    abstract class SavedState protected constructor(stub: Unit) : android.os.Parcelable {
    }
}

abstract class FragmentActivity protected constructor(stub: Unit) : androidx.activity.ComponentActivity(Unit), androidx.core.app.ActivityCompat.OnRequestPermissionsResultCallback {
}

abstract class FragmentContainer protected constructor(stub: Unit) {
}

abstract class FragmentFactory protected constructor(stub: Unit) {
}

abstract class FragmentHostCallback protected constructor(stub: Unit) : androidx.fragment.app.FragmentContainer(Unit) {
}

abstract class FragmentManager protected constructor(stub: Unit) {
    @JvmField var backStack: java.util.ArrayList<androidx.fragment.app.BackStackRecord>? = boostApiStub()
    @JvmField var backStackChangeListeners: java.util.ArrayList<androidx.fragment.app.FragmentManager.OnBackStackChangedListener>? = boostApiStub()
    fun popBackStackImmediate(): Boolean = boostApiStub()
    override fun toString(): String = boostApiStub()
    interface BackStackEntry {
    }
    interface OnBackStackChangedListener {
        fun onBackStackChanged(): Unit
    }
    interface OpGenerator {
    }
}

abstract class FragmentStateManager protected constructor(stub: Unit) {
}

abstract class FragmentTransaction protected constructor(stub: Unit) {
    @JvmField var addToBackStack: Boolean = boostApiStub()
    @JvmField var allowAddToBackStack: Boolean = boostApiStub()
    @JvmField var mName: String = boostApiStub()
}
