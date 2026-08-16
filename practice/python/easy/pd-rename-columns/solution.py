# Xom Data · Rename columns to match the report
# Problem: https://xomdata.com/practice/pd-rename-columns
# Solved: 2026-08-16

import pandas as pd


def rename_columns(table, mapping):
    # Rename only the columns listed in mapping; leave the others untouched.
    table = table.rename(columns = mapping)
    return table
