import java.util.Properties

// Keep this app's sources and runtime together in openbot/.
val openbotRoot = rootProject.file("openbot")
val openbotSdk = providers.provider {
    val properties = Properties().apply {
        rootProject.file("local.properties").takeIf { it.isFile }?.inputStream()?.use { load(it) }
    }
    file(properties.getProperty("sdk.dir") ?: System.getenv("ANDROID_HOME") ?: error("Android SDK not configured"))
}
val openbotClasses = layout.buildDirectory.dir("openbot-runtime/classes")
val openbotDex = layout.buildDirectory.dir("openbot-runtime/dex")
val openbotResources = layout.buildDirectory.dir("openbot-runtime/resources")

val compileOpenbotRuntime = tasks.register<JavaCompile>("compileOpenbotRuntime") {
    source(fileTree(openbotRoot.resolve("runtime/src/main/java")) { include("**/*.java") })
    classpath = files(openbotSdk.map { it.resolve("platforms/android-36/android.jar") })
    destinationDirectory.set(openbotClasses)
    sourceCompatibility = "1.8"
    targetCompatibility = "1.8"
    options.encoding = "UTF-8"
}
val dexOpenbotRuntime = tasks.register<JavaExec>("dexOpenbotRuntime") {
    dependsOn(compileOpenbotRuntime)
    inputs.dir(openbotClasses)
    outputs.dir(openbotDex)
    classpath = files(openbotSdk.map { it.resolve("build-tools/36.0.0/lib/d8.jar") })
    mainClass.set("com.android.tools.r8.D8")
    doFirst {
        openbotDex.get().asFile.mkdirs()
        args = listOf("--min-api", "26", "--lib", openbotSdk.get().resolve("platforms/android-36/android.jar").absolutePath,
            "--output", openbotDex.get().asFile.absolutePath) +
            fileTree(openbotClasses).matching { include("**/*.class") }.files.map { it.absolutePath }.sorted()
    }
}
val packageOpenbotRuntime = tasks.register<Copy>("packageOpenbotRuntime") {
    dependsOn(dexOpenbotRuntime)
    from(openbotDex) { include("classes.dex"); rename("classes.dex", "openbot.mpe") }
    into(openbotResources.map { it.dir("extensions") })
}
configure<SourceSetContainer> {
    named("main") {
        java.srcDir(openbotRoot.resolve("patches"))
        resources.srcDir(openbotRoot.resolve("resources"))
        resources.srcDir(files(openbotResources).builtBy(packageOpenbotRuntime))
    }
}
configure<org.jetbrains.kotlin.gradle.dsl.KotlinJvmProjectExtension> {
    sourceSets.named("main") { kotlin.srcDir(openbotRoot.resolve("patches")) }
}
tasks.named("processResources") { dependsOn(packageOpenbotRuntime) }

