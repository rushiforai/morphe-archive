#!/usr/bin/env python3
"""Read-only, version-specific availability data-flow evidence, NOT a UI test.

Usage: python3 tests/inspect_availability_contract.py DECODED_APK REPORT.json
No network access, credentials, production patch, or synthesized API response.
"""
import hashlib
import json
from pathlib import Path
import re
import sys


def inspect(root):
    evidence = {}

    def read(relative):
        paths = list(root.glob('smali*/' + relative + '.smali'))
        assert len(paths) == 1, (relative, paths)
        path = paths[0]
        text = path.read_text()
        evidence.setdefault(str(path.relative_to(root)), {
            'sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
            'anchors': [],
        })
        return path, text

    def anchor(relative, needle):
        path, text = read(relative)
        matches = [i for i, line in enumerate(text.splitlines(), 1) if needle in line]
        assert matches, (relative, needle)
        evidence[str(path.relative_to(root))]['anchors'].append({
            'needle': needle, 'lines': matches,
        })
        return text

    def method(text, signature):
        found = re.findall(r'^\.method [^\n]*' + re.escape(signature)
                           + r'[^\n]*\n.*?^\.end method', text, re.M | re.S)
        assert len(found) == 1, signature
        return found[0]

    api = anchor('apis/service/UserAPI', 'api/v1/user/bookingSlot/countForDay')
    assert 'Ljava/lang/Integer;' in method(api, 'countSessionForDay(')
    assert 'Lmodels/result/booking/BookingSlotResult;' in method(api, 'bookingSlotFind(')
    count = anchor('apis/repository/UserRepository$countSessionForDay$2', 'const/16 v9, 0xe')
    assert 'const/4 v6, 0x0' in method(count, 'invokeSuspend(')
    req = anchor('models/request/booking/BookingSlotRequestData', 'and-int/lit8 p1, p6, 0x4')
    assert re.search(r'and-int/lit8 p1, p6, 0x4\s+(?:\.line[^\n]*\s+)*if-eqz p1, :cond_2\s+(?:\.line[^\n]*\s+)*const/4 p3, 0x0', req)
    anchor('u8/a', 'GeolocationViewModel;->b:Lapis/repository/UserRepository;')
    anchor('u8/a', 'UserRepository;->countSessionForDay(')
    g = anchor('m8/g', 'BookingSharedViewModel;->y:Ljava/lang/String;')
    assert 'findBookingSlots(Ljava/util/List;Ljava/util/List;ZLjava/util/List;Ljava/lang/String;Ld9/d;)' in g
    anchor('m8/s', 'iput-object p1, v0, Lfr/keepcool/memberapp/features/main/booking/BookingSharedViewModel;->y:Ljava/lang/String;')
    w = anchor('m8/w0', 'DatePickerComponent;->setDateIsBooked(Ljava/util/List;)V')
    bookings = method(w, 'c0()V')
    assert 'Lmodels/domain/booking/MyBooking;' in bookings
    assert 'getReservationCount' not in bookings and 'getNbPlaces' not in bookings
    _, dates = read('Z6/c')
    fields = re.findall(r'^\.field public (?:final )?([a-f]:[^\n]+)', dates, re.M)
    assert fields == ['a:Ljava/lang/String;', 'b:Ljava/lang/String;', 'c:Z', 'd:Z', 'e:Z', 'f:Z'], fields
    adapter = anchor('J7/c', 'CellDatePickerComponent;->n(ZLZ6/f;)V')
    bind = method(adapter, 'g(LG0/c0;I)V')
    assert 'LZ6/c;->f:Z' in bind
    assert 'getReservationCount' not in bind and 'getNbPlaces' not in bind
    cell = anchor('common_ui/business_components/common/date_picker/CellDatePickerComponent', 'n(ZLZ6/f;)V')
    render = method(cell, 'n(ZLZ6/f;)V')
    assert 'if-eqz p1,' in render and 'setVisibility(I)V' in render
    assert 'BookingSlot' not in render
    slots = anchor('models/domain/booking/BookingSlot', 'getReservationCount()I')
    assert 'getNbPlaces()I' in slots

    # Logical counterexample, explicitly not captured/simulated server responses:
    # identical count of sessions can coexist with opposite availability.
    states = [[{'reserved': 8, 'capacity': 8}], [{'reserved': 7, 'capacity': 8}]]
    counts = [len(state) for state in states]
    available = [any(s['reserved'] < s['capacity'] for s in state) for state in states]
    assert counts[0] == counts[1] and available[0] != available[1]
    return {
        'status': 'BLOCKED_FOR_LOCAL_RECOLOR_ONLY',
        'availability_feature_implemented': False,
        'findings': {
            'countForDay_returns': 'Integer, not per-date capacity or remaining places',
            'countForDay_freePlace': False,
            'countForDay_caller': 'GeolocationViewModel coroutine u8/a',
            'findBookingSlots_date': 'selected date BookingSharedViewModel.y',
            'orange_dot_source': 'MyBooking dates -> setDateIsBooked -> Z6/c.f -> CellDatePickerComponent.n',
            'date_model_fields': fields,
            'availability_data_exists_elsewhere': 'BookingSlot.reservationCount and nbPlaces',
            'missing_in_current_picker': 'availability results keyed by each displayed date',
        },
        'logical_counterexample_NOT_API_DATA': {'session_counts': counts, 'has_free_place': available},
        'limits': [
            'Static analysis of Keepcool 1.8.21 only; not Android execution.',
            'No server request was performed; countForDay support for freePlace=true is unverified.',
            'This does not prove feature impossible: a new date-specific asynchronous loader is needed.',
            'No availability patch or availability candidate is produced by this diagnostic.',
        ],
        'evidence': evidence,
    }


if __name__ == '__main__':
    if len(sys.argv) != 3:
        raise SystemExit(__doc__)
    report = inspect(Path(sys.argv[1]))
    Path(sys.argv[2]).write_text(json.dumps(report, indent=2, ensure_ascii=False) + '\n')
    print(json.dumps({k: v for k, v in report.items() if k != 'evidence'}, indent=2, ensure_ascii=False))
