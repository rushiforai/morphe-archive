extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.zeldrisho.extension"
    testOptions.unitTests.all { it.useJUnitPlatform() }
}

dependencies {
    testImplementation("org.junit.jupiter:junit-jupiter:6.1.3")
    testRuntimeOnly("org.junit.platform:junit-platform-launcher:6.1.3")
}
