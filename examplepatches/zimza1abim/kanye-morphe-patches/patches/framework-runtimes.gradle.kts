import java.util.Properties

// Build Android framework-only runtimes. The shared extension contains unrelated
// dependencies whose classes must never replace the target app's libraries.
val androidSdk = providers.provider {
    // local.properties is untracked; CI runners only provide ANDROID_HOME.
    val properties = Properties().apply {
        rootProject.file("local.properties").takeIf { it.isFile }?.inputStream()?.use { load(it) }
    }
    file(properties.getProperty("sdk.dir") ?: System.getenv("ANDROID_HOME") ?: error("Android SDK not configured"))
}

/** Compiles src/<name>/java against android.jar into extensions/<name>.mpe. */
fun registerFrameworkRuntime(name: String) {
    val taskName = name.replaceFirstChar(Char::uppercase)
    val runtimeClasses = layout.buildDirectory.dir("$name-runtime/classes")
    val runtimeDex = layout.buildDirectory.dir("$name-runtime/dex")
    val runtimeResources = layout.buildDirectory.dir("$name-runtime/resources")
    val compile = tasks.register<JavaCompile>("compile${taskName}Runtime") {
        source(fileTree("src/$name/java") { include("**/*.java") })
        classpath = files(androidSdk.map { it.resolve("platforms/android-36/android.jar") })
        destinationDirectory.set(runtimeClasses)
        sourceCompatibility = "1.8"
        targetCompatibility = "1.8"
        options.encoding = "UTF-8"
    }
    val dex = tasks.register<JavaExec>("dex${taskName}Runtime") {
        dependsOn(compile)
        inputs.dir(runtimeClasses)
        outputs.dir(runtimeDex)
        classpath = files(androidSdk.map { it.resolve("build-tools/36.0.0/lib/d8.jar") })
        mainClass.set("com.android.tools.r8.D8")
        doFirst {
            runtimeDex.get().asFile.mkdirs()
            args = listOf("--min-api", "26", "--lib", androidSdk.get().resolve("platforms/android-36/android.jar").absolutePath,
                "--output", runtimeDex.get().asFile.absolutePath) +
                fileTree(runtimeClasses).matching { include("**/*.class") }.files.map { it.absolutePath }.sorted()
        }
    }
    val pack = tasks.register<Copy>("package${taskName}Runtime") {
        dependsOn(dex)
        from(runtimeDex) { include("classes.dex"); rename("classes.dex", "$name.mpe") }
        into(runtimeResources.map { it.dir("extensions") })
    }
    configure<SourceSetContainer> { named("main") { resources.srcDir(files(runtimeResources).builtBy(pack)) } }
    tasks.named("processResources") { dependsOn(pack) }
}

// The public source mirror leaves some runtimes out, so register only those present.
listOf("anytype", "bitwarden").filter { file("src/$it/java").isDirectory }.forEach(::registerFrameworkRuntime)
