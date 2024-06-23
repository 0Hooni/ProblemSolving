def solution(a, b):
    answer = ""
    ab = int(str(a) + str(b))
    ba = 2 * a * b
    if ab > ba:
        answer = ab
    else:
        answer = ba

    return answer


# 다른 풀이
def solution(a, b):
    return max(int(str(a) + str(b)), 2 * a * b)
