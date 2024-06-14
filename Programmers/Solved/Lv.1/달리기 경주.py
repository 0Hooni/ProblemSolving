def solution(n, m, section):
    answer = 0
    painted = 0

    for wall in section:
        if painted < wall:
            painted = wall + m - 1
            answer += 1

    return answer
