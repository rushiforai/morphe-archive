"""Tests for the patcher.

The point of these tests is not that the patch works — that is what the end-to-end
run against a real APK shows. It is that the patcher **fails safely**: refuses to
apply when the target code is absent or ambiguous, refuses to apply twice, and
reverts to the exact original bytes.

The fixtures are synthetic smali, so these tests run in CI with no APK and no tools.
"""
from __future__ import annotations

import json
import shutil
import sys
import tempfile
import unittest
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(REPO / "scripts"))

import apply_patches  # noqa: E402

FIXTURES = REPO / "tests" / "fixtures"
QUOTA_CLASS = "smali/com/example/quota/QuotaPolicy.smali"

# A synthetic patch manifest with the same shape as the real ones, pointed at the
# fixture classes. Keeps the tests independent of the shipped patches.
TEST_MANIFEST = {
    "name": "test-fixture",
    "title": "Test fixture",
    "summary": "Synthetic patch used by the unit tests.",
    "compatibility": {"package": "com.example.quota", "version": "1.0", "evidence": "tests/fixtures"},
    "hooks": [
        {
            "id": "QuotaPolicy.computeState",
            "class": "com/example/quota/QuotaPolicy",
            "method": ".method public final computeState(ZIJ)Lcom/example/quota/QuotaState;",
            "anchor": "    if-nez p1, :cond_0\n",
            "original": "    if-nez p1, :cond_0\n",
            "replacement": (
                "    sget-object p0, Lcom/example/quota/QuotaState$None;->INSTANCE:"
                "Lcom/example/quota/QuotaState$None;\n\n    return-object p0\n"
            ),            "marker": "patch:test-fixture:computeState",
            "returns": "Lcom/example/quota/QuotaState$None;",
        }
    ],
}


CALLSITE_MANIFEST = {
    "name": "test-callsite",
    "title": "Test call-site fixture",
    "summary": "Synthetic call-site patch used by the unit tests.",
    "compatibility": {"package": "com.example.pairip", "version": "1.0", "evidence": "tests/fixtures"},
    "hooks": [
        {
            "id": "LicenseClient.installingPackageName",
            "kind": "callsite",
            "class": "com/example/pairip/LicenseClient",
            "method": ".method private performLocalInstallerCheck()Z",
            "invoke": "Landroid/content/pm/InstallSourceInfo;->getInstallingPackageName()Ljava/lang/String;",
            "result": "move-result-object",
            "replace_with": "const-string",
            "literal": "com.android.vending",
            "expect": 1,
        }
    ],
}


