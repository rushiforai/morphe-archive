import com.android.build.api.dsl.ApplicationExtension

dependencies {
    compileOnly(project(":extensions:instagram:stub"))
    compileOnly(libs.morphe.extensions.library)
    compileOnly(libs.annotation)
    compileOnly(libs.appcompat)
}

configure<ApplicationExtension> {
    compileSdk = 36

    defaultConfig {
        minSdk = 26
    }
}
