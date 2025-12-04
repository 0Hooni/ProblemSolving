import Foundation

func solution(_ citations:[Int]) -> Int {
    let citations = citations.sorted()
    
    var res = 0
    for (i, c) in citations.enumerated() {
        let h = i + 1
        let count = citations.filter { $0 >= h}.count
        let remain = citations.count - count
        
        if count >= h && remain <= h { res = max(res, h) }
    }
    
    return res
}