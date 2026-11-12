#define _GNU_SOURCE

#include <android/log.h>
#include <stdbool.h>
#include <dirent.h>
#include <dlfcn.h>
#include <elf.h>
#include <errno.h>
#include <fcntl.h>
#include <jni.h>
#include <link.h>
#include <linux/memfd.h>
#include <stdint.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <sys/uio.h>
#include <unistd.h>

#include "shadowhook.h"
#include "fallback_locator.h"

/* Per-browser identity; build-arm64.sh overrides these for other Chromium ports. */
#ifndef LOG_TAG
#define LOG_TAG "BraveFontNative"
#endif
#ifndef FONTISM_ENGINE_VERSION
#define FONTISM_ENGINE_VERSION "2.3.3-brave1"
#endif
#ifndef FONTISM_BOOTSTRAP_CLASS
#define FONTISM_BOOTSTRAP_CLASS "app/fontism/extension/brave/BraveFontBootstrap"
#endif
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)

static const char SYSTEM_FONT_CONFIG[] = "/system/etc/fonts.xml";
static const char RUNTIME_FONT_NAME[] = "fontism-runtime.ttf";
static const char RUNTIME_FONT_FAMILY[] = "b23656-custom_font_family";
static int g_font_fd = -1;
static const unsigned char *g_font_mapping;
static size_t g_font_mapping_size;
static int g_font_mapping_fd = -1;
static int g_xml_fd = -1;
static int g_prepared;
static int g_activated;
static int g_shadowhook_ready;
static char g_font_path[64];
static char g_xml_path[64];
typedef void *(*fallback_next_function)(void *, const void *);
static void *g_fallback_hook_stubs[2];
static fallback_next_function g_original_fallback_next[2];
static size_t g_fallback_stage_offset;
static int g_system_fonts_stage;
typedef void *(*match_family_style_character_function)(
        const char *, const void *, const char *const *, int, uint32_t);
static void *g_match_hook_stubs[2];
static match_family_style_character_function
        g_original_match_family_style_character[2];
typedef void *(*match_family_style_function)(void *, const char *, const void *);
static void **g_font_manager_slots[2];
static size_t g_font_manager_match_style_offsets[2];
static unsigned int g_typeface_table_data_slot;
static int g_typeface_table_data_slot_resolved;
static size_t g_hint_data_offset;
static size_t g_hint_count_offset;
static int g_hint_layout_resolved;
static unsigned int g_loading_fallback_slot;
static int g_loading_fallback_slot_resolved;
static _Thread_local int g_force_custom_family;
static int g_logged_fallback_selection;
static int g_logged_match_substitution;
static int g_logged_ligature_preservation;
static int g_logged_ligature_probe_failure;
static int g_logged_loading_font_preservation;

typedef struct {
    uint32_t value;
    uint32_t mask;
} instruction_pattern;

/* Mask stack sizes, saved-register choices and destinations. Those are
   compiler details, not Blink ABI. The semantic validator below additionally
   requires the fallback stage 5/6 state machine and derives its field offset. */
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

static FILE *(*g_original_fopen)(const char *, const char *);
static int (*g_original_open)(const char *, int, ...);
static int (*g_original_open_2)(const char *, int);
static int (*g_original_openat_2)(int, const char *, int);

typedef struct {
    unsigned int chrome_images;
    unsigned int patched_imports;
} import_patch_context;

static int valid_sfnt_fd(int fd) {
    unsigned char header[4];
    struct stat metadata;
    if (fstat(fd, &metadata) != 0 || metadata.st_size < 12) return 0;
    if (pread(fd, header, sizeof(header), 0) != (ssize_t)sizeof(header)) return 0;
    return (header[0] == 0x00 && header[1] == 0x01 &&
            header[2] == 0x00 && header[3] == 0x00) ||
           memcmp(header, "OTTO", 4) == 0 ||
           memcmp(header, "ttcf", 4) == 0 ||
           memcmp(header, "true", 4) == 0;
}

static int find_inherited_font_fd(off_t expected_size) {
    DIR *directory = opendir("/proc/self/fd");
    if (directory == NULL) return -1;
    int directory_fd = dirfd(directory);
    int selected = -1;
    struct dirent *entry;
    while ((entry = readdir(directory)) != NULL) {
        char *end = NULL;
        long candidate = strtol(entry->d_name, &end, 10);
        if (end == entry->d_name || *end != '\0' || candidate < 0 ||
            candidate == directory_fd) continue;
        struct stat metadata;
        if (fstat((int)candidate, &metadata) == 0 &&
            metadata.st_size == expected_size && valid_sfnt_fd((int)candidate)) {
            selected = dup((int)candidate);
            break;
        }
    }
    closedir(directory);
    return selected;
}

static int find_registered_font_fd(off_t expected_size) {
    DIR *directory = opendir("/proc/self/fd");
    if (directory == NULL) return -1;
    int directory_fd = dirfd(directory);
    int selected = -1;
    struct dirent *entry;
    while ((entry = readdir(directory)) != NULL) {
        char *end = NULL;
        long candidate = strtol(entry->d_name, &end, 10);
        if (end == entry->d_name || *end != '\0' || candidate < 0 ||
            candidate == directory_fd) continue;
        struct stat metadata;
        if (fstat((int)candidate, &metadata) == 0 &&
            metadata.st_size == expected_size && valid_sfnt_fd((int)candidate)) {
            selected = (int)candidate;
            break;
        }
    }
    closedir(directory);
    return selected;
}

static int find_registered_config_fd(void) {
    DIR *directory = opendir("/proc/self/fd");
    if (directory == NULL) return -1;
    int directory_fd = dirfd(directory);
    int selected = -1;
    struct dirent *entry;
    while ((entry = readdir(directory)) != NULL) {
        char *end = NULL;
        long candidate = strtol(entry->d_name, &end, 10);
        if (end == entry->d_name || *end != '\0' || candidate < 0 ||
            candidate == directory_fd) continue;
        char fd_path[64];
        char target[256];
        snprintf(fd_path, sizeof(fd_path), "/proc/self/fd/%ld", candidate);
        ssize_t length = readlink(fd_path, target, sizeof(target) - 1);
        if (length <= 0) continue;
        target[length] = '\0';
        if (strstr(target, "fontism-fonts.xml") != NULL) {
            selected = (int)candidate;
            break;
        }
    }
    closedir(directory);
    return selected;
}

static int create_memory_file(const char *name) {
#if defined(__NR_memfd_create)
    return (int)syscall(__NR_memfd_create, name, MFD_CLOEXEC);
#else
    (void)name;
    errno = ENOSYS;
    return -1;
#endif
}

static int write_all(int fd, const char *data, size_t length) {
    size_t written = 0;
    while (written < length) {
        ssize_t result = write(fd, data + written, length - written);
        if (result < 0 && errno == EINTR) continue;
        if (result <= 0) return 0;
        written += (size_t)result;
    }
    return lseek(fd, 0, SEEK_SET) == 0;
}

static char *read_entire_file(const char *path, size_t *length_out) {
    int fd = open(path, O_RDONLY | O_CLOEXEC);
    if (fd < 0) return NULL;
    struct stat metadata;
    if (fstat(fd, &metadata) != 0 || metadata.st_size <= 0 ||
        metadata.st_size > 4 * 1024 * 1024) {
        close(fd);
        return NULL;
    }
    size_t length = (size_t)metadata.st_size;
    char *data = malloc(length + 1);
    if (data == NULL) {
        close(fd);
        return NULL;
    }
    size_t offset = 0;
    while (offset < length) {
        ssize_t result = read(fd, data + offset, length - offset);
        if (result < 0 && errno == EINTR) continue;
        if (result <= 0) {
            free(data);
            close(fd);
            return NULL;
        }
        offset += (size_t)result;
    }
    close(fd);
    data[length] = '\0';
    *length_out = length;
    return data;
}

static char *insert_custom_family(char *xml, size_t *xml_length,
                                  const char *font_path) {
    const char *family_set = strstr(xml, "<familyset");
    const char *opening_end = family_set == NULL ? NULL : strchr(family_set, '>');
    if (opening_end == NULL) return xml;
    opening_end++;

    char family[512];
    int written = snprintf(
            family, sizeof(family),
            "\n    <family name=\"%s\">\n"
            "        <font weight=\"400\" style=\"normal\">%s</font>\n"
            "    </family>\n",
            RUNTIME_FONT_FAMILY, font_path);
    if (written <= 0 || (size_t)written >= sizeof(family)) return xml;

    size_t prefix_length = (size_t)(opening_end - xml);
    size_t family_length = (size_t)written;
    if (*xml_length > SIZE_MAX - family_length - 1) return xml;
    char *updated = malloc(*xml_length + family_length + 1);
    if (updated == NULL) return xml;
    memcpy(updated, xml, prefix_length);
    memcpy(updated + prefix_length, family, family_length);
    memcpy(updated + prefix_length + family_length, opening_end,
           *xml_length - prefix_length + 1);
    free(xml);
    *xml_length += family_length;
    return updated;
}

static int rewrite_font_config(int target_fd, int exposed_font_fd,
                               size_t *xml_length_out) {
    (void)exposed_font_fd;

    size_t xml_length = 0;
    char *xml = read_entire_file(SYSTEM_FONT_CONFIG, &xml_length);
    if (xml == NULL) {
        LOGE("could not read original system fonts.xml: %s", strerror(errno));
        return 0;
    }
    char *original = xml;
    xml = insert_custom_family(xml, &xml_length, RUNTIME_FONT_NAME);
    if (xml == original) {
        LOGE("could not insert the custom family in system fonts.xml");
        free(xml);
        return 0;
    }
    if (ftruncate(target_fd, 0) != 0 || lseek(target_fd, 0, SEEK_SET) != 0 ||
        !write_all(target_fd, xml, xml_length)) {
        LOGE("could not rewrite in-memory fonts.xml: %s", strerror(errno));
        free(xml);
        return 0;
    }
    free(xml);
    if (xml_length_out != NULL) *xml_length_out = xml_length;
    LOGI("selected font registered once as named family %s",
         RUNTIME_FONT_FAMILY);
    return 1;
}

static int create_font_config(int exposed_font_fd) {
    g_xml_fd = create_memory_file("fontism-fonts.xml");
    if (g_xml_fd < 0) {
        LOGE("could not create in-memory fonts.xml: %s", strerror(errno));
        return 0;
    }

    /* Keep every system fallback, alias, emoji and symbol family intact.
       Replacing the complete config with three tiny families makes Chromium's
       fallback matcher recurse until a CHECK trap when a glyph is absent. */
    size_t xml_length = 0;
    if (!rewrite_font_config(g_xml_fd, exposed_font_fd, &xml_length)) {
        close(g_xml_fd);
        g_xml_fd = -1;
        return 0;
    }
    snprintf(g_xml_path, sizeof(g_xml_path), "/proc/self/fd/%d", g_xml_fd);
    if (strlen(g_xml_path) >= sizeof(SYSTEM_FONT_CONFIG)) {
        LOGE("in-memory fonts.xml path is too long: %s", g_xml_path);
        return 0;
    }
    LOGI("merged Skia font config prepared: %s -> font fd %d (%zu bytes)",
         g_xml_path, exposed_font_fd, xml_length);
    return 1;
}

static int prepare_fd(int font_fd) {
    if (g_prepared) {
        close(font_fd);
        return 1;
    }
    if (font_fd < 0 || !valid_sfnt_fd(font_fd)) {
        if (font_fd >= 0) close(font_fd);
        LOGE("invalid runtime font descriptor");
        return 0;
    }
    g_font_fd = font_fd;
    snprintf(g_font_path, sizeof(g_font_path), "/proc/self/fd/%d", g_font_fd);
    if (!create_font_config(g_font_fd)) {
        close(g_font_fd);
        g_font_fd = -1;
        return 0;
    }
    g_prepared = 1;
    LOGI("runtime font descriptor prepared: %s", g_font_path);
    return 1;
}

static jboolean native_prepare_fd(JNIEnv *env, jclass clazz, jint font_fd) {
    (void)env;
    (void)clazz;
    return prepare_fd(font_fd) ? JNI_TRUE : JNI_FALSE;
}

static jboolean native_prepare_inherited(JNIEnv *env, jclass clazz, jlong expected_size) {
    (void)env;
    (void)clazz;
    if (expected_size < 12) return JNI_FALSE;
    int font_fd = find_inherited_font_fd((off_t)expected_size);
    if (font_fd < 0) {
        LOGE("inherited font descriptor not found (size=%lld)", (long long)expected_size);
        return JNI_FALSE;
    }
    LOGI("found inherited Chromium font descriptor (size=%lld)",
         (long long)expected_size);
    return prepare_fd(font_fd) ? JNI_TRUE : JNI_FALSE;
}

static jint native_prepare_child_transport(JNIEnv *env, jclass clazz,
                                           jint borrowed_font_fd) {
    (void)env;
    (void)clazz;
    if (g_prepared || borrowed_font_fd < 0 || !valid_sfnt_fd(borrowed_font_fd)) {
        LOGE("could not prepare child descriptor transport");
        return -1;
    }
    g_font_fd = borrowed_font_fd;
    snprintf(g_font_path, sizeof(g_font_path), "/proc/self/fd/%d", g_font_fd);
    if (!create_font_config(borrowed_font_fd)) {
        g_font_fd = -1;
        return -1;
    }
    int transport_fd = g_xml_fd;
    g_xml_fd = -1;
    g_prepared = 1;
    LOGI("child descriptor transport prepared: font=%d config=%d",
         borrowed_font_fd, transport_fd);
    return transport_fd;
}

static jboolean native_rebind_registered_descriptors(JNIEnv *env, jclass clazz,
                                                     jlong expected_size) {
    (void)env;
    (void)clazz;
    if (!g_prepared || expected_size < 12) return JNI_FALSE;
    int font_fd = find_registered_font_fd((off_t)expected_size);
    int config_fd = find_registered_config_fd();
    if (font_fd < 0 || config_fd < 0) {
        LOGE("registered descriptors missing: font=%d config=%d", font_fd, config_fd);
        return JNI_FALSE;
    }
    size_t xml_length = 0;
    if (!rewrite_font_config(config_fd, font_fd, &xml_length)) return JNI_FALSE;
    g_font_fd = font_fd;
    g_xml_fd = config_fd;
    snprintf(g_font_path, sizeof(g_font_path), "/proc/self/fd/%d", g_font_fd);
    snprintf(g_xml_path, sizeof(g_xml_path), "/proc/self/fd/%d", g_xml_fd);
    LOGI("registered descriptors rebound: config=%s font=%s (%zu bytes)",
         g_xml_path, g_font_path, xml_length);
    return JNI_TRUE;
}

