/* Host-only check: inspect an ELF as bytes; never execute target instructions.
 * Mirrors the Titanium 2.3.3 engine's FontFallbackIterator::Next locator
 * (FALLBACK_NEXT_PROLOGUE + validate_fallback_state_machine in fontism_hook.c).
 * The engine accepts one or two validated images that agree on their layout. */
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

typedef struct {
    uint32_t value;
    uint32_t mask;
} instruction_pattern;

static const instruction_pattern FALLBACK_NEXT_PROLOGUE[] = {
    {0xd503233f, 0xffffffff}, /* paciasp */
    {0xd10003ff, 0xffc003ff}, /* sub sp, sp, #imm */
    {0xa9000000, 0xffc00000}, {0xa9000000, 0xffc00000},
    {0xa9000000, 0xffc00000}, {0xa9000000, 0xffc00000},
    {0xa9000000, 0xffc00000}, {0xa9000000, 0xffc00000},
    {0x910003fd, 0xffc003ff}, /* add x29, sp, #imm */
    {0xd53bd040, 0xffffffe0}, /* mrs xN, TPIDR_EL0 */
    {0xaa0103e0, 0xffffffe0}, /* mov xN, x1 */
    {0xaa0003e0, 0xffffffe0}, /* mov xN, x0 (iterator) */
    {0xf9400000, 0xffc00000}, /* ldr xN, [xN, #imm] */
    {0x52800000, 0x7f800000}, /* movz wN, #kSystemFonts */
};
#define PROLOGUE_WORDS (sizeof(FALLBACK_NEXT_PROLOGUE) / sizeof(FALLBACK_NEXT_PROLOGUE[0]))

static int matches_fallback_prologue(const uint32_t *candidate) {
    for (size_t index = 0; index < PROLOGUE_WORDS; ++index) {
        uint32_t instruction;
        memcpy(&instruction, candidate + index, sizeof(instruction));
        if ((instruction & FALLBACK_NEXT_PROLOGUE[index].mask) !=
            FALLBACK_NEXT_PROLOGUE[index].value) return 0;
    }
    return 1;
}

static int validate_fallback_state_machine(const uint32_t *candidate, size_t available_bytes,
                                           size_t *stage_offset_out, int *system_stage_out) {
    const size_t scan_words = available_bytes / sizeof(uint32_t) < 128
            ? available_bytes / sizeof(uint32_t) : 128;
    if (scan_words <= PROLOGUE_WORDS + 1) return 0;

    uint32_t iterator_move;
    memcpy(&iterator_move, candidate + 11, sizeof(iterator_move));
    uint32_t iterator_register = iterator_move & 0x1f;
    uint16_t compared_stages[32] = {0};
    unsigned int compared_count = 0;
    unsigned int stage_store_matches = 0;
    size_t derived_stage_offset = 0;
    int out_of_luck_stage = -1;

    uint32_t system_move;
    memcpy(&system_move, candidate + 13, sizeof(system_move));
    unsigned int system_shift = ((system_move >> 21) & 1u) * 16u;
    int system_stage = (int)(((system_move >> 5) & 0xffffu) << system_shift);
    if (system_stage <= 0 || system_stage > 64) return 0;

    for (size_t index = PROLOGUE_WORDS; index + 1 < scan_words; ++index) {
        uint32_t instruction, next;
        memcpy(&instruction, candidate + index, sizeof(instruction));
        memcpy(&next, candidate + index + 1, sizeof(next));

        if ((instruction & 0xff00001fu) == 0x7100001fu &&
            compared_count < sizeof(compared_stages) / sizeof(compared_stages[0])) {
            unsigned int shift = ((instruction >> 22) & 1u) * 12u;
            compared_stages[compared_count++] =
                    (uint16_t)(((instruction >> 10) & 0xfffu) << shift);
        }

        /* movz wN,#kOutOfLuck; str wN,[iterator,#stage_offset] */
        if ((instruction & 0x7f800000u) == 0x52800000u &&
            (next & 0xffc00000) == 0xb9000000 &&
            (next & 0x1f) == (instruction & 0x1f) &&
            ((next >> 5) & 0x1f) == iterator_register) {
            size_t offset = (size_t)((next >> 10) & 0xfff) * 4;
            if (offset == 0 || offset > 256) continue;
            unsigned int shift = ((instruction >> 21) & 1u) * 16u;
            int stored_stage = (int)(((instruction >> 5) & 0xffffu) << shift);
            if (stored_stage <= system_stage || stored_stage > 64) continue;
            derived_stage_offset = offset;
            out_of_luck_stage = stored_stage;
            stage_store_matches++;
        }
    }
    int saw_final_compare = 0, saw_previous_compare = 0;
    for (unsigned int index = 0; index < compared_count; ++index) {
        if (compared_stages[index] == out_of_luck_stage) saw_final_compare = 1;
        if (compared_stages[index] + 1 == out_of_luck_stage) saw_previous_compare = 1;
    }
    if (stage_store_matches != 1 || out_of_luck_stage < 0 ||
        !saw_final_compare || !saw_previous_compare)
        return 0;
    *stage_offset_out = derived_stage_offset;
    *system_stage_out = system_stage;
    return 1;
}

int main(int argc, char **argv) {
    if (argc != 2) return 2;
    int fd = open(argv[1], O_RDONLY);
    struct stat st;
    if (fd < 0 || fstat(fd, &st) || st.st_size < 64) return 3;
    unsigned char *b = mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
    if (b == MAP_FAILED || memcmp(b, "\177ELF\2\1", 6)) return 4;
    uint64_t phoff; uint16_t count, stride;
    memcpy(&phoff, b + 32, 8); memcpy(&stride, b + 54, 2); memcpy(&count, b + 56, 2);
    if (stride < 56 || phoff > (uint64_t)st.st_size ||
        count > ((uint64_t)st.st_size - phoff) / stride) return 5;
    unsigned matches = 0;
    size_t first_field = 0; int first_stage = 0;
    for (unsigned s = 0; s < count; ++s) {
        const unsigned char *ph = b + phoff + s * stride;
        uint32_t type, flags; uint64_t offset, address, size;
        memcpy(&type, ph, 4); memcpy(&flags, ph + 4, 4);
        memcpy(&offset, ph + 8, 8); memcpy(&address, ph + 16, 8); memcpy(&size, ph + 32, 8);
        if (type != 1 || !(flags & 1) || size < 512) continue;
        if (offset > (uint64_t)st.st_size || size > (uint64_t)st.st_size - offset) return 6;
        for (uint64_t i = 0; i + 512 <= size; i += 4) {
            const uint32_t *candidate = (const uint32_t *)(b + offset + i);
            size_t field = 0; int stage = 0;
            if (!matches_fallback_prologue(candidate) ||
                !validate_fallback_state_machine(candidate, size - i, &field, &stage)) continue;
            printf("MATCH VA=0x%llx field=%zu system=%d\n",
                   (unsigned long long)(address + i), field, stage);
            if (matches == 0) { first_field = field; first_stage = stage; }
            else if (field != first_field || stage != first_stage) {
                printf("CANDIDATES_DISAGREE\n");
                return 11;
            }
            ++matches;
        }
    }
    printf("VALIDATED_MATCHES=%u\n", matches);
    munmap(b, st.st_size); close(fd);
    return matches >= 1 && matches <= 2 ? 0 : 10;
}
