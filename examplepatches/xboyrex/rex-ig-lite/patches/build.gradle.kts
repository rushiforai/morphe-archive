group = "app.rex"

patches {
    about {
        name = "Rex IG Lite"
        description = "Rex IG Lite AMOLED Morphe Patch Suite for Instagram & X by xboyrex"
        source = "git@github.com:xboyrex/rex-ig-lite.git"
        author = "xboyrex (Mayank)"
        contact = "https://t.me/MayankDroid7"
        website = "https://github.com/xboyrex/rex-ig-lite"
        license = "GNU General Public License v3.0"
    }
}

dependencies {
    compileOnly("com.github.REAndroid:ARSCLib:a28c6fb2a7")
    implementation(libs.gson)
    implementation(libs.morphe.patches.library)
}

tasks {
    register<JavaExec>("runRexPatchManifestTest") {
        description = "Runs Rex IG Lite patch manifest and architectural verification tests"

        dependsOn("testClasses")

        workingDir = rootProject.projectDir
        classpath = sourceSets["test"].runtimeClasspath
        mainClass.set("app.rex.patches.instagram.RexPatchManifestTest")
    }

    withType<Test>().configureEach {
        failOnNoDiscoveredTests = false
        dependsOn("runRexPatchManifestTest")
    }

    register<JavaExec>("checkStringResources") {
        description = "Checks resource strings for invalid formatting"

        dependsOn(compileKotlin)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.resource.CheckStringKt")
    }

    register<JavaExec>("generatePatchesList") {
        description = "Build patch with patch list"

        dependsOn(build)

        classpath = sourceSets["main"].runtimeClasspath
        mainClass.set("app.morphe.util.PatchListGeneratorKt")
    }

    publish {
        dependsOn("generatePatchesList")
    }
}
