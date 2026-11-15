val patchBundleVersion = providers.gradleProperty("version").getOrElse("0.0.0")

android {
    namespace = "app.morphe.extension.instagram"

    buildFeatures {
        buildConfig = true
    }

    defaultConfig {
        minSdk = 26
        buildConfigField("String", "BUNDLE_VERSION", "\"$patchBundleVersion\"")
    }

    lint {
        abortOnError = false
        checkReleaseBuilds = false
        warningsAsErrors = false
        disable += setOf(
            "MissingPermission",
            "MissingSuperCall",
            "NewApi",
            "NotificationPermission",
            "AppCompatCustomView",
            "GestureBackNavigation",
            "WrongConstant",
            "UnspecifiedRegisterReceiverFlag",
            "Range",
            "SoonBlockedPrivateApi"
        )
    }
}

dependencies {
    compileOnly(project(":extensions:shared:library"))
    compileOnly(project(":extensions:instagram:stub"))
    compileOnly(libs.morphe.extensions.library)
    compileOnly(libs.annotation)
    compileOnly(libs.appcompat)
}
