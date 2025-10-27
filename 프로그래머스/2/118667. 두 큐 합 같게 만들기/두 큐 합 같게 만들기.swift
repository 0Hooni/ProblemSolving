import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var q1 = queue1.map { Int64($0) }
    var q2 = queue2.map { Int64($0) }
    let total = (q1.reduce(Int64(0), +) + q2.reduce(Int64(0), +))
    
    if total % 2 != 0 { return -1 }
    let target = total / 2
    
    if max(q1.max() ?? 0, q2.max() ?? 0) > target { return -1 }
    
    let arr = q1 + q2
    let N = arr.count
    
    var i = 0, j = q1.count
    var sum1 = q1.reduce(Int64(0), +)
    var moves = 0
    let limit = 2 * N
    
    while moves <= limit {
        if sum1 == target { return moves }
        
        if sum1 > target {
            let x = arr[i % N]
            sum1 -= x
            i += 1
        } else {
            let x = arr[j % N]
            sum1 += x
            j += 1
        }
        
        moves += 1
    }
    
    return -1
}