static int is_runtime_font_path(const char *path) {
    if (path == NULL) return 0;
    const char *base = strrchr(path, '/');
    base = base == NULL ? path : base + 1;
    return strcmp(base, RUNTIME_FONT_NAME) == 0;
}

static int duplicate_runtime_fd(int source_fd, const char *kind) {
    if (source_fd < 0) {
        errno = ENOENT;
        return -1;
    }
    int result = fcntl(source_fd, F_DUPFD_CLOEXEC, 0);
    if (result < 0) {
        LOGE("could not duplicate %s descriptor %d: %s",
             kind, source_fd, strerror(errno));
        return -1;
    }
    if (lseek(result, 0, SEEK_SET) < 0) {
        int saved_errno = errno;
        close(result);
        errno = saved_errno;
        return -1;
    }
    return result;
}

static FILE *fontism_fopen(const char *path, const char *mode) {
    int source_fd = -1;
    const char *kind = NULL;
    if (path != NULL && strcmp(path, SYSTEM_FONT_CONFIG) == 0) {
        source_fd = g_xml_fd;
        kind = "font config";
    } else if (is_runtime_font_path(path)) {
        source_fd = g_font_fd;
        kind = "runtime font";
    }
    if (kind != NULL) {
        int fd = duplicate_runtime_fd(source_fd, kind);
        if (fd < 0) return NULL;
        FILE *stream = fdopen(fd, mode == NULL ? "r" : mode);
        if (stream == NULL) close(fd);
        LOGI("served %s directly to Skia via fopen (source=%d copy=%d)",
             kind, source_fd, fd);
        return stream;
    }
    return g_original_fopen(path, mode);
}

static int fontism_open(const char *path, int flags, ...) {
    if ((path != NULL && strcmp(path, SYSTEM_FONT_CONFIG) == 0) ||
        is_runtime_font_path(path)) {
        return duplicate_runtime_fd(
                is_runtime_font_path(path) ? g_font_fd : g_xml_fd,
                is_runtime_font_path(path) ? "runtime font" : "font config");
    }
    if ((flags & O_CREAT) != 0) {
        va_list arguments;
        va_start(arguments, flags);
        mode_t mode = (mode_t)va_arg(arguments, int);
        va_end(arguments);
        return g_original_open(path, flags, mode);
    }
    return g_original_open(path, flags);
}

static int fontism_open_2(const char *path, int flags) {
    if ((path != NULL && strcmp(path, SYSTEM_FONT_CONFIG) == 0) ||
        is_runtime_font_path(path)) {
        return duplicate_runtime_fd(
                is_runtime_font_path(path) ? g_font_fd : g_xml_fd,
                is_runtime_font_path(path) ? "runtime font" : "font config");
    }
    return g_original_open_2(path, flags);
}

static int fontism_openat_2(int directory_fd, const char *path, int flags) {
    if ((path != NULL && strcmp(path, SYSTEM_FONT_CONFIG) == 0) ||
        is_runtime_font_path(path)) {
        return duplicate_runtime_fd(
                is_runtime_font_path(path) ? g_font_fd : g_xml_fd,
                is_runtime_font_path(path) ? "runtime font" : "font config");
    }
    return g_original_openat_2(directory_fd, path, flags);
}

static int patch_slot(void **slot, void *replacement, void **original) {
    long page_size = sysconf(_SC_PAGESIZE);
    if (page_size <= 0) return 0;
    uintptr_t page = (uintptr_t)slot & ~((uintptr_t)page_size - 1u);
    if (mprotect((void *)page, (size_t)page_size, PROT_READ | PROT_WRITE) != 0) {
        LOGE("could not unlock libchrome import slot: %s", strerror(errno));
        return 0;
    }
    if (*original == NULL) *original = *slot;
    __atomic_store_n(slot, replacement, __ATOMIC_RELEASE);
    if (mprotect((void *)page, (size_t)page_size, PROT_READ) != 0) {
        LOGE("could not restore libchrome RELRO protection: %s", strerror(errno));
    }
    return 1;
}

static int patch_chrome_file_imports(struct dl_phdr_info *info, size_t size,
                                     void *opaque) {
    (void)size;
    import_patch_context *context = (import_patch_context *)opaque;
    if (info->dlpi_name == NULL || strstr(info->dlpi_name, "libchrome.so") == NULL) {
        return 0;
    }
    context->chrome_images++;

    const ElfW(Dyn) *dynamic = NULL;
    for (ElfW(Half) index = 0; index < info->dlpi_phnum; ++index) {
        if (info->dlpi_phdr[index].p_type == PT_DYNAMIC) {
            dynamic = (const ElfW(Dyn) *)(info->dlpi_addr +
                                          info->dlpi_phdr[index].p_vaddr);
            break;
        }
    }
    if (dynamic == NULL) return 0;

    const ElfW(Sym) *symbols = NULL;
    const char *strings = NULL;
    const ElfW(Rela) *relocations = NULL;
    size_t relocation_bytes = 0;
    for (const ElfW(Dyn) *entry = dynamic; entry->d_tag != DT_NULL; ++entry) {
        switch (entry->d_tag) {
            case DT_SYMTAB:
                symbols = (const ElfW(Sym) *)(info->dlpi_addr + entry->d_un.d_ptr);
                break;
            case DT_STRTAB:
                strings = (const char *)(info->dlpi_addr + entry->d_un.d_ptr);
                break;
            case DT_JMPREL:
                relocations = (const ElfW(Rela) *)(info->dlpi_addr + entry->d_un.d_ptr);
                break;
            case DT_PLTRELSZ:
                relocation_bytes = (size_t)entry->d_un.d_val;
                break;
            default:
                break;
        }
    }
    if (symbols == NULL || strings == NULL || relocations == NULL) return 0;

    size_t count = relocation_bytes / sizeof(ElfW(Rela));
    for (size_t index = 0; index < count; ++index) {
        const ElfW(Rela) *relocation = &relocations[index];
        size_t symbol_index = (size_t)ELF64_R_SYM(relocation->r_info);
        const char *name = strings + symbols[symbol_index].st_name;
        void **slot = (void **)(info->dlpi_addr + relocation->r_offset);
        if (strcmp(name, "fopen") == 0) {
            context->patched_imports += patch_slot(
                    slot, (void *)fontism_fopen, (void **)&g_original_fopen);
        } else if (strcmp(name, "open") == 0) {
            context->patched_imports += patch_slot(
                    slot, (void *)fontism_open, (void **)&g_original_open);
        } else if (strcmp(name, "__open_2") == 0) {
            context->patched_imports += patch_slot(
                    slot, (void *)fontism_open_2, (void **)&g_original_open_2);
        } else if (strcmp(name, "__openat_2") == 0) {
            context->patched_imports += patch_slot(
                    slot, (void *)fontism_openat_2, (void **)&g_original_openat_2);
        }
    }
    return 0;
}

typedef struct {
    void *addresses[8];
    size_t stage_offsets[8];
    int system_stages[8];
    unsigned int matches;
    unsigned int duplicate_matches;
    unsigned int overflow;
} fallback_scan_context;

static int matches_fallback_prologue(const uint32_t *candidate) {
    size_t count = sizeof(FALLBACK_NEXT_PROLOGUE) /
                   sizeof(FALLBACK_NEXT_PROLOGUE[0]);
    for (size_t index = 0; index < count; ++index) {
        uint32_t instruction;
        memcpy(&instruction, candidate + index, sizeof(instruction));
        if ((instruction & FALLBACK_NEXT_PROLOGUE[index].mask) !=
            FALLBACK_NEXT_PROLOGUE[index].value) return 0;
    }
    return 1;
}

static int validate_fallback_state_machine(const uint32_t *candidate,
                                           size_t available_bytes,
                                           size_t *stage_offset_out,
                                           int *system_stage_out) {
    const size_t scan_words = available_bytes / sizeof(uint32_t) < 128
            ? available_bytes / sizeof(uint32_t) : 128;
    const size_t prologue_words = sizeof(FALLBACK_NEXT_PROLOGUE) /
                                  sizeof(FALLBACK_NEXT_PROLOGUE[0]);
    if (scan_words <= prologue_words + 1) return 0;

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

    for (size_t index = prologue_words; index + 1 < scan_words; ++index) {
        uint32_t instruction;
        uint32_t next;
        memcpy(&instruction, candidate + index, sizeof(instruction));
        memcpy(&next, candidate + index + 1, sizeof(next));

        if ((instruction & 0xff00001fu) == 0x7100001fu &&
            compared_count < sizeof(compared_stages) /
                                     sizeof(compared_stages[0])) {
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
            int stored_stage =
                    (int)(((instruction >> 5) & 0xffffu) << shift);
            if (stored_stage <= system_stage || stored_stage > 64) continue;
            derived_stage_offset = offset;
            out_of_luck_stage = stored_stage;
            stage_store_matches++;
        }
    }
    int saw_final_compare = 0;
    int saw_previous_compare = 0;
    for (unsigned int index = 0; index < compared_count; ++index) {
        if (compared_stages[index] == out_of_luck_stage)
            saw_final_compare = 1;
        if (compared_stages[index] + 1 == out_of_luck_stage)
            saw_previous_compare = 1;
    }
    if (stage_store_matches != 1 || out_of_luck_stage < 0 ||
        !saw_final_compare || !saw_previous_compare)
        return 0;
    *stage_offset_out = derived_stage_offset;
    *system_stage_out = system_stage;
    return 1;
}

static int find_fallback_next(struct dl_phdr_info *info, size_t size,
                              void *opaque) {
    (void)size;
    fallback_scan_context *context = (fallback_scan_context *)opaque;
    if (info->dlpi_name == NULL || strstr(info->dlpi_name, "libchrome.so") == NULL) {
        return 0;
    }
    for (ElfW(Half) index = 0; index < info->dlpi_phnum; ++index) {
        const ElfW(Phdr) *segment = &info->dlpi_phdr[index];
        if (segment->p_type != PT_LOAD || (segment->p_flags & PF_X) == 0 ||
            segment->p_memsz < 512) continue;
        const unsigned char *begin = (const unsigned char *)(
                info->dlpi_addr + segment->p_vaddr);
        const unsigned char *segment_end = begin + segment->p_memsz;
        const unsigned char *end = segment_end - 512 + 1;
        for (const unsigned char *candidate = begin; candidate < end;
             candidate += 4) {
            size_t stage_offset = 0;
            int system_stage = 0;
            if (validate_brave_fallback((const uint32_t *)candidate,
                        (size_t)(segment_end - candidate), &stage_offset,
                        &system_stage)) {
                int duplicate = 0;
                for (unsigned int match = 0; match < context->matches; ++match) {
                    if (context->addresses[match] == (void *)candidate) {
                        duplicate = 1;
                        break;
                    }
                }
                if (duplicate) {
                    context->duplicate_matches++;
                    continue;
                }
                if (context->matches >=
                    sizeof(context->addresses) / sizeof(context->addresses[0])) {
                    context->overflow = 1;
                    continue;
                }
                context->addresses[context->matches] = (void *)candidate;
                context->stage_offsets[context->matches] = stage_offset;
                context->system_stages[context->matches] = system_stage;
                context->matches++;
            }
        }
    }
    return 0;
}

typedef struct {
    void *addresses[8];
    unsigned int matches;
    unsigned int overflow;
} match_scan_context;

static uintptr_t decode_adrp_page(uintptr_t instruction_address,
                                  uint32_t instruction) {
    int64_t immediate = (int64_t)((((instruction >> 5) & 0x7ffffu) << 2) |
                                  ((instruction >> 29) & 0x3u));
    if ((immediate & (1 << 20)) != 0) immediate -= (1 << 21);
    return (instruction_address & ~(uintptr_t)0xfff) +
           (uintptr_t)(immediate << 12);
}

static int decode_ldr_x_unsigned(uint32_t instruction, unsigned int *target,
                                 unsigned int *base, size_t *offset) {
    if ((instruction & 0xffc00000u) != 0xf9400000u) return 0;
    *target = instruction & 0x1fu;
    *base = (instruction >> 5) & 0x1fu;
    *offset = (size_t)((instruction >> 10) & 0xfffu) * 8u;
    return 1;
}

static int decode_ldrsw_x_unsigned(uint32_t instruction,
                                   unsigned int *target,
                                   unsigned int *base, size_t *offset) {
    if ((instruction & 0xffc00000u) != 0xb9800000u) return 0;
    *target = instruction & 0x1fu;
    *base = (instruction >> 5) & 0x1fu;
    *offset = (size_t)((instruction >> 10) & 0xfffu) * 4u;
    return 1;
}

static int decode_add_x_register(uint32_t instruction, unsigned int *target,
                                 unsigned int *left, unsigned int *right) {
    if ((instruction & 0xff20fc00u) != 0x8b000000u) return 0;
    *target = instruction & 0x1fu;
    *left = (instruction >> 5) & 0x1fu;
    *right = (instruction >> 16) & 0x1fu;
    return 1;
}

static int decode_indirect_branch(uint32_t instruction,
                                  unsigned int *target) {
    if ((instruction & 0xfffffc1fu) != 0xd63f0000u &&
        (instruction & 0xfffffc1fu) != 0xd61f0000u)
        return 0;
    *target = (instruction >> 5) & 0x1fu;
    return 1;
}

/* Resolve a Clang relative-vtable call without assuming where the compiler
   placed it inside the containing function. */
static int find_relative_vcall(const uint32_t *instructions, size_t words,
                               int required_object_register,
                               size_t *vtable_offset_out) {
    for (size_t load_index = 0; load_index < words; ++load_index) {
        uint32_t load;
        memcpy(&load, instructions + load_index, sizeof(load));
        unsigned int vtable_register;
        unsigned int object_register;
        size_t object_offset;
        if (!decode_ldr_x_unsigned(load, &vtable_register, &object_register,
                                   &object_offset) || object_offset != 0 ||
            (required_object_register >= 0 &&
             object_register != (unsigned int)required_object_register))
            continue;

        size_t method_limit = load_index + 8 < words
                ? load_index + 8 : words;
        for (size_t method_index = load_index + 1;
             method_index < method_limit; ++method_index) {
            uint32_t method_load;
            memcpy(&method_load, instructions + method_index,
                   sizeof(method_load));
            unsigned int relative_register;
            unsigned int relative_base;
            size_t vtable_offset;
            if (!decode_ldrsw_x_unsigned(method_load, &relative_register,
                                         &relative_base, &vtable_offset) ||
                relative_base != vtable_register ||
                vtable_offset < 8 || vtable_offset > 512)
                continue;

            size_t add_limit = method_index + 6 < words
                    ? method_index + 6 : words;
            for (size_t add_index = method_index + 1;
                 add_index < add_limit; ++add_index) {
                uint32_t add;
                memcpy(&add, instructions + add_index, sizeof(add));
                unsigned int call_register;
                unsigned int left;
                unsigned int right;
                if (!decode_add_x_register(add, &call_register, &left,
                                           &right) ||
                    !((left == vtable_register &&
                       right == relative_register) ||
                      (right == vtable_register &&
                       left == relative_register)))
                    continue;

                size_t branch_limit = add_index + 5 < words
                        ? add_index + 5 : words;
                for (size_t branch_index = add_index + 1;
                     branch_index < branch_limit; ++branch_index) {
                    uint32_t branch;
                    memcpy(&branch, instructions + branch_index,
                           sizeof(branch));
                    unsigned int branch_register;
                    if (decode_indirect_branch(branch, &branch_register) &&
                        branch_register == call_register) {
                        *vtable_offset_out = vtable_offset;
                        return 1;
                    }
                }
            }
        }
    }
    return 0;
}

