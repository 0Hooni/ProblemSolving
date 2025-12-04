func solution(_ n:Int) -> Int {
    let mod = 1234567
    if n == 1 { return 1 }
    var dp = [Int](repeating: 0, count: n + 1)
    
    dp[0] = 1
    dp[1] = 1
    
    for i in 2...n {
        dp[i] = dp[i-1]%mod + dp[i-2]%mod
    }
    
    return dp[n] % mod
}