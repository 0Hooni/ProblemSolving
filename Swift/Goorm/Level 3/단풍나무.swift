/*
땅의 크기는 N x N
r = row
c = column
한 칸의 값이 0이면 모든 단풍이 물들었음을 의미
상하 좌우 기준 0인 곳의 수만큼 다음날 해당 칸의 단풍이 물들음
며칠 후에 단풍이 물드는지 출력
*/

let N = Int(readLine()!)!

var ground = [[Int]]()
// 공원 정보 입력
for _ in 0..<N {
	let arrInfo = readLine()!.split(separator: " ").map { Int($0)! }
	ground.append(arrInfo)
}

// 다음날 해당 칸에 몇을 뺄지 저장한 배열 추가
// 순회하고 난 뒤에 다시한번 돌면서 기존 값을 변경
// 이 때 1인 칸이 한번이라도 있다면 check를 true로 변경


let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]


var dayCount = 0

while true {
	var nextDay = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
	if ground == nextDay { break }	// 전부 0인 경우
	// 밤동안 주변 단풍이 다 물든곳의 개수를 셈
	for i in 0..<N {
		for j in 0..<N {
			for k in 0..<4 {
				let next_x = i + dx[k]
				let next_y = j + dy[k]

				if 0 <= next_x && next_x < N && 0 <= next_y && next_y < N {
					if ground[next_x][next_y] == 0 {
						nextDay[i][j] += 1
					}
				}
			}
		}
	}
	dayCount += 1
	var flag = false

	// 아침에 주변 단풍이 물든 갯수만큼 빼줌
	for i in 0..<N {
		for j in 0..<N {
			if ground[i][j] >= nextDay[i][j] {
				ground[i][j] -= nextDay[i][j]	
			} else { ground[i][j] = 0 }
			
			if ground[i][j] != 0 { flag = true }
		}
	}

	if !flag { break }
}

print(dayCount)