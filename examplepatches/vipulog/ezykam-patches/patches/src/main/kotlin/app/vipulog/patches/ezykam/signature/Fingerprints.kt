package app.vipulog.patches.ezykam.signature

internal object Fingerprints {
    /**
     * Native security shared library responsible for runtime integrity and certificate validation.
     */
    const val SECURITY_LIBRARY_NAME = "libthing_security.so"

    /**
     * Relative archive path to the ARM64 (AArch64) build of the security library.
     */
    const val ARM64_SECURITY_LIBRARY_PATH = "lib/arm64-v8a/$SECURITY_LIBRARY_NAME"

    /**
     * Expected SHA-256 certificate fingerprint of the authentic published APK,
     * represented as 64 uppercase hexadecimal ASCII characters.
     */
    const val AUTHENTIC_CERTIFICATE_SHA256 =
        "92DF8895752E8CC0AA538A40D8CEDE425B6FA804CC9663AF7F987A483D713815"

    /**
     * Byte length of the ASCII-encoded SHA-256 hex string.
     */
    const val CERTIFICATE_FINGERPRINT_ASCII_LENGTH = 64

    /**
     * 16-byte machine code sequence in ARM64 `.text` that initializes the stack buffer
     * and invokes the certificate hash calculation subroutine:
     *
     *   add x24, sp, #0
     *   stp q0, q0, [sp]
     *   stp q0, q0, [sp, #32]
     *   bl  <calculate_certificate_hash>
     */
    const val CERTIFICATE_CHECK_PATTERN_HEX = "F8030091E00300ADE00301ADC9010094"

    /**
     * ARM64 general-purpose register X24 is assigned the pointer to the certificate
     * digest buffer in this function and preserved across the subsequent validation logic.
     */
    const val DIGIT_BUFFER_REGISTER = 24

    /**
     * Offset in bytes (+12) within the 16-byte pattern where the BL instruction resides.
     */
    const val BL_INSTRUCTION_OFFSET = 0x0C
}
