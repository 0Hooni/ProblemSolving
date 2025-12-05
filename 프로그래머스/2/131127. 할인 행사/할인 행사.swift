import Foundation

func solution(
    _ want:[String], 
    _ number:[Int], 
    _ discount:[String]
) -> Int {
    if !isContains(want, discount) { return 0 }
    
    var resultDays: [Int] = []
    
    for i in 0..<(discount.count - 9) {
        let curDiscount = Array(discount[i..<i+10])
        if isContains(want, curDiscount) 
        && isPossible(want, number, curDiscount) { 
            resultDays.append(i + 1) 
        }
    }
    
    return resultDays.count
}

func isContains(_ want: [String], _ discount: [String]) -> Bool {
    return Set(want).isSubset(of: Set(discount))
}

func isPossible(_ want: [String], _ number: [Int], _ discount: [String]) -> Bool {
    var wantDict: [String: Int] = [:]
    for (idx, w) in want.enumerated() {
        wantDict[w, default: 0] = number[idx]
    }
    
    var discountDict: [String: Int] = discount.reduce(into: [:]) { 
        $0[$1, default: 0] += 1
    }
    
    for (w, count) in wantDict {
        guard let discountCount = discountDict[w] else { return false }
        if discountCount < count { return false }
    }
    
    return true
}