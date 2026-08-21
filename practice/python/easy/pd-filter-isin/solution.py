# Xom Data · Keep only the cities we are watching
# Problem: https://xomdata.com/practice/pd-filter-isin
# Solved: 2026-08-21

import pandas as pd


def only_cities(orders, cities):
    # Keep the rows whose city is in the watch list, in the original row order.
    orders = orders.copy()
    if not cities:
        return pd.DataFrame(columns=orders.columns)
    return orders[orders['city'].isin(cities)]
