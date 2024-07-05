import Foundation

/*
문제 분석
- 마울에는 1번 ~ n번집까지 n개의 집이 순서대로 세워짐
- 땅 높이는 제각각이다.(i번집의 높이는 k_i)
- 해수면이 높이의 기준. 마이너스는 해수면 아래
- 장마가 시작되면 M일 동안 비가 내림
- 장마 시작된지 i일이 되는날 s_i ~ e_i에만 비가 내림
- 비가 내리면 해수면 높이가 1만큼 증가
- 배수 시스템(작동은 시작된지 3의 배수가 되는 날) 전까지는 비가 안빠짐
- 시스템 작동은 비가 내리는날 ~ 전전날 비가내린 곳에만 작동함
- 배수 시스템이 작동하면 높이가 1 감소함
- 장마가 끝나면 모든 마을의 땅 높이가 해당 땅에 쌓여있는 물 높이만큼 증가함
- 1 ~ N번집까지 땅 높이 재조사 한 결과
*/

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var k = readLine()!.split(separator: " ").map { Int($0)! }    // 1번 집부터 집임

var isRain = [Bool](repeating: false, count: N)
// 장마 시작
for i in 0..<M {
    let se = readLine()!.split(separator: " ").map { Int($0)! }
    let s = se[0]
    let e = se[1]
    
    for j in s...e {
        k[j-1] += 1
        isRain[j-1] = true
    }    // 비가 쌓임
    
    // 배수 시스템 작동
    if (i+1) % 3 == 0 {
        for j in 0..<N { if isRain[j] { k[j] -= 1 } }
        isRain = [Bool](repeating: false, count: N)
    }
}

for height in k {
    print(height, terminator: " ")
}
