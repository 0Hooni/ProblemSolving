import Foundation

func solution(_ s:String) -> Bool
{
    var charArr: [Character] = []
    
    for e in s {
        if e == ")" && charArr.last == "(" {
            charArr.removeLast()
        } else {
            charArr.append(e)
        }
    }
    
    return charArr.isEmpty
}
