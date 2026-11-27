group = "dev.vortexnode.sbrowserx"

patches {
    about {
        name = "SBrowserX"
        description = "Morphe patches for Samsung Internet Browser: extensions, privacy, UI and UX improvements."
        source = "https://github.com/vortexnode/SBrowserX"
        author = "vortexnode"
        contact = "https://github.com/vortexnode/SBrowserX/issues"
        website = "https://github.com/vortexnode/SBrowserX"
        license = "GPLv3"
    }
}

kotlin {
    compilerOptions {
        freeCompilerArgs.add("-Xcontext-parameters")
    }
}

dependencies {
    implementation(libs.gson)
}
