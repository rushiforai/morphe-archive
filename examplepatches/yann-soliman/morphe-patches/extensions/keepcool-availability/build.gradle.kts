extension {
    name = "extensions/keepcool-availability.mpe"
}

configurations.configureEach {
    exclude(group = "org.jetbrains.kotlin", module = "kotlin-stdlib")
    exclude(group = "org.jetbrains", module = "annotations")
}

android {
    namespace = "io.github.yannsoliman.keepcool.availability"
}
