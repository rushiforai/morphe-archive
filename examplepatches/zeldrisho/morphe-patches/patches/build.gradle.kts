import java.util.zip.ZipFile

// Single source of truth for the companion-extension wiring on the Gradle
// side. The Kotlin call site (HideAdsPatch.kt extendWith(...)) cannot import
// build-script values across that boundary, so it points back here in a
// comment and any rename must change both together.
val extensionProjects = listOf(":extensions:threads", ":extensions:zalo")
val extensionArtifacts = mapOf(
    ":extensions:threads" to ("morphe/extensions/extension.mpe" to "extensions/extension.mpe"),
    ":extensions:zalo" to ("morphe/extensions/zalo.mpe" to "extensions/zalo.mpe"),
)

plugins {
    // Matches the Kotlin 2.4.10 compiler supplied by Morphe; see docs/development.md.
    id("dev.detekt") version "2.0.0-alpha.6"
}

detekt {
    buildUponDefaultConfig = true
    config.setFrom(rootProject.file("config/detekt/detekt.yml"))
}

group = "com.zeldrisho.patches"

patches {
    about {
        name = "Zeldris Patches"
        description = "Patches for Threads and apps I like, for use with Morphe"
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
    testImplementation(libs.junit)
    testImplementation(libs.kotlin.test)
}

tasks {
    test {
        // Make opt-in local APK validation cache-correct; CI uses synthetic fixtures.
        val apkPath = providers.environmentVariable("THREADS_TEST_APK").orNull.orEmpty()
        inputs.property("threadsTestApk", apkPath)
        if (apkPath.isNotBlank()) {
            inputs.file(rootProject.file(apkPath)).withPropertyName("threadsTestApkFile")
            environment("THREADS_TEST_APK", rootProject.file(apkPath).absolutePath)
        }
    }

    // Fail-fast pre-check only: confirms the extension module produced its
    // plugin-owned artifact before the full bundle build runs. This shortens
    // the failure loop; the authoritative signal stays the embedded-in-.mpp
    // check in verifyBundleExtension below.
    register("checkExtensionArtifact") {
        description = "Fail fast when the extension module output is missing before building"
        dependsOn(extensionProjects.map { "$it:syncExtension" })
        doLast {
            extensionArtifacts.forEach { (projectPath, paths) ->
                val mpe = project(projectPath).layout.buildDirectory.file(paths.first).get().asFile
                check(mpe.isFile) {
                    "Missing extension artifact $mpe after $projectPath:syncExtension — " +
                        "check $projectPath:mergeDexRelease output."
                }
            }
        }
    }

    // The Morphe Gradle plugin publishes the extension modules' build/morphe
    // directories and consumes them as patches resources, so the built .mpp
    // already embeds both extension artifacts. extendWith loads
    // it via the bundle classloader (ClassLoader.getResourceAsStream), not
    // from a repo-relative filesystem path. This guard fails fast after the
    // build when the embedded dex is missing instead of shipping a bundle
    // whose Hide-ads patch silently no-ops at runtime.
    register("verifyBundleExtension") {
        description = "Fail fast when the built .mpp misses the embedded extension dex"
        dependsOn("buildAndroid")
        doLast {
            val libs = layout.buildDirectory.dir("libs").get().asFile
            val mpps = libs.listFiles { file ->
                file.name.endsWith(".mpp") &&
                    !file.name.contains("sources") &&
                    !file.name.contains("javadoc")
            }?.toList().orEmpty()
            val currentMpps = mpps.filter { it.name == "patches-${project.version}.mpp" }
            check(currentMpps.size == 1) {
                "Expected one distributable patches-${project.version}.mpp in $libs, found: ${mpps.map { it.name }}"
            }
            val mpp = currentMpps.single()
            ZipFile(mpp).use { zip ->
                extensionArtifacts.values.forEach { paths ->
                    check(zip.getEntry(paths.second) != null) {
                        "Bundle ${mpp.name} is missing ${paths.second} — " +
                            "check the corresponding extension sync task output."
                    }
                }
            }
        }
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }
}

// Run the lightweight extension pre-check before the full bundle build so a
// missing/broken extension fails in seconds; verifyBundleExtension remains
// the authoritative pass/fail signal on the embedded artifact.
tasks.matching { it.name == "buildAndroid" }.configureEach {
    dependsOn("checkExtensionArtifact")
}
