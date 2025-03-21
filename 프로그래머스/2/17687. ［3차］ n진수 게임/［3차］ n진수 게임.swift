import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var result: [String] = []   // 나중에 joined 해주기
    var turn = 1
    var queue: [String] = []
    var currentNumber = 0
    
    while result.count != t {
        if queue.isEmpty {
            let newStringArr = String(
                currentNumber, 
                radix: n
            )
            .uppercased()
            .map({ String($0) })
            
            queue += newStringArr
            
            currentNumber += 1
        }
        
        let currentTalk = queue.removeFirst()
        if turn == p { result.append(currentTalk) }
        
        turn = turn % m + 1
    }
    
    return result.joined()
}