group = "app.template"

patches {
    about {
        name = "DRTV Morphe Patches"
        description = "Permanent dark mode patch for the DRTV Android TV app (dk.dr.tvplayer)"
        source = "https://github.com/zenthora/drtv-morphe-patches.git"
        author = "zenthora"
        contact = "na"
        website = "https://github.com/zenthora/drtv-morphe-patches"
        license = "GPLv3"
    }
}

val patchListGeneratorClasspath = configurations.create("patchListGeneratorClasspath")

dependencies {
    compileOnly(libs.gson)
    patchListGeneratorClasspath(libs.gson)
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.10.2")
}

tasks {
    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath + patchListGeneratorClasspath
        mainClass.set("util.PatchListGeneratorKt")
    }

    register<JavaExec>("verifyPatch") {
        description = "Verify the built .mpp patch bundle against the APK in the DRTV_APK env var"
        dependsOn("buildAndroid")
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("util.VerifyPatchKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}

tasks.test {
    failOnNoDiscoveredTests = false
}
