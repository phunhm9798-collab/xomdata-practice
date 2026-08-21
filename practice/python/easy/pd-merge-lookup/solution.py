# Xom Data · Bring the customer name into the order table
# Problem: https://xomdata.com/practice/pd-merge-lookup
# Solved: 2026-08-21

import pandas as pd


def attach_customer_name(orders, customers):
    # Attach the customer name, keeping only orders found in the directory.
    orders = orders.merge(customers, on = 'customer_id', how = 'inner')
    return orders.reset_index(drop = True)
