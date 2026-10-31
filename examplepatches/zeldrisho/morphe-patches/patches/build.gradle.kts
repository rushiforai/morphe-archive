import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.zip.ZipFile

group = "com.zeldrisho.patches"

// DEX class_defs refer to type_ids, which refer to string_ids. Checking only
// string presence would also accept a missing class referenced by another class.
fun definedDexClasses(dex: ByteArray): Set<String> {
    check(dex.size >= 112 && dex.copyOfRange(0, 4).contentEquals(byteArrayOf(0x64, 0x65, 0x78, 0x0a))) {
        "Embedded extension is not a DEX file"
    }
    val data = ByteBuffer.wrap(dex).order(ByteOrder.LITTLE_ENDIAN)
    val stringCount = data.getInt(0x38)
    val stringOffset = data.getInt(0x3c)
    val typeCount = data.getInt(0x40)
    val typeOffset = data.getInt(0x44)
    val classCount = data.getInt(0x60)
    val classOffset = data.getInt(0x64)
    fun table(offset: Int, count: Int, itemSize: Int) {
        check(offset >= 0 && count >= 0 && offset.toLong() + count.toLong() * itemSize <= dex.size) {
            "Invalid DEX table"
        }
    }
    table(stringOffset, stringCount, 4)
    table(typeOffset, typeCount, 4)
    table(classOffset, classCount, 32)
    return (0 until classCount).map { index ->
        val typeIndex = data.getInt(classOffset + index * 32)
        check(typeIndex in 0 until typeCount) { "Invalid DEX class type" }
        val stringIndex = data.getInt(typeOffset + typeIndex * 4)
        check(stringIndex in 0 until stringCount) { "Invalid DEX descriptor index" }
        var offset = data.getInt(stringOffset + stringIndex * 4)
        // Skip the ULEB128 UTF-16 length before the null-terminated descriptor.
        var lengthBytes = 0
        do {
            check(offset in dex.indices && lengthBytes++ < 5) { "Invalid DEX string" }
            val byte = dex[offset++].toInt() and 0xff
        } while (byte and 0x80 != 0)
        val start = offset
        while (offset < dex.size && dex[offset] != 0.toByte()) offset++
        check(offset < dex.size) { "Unterminated DEX descriptor" }
        String(dex, start, offset - start, Charsets.UTF_8)
    }.toSet()
}

patches {
    about {
        name = "Zeldris Patches"
        description = "Patches for apps I like, for use with Morphe"
        source = "git@github.com:zeldrisho/morphe-patches.git"
        author = "Zeldris"
        contact = "https://github.com/zeldrisho"
        website = "https://github.com/zeldrisho/morphe-patches"
        license = "GPLv3"
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
}

tasks {
    named("buildAndroid") {
        doLast {
            val bundle = layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile
            ZipFile(bundle).use { zip ->
                val entry = checkNotNull(zip.getEntry("extensions/extension.mpe")) {
                    "Patch bundle is missing extensions/extension.mpe"
                }
                val classes = definedDexClasses(zip.getInputStream(entry).use { it.readBytes() })
                val required = setOf(
                    "Lcom/zeldrisho/threads/extension/FeedAdFilter;",
                    "Lcom/zeldrisho/threads/extension/OpenLinksExternally;",
                    "Lcom/zeldrisho/zalo/extension/ZaloMicroGSupport;",
                )
                val missing = required - classes
                check(missing.isEmpty()) { "Patch bundle extension is missing classes: $missing" }
            }
        }
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build, "buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        environment("PATCHES_BUNDLE", layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile.absolutePath)
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
