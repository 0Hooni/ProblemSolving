import Foundation

func solution(_ n:Int) -> [Int] {
    var arr = [Int]()
    
    for i in 1...n {
        if i%2 != 0 {
            arr.append(i)
        }
    }
    
    return (0...n).filter { $0 % 2 != 0}
}
