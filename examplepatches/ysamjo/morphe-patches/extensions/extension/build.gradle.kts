extension {
    name = "extensions/extension.mpe"
}

android {
    namespace = "app.ysamjo.extension"
}

// Die testbare JS-Quelle wird als Java-Konstante in die Dex-Extension eingebettet.
abstract class GenerateChannelSpeedPayload : DefaultTask() {
    @get:InputFile
    @get:PathSensitive(PathSensitivity.RELATIVE)
    abstract val script: RegularFileProperty

    @get:OutputDirectory
    abstract val outputDirectory: DirectoryProperty

    @TaskAction
    fun generate() {
        val target = outputDirectory.file("app/ysamjo/extension/youtubetv/ChannelSpeedPayload.java").get().asFile
        target.parentFile.mkdirs()
        val literal = script.get().asFile.readLines().joinToString("\n            + ") { line ->
            "\"" + line.replace("\\", "\\\\").replace("\"", "\\\"").replace("\t", "\\t") + "\\n\""
        }
        target.writeText("package app.ysamjo.extension.youtubetv;\n" +
            "final class ChannelSpeedPayload {\n    static final String SCRIPT = $literal;\n" +
            "    private ChannelSpeedPayload() {}\n}\n")
    }
}

androidComponents.onVariants { variant ->
    val generatePayload = tasks.register<GenerateChannelSpeedPayload>("generate${variant.name.replaceFirstChar { it.uppercaseChar() }}ChannelSpeedPayload") {
        script.set(layout.projectDirectory.file("src/main/js/channel-speed.js"))
    }
    variant.sources.java?.addGeneratedSourceDirectory(generatePayload, GenerateChannelSpeedPayload::outputDirectory)
}
