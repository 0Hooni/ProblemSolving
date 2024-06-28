import Foundation

let num = readLine()!.map { Int(String($0))! }
var numCount = [Int](repeating: 0, count: 9)
var res = 0

// 숫자가 없으면 새로운 세트 추가
// 숫자가 있으면 세트 추가 x
// 숫자 9는 6에서 빼기

for n in num {
    if numCount[n == 9 ? 6 : n] == 0 {
        addNewSet()
        numCount[n == 9 ? 6 : n] -= 1
    } else {
        numCount[n == 9 ? 6 : n] -= 1
    }
}

func addNewSet() {
    for i in 0..<10 {
        numCount[i == 9 ? 6 : i] += 1
    }
    res += 1
}

print(res)
