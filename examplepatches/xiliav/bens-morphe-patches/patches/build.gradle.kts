group = "io.github.xiliav.benspatches"

patches {
    about {
        name = "Ben's Morphe Patches"
        description = "Android app patches for use with Morphe Manager"
        source = "https://github.com/xiliav/bens-morphe-patches"
        author = "xiliav"
        contact = "https://github.com/xiliav/bens-morphe-patches/issues"
        website = "https://morphe.software/add-source?github=xiliav/bens-morphe-patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

// Separate configuration so gson is available at runtime for the
// generatePatchesList task but never bundled into the APK.
val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    testImplementation("junit:junit:4.13.2")
}

tasks.test {
    useJUnit()
    testLogging {
        events("passed", "failed", "skipped")
    }
}

tasks.named("check") {
    dependsOn(":extensions:extension:testDebugUnitTest")
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}
