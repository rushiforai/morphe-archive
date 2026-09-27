import javax.xml.parsers.DocumentBuilderFactory

plugins {
    id("com.diffplug.spotless") version "8.10.2"
}

repositories {
    mavenCentral()
}

spotless {
    kotlin {
        target("patches/src/**/*.kt")
        ktlint("1.8.0")
    }
    kotlinGradle {
        target("*.gradle.kts", "patches/*.gradle.kts", "extensions/*/*.gradle.kts")
        ktlint("1.8.0")
    }
    java {
        target("extensions/*/src/**/*.java")
        googleJavaFormat("1.28.0")
    }
}

// Explicit CI/local gate: buildAndroid alone does not run all verification tasks.
tasks.register("qualityCheck") {
    group = "verification"
    description = "Check JVM formatting, Kotlin analysis, and Android lint"
    dependsOn(
        "spotlessCheck",
        ":patches:detekt",
        ":extensions:threads:lintDebug",
        ":extensions:zalo:lintDebug",
    )
}

tasks.register("coverageReport") {
    group = "verification"
    description = "Generate JVM and Android extension unit-test coverage reports"
    dependsOn(
        ":patches:test",
        ":extensions:threads:testDebugUnitTest",
        ":extensions:zalo:testDebugUnitTest",
        ":patches:jacocoTestReport",
        ":extensions:threads:createCoverageReport",
        ":extensions:zalo:createCoverageReport",
    )
}

tasks.register("coverageVerification") {
    group = "verification"
    description = "Verify established line-coverage baselines and generate all coverage reports"
    dependsOn("coverageReport", ":patches:jacocoTestCoverageVerification")
    doLast {
        val baselines = listOf(
            "patches/build/reports/jacoco/test/jacocoTestReport.xml" to 0.80,
            (
                "extensions/threads/build/intermediates/code_coverage_data/global/collectDebugCoverage/" +
                    "debugExtensionsThreadsUnitTestXmlReport.xml"
                ) to 0.91,
            (
                "extensions/zalo/build/intermediates/code_coverage_data/global/collectDebugCoverage/" +
                    "debugExtensionsZaloUnitTestXmlReport.xml"
                ) to 0.80,
        )
        baselines.forEach { (path, minimum) ->
            val report = rootProject.file(path)
            check(report.isFile) { "Missing coverage report: $report" }
            val factory = DocumentBuilderFactory.newInstance().apply {
                setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd", false)
                setFeature("http://xml.org/sax/features/external-general-entities", false)
                setFeature("http://xml.org/sax/features/external-parameter-entities", false)
            }
            val counters = factory.newDocumentBuilder().parse(report).getElementsByTagName("counter")
            val lineCounter = (0 until counters.length)
                .map { counters.item(it) as org.w3c.dom.Element }
                .lastOrNull { it.getAttribute("type") == "LINE" }
                ?: error("Missing LINE counter in $report")
            val covered = lineCounter.getAttribute("covered").toInt()
            val missed = lineCounter.getAttribute("missed").toInt()
            val ratio = covered.toDouble() / (covered + missed)
            check(ratio >= minimum) {
                "Line coverage for $path is %.1f%%; minimum is %.1f%%".format(ratio * 100, minimum * 100)
            }
            logger.lifecycle("Line coverage $path: %.1f%% (minimum %.1f%%)".format(ratio * 100, minimum * 100))
        }
    }
}

tasks.register("verify") {
    group = "verification"
    description = "Run the canonical JVM, extension, and bundle verification gate"
    dependsOn(
        "qualityCheck",
        ":patches:test",
        ":extensions:threads:testDebugUnitTest",
        ":extensions:zalo:testDebugUnitTest",
        ":patches:verifyBundleExtension",
        "coverageVerification",
    )
}
