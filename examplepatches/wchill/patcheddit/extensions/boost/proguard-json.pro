-keep class com.fasterxml.jackson.** { *; }
# Jackson's optional JVM DOM serializer is not used by the extension's JSON trees.
-dontwarn org.w3c.dom.bootstrap.DOMImplementationRegistry
