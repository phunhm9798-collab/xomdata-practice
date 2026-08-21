# Xom Data · How many cells is each column missing
# Problem: https://xomdata.com/practice/pd-missing-count
# Solved: 2026-08-21

import pandas as pd


def missing_by_column(table):
    # Return how many empty cells each column has, in column order.
    table = table.copy()
    return table.isna().sum()