static void *find_containing_function(const uint32_t *reference,
                                      const uint32_t *executable_begin) {
    const size_t max_words = 1024 / sizeof(uint32_t);
    const uint32_t *limit = reference > executable_begin + max_words
            ? reference - max_words : executable_begin;
    for (const uint32_t *candidate = reference;; --candidate) {
        uint32_t first;
        uint32_t second;
        uint32_t third;
        memcpy(&first, candidate, sizeof(first));
        if (first == 0xd503233f) { /* paciasp */
            memcpy(&second, candidate + 1, sizeof(second));
            memcpy(&third, candidate + 2, sizeof(third));
            if ((second & 0xffc003ff) == 0xd10003ff &&
                (third & 0xffc07fff) == 0xa9007bfd) {
                return (void *)candidate;
            }
        }
        if (candidate == limit) break;
    }
    return NULL;
}

static int find_match_family_style_character(struct dl_phdr_info *info,
                                             size_t size, void *opaque) {
    (void)size;
    static const char metric[] =
            "Blink.Fonts.MatchFamilyStyleCharacter.Duration";
    match_scan_context *context = (match_scan_context *)opaque;
    if (info->dlpi_name == NULL || strstr(info->dlpi_name, "libchrome.so") == NULL)
        return 0;

    const unsigned char *metric_address = NULL;
    for (ElfW(Half) index = 0; index < info->dlpi_phnum; ++index) {
        const ElfW(Phdr) *segment = &info->dlpi_phdr[index];
        /* Android's monolithic libchrome maps .rodata and .text in the same
           readable+executable PT_LOAD. Requiring a non-executable rodata
           segment therefore hides the metric anchor at runtime. */
        if (segment->p_type != PT_LOAD || (segment->p_flags & PF_R) == 0 ||
            segment->p_memsz < sizeof(metric))
            continue;
        const unsigned char *begin = (const unsigned char *)(
                info->dlpi_addr + segment->p_vaddr);
        metric_address = memmem(begin, segment->p_memsz,
                                metric, sizeof(metric) - 1);
        if (metric_address != NULL) break;
    }
    if (metric_address == NULL) return 0;

    for (ElfW(Half) index = 0; index < info->dlpi_phnum; ++index) {
        const ElfW(Phdr) *segment = &info->dlpi_phdr[index];
        if (segment->p_type != PT_LOAD || (segment->p_flags & PF_X) == 0 ||
            segment->p_memsz < 16) continue;
        const uint32_t *begin = (const uint32_t *)(
                info->dlpi_addr + segment->p_vaddr);
        const uint32_t *end = (const uint32_t *)((const unsigned char *)begin +
                                                 segment->p_memsz - 8);
        for (const uint32_t *candidate = begin; candidate < end; ++candidate) {
            uint32_t adrp;
            uint32_t add;
            memcpy(&adrp, candidate, sizeof(adrp));
            memcpy(&add, candidate + 1, sizeof(add));
            if ((adrp & 0x9f00001f) != 0x90000000 ||
                (add & 0xffc003ff) != 0x91000000) continue;
            uintptr_t address = decode_adrp_page((uintptr_t)candidate, adrp) +
                    (uintptr_t)((add >> 10) & 0xfff);
            if (address != (uintptr_t)metric_address) continue;
            void *function = find_containing_function(candidate, begin);
            if (function == NULL) continue;
            for (unsigned int match = 0; match < context->matches; ++match) {
                if (context->addresses[match] == function) return 0;
            }
            if (context->matches >=
                sizeof(context->addresses) / sizeof(context->addresses[0])) {
                context->overflow = 1;
                return 0;
            }
            context->addresses[context->matches++] = function;
            return 0;
        }
    }
    return 0;
}

static int is_han_character(uint32_t codepoint) {
    return (codepoint >= 0x2e80 && codepoint <= 0x2fdf) ||
           (codepoint >= 0x31c0 && codepoint <= 0x31ef) ||
           (codepoint >= 0x3400 && codepoint <= 0x4dbf) ||
           (codepoint >= 0x4e00 && codepoint <= 0x9fff) ||
           (codepoint >= 0xf900 && codepoint <= 0xfaff) ||
           (codepoint >= 0x20000 && codepoint <= 0x2ee5f) ||
           (codepoint >= 0x2f800 && codepoint <= 0x2fa1f) ||
           (codepoint >= 0x30000 && codepoint <= 0x323af);
}

static int is_private_use_icon(uint32_t codepoint) {
    return (codepoint >= 0xe000 && codepoint <= 0xf8ff) ||
           (codepoint >= 0xf0000 && codepoint <= 0xffffd) ||
           (codepoint >= 0x100000 && codepoint <= 0x10fffd);
}

static uint16_t read_be16(const unsigned char *data) {
    return (uint16_t)(((uint16_t)data[0] << 8) | data[1]);
}

static uint32_t read_be32(const unsigned char *data) {
    return ((uint32_t)data[0] << 24) | ((uint32_t)data[1] << 16) |
           ((uint32_t)data[2] << 8) | data[3];
}

static int read_font_bytes(off_t offset, void *buffer, size_t length) {
    if (g_font_fd < 0 || offset < 0) return 0;
    if (g_font_mapping == NULL || g_font_mapping_fd != g_font_fd) {
        struct stat metadata;
        if (fstat(g_font_fd, &metadata) != 0 || metadata.st_size <= 0)
            return 0;
        void *mapping = mmap(NULL, (size_t)metadata.st_size, PROT_READ,
                             MAP_PRIVATE, g_font_fd, 0);
        if (mapping == MAP_FAILED) return 0;
        g_font_mapping = mapping;
        g_font_mapping_size = (size_t)metadata.st_size;
        g_font_mapping_fd = g_font_fd;
    }
    if ((uint64_t)offset > g_font_mapping_size ||
        length > g_font_mapping_size - (size_t)offset) return 0;
    memcpy(buffer, g_font_mapping + offset, length);
    return 1;
}

static int cmap_format4_has_glyph(off_t table, uint32_t codepoint) {
    if (codepoint > 0xffff) return 0;
    unsigned char header[14];
    if (!read_font_bytes(table, header, sizeof(header))) return 0;
    uint16_t length = read_be16(header + 2);
    uint16_t segment_count = read_be16(header + 6) / 2;
    if (length < 16 || segment_count == 0 || segment_count > 4096) return 0;
    unsigned char *data = NULL;
    if (g_font_mapping != NULL && table >= 0 &&
        (uint64_t)table <= g_font_mapping_size &&
        length <= g_font_mapping_size - (size_t)table)
        data = (unsigned char *)g_font_mapping + table;
    if (data == NULL) return 0;
    size_t end_codes = 14;
    size_t start_codes = end_codes + segment_count * 2 + 2;
    size_t deltas = start_codes + segment_count * 2;
    size_t range_offsets = deltas + segment_count * 2;
    int found = 0;
    if (range_offsets + segment_count * 2 <= length) {
        for (uint16_t index = 0; index < segment_count; ++index) {
            uint16_t end = read_be16(data + end_codes + index * 2);
            uint16_t start = read_be16(data + start_codes + index * 2);
            if (codepoint < start || codepoint > end) continue;
            int16_t delta = (int16_t)read_be16(data + deltas + index * 2);
            uint16_t range = read_be16(data + range_offsets + index * 2);
            uint16_t glyph = 0;
            if (range == 0) {
                glyph = (uint16_t)((codepoint + delta) & 0xffff);
            } else {
                size_t position = range_offsets + index * 2 + range +
                                  (codepoint - start) * 2;
                if (position + 2 <= length) {
                    glyph = read_be16(data + position);
                    if (glyph != 0)
                        glyph = (uint16_t)((glyph + delta) & 0xffff);
                }
            }
            found = glyph != 0;
            break;
        }
    }
    return found;
}

static int cmap_group_has_glyph(off_t table, uint32_t codepoint) {
    unsigned char header[16];
    if (!read_font_bytes(table, header, sizeof(header))) return 0;
    uint32_t groups = read_be32(header + 12);
    if (groups == 0 || groups > 0x100000) return 0;
    uint32_t low = 0;
    uint32_t high = groups;
    while (low < high) {
        uint32_t middle = low + (high - low) / 2;
        unsigned char group[12];
        if (!read_font_bytes(table + 16 + (off_t)middle * 12,
                             group, sizeof(group))) return 0;
        uint32_t start = read_be32(group);
        uint32_t end = read_be32(group + 4);
        if (codepoint < start) high = middle;
        else if (codepoint > end) low = middle + 1;
        else {
            uint32_t start_glyph = read_be32(group + 8);
            return start_glyph != 0 || codepoint != start;
        }
    }
    return 0;
}

static int custom_font_has_glyph(uint32_t codepoint) {
    unsigned char offset_header[12];
    off_t face = 0;
    if (!read_font_bytes(0, offset_header, sizeof(offset_header))) return 0;
    if (memcmp(offset_header, "ttcf", 4) == 0) {
        unsigned char first_offset[4];
        if (read_be32(offset_header + 8) == 0 ||
            !read_font_bytes(12, first_offset, sizeof(first_offset))) return 0;
        face = (off_t)read_be32(first_offset);
        if (!read_font_bytes(face, offset_header, sizeof(offset_header))) return 0;
    }
    uint16_t tables = read_be16(offset_header + 4);
    if (tables == 0 || tables > 4096) return 0;
    off_t cmap = -1;
    for (uint16_t index = 0; index < tables; ++index) {
        unsigned char record[16];
        if (!read_font_bytes(face + 12 + (off_t)index * 16,
                             record, sizeof(record))) return 0;
        if (memcmp(record, "cmap", 4) == 0) {
            cmap = face + (off_t)read_be32(record + 8);
            break;
        }
    }
    if (cmap < 0) return 0;
    unsigned char cmap_header[4];
    if (!read_font_bytes(cmap, cmap_header, sizeof(cmap_header))) return 0;
    uint16_t subtables = read_be16(cmap_header + 2);
    if (subtables == 0 || subtables > 256) return 0;
    off_t format4 = -1;
    for (uint16_t index = 0; index < subtables; ++index) {
        unsigned char encoding[8];
        if (!read_font_bytes(cmap + 4 + (off_t)index * 8,
                             encoding, sizeof(encoding))) return 0;
        off_t subtable = cmap + (off_t)read_be32(encoding + 4);
        unsigned char format_bytes[2];
        if (!read_font_bytes(subtable, format_bytes, sizeof(format_bytes)))
            continue;
        uint16_t format = read_be16(format_bytes);
        if (format == 12 || format == 13) {
            if (cmap_group_has_glyph(subtable, codepoint)) return 1;
        } else if (format == 4) {
            format4 = subtable;
        }
    }
    return format4 >= 0 && cmap_format4_has_glyph(format4, codepoint);
}

static int is_default_emoji_presentation(uint32_t codepoint) {
    return (codepoint >= 0x1f000 && codepoint <= 0x1faff) ||
           (codepoint >= 0x231a && codepoint <= 0x231b) ||
           (codepoint >= 0x23e9 && codepoint <= 0x23ec) ||
           codepoint == 0x23f0 || codepoint == 0x23f3 ||
           (codepoint >= 0x25fd && codepoint <= 0x25fe) ||
           (codepoint >= 0x2614 && codepoint <= 0x2615) ||
           (codepoint >= 0x2648 && codepoint <= 0x2653) ||
           codepoint == 0x267f || codepoint == 0x2693 ||
           codepoint == 0x26a1 ||
           (codepoint >= 0x26aa && codepoint <= 0x26ab) ||
           (codepoint >= 0x26bd && codepoint <= 0x26be) ||
           (codepoint >= 0x26c4 && codepoint <= 0x26c5) ||
           codepoint == 0x26ce || codepoint == 0x26d4 ||
           codepoint == 0x26ea ||
           (codepoint >= 0x26f2 && codepoint <= 0x26f3) ||
           codepoint == 0x26f5 || codepoint == 0x26fa ||
           codepoint == 0x26fd || codepoint == 0x2705 ||
           (codepoint >= 0x270a && codepoint <= 0x270b) ||
           codepoint == 0x2728 || codepoint == 0x274c ||
           codepoint == 0x274e ||
           (codepoint >= 0x2753 && codepoint <= 0x2755) ||
           codepoint == 0x2757 ||
           (codepoint >= 0x2795 && codepoint <= 0x2797) ||
           codepoint == 0x27b0 || codepoint == 0x27bf ||
           (codepoint >= 0x2b1b && codepoint <= 0x2b1c) ||
           codepoint == 0x2b50 || codepoint == 0x2b55;
}

static int is_emoji_sequence_control(uint32_t codepoint) {
    return codepoint == 0x200d || codepoint == 0x20e3 ||
           codepoint == 0xfe0e || codepoint == 0xfe0f ||
           (codepoint >= 0xe0100 && codepoint <= 0xe01ef);
}

static int is_emoji_or_icon(uint32_t codepoint) {
    return is_default_emoji_presentation(codepoint) ||
           is_emoji_sequence_control(codepoint);
}

static int use_selected_font(uint32_t codepoint) {
    return codepoint <= 0x10ffff && !is_han_character(codepoint) &&
           !is_emoji_or_icon(codepoint);
}

static int safe_process_copy(void *destination, const void *source,
                             size_t length) {
    if (destination == NULL || source == NULL || length == 0) return 0;
    struct iovec local = {destination, length};
    struct iovec remote = {(void *)source, length};
#if defined(__NR_process_vm_readv)
    return syscall(__NR_process_vm_readv, getpid(), &local, 1, &remote, 1, 0) ==
           (ssize_t)length;
#else
    return 0;
#endif
}

