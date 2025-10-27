import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    let min = fees[0]
    let baseCost = fees[1]
    let d = fees[2]
    let dCost = fees[3]
    
    var totalCost: [String: Int] = [:]  // 차량번호: 총 주차 시간
    var isIn: [String: Int] = [:]   // 차량번호: 입고시간(분)
    
    // 기록을 분리함 -> 시간을 분으로 변경
    // - IN이면 isIn[차량번호] = 입고시간(분)
    // - OUT이면 isIn[차량번호] = nil
    //   - totalCost[차량번호] += 출고시간(분) - 입고시간(분)
    
    func process(_ record: String) {
        let component = record.components(separatedBy: " ")
        let time = toMin(component[0])
        let carNum = component[1]
        let inOut = component[2]
        
        if inOut == "IN" {
            isIn[carNum] = time
        } else if inOut == "OUT" {
            let inTime = isIn[carNum]!
            totalCost[carNum] = 
            (totalCost[carNum] == nil) ?
            (time - inTime) : (totalCost[carNum]! + time - inTime)
            
            isIn[carNum] = nil
        }
    }
    
    for record in records {
        process(record)
    }

    // 자정 전까지 출고 안된 차량
    let endTime = toMin("23:59")
    for (carNum, inTime) in isIn {

        totalCost[carNum] = (totalCost[carNum] == nil) ?
        (endTime - inTime) : (totalCost[carNum]! + endTime - inTime)
    }
    
    
    let lastCost = totalCost
    .map { (num: $0, time: $1) }
    .sorted { $0.num < $1.num }

    var result: [Int] = []
    for (num, time) in lastCost {
        if time <= min { result.append(baseCost) }
        else {
            var cost = baseCost
            let time = time - min
            cost += (time / d) * dCost
            if time % d != 0 { cost += dCost }
            result.append(cost)
        }
    }
    
    return result
}

func toMin(_ str: String) -> Int {
    let hhmm = str.components(separatedBy: ":")
    let hh = Int(hhmm[0])!
    let mm = Int(hhmm[1])!
    
    return hh * 60 + mm
}