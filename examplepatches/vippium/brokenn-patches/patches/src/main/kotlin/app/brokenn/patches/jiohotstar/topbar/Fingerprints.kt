package app.brokenn.patches.jiohotstar.topbar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * The TopBar content container, in the analysed build:
 *   Lvn/e0;->e(Lr0/d; Landroidx/compose/runtime/b; I)V
 *   (public static final, classes11.dex, JioHotstar 26.10.12.2)
 *
 * This is the layout that holds the JioHotstar / Tadka pills. It is called
 * only from Lvn/e0;->g and Lvn/e0;->h (the two TopBar content renderers,
 * via their restart lambda Lvn/e0;), so patching it touches nothing else.
 *
 * Why patch this method, and not Lvn/e0;->f (v2)?
 * v2 forced f to return early, which removed the pills — but it also
 * removed the whole TopBar container, including the height and the
 * status-bar padding it provided. The feed below then slid up under the
 * status bar. Patching e() instead keeps the container and its height,
 * and only skips the pills inside it, so the gap stays exactly as before.
 *
 * 26.10.12.2 CHANGE — why the dev.5 fingerprint failed on this build:
 * the dev.5 fingerprint was derived from 26.08.17.3, where this class
 * was Ldn/j0;, e() took (Lr0/c; ...), and the content call was
 * Lr0/c;->c(...). In 26.10.12.2 R8 re-obfuscated it to Lvn/e0;, e()
 * takes (Lr0/d; ...), and the content call is Lr0/d;->h(...).
 * The restart key, the j() call and the -673482817 literal are
 * UNCHANGED, so only the class / parameter / content-call names
 * needed updating — the method itself is otherwise identical.
 *
 * Instruction layout in the analysed build (smali order, 0-based):
 *   0   const 1673754903         <- Compose restart-group key for e()
 *   47  invoke Lvn/e0;->j()F     <- TopBar height: 54dp portrait, 64dp otherwise
 *   49  invoke .../i;->g(...)    <- Modifier.height(that value)
 *   52  const -673482817
 *   108 invoke Lr0/d;->h(...)    <- the content call that renders the pills
 *                                  (result unused, not a branch target, so
 *                                  removing it is safe; the layout node
 *                                  is still closed at 109)
 *
 * Filters MUST be in method order — Morphe matches them sequentially.
 * v3 listed the -673482817 literal before the j() call, but in the
 * method j() comes first (47, then 52), so the fingerprint could never
 * match. That was the cause of the reported "Failed to match the
 * fingerprint" error on 26.08.17.3. v4 fixes only the order, nothing else.
 *
 * instructionMatches.last() is the content call. The patch removes
 * that one instruction.
 */
object TopBarContentFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    // First parameter is an obfuscated type, matched generically ("L");
    // the Compose runtime parameter and the int flag are stable.
    parameters = listOf("L", "Landroidx/compose/runtime/b;", "I"),
    filters = listOf(
        literal(1673754903),
        methodCall(definingClass = "Lvn/e0;", name = "j"),
        literal(-673482817),
        methodCall(definingClass = "Lr0/d;", name = "h")
    )
)

