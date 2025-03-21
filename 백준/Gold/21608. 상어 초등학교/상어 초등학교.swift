import Foundation

let input = Int(readLine()!)!
let n = input * input
var total = 0

var studentLike = [Int: [Int]]()
var studentOrder = [Int]()

// 학생 순서와 좋아하는 학생 목록 입력
for _ in 1...n {
    var rl = readLine()!.split(separator: " ").map { Int($0)! }
    let currentStudent = rl.removeFirst()
    studentOrder.append(currentStudent)
    studentLike[currentStudent] = rl
}

// 교실 좌석 초기화 (input x input 크기)
var room: [[Int]] = Array(repeating: Array(repeating: -1, count: input), count: input)

// 인접 범위 확인 함수
func isPossibleRange(_ x: Int, _ y: Int) -> Bool {
    return (0 <= x && x < input) && (0 <= y && y < input)
}

// 4방향 정의
let diff = [(0,1), (1,0), (-1,0), (0,-1)]

// 학생 한 명씩 배치
for student in studentOrder {
    var candidates: [(Int, Int, Int, Int)] = [] // (likeCount, emptyCount, row, col)

    for row in 0..<input {
        for col in 0..<input {
            if room[row][col] != -1 { continue } // 이미 자리가 찼으면 넘어감

            var likeCount = 0
            var emptyCount = 0

            for (dr, dc) in diff {
                let nr = row + dr
                let nc = col + dc

                if isPossibleRange(nr, nc) {
                    let neighbor = room[nr][nc]
                    if neighbor == -1 {
                        emptyCount += 1
                    } else if studentLike[student]!.contains(neighbor) {
                        likeCount += 1
                    }
                }
            }

            candidates.append((likeCount, emptyCount, row, col))
        }
    }

    // 조건 우선순위대로 정렬
    candidates.sort {
        if $0.0 != $1.0 { return $0.0 > $1.0 }       // 좋아하는 학생 수
        if $0.1 != $1.1 { return $0.1 > $1.1 }       // 비어있는 칸 수
        if $0.2 != $1.2 { return $0.2 < $1.2 }       // 행 번호
        return $0.3 < $1.3                           // 열 번호
    }

    let (like, empty, r, c) = candidates[0]
    room[r][c] = student
}

// 만족도 계산
for row in 0..<input {
    for col in 0..<input {
        let student = room[row][col]
        var likeCount = 0

        for (dr, dc) in diff {
            let nr = row + dr
            let nc = col + dc

            if isPossibleRange(nr, nc) {
                let neighbor = room[nr][nc]
                if studentLike[student]!.contains(neighbor) {
                    likeCount += 1
                }
            }
        }

        switch likeCount {
        case 1: total += 1
        case 2: total += 10
        case 3: total += 100
        case 4: total += 1000
        default: break
        }
    }
}

print(total)