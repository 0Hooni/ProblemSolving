import Foundation

func solution(_ p:String) -> String {
    return dfs(p)
}

func dfs(_ w: String) -> String {
    if w == "" { return "" }
    
    var (u, v) = devideBalandedString(w)
    
    if isRightString(u) { return u + dfs(v) }
    else {
        var empty = "(" + dfs(v) + ")"
        u.removeFirst()
        u.removeLast()
        u = swap(u)
        empty += u
        return empty
    }
}

func swap(_ p: String) -> String {
    var stack: [String] = []
    let p = Array(p).map { String($0) }
    
    for _p in p {
        if _p == ")" { stack.append("(") }
        else { stack.append(")") }
    }
    
    return stack.joined()
}

func isRightString(_ p: String) -> Bool {
    var stack: [String] = []
    
    for str in p {
        if str == "(" { stack.append(String(str)) }
        else {
            if stack.isEmpty { return false }
            else { stack.removeLast() }
        }
    }
    
    return stack.isEmpty
}

func devideBalandedString(_ p: String) -> (String, String) {
    let p = Array(p).map { String($0) }
    
    var openStr = 0
    var closedStr = 0
    for (idx, str) in p.enumerated() {
        if str == "(" { openStr += 1}
        else { closedStr += 1}
        
        if openStr == closedStr {
            return (
                p[0...idx].map { String($0) }.joined(), 
                p[(idx+1)..<p.count].map { String($0) }.joined()
            )
        }
    }
    
    return ("", "")
}