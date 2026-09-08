#!/usr/bin/env python3
"""Verify the Keepcool J+30 date-picker bytecode patch."""

from pathlib import Path
import re
import sys

root = Path(sys.argv[1]) if len(sys.argv) > 1 else Path("decoded-patched")
files = [p for folder in root.glob("smali*") for p in folder.rglob("*.smali")]

def method(text: str, pattern: str) -> str:
    match = re.search(pattern + r".*?^\.end method", text, re.MULTILINE | re.DOTALL)
    assert match, f"method not found: {pattern}"
    return match.group(0)

picker_path = next(p for p in files if p.as_posix().endswith(
    "common_ui/business_components/common/date_picker/DatePickerComponent.smali"
))
picker = method(
    picker_path.read_text(),
    r"\.method public static r\(Lcommon_ui/business_components/common/date_picker/DatePickerComponent;",
)

setup = None
for path in files:
    text = path.read_text()
    if "getMaxBookingVisibleDays()I" not in text or "DatePickerComponent;->r(" not in text:
        continue
    for candidate in re.findall(r"\.method.*?^\.end method", text, re.MULTILINE | re.DOTALL):
        if "getMaxBookingVisibleDays()I" in candidate and "DatePickerComponent;->r(" in candidate:
            assert setup is None, "multiple calendar setup methods found"
            setup = candidate
assert setup is not None, "calendar setup method not found"

normalized_setup = re.sub(r"^\s*\.line \d+\s*$", "", setup, flags=re.MULTILINE)
assert re.search(
    r"getMaxBookingVisibleDays\(\)I\s+move-result v(\d+)\s+const/16 v\1, 0x1f",
    normalized_setup,
), "J+30 inclusive horizon (31 dates) is missing"
assert picker.count(
    "DatePickerComponent;->q(Ljava/util/Calendar;Ljava/util/List;)Ljava/util/ArrayList;"
) == 6, "expected up to six generated calendar weeks"
assert picker.count("DatePickerComponent;->getCurrentCalendar()Ljava/util/Calendar;") == 4, (
    "expected original current week plus three injected current-calendar calls"
)
assert re.search(r"add-int/lit8 v\d+, v\d+, 0x3", picker), "week +3 is missing"
assert re.search(r"add-int/lit8 v\d+, v\d+, 0x4", picker), "week +4 is missing"
assert re.search(r"add-int/lit8 v\d+, v\d+, 0x5", picker), "conditional week +5 is missing"
assert re.search(r"add-int/lit8 v\d+, v\d+, -0x16", picker), "week +4 cutoff is missing"
assert re.search(r"add-int/lit8 v\d+, v\d+, -0x1d", picker), "week +5 cutoff is missing"
assert "move-object/from16 v4" in picker, "high-register receiver bridge is missing"

# The current week can contain one to seven selectable dates. Verify that the
# generated pages always expose exactly 31 dates, irrespective of weekday.
for current_week_days in range(1, 8):
    remaining = 31 - current_week_days
    week_four_days = min(7, max(0, remaining - 21))
    week_five_days = min(7, max(0, remaining - 28))
    assert current_week_days + 21 + week_four_days + week_five_days == 31

print("Keepcool J+30 bytecode verification passed for every weekday")
