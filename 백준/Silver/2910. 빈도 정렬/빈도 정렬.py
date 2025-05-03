from collections import defaultdict

N, C = map(int, input().split())
nums = list(map(int, input().split()))

freq = defaultdict(int)     # 숫자 -> 빈도
order = {}                  # 숫자 -> 처음 등장한 인덱스

for i, num in enumerate(nums):
    freq[num] += 1
    if num not in order:
        order[num] = i

# 정렬: 1) 빈도 내림차순, 2) 먼저 나온 순서 오름차순
sorted_nums = sorted(set(nums), key=lambda x: (-freq[x], order[x]))

result = []
for num in sorted_nums:
    result.extend([num] * freq[num])

print(*result)
