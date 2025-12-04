import Foundation

func solution(_ citations:[Int]) -> Int {
    let citations = citations.sorted(by: >)
    
    var res = 0
    for (idx, cit) in citations.enumerated() {
        if idx + 1 <= cit { res = idx + 1}
        else { break }
    }
    
    return res
}