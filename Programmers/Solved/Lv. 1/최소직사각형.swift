import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    /// 가로 세로 중 큰 폭을 가지는 것을 앞에다 정렬
    /// 정렬 후 가로 세로 최대를 구함
    var size = sizes
    var maxWidth = 0
    var maxHeight = 0
    for i in 0..<size.count {
        if size[i][0] < size[i][1] {
            size[i].swapAt(0, 1)
        }
        maxWidth = max(maxWidth, size[i][0])
        maxHeight = max(maxHeight, size[i][1])
    }
    
    
    return maxWidth * maxHeight
}
