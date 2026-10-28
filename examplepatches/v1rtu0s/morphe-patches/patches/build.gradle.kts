group = "app.blitzermorph"

patches {
    about {
        name = "BlitzerMorph"
        description = "Injects live mobile speed cameras from Blitzer.de (Atudo API) into Google Maps."
        source = "git@github.com:v1rtu0s/morphe-patches.git"
        author = "v1rtu0s"
        contact = "https://github.com/v1rtu0s"
        website = "https://github.com/v1rtu0s/morphe-patches"
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
