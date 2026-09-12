package com.zeldrisho.patches.zalo.ads

import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.zeldrisho.patches.shared.resources.stripAdIdPermissions
import org.junit.Assume.assumeTrue
import org.junit.Rule
import org.junit.rules.TemporaryFolder
import java.io.ByteArrayInputStream
import java.io.File
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

class ZaloAdsTargetTest {
    @get:Rule val temporary = TemporaryFolder()

    /** Creates a patch context with the pinned Zalo package metadata. */
    private fun context(): BytecodePatchContext {
        val config = PatcherConfig(apkFile = temporary.newFile("input.apk"), temporaryFilesPath = temporary.newFolder())
        val metadata = PackageMetadata::class.java.constructors.single().newInstance(
            "com.zing.zalo",
            "26.08.01",
            "260801903",
            null,
        )
        return BytecodePatchContext::class.java.getConstructor(PatcherConfig::class.java, PackageMetadata::class.java)
            .newInstance(config, metadata)
    }

    /** Builds a synthetic public class containing the supplied methods. */
    private fun classDef(type: String, methods: List<Method>) = ImmutableClassDef(
        type,
        AccessFlags.PUBLIC.value,
        "Ljava/lang/Object;",
        emptyList(),
        null,
        emptySet(),
        emptyList(),
        methods,
    )

    /** Builds the offline-ad time-window method matched by [OfflineAdsWindow]. */
    private fun windowMethod() = ImmutableMethod(
        "Lvx/s2;",
        "h",
        emptyList(),
        "Z",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        emptySet(),
        emptySet(),
        ImmutableMethodImplementation(
            4,
            listOf(
                ImmutableInstruction21c(
                    Opcode.SGET_BOOLEAN,
                    0,
                    ImmutableFieldReference("Lu52/d;", "I", "Z"),
                ),
                ImmutableInstruction21c(
                    Opcode.SGET_OBJECT,
                    0,
                    ImmutableFieldReference("Lu52/d;", "H", "Ljava/lang/Long;"),
                ),
                ImmutableInstruction35c(
                    Opcode.INVOKE_VIRTUAL,
                    1,
                    0,
                    0,
                    0,
                    0,
                    0,
                    ImmutableMethodReference("Ljava/lang/Long;", "longValue", emptyList(), "J"),
                ),
                ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                ImmutableInstruction11x(Opcode.RETURN, 0),
            ),
            emptyList(),
            emptyList(),
        ),
    )

    /** Builds the tracker gate method matched by [OfflineAdsGate]. */
    private fun trackerGateMethod() = ImmutableMethod(
        "Lvx/s2;",
        "g",
        emptyList(),
        "Z",
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        emptySet(),
        emptySet(),
        ImmutableMethodImplementation(
            2,
            listOf(
                ImmutableInstruction35c(
                    Opcode.INVOKE_STATIC,
                    0,
                    0,
                    0,
                    0,
                    0,
                    0,
                    ImmutableMethodReference("Lvx/s2;", "h", emptyList(), "Z"),
                ),
                ImmutableInstruction21c(
                    Opcode.SGET_BOOLEAN,
                    0,
                    ImmutableFieldReference("Lu52/d;", "J", "Z"),
                ),
                ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                ImmutableInstruction11x(Opcode.RETURN, 0),
            ),
            emptyList(),
            emptyList(),
        ),
    )

