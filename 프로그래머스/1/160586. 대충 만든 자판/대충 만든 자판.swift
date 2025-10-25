import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    // 1. 각 문자를 최소 몇번 눌러야 되는지 저장해둘 딕셔너리(DP 같은 느낌)
    var keyDict: [String: Int] = [:]
    // 2. 주어진 키 할당 배열을 동시에 순차적으로 돌음
    var results = [Int]()
    for target in targets {
        let result = calcTarget(target, keymap, &keyDict)
        results.append(result)
    }
    
    return results
}

func calcTarget(
    _ target: String, 
    _ keymap: [String],
    _ keyDict: inout [String: Int]
) -> Int {  // 결과를 반환
    let target = Array(target).map { String($0) }
    var sum = 0
    
    for ch in target {
        if let min = keyDict[ch] { sum += min; continue }
        
        let findMin = findKey(keymap, ch)
        if findMin == -1 { return -1 }
        keyDict[ch] = findMin
        sum += findMin
    }
    
    return sum
}

func findKey(
    _ keymap: [String],
    _ ch: String
) -> Int {
    let maxSize = keymap.sorted { $0.count > $1.count }.first!.count
    var minCount = Int.max
    
    for keys in keymap {
        let keyArr = Array(keys).map { String($0) }
        keyArr.enumerated().forEach { (idx, key) in
            if key == ch {
                minCount = min((idx + 1), minCount)
            }            
        }
    }
    
    return minCount == Int.max ? -1 : minCount
}

