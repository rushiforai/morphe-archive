group = "io.github.warleysr"

patches {
    about {
        name = "Reddit NSFW Blocker"
        description = "Blocks NSFW content in the Reddit app"
        source = "git@github.com:warleysr/reddit-nsfw-blocker.git"
        author = "warleysr"
        contact = "https://github.com/warleysr/reddit-nsfw-blocker/issues"
        website = "https://github.com/warleysr/reddit-nsfw-blocker"
        license = "GNU General Public License v3.0, with additional GPL section 7 requirements"
    }
}

dependencies {
    // Required due to smali, or build fails. Can be removed once smali is bumped.
    implementation(libs.guava)

    implementation(libs.morphe.patches.library)
}
