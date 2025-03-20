import Foundation

func solution(_ n: Int, _ computers: [[Int]]) -> Int {
    // 한 그룹으로 구성된 네트워크 망의 개수 찾기
    // n차원 배열
    // 아직 탐색한적 없는 애는 어떻게 찾지...? 2중 for문?
    // -> 방문했던 적이 있던 컴퓨터 번호 기준!!
    // 일단 bfs를 몇번 돌리는지가 답일것 같음
    var count = 0
    var dict = [Int: [Int]]()
    var visit: [Bool] = Array(repeating: false, count: n)
    
    for i in 0..<n {
        for j in 0..<n {
            if computers[i][j] == 1 { 
                if dict[i] == nil { dict[i] = [j] } 
                else { dict[i]!.append(j) }
            }
        }
    }
    
    func bfs(_ start: Int) {
        var queue: [Int] = [start]
        
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            visit[cur] = true
            
            for next in dict[cur]! {
                if !visit[next] { queue.append(next) }
            }
        }
        
        count += 1
    }
    
    for com in 0..<n {
        if !visit[com] { bfs(com) }
    }
    
    return count
}
