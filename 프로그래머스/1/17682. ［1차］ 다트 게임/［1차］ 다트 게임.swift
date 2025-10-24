struct Dart {
    let score: Int
    let bonus: Int
    let option: Int
}

// 5시 57분
func solution(_ dartResult:String) -> Int {
    let darts = parseToDart(dartResult)
    
    var results: [Int] = []
    for dart in darts { results.append(getScoreWithOutOption(dart)) }
    
    for (idx, dart) in darts.enumerated() {
        if dart.option == 1 { continue }
        else if dart.option == 2 {
            if idx == 0 { results[idx] *= 2 }
            else { 
                results[idx - 1] *= 2
                results[idx] *= 2
            }
        } else if dart.option == -1 {
            results[idx] *= -1
        }
    }
    
    var sum = 0
    for result in results { sum += result }
    
    return sum
}

func parseToDart(_ dartResult: String) -> [Dart] {
    let arr = Array(dartResult).map { String($0) }
    
    var result = [Dart]()
    var stack: [String] = []
    var curStack: [String] = []
    
    for (idx, ch) in arr.enumerated() {
        if "0" <= ch && ch <= "9" {
            if curStack.contains("10") && curStack.count == 1 { continue }
            // 10인 경우
            if ch == "1" && (idx + 1) <= (arr.count - 1) && arr[idx+1] == "0" {
                if !curStack.isEmpty { stack.append(curStack.joined()) }
                curStack = ["10"]
            } else {
                if !curStack.isEmpty { stack.append(curStack.joined()) }
                curStack = [ch]
            }
        } else {
            curStack.append(ch)
        }
    }
    stack.append(curStack.joined())
    
    for s in stack {
        print(s)
        var dart: [String] = []
        var s = s
        var sArr: [String] = []
        if s.contains("10") {
            dart.append("10")
            sArr = Array(s).map { String($0) }
            sArr.removeFirst(2)
        } else {
            sArr = Array(s).map { String($0) }
            dart.append(sArr[0])
            sArr.removeFirst()
        }
        
        dart += sArr
        
        if dart.count == 3 {
            result.append(
                Dart(
                    score: Int(dart[0])!,
                    bonus: dart[1] == "S" ? 1 : (dart[1] == "D" ? 2 : 3),
                    option: dart[2] == "*" ? 2 : -1
                )
            )
        } else if dart.count == 2 {
            result.append(
                Dart(
                    score: Int(dart[0])!,
                    bonus: dart[1] == "S" ? 1 : (dart[1] == "D" ? 2 : 3),
                    option: 1
                )
            )
        }
    }
    
    return result
}

func getScoreWithOutOption(_ dart: Dart) -> Int {
    var result = 1
    for _ in 0..<dart.bonus {
        result *= dart.score
    }
    return result
}