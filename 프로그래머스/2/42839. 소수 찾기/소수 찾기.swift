import Foundation

func solution(_ numbers:String) -> Int {
    let permus: [Int] = getPermutationList(numbers)
    // 리스트의 수가 소수인지 확인하기
    return countPrime(permus)
}

func countPrime(_ numbers: [Int]) -> Int {
    return numbers.filter { isPrime($0) }.count
}

func isPrime(_ num: Int) -> Bool {
    if num < 2 { return false }
    var bool = true
    for n in 2..<num {
        if num % n == 0 { return false }
    }
    return true
}

func getPermutationList(_ numbers: String) -> [Int] {
    let numbers = Array(numbers).map { String($0) }
    var result: [Int] = []
    // 주어진 숫자로 만들 수 있는 모든 조합 찾기
    // 1개로 만들어지는 조합 ~ n개로 만들어지는 조합
    for len in 1...numbers.count {
        result += makePermutation(numbers, len).map { Int($0)! }
    }
    
    return Set(result).map { Int($0) }
}

func makePermutation(_ numbers: [String], _ len: Int) -> [String] {
    // 길이가 0일때 종료
    if len == 1 { return numbers }
    // 길이가 남으면 자신을 이어붙이고 자신을 제거한 나머지를 재귀로 넘김
    var results: [String] = []
    for (idx, num) in numbers.enumerated() {
        var newNumbers = numbers
        newNumbers.remove(at: idx)
        let tails = makePermutation(newNumbers, len - 1).map { num + $0 }
        results += tails
    }
    
    return results
}