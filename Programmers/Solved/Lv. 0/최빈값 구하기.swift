import Foundation

func solution(_ array:[Int]) -> Int {
    var count = [Int:Int]()
    
    for num in array {
        if count[num] == nil {
            count[num] = 1
        } else {
            count[num]! += 1
        }
    }

    var counter = 0
    var result = -1
    
    for c in count {
        if c.value == count.values.max() {
            counter += 1
            result = c.key
        }
    }
    
    return counter > 1 ? -1 : result
}
