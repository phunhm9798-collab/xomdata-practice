# Xom Data · Peek at the first few rows
# Problem: https://xomdata.com/practice/pd-first-rows
# Solved: 2026-08-16

import pandas as pd


def first_rows(table, n):
    # Return the first n rows, keeping the original row labels.
    if n != 0:
        return table.head(n)
    elif n == 0:
        return table.head(0)
    return table
