group = "app.edgewindow"

patches {
    about {
        name = "Edge Window Patches"
        description = "Display cutout compatibility patches for Android apps"
        source = "https://github.com/ymshin-dev/edge-window-patches"
        author = "ymshin-dev"
        contact = "https://github.com/ymshin-dev"
        website = "https://github.com/ymshin-dev/edge-window-patches"
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
