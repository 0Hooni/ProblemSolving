import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var result = [0, 0]
    
    for (idx, word) in words.enumerated() {
        let curTurn = idx + 1
        let curPerson = idx % n + 1
        print(words[0..<idx], word)
        
        if Array(words[0..<idx]).contains(word) {
            return [curPerson, (idx / n) + 1]
        } else if idx != 0 && !isCorrectWord(words[idx-1], words[idx]) {
            // 0, 1, 2 -> 1번 턴
            // 3, 4, 5 -> 2번 턴
            return [curPerson, (idx / n) + 1]
        }
    }
    
    return result
}

func isCorrectWord(_ prev: String, _ cur: String) -> Bool { 
    return Array(prev).map { String($0) }.last 
    == Array(cur).map { String($0) }.first
}