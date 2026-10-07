group = "app.ysamjo"

patches {
    about {
        name = "ysamjo RTL+ Patches"
        description = "Patches für RTL+ (de.rtli.tvnow) — entfernt Werbung für Premium-Abonnenten, die sie trotz Bezahlung erhalten."
        source = "https://github.com/ysamjo/ysamjo-rtlplus-patches"
        author = "ysamjo"
        contact = "https://github.com/ysamjo"
        website = "https://github.com/ysamjo/ysamjo-rtlplus-patches"
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
