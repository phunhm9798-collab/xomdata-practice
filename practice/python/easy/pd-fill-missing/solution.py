# Xom Data · Fill the blanks of one column with a default
# Problem: https://xomdata.com/practice/pd-fill-missing
# Solved: 2026-08-21

import pandas as pd


def fill_missing(table, column, value):
    # Fill the empty cells of one column, leaving the input table untouched.
    table = table.copy()
    table[column] = table[column].fillna(value)
    return table
