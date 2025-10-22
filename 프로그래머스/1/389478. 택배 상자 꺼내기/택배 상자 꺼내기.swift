import Foundation

func solution(_ maxNum:Int, _ width:Int, _ target:Int) -> Int {
    let targetPos = findPosition(width, target)
    print(targetPos)
    
    // 2. 계산 결과 x가 같고 y가 더 위에 있다면 count++
    var count = 1
    
    for n in 1...maxNum {
        let curPos = findPosition(width, n)
        print("box:", n, "위치:", curPos.x, curPos.y)
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

/// 1. 상자의 개수와 가로폭을 기준으로 특정 n에 대한 좌표를 계산할 수학적 논리를 작성
func findPosition(_ width: Int, _ target: Int) -> Position {
    let n = target - 1
    return Position(
        x: ((n % (2 * width)) < width) ? (n % width) : (((2 * width) - (n % (2 * width)) - 1) % width), 
        y: n / width
    )
}