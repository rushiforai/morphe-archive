extension {
    name = "extensions/all/versioncode/change-version-code.mpe"
}

android {
    namespace = "app.morphe.extension"
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

dependencies {
    compileOnly(libs.annotation)
}
