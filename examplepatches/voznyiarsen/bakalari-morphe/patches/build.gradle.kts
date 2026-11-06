group = "tsuchinoko"

patches {
    about {
        name = "Bakal\u00e1\u0159i Morphe Patches"
        description = "Morphe patches for cz.bakalari.mobile (Bakaláři OnLine) - disable sponsored ad pop-ups"
        source = "git@github.com:voznyiarsen/bakalari-morphe.git"
        author = "tsuchinoko"
        contact = "na"
        website = "https://github.com/voznyiarsen/bakalari-morphe"
        license = "GNU General Public License v3.0"
    }
}

dependencies {
    implementation(libs.morphe.patches.library)
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
