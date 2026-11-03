group = "app.zerobun"

patches {
    // TODO: Update this section with your project details.
    about {
        name = "Zerobun Patches"
        description = "Instagram follower tracker for the Zerobun home lab. Use alongside Piko."
        source = "git@github.com:zerobun0/zerobun-morphe-patches.git"
        author = "zerobun0"
        contact = "https://github.com/zerobun0/zerobun-morphe-patches/issues"
        website = "https://github.com/zerobun0/zerobun-morphe-patches"
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
