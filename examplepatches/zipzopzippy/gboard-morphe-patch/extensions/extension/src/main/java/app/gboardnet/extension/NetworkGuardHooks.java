package app.gboardnet.extension;

/**
 * Holder for wrapper methods generated at patch time.
 * Every rewritten network call site in Gboard calls a static wrapper here, which runs a
 * {@link NetworkGuard} check and then performs the original call.
 */
@SuppressWarnings("unused")
public final class NetworkGuardHooks {
    private NetworkGuardHooks() {
    }
}
