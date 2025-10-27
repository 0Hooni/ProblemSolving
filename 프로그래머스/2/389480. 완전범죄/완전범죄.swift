import Foundation

// info[i] = [a_i, b_i]
// n = A의 한계, m = B의 한계
func solution(_ info: [[Int]], _ n: Int, _ m: Int) -> Int {
    struct State: Hashable { let i: Int, a: Int, b: Int }

    var answer = n               // 최솟값 후보(상한)
    var visited = Set<State>()   // 방문한 상태 메모

    func dfs(_ i: Int, _ a: Int, _ b: Int) {
        // 한계 넘으면 컷
        if a >= n || b >= m { return }
        // 이미 현재 최적보다 크면 컷
        if a >= answer { return }
        // 모든 물건 배정 완료 → 최솟값 갱신
        if i == info.count {
            if a < answer { answer = a }
            return
        }
        // 중복 상태 방지
        let s = State(i: i, a: a, b: b)
        if visited.contains(s) { return }
        visited.insert(s)

        // i번째 물건을 B가 훔침
        dfs(i + 1, a, b + info[i][1])
        // i번째 물건을 A가 훔침
        dfs(i + 1, a + info[i][0], b)
    }

    dfs(0, 0, 0)
    return answer == n ? -1 : answer
}