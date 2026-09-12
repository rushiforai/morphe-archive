plugins {
    id("com.diffplug.spotless") version "8.10.2"
}

repositories {
    mavenCentral()
}

spotless {
    kotlin {
        target("patches/src/**/*.kt")
        ktlint("1.8.0")
    }
    kotlinGradle {
        target("*.gradle.kts", "patches/*.gradle.kts", "extensions/*/*.gradle.kts")
        ktlint("1.8.0")
    }
    java {
        target("extensions/*/src/**/*.java")
        googleJavaFormat("1.28.0")
    }
}

// Explicit CI/local gate: buildAndroid alone does not run all verification tasks.
tasks.register("qualityCheck") {
    group = "verification"
    description = "Check JVM formatting, Kotlin analysis, and Android lint"
    dependsOn(
        "spotlessCheck",
        ":patches:detekt",
        ":extensions:threads:lintDebug",
        ":extensions:zalo:lintDebug",
    )
}
