import Foundation

func solution(_ s:String) -> Int {
    var stack: [String] = []
    var result: [String] = []
    
    let nums: [String: Int] = ["zero": 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9]
    
    for ch in s {
        let str = String(ch)
        if "0" <= ch && ch <= "9" { result.append(str) }
        else {
            stack.append(str)
            let curStr = String(stack.joined())
            if let curNum = nums[curStr] {
                result.append(String(curNum))
                stack.removeAll()
            }
        }
    }
    
    return Int(result.joined())!
}