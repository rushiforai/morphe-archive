import java.util.Properties

// Keep this app's sources and runtime together in orca/.
val orcaRoot = rootProject.file("orca")
val orcaSdk = providers.provider {
    val properties = Properties().apply {
        rootProject.file("local.properties").takeIf { it.isFile }?.inputStream()?.use { load(it) }
    }
    file(properties.getProperty("sdk.dir") ?: System.getenv("ANDROID_HOME") ?: error("Android SDK not configured"))
}
val orcaClasses = layout.buildDirectory.dir("orca-runtime/classes")
val orcaDex = layout.buildDirectory.dir("orca-runtime/dex")
val orcaResources = layout.buildDirectory.dir("orca-runtime/resources")

val compileOrcaRuntime = tasks.register<JavaCompile>("compileOrcaRuntime") {
    source(fileTree(orcaRoot.resolve("runtime/src/main/java")) { include("**/*.java") })
    classpath = files(orcaSdk.map { it.resolve("platforms/android-36/android.jar") })
    destinationDirectory.set(orcaClasses)
    sourceCompatibility = "1.8"
    targetCompatibility = "1.8"
    options.encoding = "UTF-8"
}
val dexOrcaRuntime = tasks.register<JavaExec>("dexOrcaRuntime") {
    dependsOn(compileOrcaRuntime)
    inputs.dir(orcaClasses)
    outputs.dir(orcaDex)
    classpath = files(orcaSdk.map { it.resolve("build-tools/36.0.0/lib/d8.jar") })
    mainClass.set("com.android.tools.r8.D8")
    doFirst {
        orcaDex.get().asFile.mkdirs()
        args = listOf("--min-api", "26", "--lib", orcaSdk.get().resolve("platforms/android-36/android.jar").absolutePath,
            "--output", orcaDex.get().asFile.absolutePath) +
            fileTree(orcaClasses).matching { include("**/*.class") }.files.map { it.absolutePath }.sorted()
    }
}
val packageOrcaRuntime = tasks.register<Copy>("packageOrcaRuntime") {
    dependsOn(dexOrcaRuntime)
    from(orcaDex) { include("classes.dex"); rename("classes.dex", "orca.mpe") }
    into(orcaResources.map { it.dir("extensions") })
}
configure<SourceSetContainer> {
    named("main") {
        java.srcDir(orcaRoot.resolve("patches"))
        resources.srcDir(orcaRoot.resolve("resources"))
        resources.srcDir(files(orcaResources).builtBy(packageOrcaRuntime))
    }
}
configure<org.jetbrains.kotlin.gradle.dsl.KotlinJvmProjectExtension> {
    sourceSets.named("main") { kotlin.srcDir(orcaRoot.resolve("patches")) }
}
tasks.named("processResources") { dependsOn(packageOrcaRuntime) }