/**
 * The TopBar container, in the analysed build:
 *   Lvn/e0;->b(LWe/c; Z Lr0/d; Landroidx/compose/runtime/b; I)V
 *   (public static final, classes11.dex, JioHotstar 26.10.12.2)
 *
 * b() is what actually sizes the top-bar area. Its smali (0-based):
 *   8   const 1318644515          <- restart-group key
 *   40  invoke Lhn/a;->a(...)     <- TopBar state (We/c)
 *   43  invoke Lvn/e0;->j()F      <- old height (54 / 64dp)
 *   44  move-result v5
 *   46  int-to-float v7, 2
 *   47  sget v12, Lvn/e0;->d F     <- 12.0f
 *   48  mul-float v7, v7, v12     <- v7 = 2 * 12dp = 24dp
 *   49  add-float/2addr v7, v5    <- v7 = 2*12dp + j() = 78dp (or 0 if hidden)
 *                                     NOTE: this is ADD_FLOAT_2ADDR, not
 *                                     ADD_FLOAT — v6 scanned only for the
 *                                     latter and ran off the end of the
 *                                     method (IndexOutOfBounds at the scan
 *                                     loop). v7 scans for both, bounded.
 *                                     The mul at 48 is NOT an add, so the
 *                                     first ADD_FLOAT after j() is still
 *                                     the one at 49 — the scan is unchanged.
 *   62  invoke .../i;->g(..., v7) <- Modifier.height(v7) in the static branch
 *                                     (We/c.a true, e.g. Android 15)
 *
 * The patch overwrites v7 with 25.0f right after the add-float, so
 * the container itself is 25dp when shown. The later "if hidden, v7 = 0"
 * step still runs after this insertion point, so a hidden bar stays 0.
 * instructionMatches[2] is the j() call; the patch scans forward from
 * it for the first ADD_FLOAT instead of hardcoding the +6 offset.
 *
 * 26.10.12.2 CHANGE vs dev.5: class Ldn/j0; -> Lvn/e0;, first parameter
 * LVe/c; -> LWe/c;, state provider LQm/a; -> Lhn/a;. Restart key,
 * j() call, layout/i;->g call and the add-float shape are unchanged.
 */
object TopBarContainerFingerprint : Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("LWe/c;", "Z", "L", "Landroidx/compose/runtime/b;", "I"),
    filters = listOf(
        literal(1318644515),
        methodCall(definingClass = "Lhn/a;", name = "a"),
        methodCall(definingClass = "Lvn/e0;", name = "j"),
        methodCall(definingClass = "Landroidx/compose/foundation/layout/i;", name = "g")
    )
)

/**
 * The bottom-nav scroll listener, in the analysed build:
 *   LUm/g$a;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
 *   (public final, classes9.dex, JioHotstar 26.10.12.2)
 *   from com.hotstar.ui.bottomnav.BottomNavController$connect$1$1
 *
 * Scroll event (LZi/c$a: c = firstVisibleItemIndex, a = scroll delta,
 * b = previous first-item offset). The Um/n state methods replaced the
 * old Em/q ones: B2(Z) is the old z2(Z), A2(Z) is the old y2(Z).
 *
 *   if (index == 0) { ...show/hide within the top item... }
 *   else if (delta > j0) { B2(false); A2(false); }   // scrolling down: hide
 *   else if (delta < -50) { B2(true); A2(false); }   // scrolling up: SHOW
 *
 * That last branch is the reported bug: scrolling up mid-feed makes the
 * (now empty) top bar reappear and push content down, before the user
 * is anywhere near the top. The patch forces that one B2 call to
 * false, so the bar only comes back via the index == 0 branch — i.e.
 * when the user is back on the first item — never mid-feed.
 * A2 is already false in that branch, so it is left untouched.
 *
 * Filters are in method order and start at the -50 literal, so the
 * B2 found after it is exactly the mid-feed one, not the index == 0
 * one (which comes earlier in the method and is left untouched).
 * instructionMatches[1] is that B2 call, [2] is its A2 pair.
 *
 * 26.10.12.2 CHANGE vs dev.5: class LEm/j$a; -> LUm/g$a;,
 * LEm/q;->z2/y2 -> LUm/n;->B2/A2. The -50 literal, the B2(true)+A2(false)
 * shape of the show branch, and the neg-int + if-le first-item arm
 * (below) are all unchanged.
 */
object TopBarScrollFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        literal(-50),
        methodCall(definingClass = "LUm/n;", name = "B2"),
        methodCall(definingClass = "LUm/n;", name = "A2")
    )
)

/**
 * Lvn/e0;-><clinit>()V — initialises the TopBar's dp constants as floats:
 *   a:F = 54.0f, b:F = 64.0f (bar heights), c:F = 16.0f,
 *   d:F = 12.0f (static-path vertical/horizontal padding)
 *
 * Method-only fingerprint; the patch scans the body for the d:F store
 * (at instruction 11 in 26.10.12.2, after const 12 at 9).
 *
 * 26.10.12.2 CHANGE vs dev.5: class Ldn/j0; -> Lvn/e0; only.
 * Field names and values are unchanged.
 */
object TopBarClinitFingerprint : Fingerprint(
    definingClass = "Lvn/e0;",
    name = "<clinit>"
)
