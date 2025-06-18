class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        nums = [Int](Set(nums)).sorted()

        return nums.count
    }
}