def solution(n):
    answer = 0
    for i in range(1, n + 1):
        if not (i % 2):
            answer += i
    return answer


# 다른 풀이
# 등차수열을 이용한 풀이 -> 시간 줄일수 있는 좋은 풀이
def solution(n):
    return 2 * (n // 2) * ((n // 2) + 1) / 2
