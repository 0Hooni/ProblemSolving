def solution(num1, num2):
    answer = 0

    if num1 == num2:
        answer = 1
    else:
        answer = -1

    return answer


# 다른 풀이
def solution(num1, num2):
    return 1 if num1 == num2 else -1
