// Compile-only copies of the official Morphe extension methods the add-on calls. Never shipped: the extension
// depends on this module with compileOnly, and the patch checks at patch time that the real methods exist.
plugins {
    `java-library`
}

java {
    sourceCompatibility = JavaVersion.VERSION_17
    targetCompatibility = JavaVersion.VERSION_17
}
