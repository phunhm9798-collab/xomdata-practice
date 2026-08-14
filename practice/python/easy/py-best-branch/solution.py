# Xom Data · Branch leading on revenue
# Problem: https://xomdata.com/practice/py-best-branch
# Solved: 2026-08-14

def best_branch(branches):
    if not branches:
        return None
    return max(branches, key = branches.get)
