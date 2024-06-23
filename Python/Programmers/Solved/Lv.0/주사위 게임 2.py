def solution(a, b, c):
    answer = 0
    if a == b == c:
        answer = (a + b + c) * (a**2 + b**2 + c**2) * (a**3 + b**3 + c**3)
    elif a != b and a != c and b != c:
        answer = a + b + c
    else:
        answer = (a + b + c) * (a**2 + b**2 + c**2)
    return answer


# 다른 풀이
def solution(a, b, c):
    check = len(set([a, b, c]))
    if check == 1:
        return 3 * a * 3 * (a**2) * 3 * (a**3)
    elif check == 2:
        return (a + b + c) * (a**2 + b**2 + c**2)
    else:
        return a + b + c
