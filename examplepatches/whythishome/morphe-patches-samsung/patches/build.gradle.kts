group = "app.whythishome"

patches {
    about {
        name = "Samsung Health Patches"
        description = "Morphe patches for Samsung Health, including Health Data Sharing visibility on non-Samsung devices"
        source = "https://github.com/whythishome/morphe-patches.git"
        author = "whythishome"
        contact = "https://github.com/whythishome/morphe-patches/issues"
        website = "https://github.com/whythishome/morphe-patches"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-receivers")
    }
}

dependencies {
    implementation(libs.gson)
}

tasks {
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