static void *relative_vtable_method(uintptr_t object, size_t byte_offset) {
    uintptr_t vtable = 0;
    int32_t relative_method = 0;
    if (object == 0 || byte_offset > 512 ||
        !safe_process_copy(&vtable, (const void *)object, sizeof(vtable)) ||
        vtable == 0 ||
        !safe_process_copy(&relative_method,
                           (const char *)vtable + byte_offset,
                           sizeof(relative_method)) ||
        relative_method == 0)
        return NULL;
    void *method = (char *)vtable + relative_method;
    Dl_info info;
    if (dladdr(method, &info) == 0 || info.dli_fname == NULL ||
        strstr(info.dli_fname, "libchrome.so") == NULL)
        return NULL;
    return method;
}

static int object_has_chromium_relative_vtable(uintptr_t object) {
    unsigned int valid = 0;
    for (size_t offset = 0; offset < 48; offset += sizeof(int32_t)) {
        if (relative_vtable_method(object, offset) != NULL) valid++;
    }
    return valid >= 6;
}

static int valid_hint_codepoints(const uint32_t *hints, uint32_t count) {
    uint32_t sample_count = count < 32 ? count : 32;
    uint32_t sample[32];
    if (sample_count == 0 ||
        !safe_process_copy(sample, hints,
                           (size_t)sample_count * sizeof(uint32_t)))
        return 0;
    for (uint32_t index = 0; index < sample_count; ++index) {
        uint32_t codepoint = sample[index];
        if (codepoint > 0x10ffffu ||
            (codepoint >= 0xd800u && codepoint <= 0xdfffu))
            return 0;
    }
    return 1;
}

/* Blink passes a vector-like character hint object. Discover its backing data
   and size fields from the live object instead of assuming libc++/WTF's +12
   size member. The adjacent capacity/size pair and sampled Unicode scalars
   make accidental matches unlikely. */
static int read_hint_span(const void *hint_list, const uint32_t **hints_out,
                          uint32_t *count_out) {
    if (hint_list == NULL) return 0;
    unsigned char object[48];
    if (!safe_process_copy(object, hint_list, sizeof(object))) return 0;
    if (g_hint_layout_resolved) {
        const uint32_t *hints = NULL;
        uint32_t count = 0;
        memcpy(&hints, object + g_hint_data_offset, sizeof(hints));
        memcpy(&count, object + g_hint_count_offset, sizeof(count));
        if (hints == NULL || count == 0 || count > 4096 ||
            !valid_hint_codepoints(hints, count))
            return 0;
        *hints_out = hints;
        *count_out = count;
        return 1;
    }

    const uint32_t *selected_hints = NULL;
    uint32_t selected_count = 0;
    size_t selected_data_offset = 0;
    size_t selected_count_offset = 0;
    unsigned int matches = 0;
    for (size_t data_offset = 0;
         data_offset + sizeof(uintptr_t) <= sizeof(object);
         data_offset += sizeof(uintptr_t)) {
        const uint32_t *hints = NULL;
        memcpy(&hints, object + data_offset, sizeof(hints));
        if (hints == NULL) continue;
        for (size_t capacity_offset = 0;
             capacity_offset + 2 * sizeof(uint32_t) <= sizeof(object);
             capacity_offset += sizeof(uint32_t)) {
            if ((capacity_offset >= data_offset &&
                 capacity_offset < data_offset + sizeof(uintptr_t)) ||
                (capacity_offset + sizeof(uint32_t) >= data_offset &&
                 capacity_offset + sizeof(uint32_t) <
                         data_offset + sizeof(uintptr_t)))
                continue;
            uint32_t capacity = 0;
            uint32_t count = 0;
            memcpy(&capacity, object + capacity_offset, sizeof(capacity));
            memcpy(&count, object + capacity_offset + sizeof(uint32_t),
                   sizeof(count));
            if (count == 0 || count > 4096 || capacity < count ||
                capacity > (1u << 24) ||
                !valid_hint_codepoints(hints, count))
                continue;
            if (matches != 0 && hints == selected_hints &&
                count == selected_count)
                continue;
            if (matches != 0) return 0;
            selected_hints = hints;
            selected_count = count;
            selected_data_offset = data_offset;
            selected_count_offset = capacity_offset + sizeof(uint32_t);
            matches = 1;
        }
    }
    if (matches != 1) return 0;
    g_hint_data_offset = selected_data_offset;
    g_hint_count_offset = selected_count_offset;
    g_hint_layout_resolved = 1;
    LOGI("Blink hint layout structurally resolved: data=%zu count=%zu",
         g_hint_data_offset, g_hint_count_offset);
    *hints_out = selected_hints;
    *count_out = selected_count;
    return 1;
}

/* The anchored MatchFamilyStyleCharacter helper loads the global SkFontMgr and
   performs its virtual character match. Locate that data flow, then derive the
   adjacent matchFamilyStyle entry from the discovered character-match entry.
   This replaces Chromium-build-specific instruction indices and vtable bytes. */
static int resolve_font_manager_abi(const uint32_t *instructions,
                                    void ***manager_slot_out,
                                    size_t *match_style_offset_out) {
    const size_t words = 256;
    void **resolved_slot = NULL;
    size_t resolved_offset = 0;
    unsigned int matches = 0;
    for (size_t index = 0; index + 1 < words; ++index) {
        uint32_t adrp;
        uint32_t load;
        memcpy(&adrp, instructions + index, sizeof(adrp));
        memcpy(&load, instructions + index + 1, sizeof(load));
        if ((adrp & 0x9f000000u) != 0x90000000u) continue;
        unsigned int manager_register;
        unsigned int page_register;
        size_t page_offset;
        if (!decode_ldr_x_unsigned(load, &manager_register, &page_register,
                                   &page_offset) ||
            page_register != (adrp & 0x1fu))
            continue;

        size_t character_offset = 0;
        if (!find_relative_vcall(instructions + index + 2,
                                 words - index - 2,
                                 (int)manager_register,
                                 &character_offset) ||
            character_offset < sizeof(int32_t))
            continue;
        size_t match_style_offset = character_offset - sizeof(int32_t);
        uintptr_t slot_address = decode_adrp_page(
                (uintptr_t)(instructions + index), adrp) + page_offset;
        void **manager_slot = (void **)slot_address;

        uintptr_t manager = 0;
        if (safe_process_copy(&manager, manager_slot, sizeof(manager)) &&
            manager != 0) {
            if (!object_has_chromium_relative_vtable(manager) ||
                relative_vtable_method(manager, character_offset) == NULL ||
                relative_vtable_method(manager, match_style_offset) == NULL)
                continue;
        }
        if (matches != 0 &&
            (resolved_slot != manager_slot ||
             resolved_offset != match_style_offset))
            return 0;
        resolved_slot = manager_slot;
        resolved_offset = match_style_offset;
        matches++;
    }
    if (matches == 0 || resolved_slot == NULL) return 0;
    *manager_slot_out = resolved_slot;
    *match_style_offset_out = resolved_offset;
    return 1;
}

static int printable_family_name(const char *name, size_t length) {
    if (length < 3 || length >= 96) return 0;
    for (size_t index = 0; index < length; ++index) {
        unsigned char value = (unsigned char)name[index];
        if (value < 0x20 || value > 0x7e) return 0;
    }
    return 1;
}

static int decode_libcpp_string(const unsigned char storage[24],
                                char output[96]) {
    /* Android's libc++ has shipped both normal and alternate std::string
       layouts. Accept either, then validate the complete family name. */
    size_t short_length = storage[0] >> 1;
    if ((storage[0] & 1) == 0 && short_length <= 22 &&
        printable_family_name((const char *)storage + 1, short_length)) {
        memcpy(output, storage + 1, short_length);
        output[short_length] = '\0';
        return 1;
    }
    short_length = storage[23];
    if (short_length <= 22 &&
        printable_family_name((const char *)storage, short_length)) {
        memcpy(output, storage, short_length);
        output[short_length] = '\0';
        return 1;
    }

    uint64_t size = 0;
    uintptr_t data = 0;
    if ((storage[0] & 1) != 0) {
        memcpy(&size, storage + 8, sizeof(size));
        memcpy(&data, storage + 16, sizeof(data));
        if (size >= 3 && size < 96 && data != 0 &&
            safe_process_copy(output, (const void *)data, (size_t)size)) {
            output[size] = '\0';
            if (printable_family_name(output, (size_t)size)) return 1;
        }
    }
    memcpy(&data, storage, sizeof(data));
    memcpy(&size, storage + 8, sizeof(size));
    if (size >= 3 && size < 96 && data != 0 &&
        safe_process_copy(output, (const void *)data, (size_t)size)) {
        output[size] = '\0';
        if (printable_family_name(output, (size_t)size)) return 1;
    }
    return 0;
}

static int libcpp_string_is_empty(const unsigned char storage[24]) {
    /* libc++ has used both the first byte and the final byte for short-string
       length. Padding in a default-constructed empty string is not guaranteed
       to be zero, so inspect the active length byte rather than all storage. */
    return storage[0] == 0 || storage[23] == 0;
}

static int contains_ascii_case_insensitive(const char *text,
                                           const char *needle) {
    if (text == NULL || needle == NULL || *needle == '\0') return 0;
    size_t needle_length = strlen(needle);
    for (const char *start = text; *start != '\0'; ++start) {
        size_t index = 0;
        while (index < needle_length && start[index] != '\0') {
            unsigned char left = (unsigned char)start[index];
            unsigned char right = (unsigned char)needle[index];
            if (left >= 'A' && left <= 'Z') left += 'a' - 'A';
            if (right >= 'A' && right <= 'Z') right += 'a' - 'A';
            if (left != right) break;
            ++index;
        }
        if (index == needle_length) return 1;
    }
    return 0;
}

static int is_icon_ligature_family(const char *family) {
    return contains_ascii_case_insensitive(family, "material symbols") ||
           contains_ascii_case_insensitive(family, "material icons") ||
           contains_ascii_case_insensitive(family, "icon font") ||
           contains_ascii_case_insensitive(family, "iconfont") ||
           contains_ascii_case_insensitive(family, "ligature symbol") ||
           contains_ascii_case_insensitive(family, "glyphicons");
}

static uintptr_t decompress_heap_pointer(uintptr_t owner, uint32_t compressed,
                                         unsigned int shift) {
    if (compressed == 0) return 0;
    /* cppgc::internal::CompressedPointer stores a cage-relative pointer after
       shifting it right. Chromium 152 enables CPPGC_ENABLE_LARGER_CAGE on
       Android, so its production shift is 3 and its cage is 16 GiB aligned.
       CageBaseGlobal keeps every address bit below that alignment set; derive
       the same mask from the owning Oilpan object, then apply V8's signed
       decompression formula. */
    if (shift != 1 && shift != 3) return 0;
    uintptr_t alignment = (uintptr_t)1u << (31u + shift);
    uintptr_t cage_base =
            (owner & ~(alignment - 1u)) | (alignment - 1u);
    uint64_t pointer_mask =
            (uint64_t)(int64_t)(int32_t)compressed << shift;
    return (uintptr_t)pointer_mask & cage_base;
}

static int platform_data_font_details(uintptr_t platform_address,
                                      uintptr_t *typeface_out,
                                      char family_out[96],
                                      int allow_empty_family) {
    unsigned char platform[48];
    if (!safe_process_copy(platform, (const void *)platform_address,
                           sizeof(platform))) return 0;
    uintptr_t typeface = 0;
    uintptr_t vtable = 0;
    float text_size = 0;
    memcpy(&typeface, platform, sizeof(typeface));
    memcpy(&text_size, platform + 32, sizeof(text_size));
    if (typeface == 0 || !(text_size > 0.5f && text_size < 2048.0f) ||
        !safe_process_copy(&vtable, (const void *)typeface, sizeof(vtable)) ||
        vtable == 0 || !object_has_chromium_relative_vtable(typeface)) return 0;
    if (!decode_libcpp_string(platform + 8, family_out)) {
        /* FontCustomPlatformData deliberately constructs webfont platform
           data with std::string() as its family. The inspector obtains the
           display name from SkTypeface separately. An empty family therefore
           identifies a valid webfont platform object; it must not make the
           caller continue scanning unrelated SimpleFontData members. */
        if (!allow_empty_family || !libcpp_string_is_empty(platform + 8))
            return 0;
        family_out[0] = '\0';
    }
    *typeface_out = typeface;
    return 1;
}

static int simple_font_data_platform_member_details(
        const unsigned char *simple, uintptr_t simple_address, size_t offset,
        uintptr_t *typeface_out, char family_out[96], int allow_empty_family) {
    uintptr_t candidate = 0;
    memcpy(&candidate, simple + offset, sizeof(candidate));
    if (candidate != 0 &&
        platform_data_font_details(candidate, typeface_out, family_out,
                                   allow_empty_family))
        return 1;

    uint32_t compressed = 0;
    memcpy(&compressed, simple + offset, sizeof(compressed));
    const unsigned int compression_shifts[] = {3, 1};
    for (size_t shift_index = 0;
         shift_index < sizeof(compression_shifts) /
                               sizeof(compression_shifts[0]);
         ++shift_index) {
        candidate = decompress_heap_pointer(
                simple_address, compressed, compression_shifts[shift_index]);
        if (candidate != 0 &&
            platform_data_font_details(candidate, typeface_out, family_out,
                                       allow_empty_family))
            return 1;
    }
    return 0;
}

static int simple_font_data_details(uintptr_t simple_address,
                                    uintptr_t *typeface_out,
                                    char family_out[96]) {
    unsigned char simple[320];
    if (!safe_process_copy(simple, (const void *)simple_address,
                           sizeof(simple)) ||
        !object_has_chromium_relative_vtable(simple_address)) return 0;

    /* Discover platform_data_ from the live object. A valid candidate must
       contain a plausible text size and a SkTypeface with a Chromium relative
       vtable. Accept the deliberately empty webfont family only when the
       libc++ string storage is canonically empty. Multiple distinct candidates
       are rejected instead of guessing an offset. */
    uintptr_t selected_typeface = 0;
    char selected_family[96] = {0};
    unsigned int matches = 0;
    for (size_t offset = 8; offset + sizeof(uintptr_t) <= sizeof(simple);
         offset += 4) {
        uintptr_t candidate_typeface = 0;
        char candidate_family[96] = {0};
        if (!simple_font_data_platform_member_details(
                    simple, simple_address, offset, &candidate_typeface,
                    candidate_family, 1))
            continue;
        if (matches != 0 && candidate_typeface == selected_typeface &&
            strcmp(candidate_family, selected_family) == 0)
            continue;
        if (matches != 0) return 0;
        selected_typeface = candidate_typeface;
        memcpy(selected_family, candidate_family, sizeof(selected_family));
        matches = 1;
    }
    if (matches != 1) return 0;
    *typeface_out = selected_typeface;
    memcpy(family_out, selected_family, 96);
    return 1;
}