    /** Builds a config-read method with a caller-selected key and result register. */
    private fun configGateMethod(
        owner: String,
        name: String,
        key: String,
        returnType: String = "V",
        resultReg: Int = 1,
    ) = ImmutableMethod(
        owner,
        name,
        emptyList(),
        returnType,
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        emptySet(),
        emptySet(),
        ImmutableMethodImplementation(
            6,
            listOf(
                ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(key)),
                ImmutableInstruction11n(Opcode.CONST_4, 1, 0),
                ImmutableInstruction35c(
                    Opcode.INVOKE_STATIC,
                    2,
                    0,
                    1,
                    0,
                    0,
                    0,
                    ImmutableMethodReference("Lvj0/m;", "f", listOf("Ljava/lang/String;", "I"), "I"),
                ),
                ImmutableInstruction11x(Opcode.MOVE_RESULT, resultReg),
                ImmutableInstruction22t(Opcode.IF_NE, resultReg, 1, 0),
            ),
            emptyList(),
            emptyList(),
        ),
    )

    @Test fun offlineGatesMatchSyntheticMethods() {
        val windowCls = classDef("Lvx/s2;", listOf(windowMethod()))
        val gateCls = classDef("Lvx/s2;", listOf(trackerGateMethod()))
        with(context()) {
            OfflineAdsWindow.clearMatch()
            assertEquals(
                "h",
                OfflineAdsWindow.matchAll(windowCls, 1..1).single().originalMethod.name,
            )
            OfflineAdsGate.clearMatch()
            assertEquals(
                "g",
                OfflineAdsGate.matchAll(gateCls, 1..1).single().originalMethod.name,
            )
        }
    }

    @Test fun configGatesMatchBothCallSites() {
        val storyA = configGateMethod("Lstory/A;", "A6", "social@story@story_ads@enable")
        val storyB = configGateMethod("Lkz0/u;", "f", "social@story@story_ads@enable", resultReg = 3)
        val commA = configGateMethod("Ljt/m;", "c", "community.community_ads.enable", resultReg = 0)
        val commB = configGateMethod(
            "Ljt/e;",
            "Q",
            "community.community_ads.enable",
            returnType = "Ljava/lang/Object;",
            resultReg = 2,
        )
        with(context()) {
            StoryAdsConfig.clearMatch()
            assertEquals(
                2,
                StoryAdsConfig.matchAll(
                    classDef("Lstory/A;", listOf(storyA)),
                    1..1,
                ).size + StoryAdsConfig.matchAll(classDef("Lkz0/u;", listOf(storyB)), 1..1).size,
            )
            CommunityAdsConfig.clearMatch()
            assertEquals(
                2,
                CommunityAdsConfig.matchAll(classDef("Ljt/m;", listOf(commA)), 1..1).size +
                    CommunityAdsConfig.matchAll(classDef("Ljt/e;", listOf(commB)), 1..1).size,
            )
        }
    }

    /** Minimal LAT reader: Play lookup plus opt-out flag read, null return. */
    private fun latReadMethod() = ImmutableMethod(
        "Lcom/adtima/d;",
        "doInBackground",
        emptyList(),
        "Ljava/lang/Object;",
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
        emptySet(),
        emptySet(),
        ImmutableMethodImplementation(
            2,
            listOf(
                ImmutableInstruction35c(
                    Opcode.INVOKE_STATIC,
                    1,
                    0,
                    0,
                    0,
                    0,
                    0,
                    ImmutableMethodReference(
                        "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient;",
                        "getAdvertisingIdInfo",
                        listOf("Landroid/content/Context;"),
                        "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;",
                    ),
                ),
                ImmutableInstruction11x(Opcode.MOVE_RESULT_OBJECT, 0),
                ImmutableInstruction35c(
                    Opcode.INVOKE_VIRTUAL,
                    1,
                    0,
                    0,
                    0,
                    0,
                    0,
                    ImmutableMethodReference(
                        "Lcom/google/android/gms/ads/identifier/AdvertisingIdClient\$Info;",
                        "isLimitAdTrackingEnabled",
                        emptyList(),
                        "Z",
                    ),
                ),
                ImmutableInstruction11x(Opcode.MOVE_RESULT, 0),
                ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
            ),
            emptyList(),
            emptyList(),
        ),
    )

    @Test fun latReadMatchesSyntheticReader() {
        val cls = classDef("Lcom/adtima/d;", listOf(latReadMethod()))
        with(context()) {
            AdtimaLatRead.clearMatch()
            assertEquals(
                "doInBackground",
                AdtimaLatRead.matchAll(cls, 1..1).single().originalMethod.name,
            )
        }
    }

    @Test fun forceLimitAdTrackingReportsOptedOut() {
        val method = latReadMethod().toMutable()
        forceLimitAdTracking(method)
        val edited = method.implementation!!.instructions.toList()
        assertEquals(
            listOf(Opcode.CONST_4, Opcode.SPUT, Opcode.CONST_4, Opcode.RETURN_OBJECT),
            edited.map { it.opcode },
        )
        val sput = edited[1] as ReferenceInstruction
        assertEquals("mIsLat", (sput.reference as FieldReference).name)
    }

    @Test fun zaloManifestStripRemovesOnlyAdId() {
        val doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
            ByteArrayInputStream(
                """<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.zing.zalo">
                  <uses-permission android:name="android.permission.INTERNET"/>
                  <uses-permission android:name="com.google.android.gms.permission.AD_ID"/>
                  <uses-permission android:name="android.permission.ACCESS_ADSERVICES_AD_ID"/>
                  <uses-permission android:name="android.permission.CAMERA"/>
                </manifest>""".toByteArray(),
            ),
        )
        assertEquals(2, stripAdIdPermissions(doc))
        val remaining = (0 until doc.getElementsByTagName("uses-permission").length).map {
            (doc.getElementsByTagName("uses-permission").item(it) as org.w3c.dom.Element)
                .getAttribute("android:name")
        }
        assertEquals(listOf("android.permission.INTERNET", "android.permission.CAMERA"), remaining)
    }

    @Test fun zeroConfigResultWritesZeroToMoveResultRegister() {
        // match.method needs the class registered in the patch context (absent here),
        // so exercise the production helper on a detached mutable copy instead.
        val method = configGateMethod("Ljt/m;", "c", "community.community_ads.enable", resultReg = 0)
            .toMutable()
        val moveIndex = method.implementation!!.instructions.toList()
            .indexOfFirst { it.opcode == Opcode.MOVE_RESULT }
        assertEquals(3, moveIndex)
        // The injected const targets the MOVE_RESULT register (v0 here).
        zeroConfigResult(method, listOf(moveIndex, moveIndex + 1))
        val edited = method.implementation!!.instructions.toList()
        assertEquals(6, edited.size)
        assertEquals(Opcode.CONST_4, edited[moveIndex + 1].opcode)
        assertEquals(0, (edited[moveIndex + 1] as OneRegisterInstruction).registerA)
    }

    /** Opt-in local DEX validation against the pinned Zalo base APK; skipped in CI. */
    @Test fun matchesPinnedZaloApkWhenProvided() {
        val path = System.getenv("ZALO_TEST_APK")
        assumeTrue("Set ZALO_TEST_APK to the pinned Zalo base APK for DEX validation", !path.isNullOrBlank())
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val classes = container.dexEntryNames.asSequence().flatMap {
            container.getEntry(it)!!.dexFile.classes.asSequence()
        }.associateBy { it.type }
        with(context()) {
            OfflineAdsWindow.clearMatch()
            assertEquals(
                "h",
                OfflineAdsWindow.matchAll(classes.getValue("Lvx/s2;"), 1..1).single().originalMethod.name,
            )
            OfflineAdsGate.clearMatch()
            assertEquals(
                "g",
                OfflineAdsGate.matchAll(classes.getValue("Lvx/s2;"), 1..1).single().originalMethod.name,
            )
            GoogleAdsNetworkGate.clearMatch()
            val network = GoogleAdsNetworkGate.matchAll(
                classes.getValue("Lcom/adtima/Adtima;"),
                1..1,
            ).single()
            assertTrue(network.instructionMatches.any { it.instruction.opcode == Opcode.IF_NEZ })
            StoryAdsConfig.clearMatch()
            // Test-context matching is scoped per ClassDef (the empty input APK has no
            // global class table); production matchAll(2..2) scans the full patch context.
            StoryAdsConfig.matchAll(
                classes.getValue("Lcom/zing/zalo/social/features/story/main/ui/StoryDetailsView;"),
                1..1,
            ).single()
            StoryAdsConfig.matchAll(classes.getValue("Lkz0/u;"), 1..1).single()
            CommunityAdsConfig.clearMatch()
            CommunityAdsConfig.matchAll(classes.getValue("Ljt/m;"), 1..1).single()
            CommunityAdsConfig.matchAll(classes.getValue("Ljt/e;"), 1..1).single()
            AdtimaLatRead.clearMatch()
            val lat = AdtimaLatRead.matchAll(classes.getValue("Lcom/adtima/d;"), 1..1).single()
            assertEquals("doInBackground", lat.originalMethod.name)
            assertTrue(
                lat.originalMethod.implementation!!.tryBlocks.isNotEmpty(),
                "expected the Play lookup's catch handlers (clearBody justification)",
            )
        }
    }
}
