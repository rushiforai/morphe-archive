plugins {
    alias(libs.plugins.ksp)
}

dependencies {
    compileOnly("androidx.preference:preference:1.2.0")
    implementation(libs.morphe.extensions.library)
    compileOnly(libs.bundles.boost)
    compileOnly(project(":extensions:boost:stub"))
    compileOnly(libs.annotation)
    compileOnly("com.squareup.okhttp3:okhttp:5.0.0-alpha.8")
    implementation(libs.jackson.databind.boost)
    implementation(libs.room.runtime)
    ksp(libs.room.compiler)
    coreLibraryDesugaring(libs.desugar.jdk.libs)
    testImplementation("junit:junit:4.13.2")
    testImplementation("com.squareup.okhttp3:okhttp:5.0.0-alpha.8")
}

android {
    buildTypes.getByName("release") {
        proguardFiles("proguard-json.pro")
    }
    sourceSets.getByName("main").java.directories.add(
        project(":extensions:shared:library").file("src/main/java").absolutePath
    )
    defaultConfig {
        minSdk = 26
    }
}
