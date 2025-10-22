import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    // 사전순 보장을 위해 티켓 자체를 (from, to) 기준으로 정렬
    let tickets = tickets.sorted { 
        if $0[0] == $1[0] { return $0[1] < $1[1] }
        return $0[0] < $1[0]
    }
    var used = Array(repeating: false, count: tickets.count)
    var path = ["ICN"]
    let n = tickets.count
    
    func dfs(_ cur: String) -> Bool {
        if path.count == n + 1 { return true } // 전부 사용 완료
        // cur에서 출발하는 후보 인덱스(미사용만), 목적지 사전순으로 이미 정렬된 tickets를 순차 탐색하면 OK
        for i in 0..<n {
            if !used[i], tickets[i][0] == cur {
                used[i] = true
                path.append(tickets[i][1])
                if dfs(tickets[i][1]) { return true } // 첫 성공이 곧 사전순 최소
                path.removeLast()
                used[i] = false
            }
        }
        return false
    }
    
    _ = dfs("ICN")
    return path
}