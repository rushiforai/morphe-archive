"""Small, fail-closed interpreter for the injected instructions (not an ART VM).
External Calendar/q behavior is modeled as seven Monday-first date cells; the
real q implementation and Calendar boundary behavior are validated separately.
"""
import re
from typing import Any


def run(code, labels, weekday, poison):
    def page(week):
        return [{'day': 7 * week + i - weekday, 'enabled': 7 * week + i >= weekday}
                for i in range(7)]
    pages = [page(i) for i in range(3)]
    receiver = object()
    r: dict[str, Any] = {f'v{i}': object() for i in range(16)}
    r.update(v2=0, v3=pages, v6=poison, v9=None, p0=receiver)
    pc, steps, result = 0, 0, None
    while pc < len(code):
        steps += 1
        assert steps < 2000, 'injection does not terminate'
        line = code[pc]
        op = line.split()[0]
        regs = re.findall(r'\b[vp]\d+\b', line)
        next_pc = pc + 1
        if op.startswith('move-result'):
            r[regs[0]] = result
        elif op.startswith('move'):
            r[regs[0]] = r[regs[1]]
        elif op.startswith('const'):
            r[regs[0]] = int(line.rsplit(', ', 1)[1], 0)
        elif op == 'new-instance':
            assert line.endswith('Ljava/util/ArrayList;')
            r[regs[0]] = []
        elif op == 'check-cast':
            assert isinstance(r[regs[0]], (list, dict))
        elif op == 'iget-boolean':
            r[regs[0]] = int(r[regs[1]]['enabled'])
        elif op == 'iput-boolean':
            r[regs[1]]['enabled'] = bool(r[regs[0]])
        elif op == 'add-int/lit8':
            assert type(r[regs[1]]) is int, f'non-integer consumed: {line}'
            r[regs[0]] = r[regs[1]] + int(line.rsplit(', ', 1)[1], 0)
        elif op.startswith('invoke'):
            args = [r[k] for k in regs]
            call = line.split('->')[1]
            if call.startswith('<init>'):
                pass
            elif call.startswith('getCurrentCalendar'):
                assert args[0] is receiver
                result = {'week': 0}
            elif 'Ljava/util/Calendar;->get(I)' in line:
                assert args[1] == 3
                result = args[0]['week']
            elif 'Ljava/util/Calendar;->set(II)' in line:
                assert args[1] == 3
                args[0]['week'] = args[2]
            elif call.startswith('q('):
                result = page(args[0]['week'])
            elif call.startswith('size()'):
                result = len(args[0])
            elif call.startswith('get(I)'):
                assert 0 <= args[1] < len(args[0]), 'list index out of bounds'
                result = args[0][args[1]]
            elif call.startswith('add('):
                args[0].append(args[1])
                result = True
            else:
                raise AssertionError(f'unsupported call: {line}')
        elif op.startswith('if-'):
            values = [r[k] for k in regs]
            assert all(type(v) is int for v in values), f'non-integer branch: {line}'
            if op == 'if-eqz':
                take = values[0] == 0
            elif op == 'if-ge':
                take = values[0] >= values[1]
            elif op == 'if-le':
                take = values[0] <= values[1]
            else:
                raise AssertionError(f'unsupported branch: {line}')
            if take:
                next_pc = labels[line.rsplit(' ', 1)[1]]
        elif op.startswith('goto'):
            next_pc = labels[line.rsplit(' ', 1)[1]]
        elif op != 'nop':
            raise AssertionError(f'unsupported opcode: {line}')
        pc = next_pc
    assert r['v9'] is None
    assert r['v6'] is poison
    return pages


def canonical(code, labels):
    """Use instruction-index destinations, never disassembler label spellings."""
    result = []
    for line in code:
        line = line.replace('$DATE_PICKER_CLASS',
            'Lcommon_ui/business_components/common/date_picker/DatePickerComponent;')
        if line.startswith(('if-', 'goto')):
            label = line.rsplit(' ', 1)[1]
            assert label in labels, f'branch escapes injection: {line}'
            target = labels[label]
            assert target < len(code), 'exit label must target an instruction'
            assert not code[target].startswith('move-result'), 'branch into move-result'
            line = line.replace(label, f'@{target}')
        # Morphe may widen goto to goto/16 during relocation; same CFG edge.
        line = re.sub(r'^goto/(?:16|32) ', 'goto ', line)
        result.append(line)
    return result


def check_types(code, labels):
    """Forward CFG type analysis: merge all predecessors, not path predicates.
Only live-in contracts v2=zero, v3=ArrayList, p0=receiver are assumed.
"""
    initial = {f'v{i}': frozenset({'conflict'}) for i in range(16)}
    initial.update(v2=frozenset({'int'}), v3=frozenset({'ref'}), p0=frozenset({'ref'}))
    states = {0: initial}
    todo = [0]
    while todo:
        pc = todo.pop()
        before = states[pc]
        out = before.copy()
        line = code[pc]
        op = line.split()[0]
        regs = re.findall(r'\b[vp]\d+\b', line)
        if op.startswith(('const', 'add-int', 'iget-boolean')) or op == 'move-result':
            out[regs[0]] = frozenset({'int'})
        elif op in ('new-instance', 'move-result-object', 'check-cast'):
            out[regs[0]] = frozenset({'ref'})
        elif op.startswith('move'):
            out[regs[0]] = before[regs[1]]
        successors = [pc + 1] if pc + 1 < len(code) else []
        if op.startswith(('if-', 'goto')):
            target = labels[line.rsplit(' ', 1)[1]]
            successors = ([target] if op.startswith('goto') else successors + [target])
        for dst in successors:
            merged = out if dst not in states else {k: states[dst][k] | out[k] for k in out}
            if merged != states.get(dst):
                states[dst] = merged.copy()
                todo.append(dst)
    assert len(states) == len(code), 'unreachable injected instruction'
    for pc, before in states.items():
        line = code[pc]
        regs = re.findall(r'\b[vp]\d+\b', line)
        if line.startswith('add-int'):
            assert before[regs[1]] == {'int'}, f'bad arithmetic input at {pc}: {line}'
        if line.startswith('if-'):
            assert all(before[r] == {'int'} for r in regs), f'bad comparison inputs: {line}'
        if line.startswith(('iget-boolean', 'iput-boolean')):
            assert before[regs[1]] == {'ref'}, f'bad cell reference: {line}'
        if line.startswith('iput-boolean'):
            assert before[regs[0]] == {'int'}, f'bad boolean value: {line}'
        if line.startswith('check-cast'):
            assert before[regs[0]] == {'ref'}, f'bad cast input: {line}'
        if line.startswith('invoke'):
            signature = line.split('->', 1)[1].split('(', 1)[1].split(')', 1)[0]
            params = re.findall(r'\[*L[^;]+;|\[*[ZBCSIJFD]', signature)
            expected = ([] if line.startswith('invoke-static') else ['ref']) + [
                'ref' if p.startswith(('L', '[')) else 'int' for p in params]
            assert len(regs) == len(expected), f'unsupported invocation encoding: {line}'
            for register, typ in zip(regs, expected):
                assert before[register] == {typ}, f'bad invocation input {register}: {line}'
    return len(states)
