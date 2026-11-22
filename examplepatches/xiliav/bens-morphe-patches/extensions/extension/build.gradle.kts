extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.template.extension"
    compileSdk = 37
    defaultConfig {
        minSdk = 32
    }
}

dependencies {
    implementation("org.lsposed.hiddenapibypass:hiddenapibypass:6.2")
    testImplementation("junit:junit:4.13.2")
}

tasks.withType<Test>().configureEach {
    testLogging {
        events("passed", "failed", "skipped")
    }
}
