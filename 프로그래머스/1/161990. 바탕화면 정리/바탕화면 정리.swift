import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    // 주어진 파일중에 x가 제일 짧은곳, 
    // y가 제일 짧은곳
    // x가 제일 긴곳
    // y가 제일 긴곳
    var minX = Int.max
    var minY = Int.max
    var maxX = Int.min
    var maxY = Int.min
    
    let wallpaper = wallpaper.map { Array($0).map { String($0) } }
    
    for (x, row) in wallpaper.enumerated() {
        for (y, col) in row.enumerated() {
            if wallpaper[x][y] == "#" {
                minX = min(minX, x)
                minY = min(minY, y)
                maxX = max(maxX, x + 1)
                maxY = max(maxY, y + 1)
            }
        }
    }
    return [minX, minY, maxX, maxY]
}