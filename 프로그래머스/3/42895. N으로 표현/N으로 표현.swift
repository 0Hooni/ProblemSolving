import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    var dp = [[Int]](repeating: [], count: 10)
    dp[2] = findAllCases(N, N)
    
    for i in 1...8 {
        let curSequence = makeSeq(N, i)
        dp[i].append(curSequence)
        if i == 1 { continue }
        
        for j in 1...(i/2) { dp[i] += findAllDP(dp[i-j], dp[j]) }
        dp[i] = Array(Set(dp[i]))
    }
    
    for i in 1...8 {
        if dp[i].contains(number) { return i }
    }
    
    return -1
}

func makeSeq(_ num: Int, _ count: Int) -> Int {
    var str = ""
    for i in 0..<count { str += "\(num)" }
    return Int(str)!
}

func findAllDP(_ dp1: [Int], _ dp2: [Int]) -> [Int] {
    var res: [Int] = []
    
    for num1 in dp1 {
        for num2 in dp2 { res += findAllCases(num1, num2) }
    }
    
    return Array(Set(res))
}

func findAllCases(_ num1: Int, _ num2: Int) -> [Int] {
    var res: [Int] = []
    
    res.append(num1 + num2)
    if num1 - num2 > 0 { res.append(num1 - num2) }
    if num2 - num1 > 0 { res.append(num2 - num1) }
    res.append(num1 * num2)
    if num2 != 0 { res.append(num1 / num2) }
    if num1 != 0 { res.append(num2 / num1) }
    
    return res
}