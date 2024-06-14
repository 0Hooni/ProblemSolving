def solution(str1, str2):
    answer = ""
    for i in range(len(str1) + len(str2)):
        if not i % 2:
            answer += str1[i // 2]
        else:
            answer += str2[i // 2]
    return answer


# 다른 풀이
def solution(str1, str2):
    answer = ""
    for i in range(len(str1)):
        answer += str1[i] + str2[i]
    return answer
