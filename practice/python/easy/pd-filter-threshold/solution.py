# Xom Data · Payments at or above a minimum
# Problem: https://xomdata.com/practice/pd-filter-threshold
# Solved: 2026-08-18

import pandas as pd


def big_payments(payments, min_amount):
    # Return the rows whose amount is at least min_amount.
    # Keep the original row order and row labels.
    payments = payments[(payments['amount'] >= min_amount)]
    return payments
