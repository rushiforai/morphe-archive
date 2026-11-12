#!/usr/bin/env python3
"""Build a separate Android test APK. Does not install, launch, or change Anytype."""
import argparse
import os
from pathlib import Path
import shutil
import subprocess
from zipfile import ZipFile

parser = argparse.ArgumentParser()
parser.add_argument('--sdk', type=Path, required=True)
parser.add_argument('--java-home', type=Path, required=True)
parser.add_argument('--variable-font', type=Path, required=True)
parser.add_argument('--otf-font', type=Path, required=True)
parser.add_argument('--out', type=Path, required=True)
a = parser.parse_args()
root = Path(__file__).resolve().parents[2]
out = a.out.resolve()
for folder in ('assets', 'classes', 'dex'):
    (out / folder).mkdir(parents=True, exist_ok=True)
shutil.copyfile(a.variable_font, out / 'assets/Variable.ttf')
shutil.copyfile(a.otf_font, out / 'assets/Regular.otf')
sdk = a.sdk.resolve()
bt = sdk / 'build-tools/36.0.0'
android = sdk / 'platforms/android-36/android.jar'
env = dict(os.environ, JAVA_HOME=str(a.java_home.resolve()))
def run(*args):
    subprocess.run([str(x) for x in args], check=True, env=env)
manifest = out / 'AndroidManifest.xml'
manifest.write_text('''<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="app.font.anytype.test">
<uses-sdk android:minSdkVersion="28" android:targetSdkVersion="36"/>
<application android:name="app.font.anytype.test.FontRuntimeTest$App" android:label="Anytype font tests" android:debuggable="true" android:theme="@android:style/Theme.Material.Light.NoActionBar">
<activity android:name="app.font.anytype.test.FontRuntimeTest" android:exported="true"/>
<provider android:name="app.font.anytype.test.FontRuntimeTest$Provider" android:authorities="app.font.anytype.test.files" android:exported="false"/>
</application></manifest>''')
sources = sorted((root / 'patches/src/anytype/java').rglob('*.java'))
sources.append(root / 'scripts/anytype/android/FontRuntimeTest.java')
run(a.java_home / 'bin/javac', '-source', '8', '-target', '8', '-cp', android, '-d', out/'classes', *sources)
run(a.java_home / 'bin/java', '-cp', bt/'lib/d8.jar', 'com.android.tools.r8.D8', '--min-api', '28', '--lib', android, '--output', out/'dex', *sorted((out/'classes').rglob('*.class')))
run(bt/'aapt2', 'link', '-o', out/'unsigned.apk', '--manifest', manifest, '-I', android, '-A', out/'assets')
with ZipFile(out/'unsigned.apk', 'a') as zipfile:
    zipfile.write(out/'dex/classes.dex', 'classes.dex')
key = out/'test.jks'
if not key.exists():
    run(a.java_home/'bin/keytool', '-genkeypair', '-keystore', key, '-storepass', 'android', '-keypass', 'android', '-alias', 'androiddebugkey', '-dname', 'CN=Anytype Font Tests', '-keyalg', 'RSA', '-validity', '30')
run(bt/'zipalign', '-f', '-p', '4', out/'unsigned.apk', out/'aligned.apk')
run(bt/'apksigner', 'sign', '--ks', key, '--ks-pass', 'pass:android', '--out', out/'test.apk', out/'aligned.apk')
print(out/'test.apk')
