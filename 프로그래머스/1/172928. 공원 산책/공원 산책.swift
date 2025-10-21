import Foundation

struct Position {
    var x: Int
    var y: Int
}

func convertToDirection(NSWE: String) -> (x: Int, y: Int) {
    switch NSWE {
        case "N": return (x: -1, y: 0)
        case "S": return (x: 1, y: 0)
        case "W": return (x: 0, y: -1)
        case "E": return (x: 0, y: 1)
        default: return (x: 0, y: 0)
    }
}

func move(
    _ park: [[String]], 
    _ route: String, 
    _ position: Position
) -> Position {
    let NSWE = route.components(separatedBy: " ")[0]
    let count = Int(route.components(separatedBy: " ")[1])!
    let direction = convertToDirection(NSWE: NSWE)
    print("direction:", direction)
    
    // 1. 현재 탐색할 경로로 가는길에 장애물이 없는지 확인
    let isSafe = checkIsSafe(park, direction, position, count)
    
    // 1-1. 없다면 해당 명령을 수행하고 위치 이동
    if isSafe { 
        return Position(
            x: position.x + direction.x * count, 
            y: position.y + direction.y * count
        ) 
    }
    // 1-2. 있다면 해당 명령을 무시하고 현위치 유지
    else { return position }
}

func checkIsSafe(
    _ park: [[String]],
    _ direction: (x: Int, y: Int), 
    _ position: Position, 
    _ count: Int
) -> Bool {
    let width = park[0].count
    let height = park.count
    
    // 범위를 벗어나면 false 반환
    if (!((0 <= position.x && position.x < height) 
          && (0 <= position.y && position.y < width))) {
        return false
    }
    
    // 장애물을 만나면 false 반환
    if park[position.x][position.y] == "X" { return false }
    
    // 장애물이 끝까지 없으면 이동이 끝났는지 확인
    // 끝나면 true
    if count == 0 { return true }
    // 안끝나면 계속    
    let nextPosition = Position(
        x: position.x + direction.x, 
        y: position.y + direction.y
    )
    
    return checkIsSafe(park, direction, nextPosition, count - 1)
}

func findStart(_ park: [[String]]) -> Position {
    for (x, row) in park.enumerated() {
        for (y, point) in row.enumerated() {
            if point == "S" { return Position(x: x, y: y) }
        }
    }
    
    return Position(x: 0, y: 0)
}

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    let park = park.map { Array($0).map { String($0) } }
    var curPosition = findStart(park)
    
    print("width:", park[0].count, "height:", park.count)
    print("start:", curPosition)
    for route in routes {
        // 2. 현재 위치를 기준으로 1번 반복
        curPosition = move(park, route, curPosition)
        print(curPosition)
    }
    
    return [curPosition.x, curPosition.y]
}