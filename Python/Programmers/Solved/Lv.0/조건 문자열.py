def solution(ineq, eq, n, m):
    answer = 0
    if eq == "=":
        if ineq == ">":
            answer = int(n >= m)
        else:
            answer = int(n <= m)
    else:
        if ineq == ">":
            answer = int(n > m)
        else:
            answer = int(n < m)
    return answer


# 다른 풀이 -> replace와 eval 함수에 대한 이해성
def solution(ineq, eq, n, m):
    return int(eval(str(n) + ineq + eq.replace("!", "") + str(m)))
