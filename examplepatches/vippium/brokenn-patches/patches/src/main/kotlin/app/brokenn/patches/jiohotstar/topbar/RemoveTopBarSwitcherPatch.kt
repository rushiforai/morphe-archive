package app.brokenn.patches.jiohotstar.topbar

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.brokenn.patches.jiohotstar.shared.Constants.COMPATIBILITY_JIOHOTSTAR
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

@Suppress("unused")
val removeTopBarSwitcherPatch = bytecodePatch(
    name = "Remove top bar switcher",
    description = "Removes the JioHotstar/Tadka mode-switcher row from the top of Home."
) {
    compatibleWith(COMPATIBILITY_JIOHOTSTAR)

    execute {
        // 26.10.12.2 — same patch as dev.5, re-derived for the new build.
        // Only the obfuscated names changed (see Fingerprints.kt):
        //   Ldn/j0; -> Lvn/e0;, LVe/c; -> LWe/c;, LQm/a; -> Lhn/a;,
        //   Lr0/c;->c -> Lr0/d;->h, LEm/j$a; -> LUm/g$a;,
        //   LEm/q;->z2/y2 -> LUm/n;->B2/A2. All constants are
        //   unchanged from dev.5: container 25.0f, expanded target
        //   0.46f, zeroed animation durations, clinit d -> 0.0f,
        //   mid-feed B2 forced false, first-item if-le nopped.
        //
        // v6 — three changes, all in the same patch:
        //
        // 1. e(): hide the pills (v3/v4) and shrink their height to 1dp
        //    (v6-v8 were 8dp, user asked for 1dp in v9).
        //    In Lvn/e0;->e(): j() at 47, move-result at 48, Modifier.height
        //    at 50. 0x00000000 is the IEEE-754 bit pattern for 0.0f.
        //
        // 2. b(): shrink the container itself to 1dp. This matters
        //    because on a modern device (We/c.a true) b() takes its static
        //    branch and sizes the container from its own calculation
        //    (2*12dp + j() = 78dp), not from e()'s height — so changing
        //    e() alone would leave a 78dp container around a 1dp child.
        //    Overwriting the add-float result (v7) with 0.0f fixes the
        //    container; the later "if hidden, v7 = 0" step still runs
        //    after this point, so a hidden bar stays 0.
        //
        // 3. g$a (BottomNavController scroll listener): stop the bar
        //    reappearing on a mid-feed scroll up. Its logic is:
        //      index == 0 -> show/hide within the top item (kept)
        //      index != 0, delta > j0 -> hide (kept)
        //      index != 0, delta < -50 -> SHOW (removed: forced false)
        //    Only the last B2 call is touched — the one after the -50
        //    literal — by inserting const/4 <arg register>, 0x0 right
        //    before it. A2 is left exactly as it was (false in that
        //    branch), so bottom-nav behaviour is unchanged.
        //    Result: while scrolling mid-feed, content scrolls naturally
        //    from behind the status bar; the small gap only comes back
        //    when the user is back on the first item (top of the feed),
        //    which is also where it is present on launch.
        //
        // ORDER MATTERS in e(): remove first, then insert. The removal
        // is at index 108, after the height instructions, so it does
        // not shift the height indices. Inserting first would shift the
        // content call to 109 and a stale index would remove the wrong
        // instruction.
        //
        // History: v1 forced s2() to 1, which is the render branch
        // (if-nez branches when NOT zero) and kept the switcher on
        // screen. v2 forced s2() to 0, which hid the switcher but also
        // removed its height entirely. v3/v4 hid only e()'s content and
        // kept the full height; v4 fixed v3's fingerprint filter order
        // (j() at 48 comes before the -673482817 literal at 53).
        // Do not reintroduce any of those directions.

        // --- 1. e(): remove the pills, KEEP the row height ---
        // e()'s Modifier.height(j()) sizes the row to 54/64dp. That height
        // must stay: the bar is a pure spacer now, and its total height is
        // fraction × child(= 24dp padding + this row). Shrinking the row
        // (v9-v12 did) starves the fraction math, so the strip can never
        // grow tall enough to push the feed's "For You" title below the
        // status bar.
        val contentMethod = TopBarContentFingerprint.method
        val contentMatches = TopBarContentFingerprint.instructionMatches

        val contentIndex = contentMatches.last().index
        contentMethod.removeInstruction(contentIndex)

        // --- 2. b(): shrink the container height to 1dp ---
        val containerMethod = TopBarContainerFingerprint.method
        val containerMatches = TopBarContainerFingerprint.instructionMatches
        val containerHeightCallIndex = containerMatches[2].index

        // Scan forward from the j() call for the first float add
        // (v7 = 2*12dp + j()); do not hardcode its offset.
        //
        // v6 BUG, fixed here: v6 scanned only for Opcode.ADD_FLOAT,
        // but b() uses add-float/2addr (opcode ADD_FLOAT_2ADDR) at
        // instruction 49, so the scan ran past the end of the method
        // and Morphe reported IndexOutOfBoundsException at this loop
        // (RemoveTopBarSwitcherPatch.kt:91 in v6). The 2addr form is
        // also a different instruction type (TwoRegisterInstruction,
        // not ThreeRegisterInstruction), so the destination register
        // is read via whichever interface the found instruction has.
        // The scan is now bounded: if no float add is found within
        // 20 instructions, it fails with a clear message instead of
        // walking off the end of the method.
        var addFloatIndex = containerHeightCallIndex
        var scanned = 0
        while (scanned <= 20) {
            val opcode = containerMethod.getInstruction<Instruction>(addFloatIndex).opcode
            if (opcode == Opcode.ADD_FLOAT || opcode == Opcode.ADD_FLOAT_2ADDR) {
                break
            }
            addFloatIndex++
            scanned++
        }
        require(scanned <= 20) {
            "TopBar container: no ADD_FLOAT after j() call (fingerprint matched the wrong method?)"
        }
        val addFloatInstruction = containerMethod.getInstruction<Instruction>(addFloatIndex)
        val containerHeightRegister = when (addFloatInstruction) {
            is ThreeRegisterInstruction -> addFloatInstruction.registerA
            is TwoRegisterInstruction -> addFloatInstruction.registerA
            else -> throw IllegalStateException(
                "TopBar container: float add is neither 3-register nor 2addr form"
            )
        }
        containerMethod.addInstructions(
            addFloatIndex + 1,
            // ~25dp — matches the animated expanded target: 0.46 × e() row (54dp).
            // static/animated path flip on tab switch caused an ~11dp ghost/bounce.
            "const v$containerHeightRegister, 0x41C80000" // 25.0f
        )

        // --- 2b. v11: force the animated TopBarHeight target to ~4dp ---
        // On devices where We/c.a is false, b() skips the static height
        // modifier entirely and takes the :cond_6 branch instead, which
        // animates the bar height via LA/g;->b(target, spec, "TopBarHeight",
        // ...) with target = 1.0f (expanded) or 0.0f (collapsed). The static
        // overwrite above never executes on that path — this is why v8-v10
        // (8dp/4dp/1dp/0dp) produced no visible change on those devices.
        //
        // dn/Z's layout lambda computes barHeightPx = childHeightPx * target,
        // where childHeightPx is the 54/64dp e() row. The branch consts set
        // target = 1.0f (expanded) or 0.0f (collapsed by the scroll handler).
        // Patching the EXPANDED branch to 0.46 keeps the two-state behaviour:
        // ~25dp spacer (status-bar clearance) at the top of the feed, full
        // collapse while scrolled — a pinned constant (v11-v14) stopped the
        // collapse entirely, leaving the bar's dark background visible as a
        // black strip over scrolled content.
        val expandedTargetBits = 0x3EEB851F // 0.46f

        var topBarHeightIndex = addFloatIndex + 1
        var scannedHeight = 0
        while (scannedHeight <= 60) {
            val instr = containerMethod.getInstruction<Instruction>(topBarHeightIndex)
            if (instr.opcode == Opcode.CONST_STRING &&
                (instr as ReferenceInstruction).reference is StringReference &&
                ((instr as ReferenceInstruction).reference as StringReference).string ==
                "TopBarHeight"
            ) {
                break
            }
            topBarHeightIndex++
            scannedHeight++
        }
        require(scannedHeight <= 60) {
            "TopBar container: TopBarHeight animation call not found after ADD_FLOAT"
        }

        // --- 2c. v15: retarget the EXPANDED branch (1.0f -> 0.46f) ---
        // Two const/high16 1.0f consts live in this block: a scratch one for
        // the easing spec and the expanded-state animation target. Replace
        // the LAST one (the target branch); the collapsed branch stays 0.0f.
        // Replace (not insert) so no indices shift for the scans below.
        val oneFloatIndices = buildList {
            var i = addFloatIndex + 1
            while (i < topBarHeightIndex) {
                val instr = containerMethod.getInstruction<Instruction>(i)
                if (instr.opcode == Opcode.CONST_HIGH16 &&
                    (instr as NarrowLiteralInstruction).narrowLiteral == 0x3f800000
                ) {
                    add(i)
                }
                i++
            }
        }
        require(oneFloatIndices.size >= 2) {
            "TopBar container: expected the expanded/collapsed target branch after ADD_FLOAT"
        }
        val expandedBranchIndex = oneFloatIndices.last()
        val expandedRegister = containerMethod
            .getInstruction<OneRegisterInstruction>(expandedBranchIndex).registerA
        containerMethod.replaceInstruction(
            expandedBranchIndex,
            "const v$expandedRegister, $expandedTargetBits"
        )

        // --- 2d. v11: kill the collapse/expand animation (tab-switch bounce) ---
        // The animated path builds its tween via LA/n;->c(duration, delay, ...)
        // — 420ms when expanding, 240ms when collapsing. Tab switches can
        // retrigger these, bouncing the whole page. Zeroing the duration
        // register (v5) of each A/n.c call in this block makes every height
        // change instant. Collect all call sites first, then insert in
        // descending order so earlier indices stay valid.
        val durationCallIndices = buildList {
            var i = addFloatIndex + 1
            while (i < topBarHeightIndex) {
                val instr = containerMethod.getInstruction<Instruction>(i)
                if (instr.opcode == Opcode.INVOKE_STATIC) {
                    val ref = (instr as ReferenceInstruction).reference as? MethodReference
                    if (ref != null && ref.definingClass == "LA/n;" && ref.name == "c") {
                        add(i)
                    }
                }
                i++
            }
        }

        durationCallIndices.sortedDescending().forEach { index ->
            containerMethod.addInstructions(index, "const/4 v5, 0x0")
        }

        // --- 2d. v11: zero the 12dp padding field (vn/e0.d) ---
        // The static path applies .padding(vertical = d, horizontal = d)
        // AFTER its height modifier, so even at 0/4dp height it kept a 24dp
        // strip — the other half of the tab-switch bounce. e0.d has exactly
        // one consumer (the static-path padding), so zeroing it in <clinit>
        // aligns both paths with no other side effects.
        val clinitMethod = TopBarClinitFingerprint.method
        var sputDIndex = -1
        var scannedClinit = 0
        while (scannedClinit <= 40) {
            val instr = clinitMethod.getInstruction<Instruction>(scannedClinit)
            if (instr.opcode == Opcode.SPUT) {
                val fieldRef = (instr as ReferenceInstruction).reference as? FieldReference
                if (fieldRef != null &&
                    fieldRef.definingClass == "Lvn/e0;" &&
                    fieldRef.name == "d"
                ) {
                    sputDIndex = scannedClinit
                    break
                }
            }
            scannedClinit++
        }
        require(sputDIndex >= 0) {
            "TopBar clinit: sput of d:F not found"
        }
        val sputDRegister = clinitMethod
            .getInstruction<OneRegisterInstruction>(sputDIndex).registerA
        clinitMethod.addInstructions(sputDIndex, "const v$sputDRegister, 0x00000000")

        // --- 3. g$a: mid-feed scroll-up must not show the bar ---
        val scrollMethod = TopBarScrollFingerprint.method
        val scrollMatches = TopBarScrollFingerprint.instructionMatches
        val scrollShowIndex = scrollMatches[1].index

        // The B2 invoke takes (object, boolean); the boolean is the
        // second register used. Overwrite it with 0 just before the
        // invoke, so this one call becomes B2(false). The preceding
        // if-ge branches over both this invoke and the A2 after it,
        // so the inserted const is skipped exactly when the invoke is.
        val scrollInvoke =
            scrollMethod.getInstruction<FiveRegisterInstruction>(scrollShowIndex)
        val scrollUsedRegisters = listOf(
            scrollInvoke.registerC,
            scrollInvoke.registerD,
            scrollInvoke.registerE,
            scrollInvoke.registerF,
            scrollInvoke.registerG
        ).take(scrollInvoke.registerCount)
        val scrollArgRegister = scrollUsedRegisters[1]
        scrollMethod.addInstructions(
            scrollShowIndex,
            "const/4 v$scrollArgRegister, 0x0"
        )

        // --- 4. v8, old-layout approach: first-item scroll-up must
        //    not show the bar early either ---
        // In the old app the header was a feed widget, not a fixed
        // container: it scrolled away with the page and only came
        // back when the feed was back at the top. The new app's
        // first-item branch in the same j$a method is:
        //   index == 0:
        //     if (delta >= threshold) hide
        //     else if (delta <= -threshold || previousOffset == 0) show
        // The delta arm is what brings the bar back partway through
        // the first item, before the offset is actually 0 — the same
        // "padding comes up too early" feeling as the mid-feed arm.
        // Removing only that arm (nop-ing its if-le) leaves the
        // previousOffset == 0 arm untouched, so the bar still comes
        // back when the feed genuinely reaches the top, and it does
        // nothing else: if neither arm fires, B2 is simply left
        // unchanged, exactly as the original code did.
        //
        // The arm is located by pattern, not by hardcoded index:
        // neg-int (threshold -> -threshold) followed immediately by
        // if-le. This runs after the mid-feed insertion above, but
        // that insertion is at a later index (the -50 branch), so
        // the indices searched here are unaffected by it. The scan
        // is bounded to the whole method, which is only ~39
        // instructions, and fails clearly if the pattern is absent.
        var firstItemShowBranchIndex = -1
        var scanIndex = 0
        while (scanIndex < 100) {
            val opcode = try {
                scrollMethod.getInstruction<Instruction>(scanIndex).opcode
            } catch (e: Exception) {
                break
            }
            if (opcode == Opcode.NEG_INT) {
                val nextOpcode = try {
                    scrollMethod.getInstruction<Instruction>(scanIndex + 1).opcode
                } catch (e: Exception) {
                    null
                }
                if (nextOpcode == Opcode.IF_LE) {
                    firstItemShowBranchIndex = scanIndex + 1
                    break
                }
            }
            scanIndex++
        }
        require(firstItemShowBranchIndex >= 0) {
            "TopBar scroll: no neg-int + if-le first-item show branch found in j\$a (fingerprint matched the wrong method?)"
        }
        scrollMethod.replaceInstruction(firstItemShowBranchIndex, "nop")
    }
}
