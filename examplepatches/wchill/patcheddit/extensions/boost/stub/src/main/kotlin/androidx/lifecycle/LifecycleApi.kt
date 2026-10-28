/*
 * Copyright 2026 wchill.
 *
 * Stable compile-only Boost adapter API. Native targets are in boost/bindings.json.
 * These declarations must never be packaged with the extension.
 *
 * See the included NOTICE file for GPLv3 section 7 terms.
 */

@file:Suppress("UNUSED_PARAMETER", "unused", "RedundantVisibilityModifier")

package androidx.lifecycle

private fun <T> boostApiStub(): T = throw UnsupportedOperationException("Compile-only Boost adapter stub")

interface HasDefaultViewModelProviderFactory {
    fun getDefaultViewModelCreationExtras(): androidx.lifecycle.viewmodel.CreationExtras?
    fun getDefaultViewModelProviderFactory(): androidx.lifecycle.ViewModelProvider.Factory?
}

abstract class Lifecycle protected constructor(stub: Unit) {
    enum class State {
        a, b, c, y, z;
    }
}

interface LifecycleOwner {
    fun getLifecycle(): androidx.lifecycle.Lifecycle?
}

abstract class LiveData protected constructor(stub: Unit) {
    fun getValue(): Any? = boostApiStub()
    open fun observe(p0: androidx.lifecycle.LifecycleOwner?, p1: androidx.lifecycle.Observer?): Unit = boostApiStub()
    open fun removeObserver(p0: androidx.lifecycle.Observer?): Unit = boostApiStub()
}

interface Observer {
    fun onChanged(p0: Any?): Unit
}

abstract class ViewModel protected constructor(stub: Unit) {
}

abstract class ViewModelProvider protected constructor(stub: Unit) {
    interface Factory {
        fun create(p0: Class<*>?): androidx.lifecycle.ViewModel?
        fun create(p0: Class<*>?, p1: androidx.lifecycle.viewmodel.MutableCreationExtras?): androidx.lifecycle.ViewModel?
        fun create(p0: app.morphe.extension.boost.api.runtime.kotlin.jvm.internal.ClassReference?, p1: androidx.lifecycle.viewmodel.MutableCreationExtras?): androidx.lifecycle.ViewModel?
    }
}

abstract class ViewModelStore protected constructor(stub: Unit) {
}

interface ViewModelStoreOwner {
    fun getViewModelStore(): androidx.lifecycle.ViewModelStore?
}
