# Xom Data · Add a month column from the order date
# Problem: https://xomdata.com/practice/pd-month-column
# Solved: 2026-08-21

import pandas as pd


def add_month(orders):
    # Add a month column shaped YYYY-MM, taken from order_date.
    orders = orders.copy()
    orders['month'] = pd.to_datetime(orders['order_date']).dt.strftime('%Y-%m')
    return orders
