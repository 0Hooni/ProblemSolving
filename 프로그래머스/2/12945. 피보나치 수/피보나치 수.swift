func solution(_ n:Int) -> Int {
    var fibo: [Int] = [0, 1]
    let mod: Int = 1234567
    for i in (fibo.count - 1)..<n {
        fibo.append(fibo[i]%mod + fibo[i-1]%mod)
    }
    // 오버플로우 관점 고려하기
    return fibo[n]%mod
}