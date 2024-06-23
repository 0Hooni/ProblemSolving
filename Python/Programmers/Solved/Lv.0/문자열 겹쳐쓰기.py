def solution(my_string, overwrite_string, s):
    answer = ""
    s = int(s)
    for i in range(s):
        answer += my_string[i]
    for i in range(len(overwrite_string)):
        answer += overwrite_string[i]

    if s + len(overwrite_string) < len(my_string):
        for i in range(len(my_string) - (s + len(overwrite_string))):
            answer += my_string[s + len(overwrite_string) + i]

    return answer


# 다른 풀이
def solution(my_string, overwrite_string, s):
    answer = my_string[:s] + overwrite_string + my_string[s + len(overwrite_string) :]
    return answer
