package app.rutube.patches.subscription

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.Opcode

/**
 * The getter of the client side subscription flag.
 *
 * In 31.14.2 this is `Lsp0/b;->e()Z`, a two instruction accessor on an otherwise
 * obfuscated Kotlin data class:
 *
 *     iget-boolean v0, p0, Lsp0/b;->hasSubscription:Z
 *     return v0
 *
 * The class and method names are minified but the *field* name is not, so the field is
 * the anchor rather than the class. Only one class in the app declares a field with
 * this name.
 *
 * The same class also reads the field in `equals`, `hashCode` and `toString` (the
 * usual data class boilerplate), so the fingerprint additionally pins the accessor
 * shape: returns a boolean and takes no parameters. `equals` takes an Object,
 * `hashCode` returns an int and `toString` returns a String, so none of them match.
 */
object HasSubscriptionFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        fieldAccess(
            name = "hasSubscription",
            opcode = Opcode.IGET_BOOLEAN,
        ),
    ),
)