static int fallback_candidate_font_details(void *candidate,
                                           uintptr_t *typeface_out,
                                           char family_out[96],
                                           uintptr_t *simple_out) {
    unsigned char object[32];
    if (candidate == NULL ||
        !safe_process_copy(object, candidate, sizeof(object))) return 0;
    const size_t member_offsets[] = {8, 16};
    for (size_t index = 0;
         index < sizeof(member_offsets) / sizeof(member_offsets[0]); ++index) {
        size_t offset = member_offsets[index];
        uintptr_t simple = 0;
        memcpy(&simple, object + offset, sizeof(simple));
        if (simple != 0 &&
            simple_font_data_details(simple, typeface_out, family_out)) {
            if (simple_out != NULL) *simple_out = simple;
            return 1;
        }
        uint32_t compressed = 0;
        memcpy(&compressed, object + offset, sizeof(compressed));
        const unsigned int compression_shifts[] = {3, 1};
        for (size_t shift_index = 0;
             shift_index < sizeof(compression_shifts) /
                                   sizeof(compression_shifts[0]);
             ++shift_index) {
            simple = decompress_heap_pointer(
                    (uintptr_t)candidate, compressed,
                    compression_shifts[shift_index]);
            if (simple != 0 &&
                simple_font_data_details(simple, typeface_out, family_out)) {
                if (simple_out != NULL) *simple_out = simple;
                return 1;
            }
        }
    }
    return 0;
}

typedef bool (*simple_font_data_bool_function)(const void *);

static int simple_font_data_bool_virtual(uintptr_t simple,
                                         unsigned int slot,
                                         int *available_out) {
    uintptr_t vtable = 0;
    int32_t relative_method = 0;
    if (available_out != NULL) *available_out = 0;
    if (simple == 0 ||
        !safe_process_copy(&vtable, (const void *)simple, sizeof(vtable)) ||
        vtable == 0 ||
        !safe_process_copy(&relative_method,
                           (const char *)vtable +
                                   slot * sizeof(relative_method),
                           sizeof(relative_method)) ||
        relative_method == 0)
        return 0;
    void *method = (char *)vtable + relative_method;
    Dl_info info;
    if (dladdr(method, &info) == 0 || info.dli_fname == NULL ||
        strstr(info.dli_fname, "libchrome.so") == NULL)
        return 0;
    if (available_out != NULL) *available_out = 1;
    return ((simple_font_data_bool_function)method)((const void *)simple)
                   ? 1
                   : 0;
}

/* SimpleFontData exposes IsLoadingFallback through FontData's relative
   vtable. Do not assume its slot number. The method is the unique classifier
   between two forwarding methods that all read the same custom_font_data_
   member: IsLoading forwards one state query, IsLoadingFallback compares the
   concrete loading-fallback type, and ShouldSkipDrawing forwards another.
   Clang may move the field and every vtable entry, but that data-flow relation
   remains part of Blink's class semantics. */
static int custom_font_member_access(const uint32_t *instructions,
                                     size_t words,
                                     size_t *member_offset_out) {
    size_t limit = words < 8 ? words : 8;
    for (size_t index = 0; index < limit; ++index) {
        unsigned int target;
        unsigned int base;
        size_t offset;
        if (!decode_ldrsw_x_unsigned(instructions[index], &target, &base,
                                     &offset) ||
            base != 0 || offset == 0 || offset > 512)
            continue;
        int branched_on_member = 0;
        int zero_return = 0;
        int returned = 0;
        for (size_t tail = index + 1; tail < limit; ++tail) {
            uint32_t instruction = instructions[tail];
            if ((instruction & 0x7f000000u) == 0x35000000u &&
                (instruction & 0x1fu) == target)
                branched_on_member = 1; /* cbnz wN/xN */
            if (instruction == 0x2a1f03e0u ||
                instruction == 0x52800000u)
                zero_return = 1; /* mov w0, wzr / mov w0, #0 */
            if (instruction == 0xd65f03c0u) returned = 1;
        }
        if (branched_on_member && zero_return && returned) {
            *member_offset_out = offset;
            return 1;
        }
    }
    return 0;
}

static int custom_font_state_forwarder(void *method,
                                       size_t *member_offset_out,
                                       size_t *inner_vtable_offset_out) {
    uint32_t instructions[24];
    if (method == NULL ||
        !safe_process_copy(instructions, method, sizeof(instructions)) ||
        !custom_font_member_access(instructions, 24, member_offset_out))
        return 0;
    return find_relative_vcall(instructions, 24, 0,
                               inner_vtable_offset_out);
}

static int loading_fallback_classifier(void *method,
                                       size_t *member_offset_out) {
    uint32_t instructions[24];
    if (method == NULL ||
        !safe_process_copy(instructions, method, sizeof(instructions)) ||
        !custom_font_member_access(instructions, 24, member_offset_out))
        return 0;
    int compares_type = 0;
    int returns_equality = 0;
    for (size_t index = 0; index < 24; ++index) {
        uint32_t instruction = instructions[index];
        if ((instruction & 0xffe0fc1fu) == 0xeb00001fu)
            compares_type = 1; /* cmp xN, xM */
        if (instruction == 0x1a9f17e0u)
            returns_equality = 1; /* cset w0, eq */
    }
    size_t ignored_offset = 0;
    return compares_type && returns_equality &&
           !find_relative_vcall(instructions, 24, -1, &ignored_offset);
}

static int resolve_loading_fallback_slot(uintptr_t simple) {
    if (g_loading_fallback_slot_resolved)
        return g_loading_fallback_slot != 0;
    unsigned int resolved_slot = 0;
    size_t resolved_member = 0;
    unsigned int matches = 0;
    for (unsigned int slot = 3; slot < 48; ++slot) {
        void *classifier = relative_vtable_method(
                simple, (size_t)slot * sizeof(int32_t));
        size_t member_offset = 0;
        if (!loading_fallback_classifier(classifier, &member_offset))
            continue;

        void *previous = relative_vtable_method(
                simple, (size_t)(slot - 1) * sizeof(int32_t));
        size_t previous_member = 0;
        size_t previous_inner_slot = 0;
        if (!custom_font_state_forwarder(previous, &previous_member,
                                         &previous_inner_slot) ||
            previous_member != member_offset)
            continue;

        int following_forwarder = 0;
        for (unsigned int distance = 1; distance <= 3; ++distance) {
            void *following = relative_vtable_method(
                    simple, (size_t)(slot + distance) * sizeof(int32_t));
            size_t following_member = 0;
            size_t following_inner_slot = 0;
            if (custom_font_state_forwarder(following, &following_member,
                                            &following_inner_slot) &&
                following_member == member_offset &&
                following_inner_slot != previous_inner_slot) {
                following_forwarder = 1;
                break;
            }
        }
        if (!following_forwarder) continue;
        if (matches != 0 && (resolved_slot != slot ||
                             resolved_member != member_offset)) {
            LOGE("Blink loading-fallback semantic candidates disagree");
            g_loading_fallback_slot_resolved = 1;
            return 0;
        }
        resolved_slot = slot;
        resolved_member = member_offset;
        matches++;
    }
    if (matches == 0 || resolved_slot == 0) {
        LOGE("Blink loading-fallback semantic resolution failed");
        g_loading_fallback_slot_resolved = 1;
        return 0;
    }
    int available = 0;
    int value = simple_font_data_bool_virtual(simple, resolved_slot,
                                               &available);
    if (!available || (value != 0 && value != 1)) {
        LOGE("Blink loading-fallback candidate validation failed");
        g_loading_fallback_slot_resolved = 1;
        return 0;
    }
    g_loading_fallback_slot = resolved_slot;
    g_loading_fallback_slot_resolved = 1;
    LOGI("Blink loading-fallback slot structurally resolved: slot=%u "
         "member=%zu candidates=%u", resolved_slot, resolved_member,
         matches);
    return 1;
}

/* Reading the actual cmap and GSUB tables lets us recognize what the font
   does, instead of guessing from CSS or internal family names. The SkTypeface
   table-data virtual slot is discovered from a semantic owner that requests a
   whole table with zero offset, unlimited length and a null output buffer. */
#define FONT_TABLE_LIMIT (16u * 1024u * 1024u)
#define FONT_TAG(a, b, c, d) \
    (((uint32_t)(a) << 24) | ((uint32_t)(b) << 16) | \
     ((uint32_t)(c) << 8) | (uint32_t)(d))

typedef size_t (*sk_typeface_get_table_data_function)(
        const void *, uint32_t, size_t, size_t, void *);

static int resolve_typeface_table_data_slot(uintptr_t typeface) {
    if (g_typeface_table_data_slot_resolved)
        return g_typeface_table_data_slot != 0;
    g_typeface_table_data_slot_resolved = 1;
    unsigned int resolved_slot = 0;
    unsigned int owner_slot = 0;
    unsigned int matches = 0;
    for (unsigned int slot = 4; slot < 96; ++slot) {
        void *method = relative_vtable_method(
                typeface, (size_t)slot * sizeof(int32_t));
        uint32_t instructions[64];
        if (method == NULL ||
            !safe_process_copy(instructions, method, sizeof(instructions)))
            continue;
        int zero_offset = 0;
        int full_length = 0;
        int null_output = 0;
        for (size_t index = 0; index < 24; ++index) {
            uint32_t instruction = instructions[index];
            if (instruction == 0xaa1f03e2u || instruction == 0x2a1f03e2u)
                zero_offset = 1; /* mov x2/w2, zero */
            if (instruction == 0x92800003u || instruction == 0x12800003u)
                full_length = 1; /* movn x3/w3, #0 */
            if (instruction == 0xaa1f03e4u || instruction == 0x2a1f03e4u)
                null_output = 1; /* mov x4/w4, zero */
        }
        if (!zero_offset || !full_length || !null_output) continue;
        size_t byte_offset = 0;
        if (!find_relative_vcall(instructions, 48, 0, &byte_offset) ||
            byte_offset % sizeof(int32_t) != 0)
            continue;
        unsigned int candidate_slot =
                (unsigned int)(byte_offset / sizeof(int32_t));
        if (candidate_slot < 4 || candidate_slot >= 96) continue;
        if (matches != 0 && candidate_slot != resolved_slot) {
            LOGE("SkTypeface table-data semantic candidates disagree: "
                 "slot=%u/%u", resolved_slot, candidate_slot);
            return 0;
        }
        resolved_slot = candidate_slot;
        owner_slot = slot;
        matches++;
    }
    if (matches == 0 || resolved_slot == 0) {
        LOGE("SkTypeface table-data semantic resolution failed");
        return 0;
    }
    void *method = relative_vtable_method(
            typeface, (size_t)resolved_slot * sizeof(int32_t));
    if (method == NULL) {
        LOGE("SkTypeface table-data candidate is not executable: slot=%u",
             resolved_slot);
        return 0;
    }
    sk_typeface_get_table_data_function reader =
            (sk_typeface_get_table_data_function)method;
    const uint32_t cmap_tag = FONT_TAG('c', 'm', 'a', 'p');
    size_t cmap_size = reader((const void *)typeface, cmap_tag, 0,
                              ~(size_t)0, NULL);
    unsigned char header[4] = {0};
    if (cmap_size < sizeof(header) || cmap_size > FONT_TABLE_LIMIT ||
        reader((const void *)typeface, cmap_tag, 0, sizeof(header), header) !=
                sizeof(header) ||
        header[0] != 0 || header[1] != 0 ||
        (((unsigned int)header[2] << 8) | header[3]) == 0) {
        LOGE("SkTypeface table-data candidate validation failed: slot=%u "
             "size=%zu", resolved_slot, cmap_size);
        return 0;
    }
    g_typeface_table_data_slot = resolved_slot;
    LOGI("SkTypeface table-data slot structurally resolved: slot=%u "
         "semantic-owner=%u candidates=%u", resolved_slot, owner_slot,
         matches);
    return 1;
}

typedef struct {
    uintptr_t typeface;
    unsigned char *cmap;
    size_t cmap_size;
    unsigned char *gsub;
    size_t gsub_size;
} ligature_font_tables;

typedef struct {
    uintptr_t typeface;
    uint64_t hash;
    uint32_t count;
    uint32_t first;
    uint32_t last;
    int result;
} ligature_probe_cache_entry;

typedef struct {
    uintptr_t typeface;
    int result;
} ligature_font_class_cache_entry;

static _Thread_local ligature_font_tables g_ligature_tables;
static _Thread_local ligature_probe_cache_entry g_ligature_probe_cache[64];
static _Thread_local unsigned int g_ligature_probe_cache_cursor;
static _Thread_local ligature_font_class_cache_entry
        g_ligature_font_class_cache[32];
static _Thread_local unsigned int g_ligature_font_class_cache_cursor;

static sk_typeface_get_table_data_function typeface_table_reader(
        uintptr_t typeface) {
    if (typeface == 0 || !resolve_typeface_table_data_slot(typeface))
        return NULL;
    return (sk_typeface_get_table_data_function)relative_vtable_method(
            typeface, (size_t)g_typeface_table_data_slot * sizeof(int32_t));
}

static void clear_ligature_font_tables(void) {
    free(g_ligature_tables.cmap);
    free(g_ligature_tables.gsub);
    memset(&g_ligature_tables, 0, sizeof(g_ligature_tables));
}

static int load_ligature_font_tables(uintptr_t typeface) {
    if (g_ligature_tables.typeface == typeface)
        return g_ligature_tables.cmap != NULL &&
               g_ligature_tables.gsub != NULL;
    clear_ligature_font_tables();
    g_ligature_tables.typeface = typeface;
    sk_typeface_get_table_data_function read_table =
            typeface_table_reader(typeface);
    if (read_table == NULL) return 0;
    const uint32_t cmap_tag = FONT_TAG('c', 'm', 'a', 'p');
    const uint32_t gsub_tag = FONT_TAG('G', 'S', 'U', 'B');
    size_t cmap_size = read_table((const void *)typeface, cmap_tag, 0,
                                  ~(size_t)0, NULL);
    size_t gsub_size = read_table((const void *)typeface, gsub_tag, 0,
                                  ~(size_t)0, NULL);
    if (cmap_size < 12 || gsub_size < 10 || cmap_size > FONT_TABLE_LIMIT ||
        gsub_size > FONT_TABLE_LIMIT) return 0;
    unsigned char *cmap = malloc(cmap_size);
    unsigned char *gsub = malloc(gsub_size);
    if (cmap == NULL || gsub == NULL ||
        read_table((const void *)typeface, cmap_tag, 0, cmap_size, cmap) !=
                cmap_size ||
        read_table((const void *)typeface, gsub_tag, 0, gsub_size, gsub) !=
                gsub_size) {
        free(cmap);
        free(gsub);
        return 0;
    }
    g_ligature_tables.cmap = cmap;
    g_ligature_tables.cmap_size = cmap_size;
    g_ligature_tables.gsub = gsub;
    g_ligature_tables.gsub_size = gsub_size;
    return 1;
}

