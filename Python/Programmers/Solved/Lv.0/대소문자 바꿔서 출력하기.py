str = input()
str = list(str)
for i in range(len(str)):
    ch = str[i]
    if ch.isupper():
        ch = ch.lower()
        str[i] = ch
    else:
        ch = ch.upper()
        str[i] = ch

res = ""
for ch in str:
    res += ch

print(res)

# 다른 풀이
print(input().swapcase())
