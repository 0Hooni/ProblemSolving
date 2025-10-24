import Foundation

struct FromTo {
    let from: String
    let to: String
}

func solution(_ friends:[String], _ gifts:[String]) -> Int {
    var giftLog: [String: [String: Int]] = [:]
    
    for (idx, gift) in gifts.enumerated() {
        let fromto = getFromTo(gift)
        let from = fromto.from
        let to = fromto.to
        
        // 준적 있을때
        if var toCountDict = giftLog[from], 
           let toCount = toCountDict[to] {
           toCountDict[to] = toCount + 1
           giftLog[from] = toCountDict
        } else {    // 준적 없을때
               var toCountDict = giftLog[from, default: [:]]
               toCountDict[to] = 1
               giftLog[from] = toCountDict
        }
    }
    
    // 선물 지수 계산
    var giftScore = [String: Int]() 
    for friend in friends { giftScore[friend] = 0 } // 초기화
    // 선물 지수 = 준 선물 - 받은 선물
    for from in friends { 
        giftScore[from] = getGiftScore(from, friends, giftLog) 
    }
    
    // 각자 받은 선물의 수
    var results = [String: Int]()
    for friend in friends { results[friend] = 0 } // 초기화
    for (idx, from) in friends.enumerated() {
        for (idx, to) in friends.enumerated() {
            if from == to { continue }
            
            // 1. 주고 받은 선물이 우위인 사람이 받음
            let giveLog = giftLog[from] ?? [:]
            let giveCount = giveLog[to] ?? 0
            let getLog = giftLog[to] ?? [:]
            let getCount = getLog[from] ?? 0
            
            // 1. 주고 받은 기록 있음
            if giveCount != 0 || getCount != 0 {
                if giveCount < getCount { continue }
                else if giveCount == getCount {
                    if giftScore[from]! > giftScore[to]! {
                        results[from]! += 1 
                    }
                } else {
                    results[from]! += 1 
                }
            } else if giveCount == 0 && getCount == 0 {
                if giftScore[from]! > giftScore[to]! {
                    results[from]! += 1 
                }
            }
        }
    }
    
    print("선물 기록:", giftLog)
    print("선물 지수:", giftScore)
    print("다음달 기록:", results)
    var result = 0
    for friend in friends {
        result = max(results[friend]!, result)
    }
    
    return result
}

func getFromTo(_ fromtoStr: String) -> FromTo {
    let fromto = fromtoStr.components(separatedBy: " ")
    return FromTo(from: fromto[0], to: fromto[1])
}

func getGiftScore(
    _ from: String, 
    _ friends: [String], 
    _ giftLog: [String: [String: Int]]
) -> Int {
    var giveScore = 0   // 준 선물
    var getScore = 0    // 받은 선물
    
    // ["to": Count]
    if let fromLog = giftLog[from] { 
        for friend in friends {
            if let friendLog = giftLog[friend], // 준사람의 선물 기록
                // 나한테 줬던거
               let fromScore = friendLog[from] { getScore += fromScore }
            
            // 준 선물
            if let toScore = fromLog[friend] { giveScore += toScore }
        }
    }
    
    return giveScore - getScore
}
