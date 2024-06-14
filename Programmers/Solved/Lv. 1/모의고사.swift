import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let firstSupoPattern = [1, 2, 3, 4, 5]
    let secondSupoPattern = [2, 1, 2, 3, 2, 4, 2, 5]
    let thirdSupoPattern = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var firstSupoCorrect = 0
    var secondSupoCorrect = 0
    var thirdSupoCorrect = 0
    
    for i in 0..<answers.count {
        if firstSupoPattern[i % firstSupoPattern.count] == answers[i] {
            firstSupoCorrect += 1
        }
        if secondSupoPattern[i % secondSupoPattern.count] == answers[i] {
            secondSupoCorrect += 1
        }
        if thirdSupoPattern[i % thirdSupoPattern.count] == answers[i] {
            thirdSupoCorrect += 1
        }
    }
    
    var result: [Int] = []
    let maxCorrect = max(firstSupoCorrect, max(secondSupoCorrect, thirdSupoCorrect))
    if firstSupoCorrect == maxCorrect { result.append(1) }
    if secondSupoCorrect == maxCorrect { result.append(2) }
    if thirdSupoCorrect == maxCorrect { result.append(3) }
    
    
    return result
}

print(solution([1, 3, 2, 4, 2]))
