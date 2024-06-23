func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    let sortedArr = arr.sorted().filter { $0 % divisor == 0 }

    return sortedArr.isEmpty ? [-1] : sortedArr
}