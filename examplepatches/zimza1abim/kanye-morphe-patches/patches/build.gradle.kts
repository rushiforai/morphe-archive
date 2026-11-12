group = "app.template"

patches {
    about {
        name = "Kanye's Patches"
        description = "Patches for Brave, Bare, Titanium, Notesnook, Joplin, Anytype, and Bitwarden"
        source = ""
        author = "kanye"
        contact = "na"
        website = "na"
        license = "GPLv3"
    }
}

tasks.processResources {
    // UI versions are selected from the adapter registry, not one mutable bundle.
    exclude("joplin/index.android.bundle", "joplin/target.properties")
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
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
        args(layout.buildDirectory.file("libs/patches-${project.version}.mpp").get().asFile.absolutePath)
    }

    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("generatePatchesList")
    }
}

apply(from = "framework-runtimes.gradle.kts")
