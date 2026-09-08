#!/usr/bin/env python3
"""Verify apktool output independently, ignoring only understood DEX serialization differences."""
import difflib
import json
from pathlib import Path
import re
import sys
import zipfile

original, patched, reports = map(Path, sys.argv[1:4])
reports.mkdir(parents=True, exist_ok=True)

def normalize(text):
    lines = []
    for line in text.splitlines():
        if not line.strip() or line.strip().startswith('.line '):
            continue
        # DEX writers may omit explicit default static values: semantics are unchanged.
        if line.startswith('.field ') and ' static ' in line:
            line = re.sub(r' = (null|false|0x0)$', '', line)
        lines.append(line)
    return '\n'.join(lines) + '\n'

def classes(root):
    result = {}
    for folder in root.glob('smali*'):
        for file in folder.rglob('*.smali'):
            key = str(file.relative_to(folder))
            assert key not in result, 'Duplicate class: ' + key
            result[key] = file.read_text()
    return result

a, b = classes(original), classes(patched)
assert a.keys() == b.keys(), 'Classes added or removed'
changed = [k for k in a if normalize(a[k]) != normalize(b[k])]
assert changed == ['e5/b.smali'], changed
before, after = normalize(a[changed[0]]), normalize(b[changed[0]])

def validator(text):
    match = re.search(r'\.method[^\n]* E\(Ljava/lang/String;\)Z.*?\.end method', text, re.S)
    assert match is not None, 'Validator absent'
    return match.group()

def regex(text):
    match = re.search(r'const-string v0, (".*")', validator(text))
    assert match is not None, 'Regex literal absent'
    return json.loads(match.group(1))

old, new = regex(before), regex(after)
expected = old.split('@')[0].replace(r'[\w-]', r'[\w+\-]') + '@' + old.split('@')[1]
assert new == expected, 'Unexpected regex'
assert before.replace(json.dumps(old), json.dumps(new), 1) == after, 'More than one instruction changed'
for name, text in [('original-regex.txt', old), ('patched-regex.txt', new),
                   ('original-validator.smali', validator(before)), ('patched-validator.smali', validator(after))]:
    (reports / name).write_text(text)
(reports / 'validator-normalized.diff').write_text(''.join(difflib.unified_diff(before.splitlines(True), after.splitlines(True), fromfile='original/e5/b.smali', tofile='patched/e5/b.smali')))
report = {'original_classes':len(a), 'patched_classes':len(b), 'raw_changed_classes':sum(a[k] != b[k] for k in a),
          'normalized_changed_classes':changed, 'changed_instructions':1,
          'normalization':['Ignore .line debug metadata and blank lines', 'Omitted explicit default static null/false/0 values'],
          'added_classes':0, 'removed_classes':0,
          'network_runtime_test':False}
(reports / 'bytecode-comparison.json').write_text(json.dumps(report, indent=2))
print(json.dumps(report, indent=2))