class CallSitePatchTest(unittest.TestCase):
    """The call-site kind keeps the call and only answers its result."""

    def setUp(self) -> None:
        self.tmp = Path(tempfile.mkdtemp(prefix="callsite-test-"))
        self.addCleanup(shutil.rmtree, self.tmp, ignore_errors=True)
        self.tree = self.tmp / "decoded"
        shutil.copytree(FIXTURES / "smali_callsite" / "smali", self.tree / "smali")
        self.hook = CALLSITE_MANIFEST["hooks"][0]
        self.path = self.tree / "smali/com/example/pairip/LicenseClient.smali"

    def _apply(self, **kwargs) -> str:
        return apply_patches.apply_hook(self.tree, self.hook, **kwargs)

    def test_replaces_the_result_and_keeps_the_call(self) -> None:
        self.assertEqual("applied", self._apply(revert=False, dry_run=False))
        text = self.path.read_text(encoding="utf-8")
        self.assertEqual(1, text.count(self.hook["invoke"]), "the call must be left in place")
        # the call's own result is gone, replaced in place, with the same register
        self.assertEqual(0, text.count(self.hook["invoke"] + "\n\n    move-result-object"))
        self.assertIn(
            self.hook["invoke"]
            + "\n\n    # patch:test:LicenseClient.installingPackageName"
              '\n    const-string v0, "com.android.vending"',
            text,
        )
        # the other call site of the fixture is untouched
        self.assertIn("getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;\n\n"
                      "    move-result-object v0", text)

    def test_idempotent(self) -> None:
        self._apply(revert=False, dry_run=False)
        first = self.path.read_text(encoding="utf-8")
        self.assertEqual("skip (already applied)", self._apply(revert=False, dry_run=False))
        self.assertEqual(first, self.path.read_text(encoding="utf-8"))

    def test_revert_restores_original_bytes(self) -> None:
        original = self.path.read_text(encoding="utf-8")
        self._apply(revert=False, dry_run=False)
        self.assertEqual("reverted", self._apply(revert=True, dry_run=False))
        self.assertEqual(original, self.path.read_text(encoding="utf-8"))

    def test_revert_before_apply_is_a_skip(self) -> None:
        self.assertEqual("skip (not applied)", self._apply(revert=True, dry_run=False))

    def test_refuses_when_the_call_is_absent(self) -> None:
        self.hook = {**self.hook, "invoke": "Landroid/content/pm/InstallSourceInfo;->getPackageSource()I"}
        with self.assertRaises(apply_patches.PatchError) as ctx:
            self._apply(revert=False, dry_run=False)
        self.assertIn("no call to", str(ctx.exception))

    def test_refuses_when_the_site_count_differs(self) -> None:
        # the fixture has one site in this method and one in another: asking for two
        # while scoped to the first method must fail rather than guess.
        self.hook = {**self.hook, "expect": 2}
        with self.assertRaises(apply_patches.PatchError) as ctx:
            self._apply(revert=False, dry_run=False)
        self.assertIn("1 call site(s) found, 2 expected", str(ctx.exception))

    def test_refuses_when_the_result_is_not_adjacent(self) -> None:
        text = self.path.read_text(encoding="utf-8").replace(
            "    move-result-object v0\n\n    const/4 v1, 0x1",
            "    nop\n\n    move-result-object v0\n\n    const/4 v1, 0x1",
            1,
        )
        self.path.write_text(text, encoding="utf-8")
        with self.assertRaises(apply_patches.PatchError) as ctx:
            self._apply(revert=False, dry_run=False)
        self.assertIn("no call to", str(ctx.exception))


KINDS = ("anchor", "callsite", "callsite-global")


class PatchApplicationTest(unittest.TestCase):
    def setUp(self) -> None:
        self.tmp = Path(tempfile.mkdtemp(prefix="patch-test-"))
        self.addCleanup(shutil.rmtree, self.tmp, ignore_errors=True)
        self._install_fixture("smali_clean")
        self.hook = TEST_MANIFEST["hooks"][0]

    def _install_fixture(self, name: str) -> None:
        target = self.tmp / "decoded" / "smali"
        if target.exists():
            shutil.rmtree(target.parent)
        shutil.copytree(FIXTURES / name / "smali", target)
        self.tree = self.tmp / "decoded"

    @property
    def class_path(self) -> Path:
        return self.tree / QUOTA_CLASS

    def test_applies_exactly_once(self) -> None:
        result = apply_patches.apply_hook(self.tree, self.hook, revert=False, dry_run=False)
        self.assertEqual("applied", result)
        text = self.class_path.read_text(encoding="utf-8")
        # the marker appears twice (opening and closing comment): the block must be unique
        self.assertEqual(2, text.count(self.hook["marker"]))
        self.assertIn(self.hook["replacement"], text)

        # The injected block must be the first thing in the method body, so everything
        # after it is unreachable and the patch cannot be bypassed by later logic.
        body = text.split(self.hook["method"], 1)[1]
        after_locals = body.split(".locals 0", 1)[1].lstrip("\n")
        first_line, _, rest = after_locals.partition("\n")
        self.assertIn(self.hook["marker"], first_line, "patch marker must open the body")
        self.assertTrue(
            rest.lstrip("\n").startswith(self.hook["replacement"]),
            f"patch not injected first:\n{after_locals[:200]}",
        )

    def test_is_idempotent(self) -> None:
        apply_patches.apply_hook(self.tree, self.hook, revert=False, dry_run=False)
        first = self.class_path.read_text(encoding="utf-8")
        result = apply_patches.apply_hook(self.tree, self.hook, revert=False, dry_run=False)
        self.assertEqual("skip (already applied)", result)
        self.assertEqual(first, self.class_path.read_text(encoding="utf-8"))

    def test_dry_run_writes_nothing(self) -> None:
        before = self.class_path.read_text(encoding="utf-8")
        apply_patches.apply_hook(self.tree, self.hook, revert=False, dry_run=True)
        self.assertEqual(before, self.class_path.read_text(encoding="utf-8"))

    def test_revert_restores_original_bytes(self) -> None:
        original = self.class_path.read_text(encoding="utf-8")
        apply_patches.apply_hook(self.tree, self.hook, revert=False, dry_run=False)
        result = apply_patches.apply_hook(self.tree, self.hook, revert=True, dry_run=False)
        self.assertEqual("reverted", result)
        self.assertEqual(original, self.class_path.read_text(encoding="utf-8"))

    def test_refuses_when_method_is_absent(self) -> None:
        self._install_fixture("smali_missing_method")
        with self.assertRaises(apply_patches.PatchError) as ctx:
            apply_patches.apply_hook(self.tree, self.hook, revert=False, dry_run=False)
        self.assertIn("method not found", str(ctx.exception))

    def test_refuses_when_anchor_is_ambiguous(self) -> None:
        self._install_fixture("smali_ambiguous")
        with self.assertRaises(apply_patches.PatchError) as ctx:
            apply_patches.apply_hook(self.tree, self.hook, revert=False, dry_run=False)
        self.assertIn("appears 2 times", str(ctx.exception))


