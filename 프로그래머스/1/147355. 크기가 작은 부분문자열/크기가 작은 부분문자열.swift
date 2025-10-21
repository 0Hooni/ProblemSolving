import Foundation

func solution(_ t: String, _ p: String) -> Int {
    let target = Int(p)!
    
    var count = 0
    for i in 0...(t.count - p.count) {
        let startIdx = t.index(t.startIndex, offsetBy: i)
        let endIdx = t.index(startIdx, offsetBy: p.count)
        let cur = Int(t[startIdx..<endIdx])!
        if cur <= target { count += 1 }
    }
    
    return count
}