static int table_u16(const unsigned char *table, size_t size, size_t offset,
                     uint16_t *value) {
    if (offset > size || size - offset < 2) return 0;
    *value = (uint16_t)(((uint16_t)table[offset] << 8) | table[offset + 1]);
    return 1;
}

static int table_u32(const unsigned char *table, size_t size, size_t offset,
                     uint32_t *value) {
    if (offset > size || size - offset < 4) return 0;
    *value = ((uint32_t)table[offset] << 24) |
             ((uint32_t)table[offset + 1] << 16) |
             ((uint32_t)table[offset + 2] << 8) | table[offset + 3];
    return 1;
}

static int cmap_format12_glyph(const unsigned char *table, size_t size,
                               size_t subtable, uint32_t codepoint,
                               uint16_t *glyph) {
    uint32_t length = 0;
    uint32_t groups = 0;
    if (!table_u32(table, size, subtable + 4, &length) || length < 16 ||
        subtable > size || length > size - subtable ||
        !table_u32(table, size, subtable + 12, &groups) ||
        groups > (length - 16) / 12) return 0;
    uint32_t low = 0;
    uint32_t high = groups;
    while (low < high) {
        uint32_t middle = low + (high - low) / 2;
        size_t record = subtable + 16 + (size_t)middle * 12;
        uint32_t start = 0;
        uint32_t end = 0;
        uint32_t start_glyph = 0;
        if (!table_u32(table, size, record, &start) ||
            !table_u32(table, size, record + 4, &end) ||
            !table_u32(table, size, record + 8, &start_glyph)) return 0;
        if (codepoint < start) {
            high = middle;
        } else if (codepoint > end) {
            low = middle + 1;
        } else {
            uint32_t result = start_glyph + codepoint - start;
            if (result > 0xffff) return 0;
            *glyph = (uint16_t)result;
            return *glyph != 0;
        }
    }
    return 0;
}

static int cmap_format4_glyph(const unsigned char *table, size_t size,
                              size_t subtable, uint32_t codepoint,
                              uint16_t *glyph) {
    if (codepoint > 0xffff) return 0;
    uint16_t length = 0;
    uint16_t seg_count_x2 = 0;
    if (!table_u16(table, size, subtable + 2, &length) || length < 16 ||
        subtable > size || length > size - subtable ||
        !table_u16(table, size, subtable + 6, &seg_count_x2) ||
        seg_count_x2 == 0 || (seg_count_x2 & 1) != 0) return 0;
    uint16_t seg_count = seg_count_x2 / 2;
    size_t end_codes = subtable + 14;
    size_t start_codes = end_codes + (size_t)seg_count * 2 + 2;
    size_t deltas = start_codes + (size_t)seg_count * 2;
    size_t range_offsets = deltas + (size_t)seg_count * 2;
    if (range_offsets > subtable + length ||
        (size_t)seg_count * 2 > subtable + length - range_offsets) return 0;
    for (uint16_t index = 0; index < seg_count; ++index) {
        uint16_t end = 0;
        uint16_t start = 0;
        if (!table_u16(table, size, end_codes + (size_t)index * 2, &end) ||
            !table_u16(table, size, start_codes + (size_t)index * 2, &start))
            return 0;
        if (codepoint < start || codepoint > end) continue;
        uint16_t delta = 0;
        uint16_t range = 0;
        if (!table_u16(table, size, deltas + (size_t)index * 2, &delta) ||
            !table_u16(table, size, range_offsets + (size_t)index * 2,
                       &range)) return 0;
        if (range == 0) {
            *glyph = (uint16_t)(codepoint + delta);
            return *glyph != 0;
        }
        size_t range_word = range_offsets + (size_t)index * 2;
        size_t glyph_offset = range_word + range +
                              (size_t)(codepoint - start) * 2;
        uint16_t result = 0;
        if (glyph_offset >= subtable + length ||
            !table_u16(table, size, glyph_offset, &result)) return 0;
        if (result != 0) result = (uint16_t)(result + delta);
        *glyph = result;
        return result != 0;
    }
    return 0;
}

static int cmap_glyph(const unsigned char *table, size_t size,
                      uint32_t codepoint, uint16_t *glyph) {
    uint16_t records = 0;
    if (!table_u16(table, size, 2, &records) ||
        records > (size - 4) / 8) return 0;
    size_t format4 = 0;
    size_t format12 = 0;
    for (uint16_t index = 0; index < records; ++index) {
        size_t record = 4 + (size_t)index * 8;
        uint16_t platform = 0;
        uint16_t encoding = 0;
        uint32_t offset = 0;
        uint16_t format = 0;
        if (!table_u16(table, size, record, &platform) ||
            !table_u16(table, size, record + 2, &encoding) ||
            !table_u32(table, size, record + 4, &offset) || offset >= size ||
            !table_u16(table, size, offset, &format)) continue;
        if (!((platform == 0) ||
              (platform == 3 && (encoding == 1 || encoding == 10)))) continue;
        if (format == 12) format12 = offset;
        if (format == 4) format4 = offset;
    }
    if (format12 != 0 &&
        cmap_format12_glyph(table, size, format12, codepoint, glyph)) return 1;
    return format4 != 0 &&
           cmap_format4_glyph(table, size, format4, codepoint, glyph);
}

static int cmap_format12_glyph_is_private_use(
        const unsigned char *table, size_t size, size_t subtable,
        uint16_t glyph) {
    uint32_t length = 0;
    uint32_t groups = 0;
    if (!table_u32(table, size, subtable + 4, &length) || length < 16 ||
        subtable > size || length > size - subtable ||
        !table_u32(table, size, subtable + 12, &groups) ||
        groups > (length - 16) / 12) return 0;
    for (uint32_t index = 0; index < groups; ++index) {
        size_t record = subtable + 16 + (size_t)index * 12;
        uint32_t start = 0;
        uint32_t end = 0;
        uint32_t start_glyph = 0;
        if (!table_u32(table, size, record, &start) ||
            !table_u32(table, size, record + 4, &end) ||
            !table_u32(table, size, record + 8, &start_glyph)) return 0;
        if (glyph < start_glyph) continue;
        uint32_t codepoint = start + (uint32_t)glyph - start_glyph;
        if (codepoint <= end && is_private_use_icon(codepoint)) return 1;
    }
    return 0;
}

static int cmap_format4_glyph_is_private_use(
        const unsigned char *table, size_t size, size_t subtable,
        uint16_t glyph) {
    uint16_t length = 0;
    uint16_t seg_count_x2 = 0;
    if (!table_u16(table, size, subtable + 2, &length) || length < 16 ||
        subtable > size || length > size - subtable ||
        !table_u16(table, size, subtable + 6, &seg_count_x2) ||
        seg_count_x2 == 0 || (seg_count_x2 & 1) != 0) return 0;
    uint16_t seg_count = seg_count_x2 / 2;
    size_t end_codes = subtable + 14;
    size_t start_codes = end_codes + (size_t)seg_count * 2 + 2;
    size_t deltas = start_codes + (size_t)seg_count * 2;
    size_t range_offsets = deltas + (size_t)seg_count * 2;
    if (range_offsets > subtable + length ||
        (size_t)seg_count * 2 > subtable + length - range_offsets) return 0;
    for (uint16_t index = 0; index < seg_count; ++index) {
        uint16_t start = 0;
        uint16_t end = 0;
        uint16_t delta = 0;
        uint16_t range = 0;
        if (!table_u16(table, size, start_codes + (size_t)index * 2,
                       &start) ||
            !table_u16(table, size, end_codes + (size_t)index * 2, &end) ||
            !table_u16(table, size, deltas + (size_t)index * 2, &delta) ||
            !table_u16(table, size, range_offsets + (size_t)index * 2,
                       &range)) return 0;
        uint32_t private_start = start > 0xe000 ? start : 0xe000;
        uint32_t private_end = end < 0xf8ff ? end : 0xf8ff;
        if (private_start > private_end) continue;
        for (uint32_t codepoint = private_start; codepoint <= private_end;
             ++codepoint) {
            uint16_t mapped = 0;
            if (range == 0) {
                mapped = (uint16_t)(codepoint + delta);
            } else {
                size_t range_word = range_offsets + (size_t)index * 2;
                size_t glyph_offset = range_word + range +
                                      (size_t)(codepoint - start) * 2;
                if (glyph_offset >= subtable + length ||
                    !table_u16(table, size, glyph_offset, &mapped)) return 0;
                if (mapped != 0) mapped = (uint16_t)(mapped + delta);
            }
            if (mapped == glyph) return 1;
        }
    }
    return 0;
}

static int cmap_glyph_is_private_use(const unsigned char *table, size_t size,
                                     uint16_t glyph) {
    uint16_t records = 0;
    if (glyph == 0 || !table_u16(table, size, 2, &records) ||
        records > (size - 4) / 8) return 0;
    for (uint16_t index = 0; index < records; ++index) {
        size_t record = 4 + (size_t)index * 8;
        uint16_t platform = 0;
        uint16_t encoding = 0;
        uint32_t offset = 0;
        uint16_t format = 0;
        if (!table_u16(table, size, record, &platform) ||
            !table_u16(table, size, record + 2, &encoding) ||
            !table_u32(table, size, record + 4, &offset) || offset >= size ||
            !table_u16(table, size, offset, &format)) continue;
        if (!((platform == 0) ||
              (platform == 3 && (encoding == 1 || encoding == 10)))) continue;
        if (format == 12 &&
            cmap_format12_glyph_is_private_use(table, size, offset, glyph))
            return 1;
        if (format == 4 &&
            cmap_format4_glyph_is_private_use(table, size, offset, glyph))
            return 1;
    }
    return 0;
}

static int coverage_index(const unsigned char *table, size_t size,
                          size_t coverage, uint16_t glyph,
                          uint16_t *index_out) {
    uint16_t format = 0;
    uint16_t count = 0;
    if (!table_u16(table, size, coverage, &format) ||
        !table_u16(table, size, coverage + 2, &count)) return 0;
    if (format == 1) {
        if (count > (size - coverage - 4) / 2) return 0;
        uint16_t low = 0;
        uint16_t high = count;
        while (low < high) {
            uint16_t middle = (uint16_t)(low + (high - low) / 2);
            uint16_t value = 0;
            if (!table_u16(table, size,
                           coverage + 4 + (size_t)middle * 2, &value))
                return 0;
            if (glyph < value) high = middle;
            else if (glyph > value) low = (uint16_t)(middle + 1);
            else {
                *index_out = middle;
                return 1;
            }
        }
        return 0;
    }
    if (format == 2) {
        if (count > (size - coverage - 4) / 6) return 0;
        for (uint16_t range_index = 0; range_index < count; ++range_index) {
            size_t record = coverage + 4 + (size_t)range_index * 6;
            uint16_t start = 0;
            uint16_t end = 0;
            uint16_t start_index = 0;
            if (!table_u16(table, size, record, &start) ||
                !table_u16(table, size, record + 2, &end) ||
                !table_u16(table, size, record + 4, &start_index)) return 0;
            if (glyph >= start && glyph <= end) {
                uint32_t result = (uint32_t)start_index + glyph - start;
                if (result > 0xffff) return 0;
                *index_out = (uint16_t)result;
                return 1;
            }
        }
    }
    return 0;
}

static int ligature_subtable_matches(const unsigned char *table, size_t size,
                                     size_t subtable, const uint16_t *glyphs,
                                     uint32_t glyph_count) {
    uint16_t format = 0;
    uint16_t coverage_offset = 0;
    uint16_t set_count = 0;
    if (!table_u16(table, size, subtable, &format) || format != 1 ||
        !table_u16(table, size, subtable + 2, &coverage_offset) ||
        !table_u16(table, size, subtable + 4, &set_count)) return 0;
    uint16_t coverage = 0;
    if (!coverage_index(table, size, subtable + coverage_offset, glyphs[0],
                        &coverage) || coverage >= set_count) return 0;
    uint16_t set_offset = 0;
    if (!table_u16(table, size,
                   subtable + 6 + (size_t)coverage * 2, &set_offset)) return 0;
    size_t set = subtable + set_offset;
    uint16_t ligature_count = 0;
    if (!table_u16(table, size, set, &ligature_count)) return 0;
    for (uint16_t index = 0; index < ligature_count; ++index) {
        uint16_t ligature_offset = 0;
        if (!table_u16(table, size, set + 2 + (size_t)index * 2,
                       &ligature_offset)) return 0;
        size_t ligature = set + ligature_offset;
        uint16_t ligature_glyph = 0;
        uint16_t component_count = 0;
        if (!table_u16(table, size, ligature, &ligature_glyph) ||
            !table_u16(table, size, ligature + 2, &component_count))
            continue;
        if (ligature_glyph == 0 || component_count != glyph_count) continue;
        int matches = 1;
        for (uint32_t component = 1; component < glyph_count; ++component) {
            uint16_t expected = 0;
            if (!table_u16(table, size,
                           ligature + 4 + (size_t)(component - 1) * 2,
                           &expected) || expected != glyphs[component]) {
                matches = 0;
                break;
            }
        }
        if (matches) return 1;
    }
    return 0;
}

static int gsub_has_exact_ligature(const unsigned char *table, size_t size,
                                   const uint16_t *glyphs,
                                   uint32_t glyph_count) {
    uint16_t lookup_list_offset = 0;
    if (!table_u16(table, size, 8, &lookup_list_offset)) return 0;
    size_t lookup_list = lookup_list_offset;
    uint16_t lookup_count = 0;
    if (!table_u16(table, size, lookup_list, &lookup_count)) return 0;
    for (uint16_t lookup_index = 0; lookup_index < lookup_count;
         ++lookup_index) {
        uint16_t lookup_offset = 0;
        if (!table_u16(table, size,
                       lookup_list + 2 + (size_t)lookup_index * 2,
                       &lookup_offset)) return 0;
        size_t lookup = lookup_list + lookup_offset;
        uint16_t lookup_type = 0;
        uint16_t subtable_count = 0;
        if (!table_u16(table, size, lookup, &lookup_type) ||
            !table_u16(table, size, lookup + 4, &subtable_count)) continue;
        if (lookup_type != 4 && lookup_type != 7) continue;
        for (uint16_t subtable_index = 0; subtable_index < subtable_count;
             ++subtable_index) {
            uint16_t subtable_offset = 0;
            if (!table_u16(table, size,
                           lookup + 6 + (size_t)subtable_index * 2,
                           &subtable_offset)) break;
            size_t subtable = lookup + subtable_offset;
            if (lookup_type == 7) {
                uint16_t extension_format = 0;
                uint16_t extension_type = 0;
                uint32_t extension_offset = 0;
                if (!table_u16(table, size, subtable, &extension_format) ||
                    extension_format != 1 ||
                    !table_u16(table, size, subtable + 2, &extension_type) ||
                    extension_type != 4 ||
                    !table_u32(table, size, subtable + 4,
                               &extension_offset)) continue;
                subtable += extension_offset;
            }
            if (ligature_subtable_matches(table, size, subtable, glyphs,
                                          glyph_count)) return 1;
        }
    }
    return 0;
}

