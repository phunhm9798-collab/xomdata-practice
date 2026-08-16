# Xom Data · The best-selling products
# Problem: https://xomdata.com/practice/pd-sort-top-n
# Solved: 2026-08-16

import pandas as pd


def top_products(products, n):
    # Return the n best-selling products, ties broken by name (A to Z).
    # Renumber the rows from 0.
    products = products.sort_values(by = ['sold', 'name'], ascending = [False, True])
    products = products.head(n).reset_index(drop = True)
    return products
