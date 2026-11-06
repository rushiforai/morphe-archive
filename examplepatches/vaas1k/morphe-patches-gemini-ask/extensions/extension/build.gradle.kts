extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.geminiask.extension"

    defaultConfig {
        minSdk = 26
    }
}

dependencies {
    compileOnly(project(":extensions:extension:stub"))
}