typedef struct {
    uint32_t identifier_ligatures;
    uint32_t long_identifier_ligatures;
    uint32_t underscored_identifier_ligatures;
} identifier_ligature_stats;

static int identifier_glyph_index(const uint16_t glyphs[37], uint16_t glyph) {
    if (glyph == 0) return -1;
    for (int index = 0; index < 37; ++index) {
        if (glyphs[index] == glyph) return index;
    }
    return -1;
}

static int ligature_subtable_is_identifier_icon_font(
        const unsigned char *gsub, size_t gsub_size, size_t subtable,
        const unsigned char *cmap, size_t cmap_size,
        const uint16_t identifier_glyphs[37],
        identifier_ligature_stats *stats) {
    uint16_t format = 0;
    uint16_t coverage_offset = 0;
    uint16_t set_count = 0;
    if (!table_u16(gsub, gsub_size, subtable, &format) || format != 1 ||
        !table_u16(gsub, gsub_size, subtable + 2, &coverage_offset) ||
        !table_u16(gsub, gsub_size, subtable + 4, &set_count)) return 0;
    for (int first_index = 0; first_index < 37; ++first_index) {
        uint16_t first_glyph = identifier_glyphs[first_index];
        uint16_t coverage = 0;
        if (first_glyph == 0 ||
            !coverage_index(gsub, gsub_size, subtable + coverage_offset,
                            first_glyph, &coverage) ||
            coverage >= set_count) continue;
        uint16_t set_offset = 0;
        if (!table_u16(gsub, gsub_size,
                       subtable + 6 + (size_t)coverage * 2, &set_offset))
            continue;
        size_t set = subtable + set_offset;
        uint16_t ligature_count = 0;
        if (!table_u16(gsub, gsub_size, set, &ligature_count) ||
            set > gsub_size ||
            ligature_count > (gsub_size - set - 2) / 2) continue;
        for (uint16_t index = 0; index < ligature_count; ++index) {
            uint16_t ligature_offset = 0;
            if (!table_u16(gsub, gsub_size,
                           set + 2 + (size_t)index * 2, &ligature_offset))
                break;
            size_t ligature = set + ligature_offset;
            uint16_t result_glyph = 0;
            uint16_t component_count = 0;
            if (!table_u16(gsub, gsub_size, ligature, &result_glyph) ||
                !table_u16(gsub, gsub_size, ligature + 2,
                           &component_count) ||
                result_glyph == 0 || component_count < 2 ||
                component_count > 96 || ligature > gsub_size ||
                (size_t)(component_count - 1) >
                        (gsub_size - ligature - 4) / 2)
                continue;
            int identifier_only = 1;
            int has_underscore = first_index == 36;
            for (uint16_t component = 1; component < component_count;
                 ++component) {
                uint16_t component_glyph = 0;
                if (!table_u16(gsub, gsub_size,
                               ligature + 4 + (size_t)(component - 1) * 2,
                               &component_glyph)) {
                    identifier_only = 0;
                    break;
                }
                int component_index = identifier_glyph_index(
                        identifier_glyphs, component_glyph);
                if (component_index < 0) {
                    identifier_only = 0;
                    break;
                }
                if (component_index == 36) has_underscore = 1;
            }
            if (!identifier_only) continue;
            ++stats->identifier_ligatures;
            if (component_count >= 4) ++stats->long_identifier_ligatures;
            if (has_underscore)
                ++stats->underscored_identifier_ligatures;

            /* Icon ligature fonts conventionally map the substituted glyph
               to a PUA codepoint as well. This is a strong signal even for a
               webfont subset containing only one icon name. */
            if (cmap_glyph_is_private_use(cmap, cmap_size, result_glyph))
                return 1;

            /* Ordinary text fonts may contain fi/ffi/ffl. They do not contain
               underscore-separated names or a sizeable dictionary of long
               identifier ligatures. */
            if (stats->underscored_identifier_ligatures >= 1 ||
                stats->long_identifier_ligatures >= 8 ||
                stats->identifier_ligatures >= 16)
                return 1;
        }
    }
    return 0;
}

static int gsub_is_identifier_icon_font(const unsigned char *gsub,
                                        size_t gsub_size,
                                        const unsigned char *cmap,
                                        size_t cmap_size) {
    uint16_t identifier_glyphs[37] = {0};
    for (uint32_t index = 0; index < 26; ++index)
        (void)cmap_glyph(cmap, cmap_size, 'a' + index,
                         &identifier_glyphs[index]);
    for (uint32_t index = 0; index < 10; ++index)
        (void)cmap_glyph(cmap, cmap_size, '0' + index,
                         &identifier_glyphs[26 + index]);
    (void)cmap_glyph(cmap, cmap_size, '_', &identifier_glyphs[36]);

    uint16_t lookup_list_offset = 0;
    if (!table_u16(gsub, gsub_size, 8, &lookup_list_offset)) return 0;
    size_t lookup_list = lookup_list_offset;
    uint16_t lookup_count = 0;
    if (!table_u16(gsub, gsub_size, lookup_list, &lookup_count)) return 0;
    identifier_ligature_stats stats = {0};
    for (uint16_t lookup_index = 0; lookup_index < lookup_count;
         ++lookup_index) {
        uint16_t lookup_offset = 0;
        if (!table_u16(gsub, gsub_size,
                       lookup_list + 2 + (size_t)lookup_index * 2,
                       &lookup_offset)) return 0;
        size_t lookup = lookup_list + lookup_offset;
        uint16_t lookup_type = 0;
        uint16_t subtable_count = 0;
        if (!table_u16(gsub, gsub_size, lookup, &lookup_type) ||
            !table_u16(gsub, gsub_size, lookup + 4, &subtable_count))
            continue;
        if (lookup_type != 4 && lookup_type != 7) continue;
        for (uint16_t subtable_index = 0; subtable_index < subtable_count;
             ++subtable_index) {
            uint16_t subtable_offset = 0;
            if (!table_u16(gsub, gsub_size,
                           lookup + 6 + (size_t)subtable_index * 2,
                           &subtable_offset)) break;
            size_t subtable = lookup + subtable_offset;
            if (lookup_type == 7) {
                uint16_t extension_format = 0;
                uint16_t extension_type = 0;
                uint32_t extension_offset = 0;
                if (!table_u16(gsub, gsub_size, subtable,
                               &extension_format) ||
                    extension_format != 1 ||
                    !table_u16(gsub, gsub_size, subtable + 2,
                               &extension_type) ||
                    extension_type != 4 ||
                    !table_u32(gsub, gsub_size, subtable + 4,
                               &extension_offset))
                    continue;
                subtable += extension_offset;
            }
            if (ligature_subtable_is_identifier_icon_font(
                        gsub, gsub_size, subtable, cmap, cmap_size,
                        identifier_glyphs, &stats))
                return 1;
        }
    }
    return 0;
}

/* Returns 1 for a font whose GSUB table behaves like an identifier-based icon
   font, 0 for an ordinary text font, and -1 when tables cannot be inspected. */
static int typeface_is_identifier_icon_font(uintptr_t typeface) {
    for (size_t index = 0;
         index < sizeof(g_ligature_font_class_cache) /
                         sizeof(g_ligature_font_class_cache[0]);
         ++index) {
        ligature_font_class_cache_entry *entry =
                &g_ligature_font_class_cache[index];
        if (entry->typeface == typeface) return entry->result;
    }
    int result = -1;
    if (load_ligature_font_tables(typeface)) {
        result = gsub_is_identifier_icon_font(
                         g_ligature_tables.gsub, g_ligature_tables.gsub_size,
                         g_ligature_tables.cmap, g_ligature_tables.cmap_size)
                 ? 1
                 : 0;
    }
    ligature_font_class_cache_entry *entry =
            &g_ligature_font_class_cache[
                    g_ligature_font_class_cache_cursor++ % 32];
    entry->typeface = typeface;
    entry->result = result;
    return result;
}

static uint64_t ligature_hint_hash(const uint32_t *hints, uint32_t count) {
    uint64_t hash = UINT64_C(1469598103934665603);
    for (uint32_t index = 0; index < count; ++index) {
        hash ^= hints[index];
        hash *= UINT64_C(1099511628211);
    }
    return hash;
}

/* Returns 1 for an exact multi-character-to-one-glyph GSUB substitution,
   0 for an ordinary font, and -1 when the candidate cannot be inspected. */
static int typeface_has_exact_ligature(uintptr_t typeface,
                                       const void *hint_list) {
    const uint32_t *hints = NULL;
    uint32_t count = 0;
    if (!read_hint_span(hint_list, &hints, &count) ||
        count < 2 || count > 96) return 0;
    uint64_t hash = ligature_hint_hash(hints, count);
    for (size_t index = 0;
         index < sizeof(g_ligature_probe_cache) /
                         sizeof(g_ligature_probe_cache[0]);
         ++index) {
        ligature_probe_cache_entry *entry = &g_ligature_probe_cache[index];
        if (entry->typeface == typeface && entry->hash == hash &&
            entry->count == count && entry->first == hints[0] &&
            entry->last == hints[count - 1]) return entry->result;
    }
    int result = -1;
    if (load_ligature_font_tables(typeface)) {
        uint16_t glyphs[96];
        int mapped = 1;
        for (uint32_t index = 0; index < count; ++index) {
            if (!cmap_glyph(g_ligature_tables.cmap,
                            g_ligature_tables.cmap_size, hints[index],
                            &glyphs[index])) {
                mapped = 0;
                break;
            }
        }
        result = mapped &&
                         gsub_has_exact_ligature(g_ligature_tables.gsub,
                                                 g_ligature_tables.gsub_size,
                                                 glyphs, count)
                 ? 1
                 : 0;
    }
    ligature_probe_cache_entry *entry =
            &g_ligature_probe_cache[g_ligature_probe_cache_cursor++ % 64];
    entry->typeface = typeface;
    entry->hash = hash;
    entry->count = count;
    entry->first = hints[0];
    entry->last = hints[count - 1];
    entry->result = result;
    return result;
}

static int could_be_ligature_name(const void *hint_list) {
    if (hint_list == NULL) return 0;
    const uint32_t *hints = NULL;
    uint32_t count = 0;
    if (!read_hint_span(hint_list, &hints, &count)) return 0;
    /* Ordinary font fallback may stop after one strong-script character,
       while segmented @font-face data requests the complete identifier. */
    if (hints == NULL || count < 1 || count > 96) return 0;
    for (uint32_t index = 0; index < count; ++index) {
        uint32_t codepoint = hints[index];
        if (!((codepoint >= 'a' && codepoint <= 'z') ||
              (codepoint >= '0' && codepoint <= '9') ||
              codepoint == '_')) return 0;
    }
    return 1;
}

static int should_preserve_ligature_candidate(void *candidate,
                                              const void *hint_list,
                                              char family_out[96]) {
    uintptr_t typeface = 0;
    uintptr_t simple = 0;
    if (!fallback_candidate_font_details(candidate, &typeface, family_out,
                                         &simple))
        return 0;
    /* Keeping the loading fallback is essential: replacing it with the user
       font discards Blink's pending @font-face candidate before the network
       face can invalidate and reshape the run. */
    int loading_available = 0;
    int loading_fallback = 0;
    if (resolve_loading_fallback_slot(simple))
        loading_fallback = simple_font_data_bool_virtual(
                simple, g_loading_fallback_slot, &loading_available);
    if (loading_available && loading_fallback) {
        if (__atomic_exchange_n(&g_logged_loading_font_preservation, 1,
                                __ATOMIC_RELAXED) == 0)
            LOGI("Preserved loading @font-face candidate: %s", family_out);
        return 1;
    }
    int exact_probe = typeface_has_exact_ligature(typeface, hint_list);
    int font_probe = exact_probe == 1
                             ? 1
                             : typeface_is_identifier_icon_font(typeface);
    if (font_probe < 0 &&
        __atomic_exchange_n(&g_logged_ligature_probe_failure, 1,
                            __ATOMIC_RELAXED) == 0) {
        LOGI("GSUB ligature probe unavailable; using compatibility fallback "
             "for family: %s", family_out);
    }
    /* Keep the former family-based result only as a compatibility fallback.
       New and arbitrarily named icon fonts are accepted by the exact GSUB
       substitution check above. */
    return exact_probe == 1 || font_probe == 1 ||
           is_icon_ligature_family(family_out);
}

static int apply_custom_font_priority(void *iterator, const void *hint_list) {
    if (iterator != NULL && hint_list != NULL) {
        const uint32_t *hints = NULL;
        uint32_t hint_count = 0;
        if (!read_hint_span(hint_list, &hints, &hint_count)) return 0;

        int select_custom = 0;
        int private_use_cluster = 0;
        if (hints != NULL && hint_count > 0 && hint_count <= 4096) {
            for (uint32_t index = 0; index < hint_count; ++index) {
                uint32_t codepoint = hints[index];
                if (is_private_use_icon(codepoint)) private_use_cluster = 1;
                if (use_selected_font(codepoint)) select_custom = 1;
            }
        }

        int fallback_stage = 0;
        memcpy(&fallback_stage, (char *)iterator + g_fallback_stage_offset,
               sizeof(fallback_stage));
        /* Keep an explicit @font-face opportunity for PUA icons. If the page
           font lacks the glyph, a later system-font stage may use the selected
           font and then continue through Chromium fallback when absent. */
        if (select_custom &&
            (!private_use_cluster || fallback_stage == g_system_fonts_stage) &&
            (fallback_stage == 0 || fallback_stage == 1 ||
             fallback_stage == g_system_fonts_stage)) {
            if (fallback_stage == 0 || fallback_stage == 1) {
                /* In current Chromium the first Next() call enters at stage
                   0 and advances to kSystemFonts inside that same call. The
                   old stage-1-only gate therefore never armed the paired
                   matcher for ordinary page text. Jump both initial font
                   stages to kSystemFonts; excluded clusters keep Blink's
                   original web/icon/emoji path. */
                memcpy((char *)iterator + g_fallback_stage_offset,
                       &g_system_fonts_stage,
                       sizeof(g_system_fonts_stage));
            }
            if (__atomic_load_n(&g_logged_fallback_selection,
                                __ATOMIC_RELAXED) == 0 &&
                __atomic_exchange_n(&g_logged_fallback_selection, 1,
                                    __ATOMIC_RELAXED) == 0) {
                LOGI("Eligible fallback armed: stage=%d hints=%u",
                     fallback_stage, hint_count);
            }
            return 1;
        }
    }
    return 0;
}

