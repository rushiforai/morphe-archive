extension {
    // The name must be unique across every patch bundle a user combines:
    // bundles can end up sharing a class loader, and then the first file of a given name wins.
    name = "extensions/duetnudge.mpe"
}

android {
    namespace = "app.variablenine.nudge"

    defaultConfig {
        // Lowest Android version any supported YouTube or Reddit release still runs on.
        minSdk = 26
    }

    testOptions {
        unitTests {
            isIncludeAndroidResources = true
        }
    }
}

dependencies {
    // Deliberately no runtime dependencies. Whatever this module ships is merged into
    // the host app, where a class of the same name that already exists silently wins.

    testImplementation(libs.junit)
    testImplementation(libs.robolectric)
    // A real org.json for plain JVM tests; the Android jar on the unit test classpath only has stubs.
    testImplementation(libs.json)
}

tasks.withType<Test>().configureEach {
    // Robolectric downloads the Android runtime it simulates from Maven Central. Where
    // that is rate limited, a mirror can be named: -Pduet.robolectricRepo=https://...
    providers.gradleProperty("duet.robolectricRepo").orNull?.let {
        systemProperty("robolectric.dependency.repo.url", it)
    }
    testLogging {
        events("failed")
        showStandardStreams = false
    }
}
