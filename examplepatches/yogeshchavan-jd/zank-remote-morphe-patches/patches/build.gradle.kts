group = "com.morphe.patches.zankremote"

patches {
    about {
        name = "Zank Remote Patches"
        description = "Morphe patches for Zank Remote Android & TV controller"
        source = "git@github.com:yogeshchavan-jd/zank-remote-morphe-patches.git"
        author = "yogeshchavan-jd"
        contact = "na"
        website = "https://github.com/yogeshchavan-jd/zank-remote-morphe-patches"
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
