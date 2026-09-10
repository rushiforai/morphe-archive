#!/usr/bin/env python3
"""Register regressions; source checks also accept final disassembled APK via env.

CALENDAR_DECODED=/path/to/decoded python3 -m unittest discover -s tests -v
These focused static checks are not a replacement for the Android ART verifier.
"""
import os
from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'patches/src/personal/kotlin/io/github/yannsoliman/patches/keepcool/KeepcoolCalendarPatch.kt'


def parse(text):
    code, labels = [], {}
    for line in text.splitlines():
        line = line.split('#')[0].strip()
        if not line or line.startswith('.'):
            continue
        if line.startswith(':'):
            labels[line] = len(code)
        else:
            code.append(line)
    return code, labels


def source_injection():
    text = SOURCE.read_text()
    blocks = re.findall(r'"""(.*?)"""', text, re.S)
    # The Kotlin code emits a receiver bridge before each of its three blocks.
    return '\n'.join('move-object/from16 v4, p0\n' + b for b in blocks)


def final_method():
    root = Path(os.environ['CALENDAR_DECODED'])
    path, = root.glob('smali*/common_ui/business_components/common/date_picker/DatePickerComponent.smali')
    match = re.search(r'^\.method public static r\(.*?^\.end method',
                      path.read_text(), re.M | re.S)
    assert match, 'date-picker builder not found'
    return match.group()


def final_injection():
    method = final_method()
    start = method.index('    move-object/from16 v4, p0')
    end = method.index('    new-instance v1, Ljava/util/ArrayList;', start)
    return method[start:end]


def injections():
    yield 'source', source_injection()
    if 'CALENDAR_DECODED' in os.environ:
        yield 'dex', final_injection()


class CalendarRegisters(unittest.TestCase):
    def test_all_weekdays_and_horizon_boundaries(self):
        from calendar_smali import run
        for name, text in injections():
            for weekday in range(7):
                for poison in (object(), -123):
                    with self.subTest(artifact=name, weekday=weekday, merged_type=type(poison).__name__):
                        pages = run(*parse(text), weekday, poison)
                        self.assertEqual(len(pages), 6 if weekday >= 5 else 5)
                        self.assertTrue(all(len(p) == 7 for p in pages))
                        enabled = [c['day'] for p in pages for c in p if c['enabled']]
                        self.assertEqual(enabled, list(range(31)))
                        cells = {c['day']: c['enabled'] for p in pages for c in p}
                        for day in (0, 1, 20, 21, 27, 28, 29, 30):
                            self.assertTrue(cells[day])
                        for day in (-1, 31, 32, 33, 34, 35):
                            if day in cells:
                                self.assertFalse(cells[day])

    def test_cfg_types_merge_every_predecessor(self):
        from calendar_smali import canonical, check_types
        for name, text in injections():
            with self.subTest(artifact=name):
                code, labels = parse(text)
                canonical(code, labels)
                self.assertEqual(check_types(code, labels), len(code))

    @unittest.skipUnless('CALENDAR_DECODED' in os.environ, 'requires disassembled APK')
    def test_final_control_flow_exactly_matches_source(self):
        from calendar_smali import canonical
        self.assertEqual(canonical(*parse(final_injection())), canonical(*parse(source_injection())))

    @unittest.skipUnless('CALENDAR_DECODED' in os.environ, 'requires disassembled APK')
    def test_scratch_registers_dead_in_original_suffix(self):
        method = final_method()
        end = method.index('    new-instance v1, Ljava/util/ArrayList;',
                           method.index('    move-object/from16 v4, p0'))
        suffix, _ = parse(method[end:])
        self.assertFalse(any(re.search(r'\bv(?:12|13)\b', line) for line in suffix))
        self.assertEqual([line for line in suffix if re.search(r'\bv9\b', line)], ['throw v9'])

    def test_does_not_consume_merged_iterator_or_int(self):
        for name, text in injections():
            with self.subTest(artifact=name):
                code, _ = parse(text)
                uses = [line for line in code if re.search(r'\bv6\b', line)]
                self.assertEqual(uses, [], 'v6 merges Iterator/int before injection; derive remaining days independently')

    def test_preserves_live_null_throw_sentinel(self):
        for name, text in injections():
            with self.subTest(artifact=name):
                code, _ = parse(text)
                writes = [line for line in code if re.match(
                    r'(?:move\S*|const\S*|new-instance|iget\S*|add-\S*|sub-\S*) v9(?:,|$)', line)]
                self.assertEqual(writes, [], 'v9 is live at the original throw v9; injection must not overwrite it')


if __name__ == '__main__':
    unittest.main()
