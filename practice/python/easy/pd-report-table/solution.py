# Xom Data · Turn the raw table into something you can send
# Problem: https://xomdata.com/practice/pd-report-table
# Solved: 2026-08-16

import pandas as pd


def report_table(raw):
    # Keep city and revenue, rename them, sort by revenue, renumber the rows.
    raw = raw.drop(columns = ['internal_flag'])
    raw = raw.rename(columns ={
        'cty': 'city',
        'rev': 'revenue'
    }).sort_values(by = ['revenue', 'city'], ascending = [False, True]).reset_index(drop = True)
    return raw
