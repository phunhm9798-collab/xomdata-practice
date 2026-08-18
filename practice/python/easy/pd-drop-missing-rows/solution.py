# Xom Data · Drop rows missing required information
# Problem: https://xomdata.com/practice/pd-drop-missing-rows
# Solved: 2026-08-18

import pandas as pd


def drop_incomplete(table, required):
    # Drop rows that are empty in any of the required columns.
    if not required:
        return table
    table = table.dropna(subset = required)
    return table
