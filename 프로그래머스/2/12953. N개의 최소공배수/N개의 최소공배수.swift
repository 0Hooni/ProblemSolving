func gcd(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : gcd(b, a % b)
}

func solution(_ arr:[Int]) -> Int {
    return arr.reduce(1) { (result, num) in
        (result * num) / gcd(result, num)
    }
}