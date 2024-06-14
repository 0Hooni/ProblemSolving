import Foundation

func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var result = [Int]()
    for query in queries {
        var currentMin = -1
        for i in query[0]...query[1] {
            if query[2] < arr[i]  {
                if currentMin == -1 {
                    currentMin = arr[i]
                } else {
                    currentMin = min(currentMin, arr[i])
                }
            }
        }
        result.append(currentMin)
    }
    return result
}
