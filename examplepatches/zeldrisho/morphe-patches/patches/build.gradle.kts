plugins {
    // Matches the Kotlin 2.4.10 compiler supplied by Morphe; see docs/development.md.
    id("dev.detekt") version "2.0.0-alpha.6"
}

detekt {
    buildUponDefaultConfig = true
    config.setFrom(rootProject.file("config/detekt/detekt.yml"))
}

group = "com.zeldrisho.threads"

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

    // The extension module build only produces
    // extensions/extension/build/morphe/extensions/extension.mpe, but the
    // Hide-ads patch resolves extendWith("extensions/extension.mpe") relative
    // to the patch working dir (repo root). This copy used to be manual (see
    // docs/plan.md) — now it is part of the build so CI and local builds
    // cannot silently ship a stale/missing dex. Single-file outputs keep
    // Gradle validation happy (no whole-directory ownership).
    register("copyExtensionMpe") {
        description = "Copy the companion extension .mpe to repo-relative extensions/extension.mpe"
        val src = project(":extensions:extension").layout.buildDirectory.file("morphe/extensions/extension.mpe")
        val dst = rootDir.resolve("extensions/extension.mpe")
        inputs.file(src)
        outputs.file(dst)
        dependsOn(":extensions:extension:syncExtension")
        doLast {
            project.copy {
                from(src)
                into(dst.parentFile)
            }
        }
    }

    // Fail fast when the companion extension dex is missing instead of producing
    // a bundle whose Hide-ads patch silently no-ops at runtime (extendWith is a
    // load-time reference, so buildAndroid succeeds even without the .mpe).
    register("verifyExtensionMpe") {
        description = "Fail fast when the companion extension .mpe is missing or stale"
        dependsOn("copyExtensionMpe")
        doLast {
            val mpe = rootDir.resolve("extensions/extension.mpe")
            check(mpe.isFile) {
                "Missing extensions/extension.mpe after copyExtensionMpe — " +
                    "check :extensions:extension:assembleRelease output."
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

// The Hide-ads patch loads the companion extension dex via
// extendWith("extensions/extension.mpe"). Ensure the .mpe is copied fresh and
// present before compiling the Android bundle, so a stale/missing copy fails
// here with a clear message instead of shipping a broken patch.
// processResources consumes the copied .mpe, so it must run after the copy.
tasks.matching { it.name == "buildAndroid" }.configureEach {
    dependsOn("verifyExtensionMpe")
}
tasks.matching { it.name == "processResources" }.configureEach {
    dependsOn("copyExtensionMpe")
}
