# Xom Data · Total revenue across the network
# Problem: https://xomdata.com/practice/py-total-revenue-dict
# Solved: 2026-08-21

def total_revenue(branches):
    if not branches:
        return 0
    else:
        return sum(branches.values())