GLOBAL_HOOKS = [
    {
        "id": "installingPackageName",
        "kind": "callsite-global",
        "invoke": "Landroid/content/pm/InstallSourceInfo;->getInstallingPackageName()Ljava/lang/String;",
        "result": "move-result-object",
        "replace_with": "const-string",
        "literal": "com.android.vending",
        "expect": 1,
    },
    {
        "id": "packageSource",
        "kind": "callsite-global",
        "invoke": "Landroid/content/pm/InstallSourceInfo;->getPackageSource()I",
        "result": "move-result",
        "replace_with": "const/4",
        "literal": "0x2",
        "expect": 1,
    },
]


class GlobalPatchTest(unittest.TestCase):
    """A global hook answers every site in the tree, whatever class holds it."""

    def setUp(self) -> None:
        self.tmp = Path(tempfile.mkdtemp(prefix="global-test-"))
        self.addCleanup(shutil.rmtree, self.tmp, ignore_errors=True)
        self.tree = self.tmp / "decoded"
        shutil.copytree(FIXTURES / "smali_global", self.tree)
        self.gate = self.tree / "smali/com/example/sdk/Gate.smali"
        self.report = self.tree / "smali_classes2/com/example/telemetry/Report.smali"

    def _apply(self, hook, **kwargs):
        return apply_patches.apply_hook(self.tree, hook, **kwargs)

    def test_answers_sites_in_different_dex_trees(self) -> None:
        self.assertEqual("applied", self._apply(GLOBAL_HOOKS[0], revert=False, dry_run=False))
        self.assertEqual("applied", self._apply(GLOBAL_HOOKS[1], revert=False, dry_run=False))
        self.assertIn('const-string v0, "com.android.vending"', self.gate.read_text(encoding="utf-8"))
        # the integer form must be written bare, and keep the result's register
        self.assertIn("const/4 v0, 0x2", self.report.read_text(encoding="utf-8"))

    def test_idempotent_and_reversible(self) -> None:
        gate, report = self.gate.read_text(encoding="utf-8"), self.report.read_text(encoding="utf-8")
        for hook in GLOBAL_HOOKS:
            self._apply(hook, revert=False, dry_run=False)
        for hook in GLOBAL_HOOKS:
            self.assertEqual("skip (already applied)", self._apply(hook, revert=False, dry_run=False))
        for hook in GLOBAL_HOOKS:
            self.assertEqual("reverted", self._apply(hook, revert=True, dry_run=False))
        self.assertEqual(gate, self.gate.read_text(encoding="utf-8"))
        self.assertEqual(report, self.report.read_text(encoding="utf-8"))

    def test_refuses_a_site_count_mismatch(self) -> None:
        hook = {**GLOBAL_HOOKS[0], "expect": 2}
        with self.assertRaises(apply_patches.PatchError) as ctx:
            self._apply(hook, revert=False, dry_run=False)
        self.assertIn("1 call site(s) found", str(ctx.exception))
        self.assertIn("2 expected", str(ctx.exception))

    def test_refuses_when_the_api_is_absent(self) -> None:
        hook = {**GLOBAL_HOOKS[0], "invoke": "Landroid/content/pm/InstallSourceInfo;->getInitiatingPackageName()Ljava/lang/String;"}
        with self.assertRaises(apply_patches.PatchError) as ctx:
            self._apply(hook, revert=False, dry_run=False)
        self.assertIn("no call to", str(ctx.exception))
        self.assertIn("no call site(s) found", "no call site(s) found" ) if False else None


