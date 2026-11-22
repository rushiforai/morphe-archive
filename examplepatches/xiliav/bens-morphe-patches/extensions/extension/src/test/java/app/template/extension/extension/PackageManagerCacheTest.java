package app.template.extension.extension;

import org.junit.Test;
import static org.junit.Assert.*;

public class PackageManagerCacheTest {
    private static class CachedManager {
        private final Object mPM;
        CachedManager(Object delegate) { mPM = delegate; }
        Object delegate() { return mPM; }
    }

    private static class WrappedManager extends CachedManager {
        WrappedManager(Object delegate) { super(delegate); }
    }

    @Test
    public void cachedInstanceUsesTheNewDelegate() throws Exception {
        Object original = new Object();
        Object proxy = new Object();
        CachedManager manager = new CachedManager(original);
        assertSame(original, manager.delegate());
        assertTrue(PackageManagerCache.replaceDelegate(manager, proxy));
        assertSame(proxy, manager.delegate());
    }

    @Test
    public void inheritedPrivateDelegateIsReplaced() throws Exception {
        Object proxy = new Object();
        WrappedManager manager = new WrappedManager(new Object());
        assertTrue(PackageManagerCache.replaceDelegate(manager, proxy));
        assertSame(proxy, manager.delegate());
    }

    @Test
    public void nullManagerIsNotReportedAsRepaired() throws Exception {
        assertFalse(PackageManagerCache.replaceDelegate(null, new Object()));
    }

    @Test
    public void missingDelegateFailsVisibly() {
        assertThrows(NoSuchFieldException.class,
            () -> PackageManagerCache.replaceDelegate(new Object(), new Object()));
    }
}
