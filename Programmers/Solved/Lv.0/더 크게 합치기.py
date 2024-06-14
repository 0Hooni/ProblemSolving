def solution(a, b):
    answer = 0
    ab = int(str(a) + str(b))
    ba = int(str(b) + str(a))
    if ab > ba:
        answer = ab
    else:
        answer = ba

    return answer


# 다른 풀이
def solution(a, b):
    return int(max(f"{a}{b}", f"{b}{a}"))
