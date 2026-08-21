# Xom Data · Clean up a hand-typed city column
# Problem: https://xomdata.com/practice/pd-clean-text
# Solved: 2026-08-21

import pandas as pd


def clean_city(table, column):
    # Trim the surrounding spaces and title-case the values of one column.
    table = table.copy()
    table[column] = table[column].str.strip().str.title()
    return table