static void *fontism_fallback_next_0(void *iterator, const void *hint_list) {
    int stage = -1;
    if (iterator != NULL)
        memcpy(&stage, (char *)iterator + g_fallback_stage_offset,
               sizeof(stage));
    if ((stage == 0 || stage == 1) && could_be_ligature_name(hint_list)) {
        int previous = g_force_custom_family;
        /* Resolve the page's CSS family without substitution first. Enabling
           the custom matcher here destroys the very webfont candidate this
           branch needs to inspect (for example Material Symbols Rounded). */
        g_force_custom_family = 0;
        void *page_candidate = g_original_fallback_next[0](iterator, hint_list);
        int next_stage = -1;
        memcpy(&next_stage, (char *)iterator + g_fallback_stage_offset,
               sizeof(next_stage));
        char family[96] = {0};
        if ((next_stage == 0 || next_stage == 1) &&
            should_preserve_ligature_candidate(page_candidate, hint_list,
                                                family)) {
            g_force_custom_family = previous;
            if (__atomic_exchange_n(&g_logged_ligature_preservation, 1,
                                    __ATOMIC_RELAXED) == 0)
                LOGI("Preserved identifier webfont candidate: %s", family);
            return page_candidate;
        }
        if (next_stage != 0 && next_stage != 1) {
            g_force_custom_family = previous;
            return page_candidate;
        }
        memcpy((char *)iterator + g_fallback_stage_offset,
               &g_system_fonts_stage, sizeof(g_system_fonts_stage));
        g_force_custom_family = 1;
        void *result = g_original_fallback_next[0](iterator, hint_list);
        g_force_custom_family = previous;
        return result;
    }
    int previous = g_force_custom_family;
    g_force_custom_family = previous ||
                            apply_custom_font_priority(iterator, hint_list);
    void *result = g_original_fallback_next[0](iterator, hint_list);
    g_force_custom_family = previous;
    return result;
}

static void *fontism_fallback_next_1(void *iterator, const void *hint_list) {
    int stage = -1;
    if (iterator != NULL)
        memcpy(&stage, (char *)iterator + g_fallback_stage_offset,
               sizeof(stage));
    if ((stage == 0 || stage == 1) && could_be_ligature_name(hint_list)) {
        int previous = g_force_custom_family;
        /* Resolve the page's CSS family without substitution first. Enabling
           the custom matcher here destroys the very webfont candidate this
           branch needs to inspect (for example Material Symbols Rounded). */
        g_force_custom_family = 0;
        void *page_candidate = g_original_fallback_next[1](iterator, hint_list);
        int next_stage = -1;
        memcpy(&next_stage, (char *)iterator + g_fallback_stage_offset,
               sizeof(next_stage));
        char family[96] = {0};
        if ((next_stage == 0 || next_stage == 1) &&
            should_preserve_ligature_candidate(page_candidate, hint_list,
                                                family)) {
            g_force_custom_family = previous;
            if (__atomic_exchange_n(&g_logged_ligature_preservation, 1,
                                    __ATOMIC_RELAXED) == 0)
                LOGI("Preserved identifier webfont candidate: %s", family);
            return page_candidate;
        }
        if (next_stage != 0 && next_stage != 1) {
            g_force_custom_family = previous;
            return page_candidate;
        }
        memcpy((char *)iterator + g_fallback_stage_offset,
               &g_system_fonts_stage, sizeof(g_system_fonts_stage));
        g_force_custom_family = 1;
        void *result = g_original_fallback_next[1](iterator, hint_list);
        g_force_custom_family = previous;
        return result;
    }
    int previous = g_force_custom_family;
    g_force_custom_family = previous ||
                            apply_custom_font_priority(iterator, hint_list);
    void *result = g_original_fallback_next[1](iterator, hint_list);
    g_force_custom_family = previous;
    return result;
}

static void *match_custom_family(
        unsigned int index, const char *family_name, const void *style,
        const char *const *bcp47, int bcp47_count, uint32_t character) {
    int locale_probe = 0;
#ifdef FONTISM_LOCALE_DEFAULT_PROBE
    /* For lang="ko" pages Blink resolves the default sans-serif family by
       asking for a typeface that renders U+AC00, with no family name. If that
       answers the system Korean font, Hangul covered by it never reaches
       FontFallbackIterator::Next, so the fallback hook cannot select the
       custom font. Answer this locale probe with the custom family too. */
    locale_probe = family_name == NULL && character == 0xac00;
#endif
    if ((g_force_custom_family || locale_probe) && use_selected_font(character) &&
        custom_font_has_glyph(character) &&
        g_font_manager_slots[index] != NULL) {
        void *font_manager = __atomic_load_n(g_font_manager_slots[index],
                                             __ATOMIC_ACQUIRE);
        if (font_manager != NULL) {
            void *vtable = NULL;
            int32_t relative_method = 0;
            memcpy(&vtable, font_manager, sizeof(vtable));
            if (vtable != NULL)
                memcpy(&relative_method,
                       (const char *)vtable +
                               g_font_manager_match_style_offsets[index],
                       sizeof(relative_method));
            if (relative_method != 0) {
                match_family_style_function direct_match =
                        (match_family_style_function)((char *)vtable +
                                                      relative_method);
                void *typeface = direct_match(font_manager,
                                              RUNTIME_FONT_FAMILY, style);
                if (__atomic_load_n(&g_logged_match_substitution,
                                    __ATOMIC_RELAXED) == 0 &&
                    __atomic_exchange_n(&g_logged_match_substitution, 1,
                                        __ATOMIC_RELAXED) == 0) {
                    LOGI("Glyph-verified custom typeface: U+%04X manager=%p "
                         "face=%p original=%s", character, font_manager,
                         typeface, family_name != NULL ? family_name : "(null)");
                }
                if (typeface != NULL) return typeface;
            }
        }
    }
    return g_original_match_family_style_character[index](
            family_name, style, bcp47, bcp47_count, character);
}

static void *fontism_match_family_style_character_0(
        const char *family_name, const void *style, const char *const *bcp47,
        int bcp47_count, uint32_t character) {
    return match_custom_family(0, family_name, style, bcp47,
                               bcp47_count, character);
}

static void *fontism_match_family_style_character_1(
        const char *family_name, const void *style, const char *const *bcp47,
        int bcp47_count, uint32_t character) {
    return match_custom_family(1, family_name, style, bcp47,
                               bcp47_count, character);
}

static int initialize_shadowhook(void) {
    if (g_shadowhook_ready) return 1;
    int result = shadowhook_init(SHADOWHOOK_MODE_UNIQUE, false);
    if (result != 0) {
        LOGE("ShadowHook initialization failed: %d", result);
        return 0;
    }
    g_shadowhook_ready = 1;
    return 1;
}

static void uninstall_fallback_order_hooks(void) {
    for (unsigned int index = 0; index < 2; ++index) {
        if (g_fallback_hook_stubs[index] != NULL)
            shadowhook_unhook(g_fallback_hook_stubs[index]);
        g_fallback_hook_stubs[index] = NULL;
        g_original_fallback_next[index] = NULL;
    }
}

static int install_fallback_order_hook(void) {
    fallback_scan_context scan = {0};
    dl_iterate_phdr(find_fallback_next, &scan);
    if (scan.matches == 0 || scan.matches > 2 || scan.addresses[0] == NULL ||
        scan.overflow) {
        LOGE("Blink fallback fingerprint mismatch: unique=%u duplicates=%u overflow=%u",
             scan.matches, scan.duplicate_matches, scan.overflow);
        for (unsigned int match = 0; match < scan.matches; ++match) {
            LOGE("Blink fallback candidate[%u]=%p stage_offset=%zu", match,
                 scan.addresses[match], scan.stage_offsets[match]);
        }
        return 0;
    }
    for (unsigned int match = 1; match < scan.matches; ++match) {
        if (scan.stage_offsets[match] != scan.stage_offsets[0] ||
            scan.system_stages[match] != scan.system_stages[0]) {
            LOGE("Blink fallback candidates disagree: offset=%zu/%zu "
                 "system-stage=%d/%d", scan.stage_offsets[0],
                 scan.stage_offsets[match], scan.system_stages[0],
                 scan.system_stages[match]);
            return 0;
        }
    }
    if (scan.duplicate_matches != 0) {
        LOGI("Blink fallback scan ignored %u duplicate image enumeration(s)",
             scan.duplicate_matches);
    }
    g_fallback_stage_offset = scan.stage_offsets[0];
    g_system_fonts_stage = scan.system_stages[0];
    if (!initialize_shadowhook()) return 0;
    void *proxies[2] = {
        (void *)fontism_fallback_next_0,
        (void *)fontism_fallback_next_1,
    };
    for (unsigned int match = 0; match < scan.matches; ++match) {
        g_fallback_hook_stubs[match] = shadowhook_hook_func_addr(
                scan.addresses[match], proxies[match],
                (void **)&g_original_fallback_next[match]);
        if (g_fallback_hook_stubs[match] == NULL ||
            g_original_fallback_next[match] == NULL) {
            int hook_error = shadowhook_get_errno();
            LOGE("Blink fallback hook[%u] failed: %d (%s)", match, hook_error,
                 shadowhook_to_errmsg(hook_error));
            for (unsigned int installed = 0; installed < match; ++installed) {
                shadowhook_unhook(g_fallback_hook_stubs[installed]);
                g_fallback_hook_stubs[installed] = NULL;
                g_original_fallback_next[installed] = NULL;
            }
            return 0;
        }
        LOGI("Blink custom-font priority hook[%u] installed at %p", match,
             scan.addresses[match]);
    }
    LOGI("Blink custom-font priority installed for %u image(s) "
         "(stage offset=%zu system-stage=%d)", scan.matches,
         g_fallback_stage_offset, g_system_fonts_stage);
    return 1;
}

static int install_match_family_hook(void) {
    match_scan_context scan = {0};
    dl_iterate_phdr(find_match_family_style_character, &scan);
    if (scan.matches == 0 || scan.matches > 2 || scan.overflow) {
        LOGE("Blink family matcher fingerprint mismatch: unique=%u overflow=%u",
             scan.matches, scan.overflow);
        return 0;
    }
    void *proxies[2] = {
        (void *)fontism_match_family_style_character_0,
        (void *)fontism_match_family_style_character_1,
    };
    for (unsigned int match = 0; match < scan.matches; ++match) {
        const uint32_t *instructions = (const uint32_t *)scan.addresses[match];
        if (!resolve_font_manager_abi(
                    instructions, &g_font_manager_slots[match],
                    &g_font_manager_match_style_offsets[match])) {
            LOGE("Blink FontManager structural ABI resolution failed[%u]",
                 match);
            return 0;
        }

        g_match_hook_stubs[match] = shadowhook_hook_func_addr(
                scan.addresses[match], proxies[match],
                (void **)&g_original_match_family_style_character[match]);
        if (g_match_hook_stubs[match] == NULL ||
            g_original_match_family_style_character[match] == NULL) {
            int error = shadowhook_get_errno();
            LOGE("Blink family matcher hook[%u] failed: %d (%s)", match,
                 error, shadowhook_to_errmsg(error));
            for (unsigned int installed = 0; installed < match; ++installed) {
                shadowhook_unhook(g_match_hook_stubs[installed]);
                g_match_hook_stubs[installed] = NULL;
                g_original_match_family_style_character[installed] = NULL;
            }
            return 0;
        }
        LOGI("Blink glyph-verified direct-family hook[%u] installed at %p "
             "(manager slot=%p match-style-vtable=%zu)", match,
             scan.addresses[match], g_font_manager_slots[match],
             g_font_manager_match_style_offsets[match]);
    }
    LOGI("Blink single custom family installed for %u image(s)", scan.matches);
    return 1;
}

static jboolean native_activate(JNIEnv *env, jclass clazz) {
    (void)env;
    (void)clazz;
    if (!g_prepared) return JNI_FALSE;
    if (g_activated) return JNI_TRUE;
    import_patch_context context = {0, 0};
    dl_iterate_phdr(patch_chrome_file_imports, &context);
    if (context.chrome_images == 0 || context.patched_imports == 0 ||
        g_original_fopen == NULL) {
        LOGE("Skia file bridge installation failed: chrome=%u imports=%u fopen=%p",
             context.chrome_images, context.patched_imports, g_original_fopen);
        return JNI_FALSE;
    }
    if (!install_fallback_order_hook()) return JNI_FALSE;
    if (!install_match_family_hook()) {
        uninstall_fallback_order_hooks();
        return JNI_FALSE;
    }
    g_activated = 1;
    LOGI("Skia FD bridge and Blink single-family hooks installed (%u imports)",
         context.patched_imports);
    return JNI_TRUE;
}

JNIEXPORT jint JNI_OnLoad(JavaVM *vm, void *reserved) {
    (void)reserved;
    JNIEnv *env = NULL;
    if ((*vm)->GetEnv(vm, (void **)&env, JNI_VERSION_1_6) != JNI_OK) return JNI_ERR;
    jclass bootstrap = (*env)->FindClass(env, FONTISM_BOOTSTRAP_CLASS);
    if (bootstrap == NULL) return JNI_ERR;
    const JNINativeMethod methods[] = {
        {"nativePrepareFd", "(I)Z", (void *)native_prepare_fd},
        {"nativePrepareInherited", "(J)Z", (void *)native_prepare_inherited},
        {"nativePrepareChildTransport", "(I)I", (void *)native_prepare_child_transport},
        {"nativeRebindRegisteredDescriptors", "(J)Z", (void *)native_rebind_registered_descriptors},
        {"nativeActivate", "()Z", (void *)native_activate},
    };
    if ((*env)->RegisterNatives(env, bootstrap, methods, 5) != JNI_OK) return JNI_ERR;
    LOGI("Fontism native engine %s loaded", FONTISM_ENGINE_VERSION);
    return JNI_VERSION_1_6;
}
