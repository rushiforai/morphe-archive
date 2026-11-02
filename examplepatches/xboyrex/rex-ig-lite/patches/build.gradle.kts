group = "app.rex"

patches {
    about {
        name = "xboyrex"
        description = "xboyrex Morphe patches for Instagram & X by Mayank (@xboyrex)"
        source = "git@github.com:xboyrex/rex-ig-lite.git"
        author = "xboyrex"
        contact = "xboyrex496@gmail.com"
        website = "https://github.com/xboyrex/rex-ig-lite"
        license = "GNU General Public License v3.0"
    }
}

dependencies {
    compileOnly("com.github.REAndroid:ARSCLib:a28c6fb2a7")

    // Used by JsonGenerator.
    implementation(libs.gson)

    implementation(libs.morphe.patches.library)
}

tasks {
    register<JavaExec>("checkStringResources") {
        description = "Checks resource strings for invalid formatting"

        dependsOn(compileKotlin)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.resource.CheckStringKt")
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build, "buildAndroid")

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }
    // Used by gradle-semantic-release-plugin.
    publish {
        dependsOn("buildAndroid", "generatePatchesList")
    }
}
