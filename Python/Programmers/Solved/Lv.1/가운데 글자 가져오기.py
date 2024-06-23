def solution(s):
    return s[len(s) // 2] if len(s) % 2 else s[len(s) // 2 - 1] + s[len(s) // 2]
