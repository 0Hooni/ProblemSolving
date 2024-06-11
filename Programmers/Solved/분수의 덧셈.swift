import Foundation

func solution(_ numer1:Int, _ denom1:Int, _ numer2:Int, _ denom2:Int) -> [Int] {
    var upper: Int = numer1 * denom2 + numer2 * denom1
    var lower: Int = denom1 * denom2
    let GCD = findGCD(upper, lower)
    upper = upper / GCD
    lower = lower / GCD
    
    return [upper, lower]
}

func findGCD(_ num1: Int, _ num2: Int) -> Int {
    if num2 == 0 {
        return num1
    } else {
        return findGCD(num2, num1 % num2)
    }
}
