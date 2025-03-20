import Foundation

func solution(_ clothes:[[String]]) -> Int {
    // 오늘 입은거 제외해서 리스트에서 입어야 됨
    var dict = [String: Int]()
    
    for cloth in clothes {
        let part = cloth[1]
        
        if dict[part] == nil { dict[part] = 1 }
        else { dict[part]! += 1 }
    }
    
    var count = 1
    
    for (key, value) in dict {
        count *= (value + 1)
    }
    
    return count - 1
}