def solution(num_list):
    even = ""
    odd = ""

    for num in num_list:
        if num % 2:
            odd += str(num)
        else:
            even += str(num)

    return int(even) + int(odd)
