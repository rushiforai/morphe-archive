import com.android.build.api.dsl.ApplicationExtension

extension {
    name = "extensions/cobalt-downloads.mpe"
}

android {
    namespace = "dev.skulldogged.cobalt.extension"
}

configure<ApplicationExtension> {
    defaultConfig {
        minSdk = 26
    }
}

dependencies {
    implementation("androidx.media3:media3-muxer:1.10.1")
}
