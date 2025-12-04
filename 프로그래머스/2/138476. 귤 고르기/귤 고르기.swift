import Foundation

func solution(_ k:Int, _ tangerine:[Int]) -> Int {
    // 딕셔너리 이용?[귤: 개수]
    var dict: [Int: Int] = [:]
    for t in tangerine {
        dict[t, default: 0] += 1
    }
    
    let sortedDict = dict.sorted { $0.value > $1.value }
    var total = 0
    var result = 0
    for (key, value) in sortedDict {
        if total >= k { break }
        total += value
        result += 1
    }
    
    return result
}