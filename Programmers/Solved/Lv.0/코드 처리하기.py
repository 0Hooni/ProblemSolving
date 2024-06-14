def solution(code):
    answer = ""
    cur_mode = 0
    for i in range(len(code)):
        if cur_mode == 0:
            if code[i] == "1":
                cur_mode = 1
                continue
            else:
                if not i % 2:
                    answer += code[i]
        else:
            if code[i] == "1":
                cur_mode = 0
                continue
            else:
                if i % 2:
                    answer += code[i]

    return answer if answer != "" else "EMPTY"


# 다른 풀이
def solution(code):
    answer = ""

    mode = 0
    for i in range(len(code)):
        if code[i] == "1":
            mode ^= 1
        else:
            if i % 2 == mode:
                answer += code[i]

    return answer if answer else "EMPTY"
