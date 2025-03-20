import Foundation

/// numbers: 크기 2~20
/// numbers: 값 1~50
/// target: 1~1000
func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0
    
    func dfs(index: Int, sum: Int) {
        if index == numbers.count {
            if sum == target { count += 1 }
            
            return
        }

        dfs(index: index + 1, sum: sum + numbers[index])
        dfs(index: index + 1, sum: sum - numbers[index])
    }
    
    dfs(index: 0, sum: 0)
    
    return count
}
    
