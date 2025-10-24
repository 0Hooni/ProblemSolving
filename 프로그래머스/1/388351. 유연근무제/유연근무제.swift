import Foundation

// 시작: 4시 48분
func solution(_ schedules:[Int], _ timelogs:[[Int]], _ startday:Int) -> Int {
    let schedules: [Int] = schedules.map { return toMin($0) }
    let timelogs: [[Int]] = timelogs.map { $0.map { return toMin($0) }}
    
    var results = [Int](repeating: 0, count: schedules.count)
    
    for i in 0..<7 {
        let day = ((startday - 1) + i) % 7
        if day == 5 || day == 6 { continue }
        
        for (idx, schedule) in schedules.enumerated() {
            let timelog = timelogs[idx]
            results[idx] += isLate(schedule, timelog[i]) ? 1 : 0
        }
    }
    
    return results.filter { $0 == 0 }.count
}

func isLate(_ schedule: Int, _ time: Int) -> Bool {
    return time > schedule + 10
}

func toMin(_ num: Int) -> Int {
    let HH = num / 100
    let MM = num % 100
    
    return (HH * 60) + MM
}