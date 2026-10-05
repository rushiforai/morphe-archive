import com.android.build.api.dsl.ApplicationExtension

dependencies {
    compileOnly(project(":extensions:nsfwblocker:stub"))
}

configure<ApplicationExtension> {
    compileSdk = 36

    defaultConfig {
        minSdk = 28
    }
}
