import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    // 갈색 + 노랑 = 넓이
    // 넓이의 약수 페어로 가능한 갈색, 노랑 영역?
    // 갈색은 항상 마지막 한줄 = (가로 + 세로) * 2 - 4

    let size: Int = brown + yellow
    
    for h in 1...(size/2) {
        if size % h == 0 {
            let w:Int = size/h
            if ((h + w) * 2 - 4) == brown {
                return [w, h]
            }
        } else { continue }
    }
    
    return []
}