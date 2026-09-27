package util

import com.google.gson.JsonObject
import com.google.gson.JsonParser

/** Structural validation shared by generation and isolated metadata-fixture tests. */
object PatchListValidator {
    /** Validates a serialized patch-list document. */
    fun validate(json: String) {
        validate(JsonParser.parseString(json).asJsonObject)
    }

    /** Validates required patch metadata and uniqueness within each compatible package. */
    fun validate(root: JsonObject) {
        require(root["version"]?.isJsonPrimitive == true && root["version"].asString.isNotBlank()) {
            "patch list is missing version"
        }
        val patches = root["patches"]?.takeIf { it.isJsonArray }?.asJsonArray
            ?: error("patch list is missing patches array")
        val namesByPackage = mutableMapOf<String, MutableSet<String>>()
        patches.forEach { element ->
            require(element.isJsonObject) { "patch entry is not an object" }
            val patch = element.asJsonObject
            val name = patch["name"]?.takeIf { it.isJsonPrimitive }?.asString
                ?.takeIf { it.isNotBlank() } ?: error("patch has no name")
            require(patch["default"]?.isJsonPrimitive == true) { "$name has no default" }
            val options = patch["options"]?.takeIf { it.isJsonArray }?.asJsonArray
                ?: error("$name has no options array")
            val optionKeys = mutableSetOf<String>()
            options.forEach { optionElement ->
                val option = optionElement.asJsonObject
                val key = option["key"]?.takeIf { it.isJsonPrimitive }?.asString
                    ?.takeIf { it.isNotBlank() } ?: error("$name has an invalid option key")
                check(optionKeys.add(key)) { "duplicate option $key on $name" }
                require(option["title"]?.isJsonPrimitive == true) { "$name/$key has no title" }
                require(option["type"]?.isJsonPrimitive == true) { "$name/$key has no type" }
                if (option["required"]?.asBoolean == true) {
                    require(option.has("default")) { "$name/$key has no required default" }
                }
            }
            patch["compatiblePackages"]?.takeUnless { it.isJsonNull }?.asJsonArray?.forEach { appElement ->
                val app = appElement.asJsonObject
                val packageName = app["packageName"]?.asString
                    ?.takeIf { it.contains('.') } ?: error("$name has an invalid package")
                check(namesByPackage.getOrPut(packageName) { mutableSetOf() }.add(name)) {
                    "duplicate patch name $name for $packageName"
                }
                val targets = app["targets"]?.takeIf { it.isJsonArray }?.asJsonArray
                    ?: error("$name/$packageName has no targets")
                require(targets.size() > 0) { "$name/$packageName has no targets" }
                targets.forEach { targetElement ->
                    val target = targetElement.asJsonObject
                    require(target["version"]?.asString?.isNotBlank() == true) {
                        "$name/$packageName has an invalid target version"
                    }
                    require(hasValidMinSdk(target)) {
                        "$name/$packageName has an invalid target minSdk"
                    }
                }
            }
        }
    }

    /** Accepts an explicit null or positive minimum SDK; rejects an absent or nonpositive value. */
    private fun hasValidMinSdk(target: JsonObject): Boolean = target["minSdk"]?.let { it.isJsonNull || it.asInt > 0 } == true
}
