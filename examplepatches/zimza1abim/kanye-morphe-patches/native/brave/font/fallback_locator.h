#ifndef BRAVE_FONT_FALLBACK_LOCATOR_H
#define BRAVE_FONT_FALLBACK_LOCATOR_H

#include <stddef.h>
#include <stdint.h>
#include <string.h>

/* Recognize Next's dispatch and kFirstCandidate -> kOutOfLuck transition.
 * Derive registers, field offset, enum values and branch destinations from
 * instructions. No APK address, frame size or TLS/canary layout is assumed. */
static int validate_brave_fallback(const uint32_t *code, size_t bytes,
                                   size_t *stage_offset, int *system_stage) {
    size_t words = bytes / 4;
    if (words < 80 || code[0] != 0xd503233f ||
        (code[1] & 0xffc003ffu) != 0xd10003ffu) return 0;
    unsigned iterator = 31, hints = 31;
    for (size_t i = 2; i < 24; ++i) {
        if ((code[i] & 0xffffffe0u) == 0xaa0003e0u &&
            (code[i] & 31) >= 19 && (code[i] & 31) <= 28)
            iterator = code[i] & 31;
        if ((code[i] & 0xffffffe0u) == 0xaa0103e0u &&
            (code[i] & 31) >= 19 && (code[i] & 31) <= 28)
            hints = code[i] & 31;
    }
    if (iterator == 31 || hints == 31 || iterator == hints) return 0;
    unsigned matches = 0;
    size_t result_offset = 0;
    int result_stage = 0;
    for (size_t load = 2; load < 48; ++load) {
        uint32_t ins = code[load];
        if ((ins & 0xffc00000u) != 0xb9400000u ||
            ((ins >> 5) & 31) != iterator) continue;
        unsigned reg = ins & 31;
        size_t offset = ((ins >> 10) & 4095) * 4;
        if (!offset || offset > 256) continue;
        for (size_t cmp = load + 1; cmp + 5 < load + 16; ++cmp) {
            unsigned values[3];
            size_t targets[3];
            int valid = 1;
            for (unsigned j = 0; j < 3; ++j) {
                size_t at = cmp + j * 2;
                uint32_t compare = code[at], branch = code[at + 1];
                if ((compare & 0xffc003ffu) != (0x7100001fu | (reg << 5)) ||
                    (branch & 0xff00001fu) != 0x54000000u) { valid = 0; break; }
                values[j] = (compare >> 10) & 4095;
                int32_t delta = (int32_t)(branch << 8) >> 13;
                ptrdiff_t target = (ptrdiff_t)at + 1 + delta;
                if (target < 0 || (size_t)target + 32 >= words ||
                    target > 2048) { valid = 0; break; }
                targets[j] = (size_t)target;
            }
            if (!valid || values[0] < 2 || values[0] > 16 ||
                values[1] != values[0] + 1 || values[2] != values[1] + 1 ||
                targets[0] == targets[1] || targets[1] == targets[2]) continue;
            int hint_read = 0, exhausted_store = 0;
            for (size_t i = targets[0]; i < targets[0] + 8; ++i)
                if ((code[i] & 0xffc00000u) == 0xb9400000u &&
                    ((code[i] >> 5) & 31) == hints &&
                    ((code[i] >> 10) & 4095) > 0 &&
                    ((code[i] >> 10) & 4095) <= 16) hint_read = 1;
            for (size_t i = targets[1]; i + 1 < targets[1] + 32; ++i) {
                uint32_t move = code[i], store = code[i + 1];
                if ((move & 0xffe00000u) == 0x52800000u &&
                    ((move >> 5) & 65535) == values[2] &&
                    (store & 0xffc00000u) == 0xb9000000u &&
                    (store & 31) == (move & 31) &&
                    ((store >> 5) & 31) == iterator &&
                    ((store >> 10) & 4095) * 4 == offset) exhausted_store = 1;
            }
            if (!hint_read || !exhausted_store) continue;
            result_offset = offset;
            result_stage = (int)values[0];
            ++matches;
        }
    }
    if (matches != 1) return 0;
    *stage_offset = result_offset;
    *system_stage = result_stage;
    return 1;
}
#endif
