# Xom Data · Search in rotated sorted array
# Problem: https://xomdata.com/practice/py-search-rotated
# Solved: 2026-08-27

def search(numbers, target):
    left, right = 0, len(numbers) - 1

    while left <= right:
        mid = (left + right) // 2

        if numbers[mid] == target:
            return mid

        # Kiểm tra nửa trái có được sắp xếp tăng dần không
        if numbers[left] <= numbers[mid]:
            # Nếu target nằm trong nửa trái đã sắp xếp
            if numbers[left] <= target < numbers[mid]:
                right = mid - 1
            else:
                left = mid + 1
        else:
            # Nửa phải được sắp xếp tăng dần
            if numbers[mid] < target <= numbers[right]:
                left = mid + 1
            else:
                right = mid - 1

    return -1
