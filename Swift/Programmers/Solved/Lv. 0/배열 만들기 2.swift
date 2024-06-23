import Foundation

func solution(_ l:Int, _ r:Int) -> [Int] {
    var result = [Int]()
//    (l...r).map
    
    for i  in l...r {
        if i%5 == 0 {
            // 10보다 작은 수일때
            if i/10 == 0 {
                result.append(i)
                continue
            }
            
            // 10보다 큰 수에서 시작할 때
            var cur = i
            while cur/10 != 0 {
                cur /= 10
                if cur%5 == 0 {
                    if cur/10 == 0 {
                        result.append(i)
                        break
                    } else {
                        continue
                    }
                } else {
                    break
                }
            }
        }
    }
    
    return result.isEmpty ? [-1]:result
}
