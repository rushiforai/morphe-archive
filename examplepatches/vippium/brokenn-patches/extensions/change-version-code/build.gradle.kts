extension {
    name = "extensions/change-version-code.mpe"
}

android {
    namespace = "app.brokenn.extension.all.versioncode"

    // getVersionCodeLong is only injected into P+ call sites.
    lint {
        disable += "NewApi"
    }
}
