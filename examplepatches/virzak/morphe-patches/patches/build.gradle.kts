group = "app.rutube"

patches {
    // Shown verbatim in Morphe Manager's patch source list, so keep it meaningful.
    about {
        name = "RuTube Patches"
        description = "Patches for the RuTube Android app"
        source = "https://github.com/virzak/morphe-patches"
        author = "Victor Irzak"
        contact = "https://github.com/virzak"
        website = "https://github.com/virzak/morphe-patches"
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
