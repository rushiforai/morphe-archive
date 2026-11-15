plugins {
    alias(libs.plugins.android.library)
}

android {
    namespace = "app.morphe.extension.instagram"
    compileSdk = 36

    defaultConfig {
        minSdk = 26
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    lint {
        abortOnError = false
        checkReleaseBuilds = false
        warningsAsErrors = false
        disable += setOf("LintError")
    }
}
