def solution(n):
    answer = 0
    if n % 2:
        for i in range(1, n + 1, 2):
            answer += i

    else:
        for i in range(2, n + 1, 2):
            answer += i**2

    return answer


# 다른 풀이
def solution(n):
    return sum(x ** (2 - x % 2) for x in range(n + 1) if n % 2 == x % 2)
