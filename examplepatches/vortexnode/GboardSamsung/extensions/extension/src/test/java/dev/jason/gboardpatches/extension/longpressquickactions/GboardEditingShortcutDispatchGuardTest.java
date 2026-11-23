package dev.jason.gboardpatches.extension.longpressquickactions;

import android.view.inputmethod.InputConnection;

import org.junit.Assert;
import org.junit.Test;

import java.lang.reflect.Proxy;
import java.util.concurrent.atomic.AtomicInteger;

public final class GboardEditingShortcutDispatchGuardTest {
    @Test
    public void emptyOrMissingSelectionRejectsCopyAndCut() {
        Assert.assertFalse(shouldDispatch(android.R.id.copy, ""));
        Assert.assertFalse(shouldDispatch(android.R.id.copy, null));
        Assert.assertFalse(shouldDispatch(android.R.id.cut, ""));
        Assert.assertFalse(shouldDispatch(android.R.id.cut, null));
    }

    @Test
    public void selectedWhitespaceStillAllowsCopyAndCut() {
        Assert.assertTrue(shouldDispatch(android.R.id.copy, " "));
        Assert.assertTrue(shouldDispatch(android.R.id.cut, " "));
    }

    @Test
    public void selectionReadFailureRejectsCopyAndCut() {
        InputConnection connection = proxyConnection((proxy, method, args) -> {
            if ("getSelectedText".equals(method.getName())) {
                throw new RuntimeException("selection unavailable");
            }
            return defaultValue(method.getReturnType());
        });

        Assert.assertFalse(GboardEditingShortcutDispatchGuard
                .shouldDispatchContextMenuAction(connection, android.R.id.copy));
        Assert.assertFalse(GboardEditingShortcutDispatchGuard
                .shouldDispatchContextMenuAction(connection, android.R.id.cut));
    }

    @Test
    public void nonCopyActionDoesNotQuerySelection() {
        AtomicInteger selectionReads = new AtomicInteger();
        InputConnection connection = proxyConnection((proxy, method, args) -> {
            if ("getSelectedText".equals(method.getName())) {
                selectionReads.incrementAndGet();
            }
            return defaultValue(method.getReturnType());
        });

        Assert.assertTrue(GboardEditingShortcutDispatchGuard
                .shouldDispatchContextMenuAction(connection, android.R.id.paste));
        Assert.assertEquals(0, selectionReads.get());
    }

    private static boolean shouldDispatch(int actionId, CharSequence selectedText) {
        InputConnection connection = proxyConnection((proxy, method, args) -> {
            if ("getSelectedText".equals(method.getName())) {
                return selectedText;
            }
            return defaultValue(method.getReturnType());
        });
        return GboardEditingShortcutDispatchGuard
                .shouldDispatchContextMenuAction(connection, actionId);
    }

    private static InputConnection proxyConnection(java.lang.reflect.InvocationHandler handler) {
        return (InputConnection) Proxy.newProxyInstance(
                GboardEditingShortcutDispatchGuardTest.class.getClassLoader(),
                new Class<?>[] {InputConnection.class},
                handler);
    }

    private static Object defaultValue(Class<?> type) {
        if (type == boolean.class) return Boolean.FALSE;
        if (type == int.class) return Integer.valueOf(0);
        if (type == long.class) return Long.valueOf(0L);
        return null;
    }
}
