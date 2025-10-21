import Foundation

func solution(_ s:String) -> Int {
    var strArr = Array(s)
    
    var x = strArr[0]
    var xCount = 0
    var anotherCount = 0
    var result = [String]()
    
    for (idx, str) in strArr.enumerated() {
        if xCount == 0 {  x = str }
        if str == x { xCount += 1 }
        else { anotherCount += 1 }
        
        if xCount == anotherCount {
            result.append(String(strArr[0..<xCount*2]))
            for j in 0..<xCount*2 { strArr.removeFirst() }
            xCount = 0
            anotherCount = 0
        }
    }
    
    return strArr.isEmpty ? result.count : result.count + 1
}