# Xom Data · Boxes needed to pack the goods
# Problem: https://xomdata.com/practice/py-boxes-needed
# Solved: 2026-08-14

def boxes_needed(items, capacity):
    needed = items // capacity
    if not items:
        return 0
    if items % capacity != 0:
        needed +=1
    return needed
