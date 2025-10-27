import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    // 0 기준 스플릿 -> 필요없는 인수 제거(0, 1) -> 소수 판별
    // 해당 N 은 K 진법에서도 10진법에서도 소수여야 함.
    let kStr = String(n, radix: k)
    let numStrArr = kStr.components(separatedBy: "0").filter { 
        $0 != "" && $0 != "0" && $0 != "1"
    }
    
    // 필요시 소수 결과를 저장한 primeDict 만들기
    var prime: [Int: Bool] = [:]
    
    var count = 0
    for num in numStrArr {
        if isNumStrPrime(num, &prime) { count += 1 }
    }
    
    return count
}

func isNumStrPrime(
    _ num: String, 
    _ prime: inout [Int: Bool]
) -> Bool {
    let num = Int(num)!
    
    if let isPrime = prime[num] { return isPrime } 
    else {
        let res = isPrime(num)
        prime[num] = res
        return res
    }
    
    return false
}

func isPrime(_ n: Int) -> Bool {
    if n == 2 || n == 3 { return true }
    
    for i in 2...Int(sqrt(Float(n))) {
        if n % i == 0 { return false }
    }
    
    return true
}