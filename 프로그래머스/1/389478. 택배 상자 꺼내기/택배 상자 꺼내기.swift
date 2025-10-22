import Foundation

func solution(_ maxNum:Int, _ width:Int, _ target:Int) -> Int {
    let targetPos = findPosition(width, target)
    
    // 2. 계산 결과 x가 같고 y가 더 위에 있다면 count++
    var count = 1
    for n in 1...maxNum {
        let curPos = findPosition(width, n)
        if curPos.x == targetPos.x && curPos.y > targetPos.y { 
            count += 1 
        }
    }
    
    return count
}

struct Position {
    let x: Int
    let y: Int
}
// 

/// 1. 상자의 개수와 가로폭을 기준으로 특정 n에 대한 좌표를 계산할 수학적 논리를 작성
func findPosition(_ width: Int, _ target: Int) -> Position {
    let idx = target - 1
    let row = idx / width
    let col = idx % width

    // 짝수 행: 왼 -> 오
    // 홀수 행: 오 -> 왼
    let x = (row % 2 == 0) ? col : (width - 1 - col)
    return Position(x: x, y: row)
}