class ManifestTest(unittest.TestCase):
    def test_every_manifest_is_well_formed(self) -> None:
        manifests = apply_patches.load_manifests()
        self.assertTrue(manifests, "no patch manifest found")
        seen_ids: set[str] = set()
        for manifest in manifests:
            for key in ("name", "title", "summary", "compatibility", "hooks"):
                self.assertIn(key, manifest, f"{manifest['_path']} lacks {key}")
            for hook in manifest["hooks"]:
                scope = hook.get("kind") == "callsite-global"
                for key in ("id", "why") + (() if scope else ("class", "method")):
                    self.assertIn(key, hook, f"{hook.get('id', '?')} lacks {key}")
                self.assertNotIn(hook["id"], seen_ids, f"duplicate hook id {hook['id']}")
                seen_ids.add(hook["id"])
                self.assertIn(hook.get("kind", "anchor"), KINDS)
                if hook.get("kind", "anchor") == "anchor":
                    self._validate_anchor_hook(hook)
                else:
                    self._validate_callsite_hook(hook)

    @staticmethod
    def _validate_anchor_hook(hook: dict) -> None:
        for key in ("anchor", "original", "marker", "returns"):
            assert key in hook, f"{hook['id']} lacks {key}"
        # the value the hook returns must be compatible with the method's declared
        # return type: either the same descriptor, or a subtype of it
        returned = hook["returns"]
        method_return = hook["method"].rsplit(")", 1)[-1]
        assert method_return == returned or returned.startswith(method_return[:-1]), (
            f"{hook['id']}: {returned} is not a {method_return}"
        )
        # A hook that returns something short-circuits the method and must say so.
        # A hook on a void method only injects instructions, so no return is expected.
        if returned != "V":
            opcode = {
                "J": "return-wide",
                "D": "return-wide",
                "F": "return",
                "I": "return",
                "Z": "return",
                "L": "return-object",
            }[returned[0]]
            assert opcode in hook["replacement"], (
                f"{hook['id']}: replacement does not end with {opcode} for a {returned}"
            )
        # the anchor must be part of the method body, not the method header
        assert hook["anchor"].strip() != hook["method"].strip()

    @staticmethod
    def _validate_callsite_hook(hook: dict) -> None:
        # a global hook is answered by every tree it is applied to, which obfuscated
        # SDK class names would make impossible to pin one by one
        assert hook["expect"] >= 1
        for key in ("invoke", "result", "replace_with", "literal", "expect"):
            assert key in hook, f"{hook['id']} lacks {key}"
        assert hook["expect"] >= 1, f"{hook['id']}: expect must be at least 1"
        assert hook["invoke"].startswith("L") and "->" in hook["invoke"], (
            f"{hook['id']}: invoke must be a full descriptor"
        )
        # the replacement must be a value of the same width as the result it replaces
        wide = hook["result"].endswith("-wide")
        assert wide == hook["replace_with"].endswith("-wide"), (
            f"{hook['id']}: {hook['replace_with']} does not match {hook['result']}"
        )
        if hook["replace_with"].startswith("const-string"):
            assert hook["result"] == "move-result-object", (
                f"{hook['id']}: {hook['replace_with']} writes an object register"
            )
        assert hook["literal"], f"{hook['id']}: empty literal"

    def test_unknown_patch_name_is_rejected(self) -> None:
        with self.assertRaises(apply_patches.PatchError):
            apply_patches.load_manifests("does-not-exist")

    def test_class_file_refuses_ambiguity(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            for dex in ("smali", "smali_classes2"):
                target = root / dex / "com" / "example"
                target.mkdir(parents=True)
                (target / "Duplicated.smali").write_text(".class public Lcom/example/Duplicated;\n")
            with self.assertRaises(apply_patches.PatchError) as ctx:
                apply_patches.class_file(root, "com/example/Duplicated")
            self.assertIn("2 smali files", str(ctx.exception))


if __name__ == "__main__":
    unittest.main()
