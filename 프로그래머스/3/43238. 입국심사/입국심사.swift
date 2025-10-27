import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    let times = times.sorted()
    // 특정 시간 T 안에 n명을 모두 심사할 수 있는가?  
    var max: Int64 = Int64(n * times.min()!)
    var min: Int64 = Int64(1)
    var middle: Int64 = (min + max) / 2
    
    while min <= max {
        if possibleCount(middle, times) >= n {
            max = middle - 1
        } else {
            min = middle + 1
        }
        
        middle = (min + max) / 2
    }
    
    return min
}

func possibleCount(_ time: Int64, _ times: [Int]) -> Int64 {
    return times.map { time / Int64($0) }.reduce(0) { $0 + $1 }
}
