import Foundation

func solution(_ n:Int) -> Int {
    var ans: Int = 0
    var num: Int = n
    
    while num > 0 {
        ans += num % 2
        num /= 2
    }

    return ans
}