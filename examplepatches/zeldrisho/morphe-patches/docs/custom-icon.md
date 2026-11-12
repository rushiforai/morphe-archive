# Zalo custom launcher icon

Download the [example PNG](images/example-launcher-icon.png) as a file (not a screenshot or a web page). It is a 192 × 192 non-interlaced PNG with transparent padding. The patch accepts PNG, not SVG.

The example is derived from the [Lawnicons Zalo SVG](https://github.com/LawnchairLauncher/lawnicons/blob/b1b123e6e872d03350a240d4d74f65813bfd0ccb/svgs/zalo.svg): we scaled it down and rasterized it onto a transparent canvas. The original [SVG](images/lawnicons-zalo.svg) and [Apache 2.0 license](images/LAWNICONS-LICENSE.txt) are included. The launcher applies its own mask; the patch uses a white adaptive icon background.

In Morphe Desktop, select Zalo 26.10.02 and this patch bundle. In the patch selection screen, enable **Change Zalo app icon** and set its **PNG icon path** option to the absolute path of the downloaded PNG on the computer running Morphe. This is a path to a PNG file, not an Icon Studio folder or a URL. Patch the app and install the output; the custom icon is applied without an in-app switch. Launchers may take time to refresh their icons.

The PNG must be square, 48–512 pixels per side, non-interlaced and no larger than **1 MiB**. Leave padding around the artwork for Android's adaptive icon mask. If patching fails, check that Morphe can read the file and inspect the error message; the option is read during patching, not imported in the running app.

Installing an output with the original package ID can replace an installed app only if the signatures match. Do not uninstall an existing app or clear its data just to install the patched output.
