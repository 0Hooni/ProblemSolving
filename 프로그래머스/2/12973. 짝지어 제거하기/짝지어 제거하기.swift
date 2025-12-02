import Foundation

func solution(_ s:String) -> Int{
    var strArr: [String] = Array(s).map { String($0) }
    var stack: [String] = []
    
    while !strArr.isEmpty {
        let cur: String = strArr.popLast()!
        
        if !stack.isEmpty && stack.last! == cur {
            stack.removeLast()
        } else {
            stack.append(cur)
        }
    }
    
    return stack.isEmpty ? 1 : 0
}