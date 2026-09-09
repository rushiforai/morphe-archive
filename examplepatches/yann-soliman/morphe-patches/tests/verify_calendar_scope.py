#!/usr/bin/env python3
"""Compare the entire decoded APK, permitting ONLY the two calendar edits.
Usage: python3 tests/verify_calendar_scope.py ORIGINAL DECODED REPORT.json
"""
import json
from pathlib import Path
import re
import sys
from calendar_smali import canonical
from test_calendar_registers import parse


def classes(root):
    result = {}
    for folder in root.glob('smali*'):
        for file in folder.rglob('*.smali'):
            key = str(file.relative_to(folder))
            assert key not in result
            result[key] = file.read_text()
    return result


def normalize(text):
    lines = []
    for line in text.splitlines():
        if not line.strip() or line.strip().startswith('.line '):
            continue
        if line.startswith('.field ') and ' static ' in line:
            line = re.sub(r' = (null|false|0x0)$', '', line)
        lines.append(line)
    return '\n'.join(lines)


def method(text):
    match = re.search(r'^\.method public static r\(.*?^\.end method', text, re.M | re.S)
    assert match
    return match.group()


def sentinel_reaching_defs(code, labels):
    # Every normal CFG edge is included, including the n():V fallthrough.
    states, pending = {0: frozenset({'undefined'})}, [0]
    while pending:
        pc = pending.pop()
        line = code[pc]
        out = states[pc]
        if re.match(r'(?:move\S*|const\S*|new-instance|iget\S*|add-\S*|sub-\S*) v9(?:,|$)', line):
            out = frozenset({line})
        successors = [pc+1] if pc+1 < len(code) else []
        if line.startswith(('return', 'throw')):
            successors = []
        elif line.startswith(('if-', 'goto')):
            target = labels[line.rsplit(' ', 1)[1]]
            successors = [target] if line.startswith('goto') else successors + [target]
        for dst in successors:
            joined = states.get(dst, frozenset()) | out
            if joined != states.get(dst):
                states[dst] = joined
                pending.append(dst)
    throws = [i for i, line in enumerate(code) if line == 'throw v9']
    assert len(throws) == 4
    for pc in throws:
        assert states[pc] == {'const/4 v9, 0x0'}, (pc, states[pc])
    return len(throws)


def main():
    original, patched, report = map(Path, sys.argv[1:4])
    a, b = classes(original), classes(patched)
    assert a.keys() == b.keys(), 'classes added or removed'
    changed = sorted(k for k in a if normalize(a[k]) != normalize(b[k]))
    picker = 'common_ui/business_components/common/date_picker/DatePickerComponent.smali'
    assert picker in changed and len(changed) == 2, changed
    before, after = method(a[picker]), method(b[picker])
    start = after.index('    move-object/from16 v4, p0')
    end = after.index('    new-instance v1, Ljava/util/ArrayList;', start)
    injected_code, injected_labels = parse(after[start:end])
    suffix_labels = '\n'.join(label for label, pc in injected_labels.items() if pc == len(injected_code))
    restored = after[:start] + suffix_labels + '\n' + after[end:]
    # Existing short/empty-third-page branches must still target the original
    # fragment-list instruction. Only the nonempty +2-page fallthrough injects.
    # No original edge may land halfway through the new block.
    old_code, old_labels = parse(before)
    new_code, new_labels = parse(after)
    entry = len(parse(after[:start])[0])
    added = len(new_code) - len(old_code)
    for pc, line in enumerate(old_code):
        if line.startswith(('if-', 'goto')):
            dst = old_labels[line.rsplit(' ', 1)[1]]
            expected = dst + added if dst >= entry else dst
            relocated = new_code[pc + added if pc >= entry else pc]
            actual = new_labels[relocated.rsplit(' ', 1)[1]]
            assert actual == expected, ('original edge destination changed', pc, actual, expected)
    original_code = canonical(old_code, old_labels)
    restored_code = canonical(*parse(restored))
    assert original_code == restored_code, 'original picker instructions/CFG changed'
    assert normalize(a[picker].replace(before, '<r>')) == normalize(b[picker].replace(after, '<r>')), 'another picker method changed'
    throws = sentinel_reaching_defs(*parse(after))
    setup, = [k for k in changed if k != picker]
    normalized = normalize(b[setup])
    pattern = r'(getMaxBookingVisibleDays\(\)I\n\s*move-result v(\d+)\n)\s*const/16 v\2, 0x1f\n'
    restored_setup, count = re.subn(pattern, r'\1', normalized)
    assert count == 1
    assert normalize(a[setup]) == restored_setup, 'unexpected setup edit'
    result = dict(classes=len(a), changed_classes=changed, added_classes=0,
                  removed_classes=0, original_picker_cfg_preserved=True,
                  unchanged_picker_helpers=True, null_throw_paths_verified=throws,
                  injected_instructions=len(parse(after)[0])-len(parse(before)[0]),
                  normalization=['blank lines and .line metadata', 'static default values', 'goto width and label names (CFG only)'],
                  android_art_runtime_test=False)
    report.write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps(result, indent=2))


if __name__ == '__main__':
    main()
