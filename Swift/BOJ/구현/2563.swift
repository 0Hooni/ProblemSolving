import Foundation
// 최대 크기는 100 언더
// 검은색의 영역을 구해야 됨
// 겹치는 부분은 한번 빼줌
// 겹치는걸 어떻게 판단하지?
    // 전체 영역을 false로 하자
    // 채워질 때 true로 변환
    // 값을 순회하면서 전체 영역 확인

let rl = Int(readLine()!)!
let falseBool = [Bool](repeating: false, count: 100)
var blackArea = [[Bool]](repeating: falseBool, count: 100)

for _ in 0..<rl {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    let x = xy[0]
    let y = xy[1]

    for i in x..<x+10 {
        for j in y..<y+10 {
            blackArea[i][j] = true
        }
    }
}

var count = 0

for i in 0..<100 {
    for j in 0..<100 {
        if blackArea[i][j] { count += 1 }
    }
}

print(count)
