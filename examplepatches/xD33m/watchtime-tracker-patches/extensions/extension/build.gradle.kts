extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "io.github.xd33m.watchtime.addon"
}

dependencies {
    compileOnly(project(":host-stub"))
    testImplementation(libs.junit)
}
