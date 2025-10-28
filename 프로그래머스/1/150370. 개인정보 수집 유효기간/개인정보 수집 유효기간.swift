import Foundation

struct Info {
    let date: String
    let type: String
}

func solution(
    _ today:String, 
    _ terms:[String], 
    _ privacies:[String]
) -> [Int] {
    let terms = terms.map { $0.components(separatedBy: " ") }
    var termDict: [String: Int] = [:]
    terms.forEach { termDict[$0[0]] = Int($0[1])! }

    
    let privacies = privacies
    .map { $0.components(separatedBy: " ") }
    .map { Info(date: $0[0], type: $0[1]) }
    
    var result: [Int] = []
    for (idx, privacy) in privacies.enumerated() {
        if overDate(today, privacy.date, termDict[privacy.type]!) {
            result.append(idx + 1)
        }
    }
    
    // 파기할 번호 오름차순 정렬 후 반환
    return result
}

func overDate(_ today: String, _ date: String, _ month: Int) -> Bool {
    let today = today.components(separatedBy: ".")
    let (tdY, tdM, tdD) = (Int(today[0])!, Int(today[1])!, Int(today[2])!)
    
    let date = date.components(separatedBy: ".")
    var (dY, dM, dD) = (Int(date[0])!, Int(date[1])!, Int(date[2])!)
    
    // 날짜 하루 빼주기
    if dD <= 0 {
        dM -= 1
        dD += 28
        if dM <= 0 {
            dY -= 1
            dM += 12
        }
    }
    
    // 약관 달 추가해주기
    dM += month
    
    // 12월을 넘기면 년도 계산해주기
    if dM > 12 {    // dM이 24가 될 때 문제가 생김
        dY += (dM - 1) / 12
        dM = (dM - 1) % 12
        dM += 1
    }
    
    if tdY < dY { return false }
    else if tdY == dY {
        if tdM < dM { return false }
        else if tdM == dM {
            if tdD < dD { return false }
        }
    }
    
    return true
}