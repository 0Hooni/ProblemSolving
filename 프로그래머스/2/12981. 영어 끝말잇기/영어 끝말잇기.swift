import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var result = [0, 0]
    
    for (idx, word) in words.enumerated() {
        let curTurn = idx + 1
        let curPerson = idx % n + 1
        print(words[0..<idx], word)
        
        if idx != 0 && !isPossible(idx, words) {
            return [curPerson, (idx / n) + 1]
        }
    }
    
    return result
}

func isPossible(_ idx: Int, _ words: [String]) -> Bool { 
    return Array(words[idx-1]).map { String($0) }.last 
    == Array(words[idx]).map { String($0) }.first
    && !Array(words[0..<idx]).contains(words[idx])
}