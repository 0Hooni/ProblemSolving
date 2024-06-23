def solution(num_list):
    answer = 0
    temp1 = 1  # 모든 원소 곱
    temp2 = 0  # 원소 합의 제곱
    for num in num_list:
        temp1 *= num
        temp2 += num

    temp2 = temp2**2

    return 0 if temp1 > temp2 else 1


# 다른 풀이
def solution(num_list):
    mul = 1
    for n in num_list:
        mul *= n
    return int(mul < sum(num_list) ** 2)
