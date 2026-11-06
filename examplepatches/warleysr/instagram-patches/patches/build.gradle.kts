group = "io.github.warleysr"

patches {
    about {
        name = "Instagram Patches"
        description = "Morphe patches for Instagram (Keep screen on & Carousel auto scroll)"
        source = "git@github.com:warleysr/instagram-patches.git"
        author = "warleysr"
        contact = "https://github.com/warleysr/instagram-patches/issues"
        website = "https://github.com/warleysr/instagram-patches"
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
    }
}

dependencies {
    // Required due to smali, or build fails. Can be removed once smali is bumped.
    implementation(libs.guava)

    implementation(libs.morphe.patches.library)
    testImplementation(kotlin("test"))
    testImplementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.8.0")
}

