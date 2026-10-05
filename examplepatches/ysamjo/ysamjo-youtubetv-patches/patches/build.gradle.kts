group = "app.ysamjo"

patches {
    about {
        name = "ysamjo YouTube TV Patches"
        description = "Patches for YouTube for Android TV (com.google.android.youtube.tv)."
        source = "https://github.com/ysamjo/ysamjo-youtubetv-patches"
        author = "ysamjo"
        contact = "https://github.com/ysamjo"
        website = "https://github.com/ysamjo/ysamjo-youtubetv-patches"
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
