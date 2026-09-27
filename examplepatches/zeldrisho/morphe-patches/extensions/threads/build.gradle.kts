extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "com.zeldrisho.threads.extension"
    buildTypes {
        getByName("debug") {
            enableUnitTestCoverage = true
        }
    }
}

dependencies {
    testImplementation(libs.junit)
}
