android {
    namespace = "app.morphe.extension"

    defaultConfig {
        minSdk = 28
    }

    lint {
        abortOnError = false
        checkReleaseBuilds = false
        warningsAsErrors = false
    }
}

dependencies {
    implementation(project(":extensions:shared:library"))
}
