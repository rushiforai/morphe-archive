extension {
    name = "extensions/zalo.mpe"
}

android {
    namespace = "com.zeldrisho.zalo.extension"
    testOptions {
        unitTests.all { testTask ->
            testTask.jvmArgs(
                "--add-opens=java.base/java.lang=ALL-UNNAMED",
                "--add-opens=java.base/java.util=ALL-UNNAMED",
                "--add-opens=java.base/java.io=ALL-UNNAMED",
                "--add-opens=java.base/java.net=ALL-UNNAMED",
                "--add-opens=java.base/java.security=ALL-UNNAMED",
                "--add-opens=java.base/java.text=ALL-UNNAMED",
                "--add-opens=java.base/jdk.internal.access=ALL-UNNAMED",
                "--add-opens=java.desktop/java.awt.font=ALL-UNNAMED",
                "--add-opens=jdk.compiler/com.sun.tools.javac.api=ALL-UNNAMED",
            )
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
