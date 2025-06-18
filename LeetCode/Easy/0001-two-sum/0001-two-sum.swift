class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        for (i, num1) in nums.enumerated() {
            for j in (i + 1)..<nums.count {
                if num1 + nums[j] == target {
                    return [i, j]
                }
            }
        }

        return []
    }
}