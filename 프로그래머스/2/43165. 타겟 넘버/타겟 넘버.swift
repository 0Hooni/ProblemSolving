import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0

    func dfs(_ numbers: [Int], _ sum: Int, _ isMinus: Bool) {
        var numbers = numbers
        let cur = numbers.removeFirst()
        var sum = sum + (isMinus ? -cur : cur)

        // 마지막 노드에 오면 sum을 비교
        if numbers.isEmpty {
            if sum == target { result += 1 }
        } else {    // 마지막이 아니면 (+, -)로 나눠짐
            dfs(numbers, sum, true)
            dfs(numbers, sum, false)
        }
    }
    
    dfs(numbers, 0, true)
    dfs(numbers, 0, false)
    
    return result
}
