/* Host-only check: inspect an ELF as bytes; never execute target instructions. */
#include "../../native/brave/font/fallback_locator.h"
#include <stdio.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

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
    for (unsigned s = 0; s < count; ++s) {
        const unsigned char *ph = b + phoff + s * stride;
        uint32_t type, flags; uint64_t offset, address, size;
        memcpy(&type, ph, 4); memcpy(&flags, ph + 4, 4);
        memcpy(&offset, ph + 8, 8); memcpy(&address, ph + 16, 8); memcpy(&size, ph + 32, 8);
        if (type != 1 || !(flags & 1)) continue;
        if (offset > (uint64_t)st.st_size || size > (uint64_t)st.st_size - offset) return 6;
        for (uint64_t i = 0; i + 320 <= size; i += 4) {
            const uint32_t *candidate = (const uint32_t *)(b + offset + i);
            size_t field = 0; int stage = 0;
            if (!validate_brave_fallback(candidate, size - i, &field, &stage)) continue;
            printf("MATCH VA=0x%llx field=%zu system=%d\n",
                   (unsigned long long)(address + i), field, stage);
            ++matches;
            /* Breaking the saved hint argument must reject the candidate. */
            size_t copy_bytes = size - i < 16384 ? size - i : 16384;
            uint32_t *mutated = malloc(copy_bytes);
            if (!mutated) return 7;
            memcpy(mutated, candidate, copy_bytes);
            for (unsigned j = 2; j < 24; ++j)
                if ((mutated[j] & 0xffffffe0u) == 0xaa0103e0u) mutated[j] = 0xd503201f;
            if (validate_brave_fallback(mutated, copy_bytes, &field, &stage)) return 8;
            free(mutated);
            /* Truncated input must be rejected before any branch target read. */
            if (validate_brave_fallback(candidate, 64, &field, &stage)) return 9;
        }
    }
    printf("VALIDATED_MATCHES=%u\n", matches);
    munmap(b, st.st_size); close(fd);
    return matches == 1 ? 0 : 10;
}
