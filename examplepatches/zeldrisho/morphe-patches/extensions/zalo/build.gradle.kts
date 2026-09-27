extension {
    name = "extensions/zalo.mpe"
}

android {
    namespace = "com.zeldrisho.zalo.extension"
    testOptions {
        unitTests.all { testTask ->
            testTask.extensions.configure<org.gradle.testing.jacoco.plugins.JacocoTaskExtension> {
                setIncludeNoLocationClasses(true)
                setExcludes(listOf("jdk.internal.*"))
            }
        }
    }
    buildTypes {
        getByName("debug") {
            enableUnitTestCoverage = true
        }
    }
}

dependencies {
    testImplementation(libs.junit)
    testImplementation(libs.robolectric)
}
