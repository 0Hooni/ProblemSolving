func solution(_ s:String) -> String {
    var curIdx = 0
    var result = ""
    
    for ch in s {
        if ch == " " { curIdx = 0; result += " "; continue }
        
        if curIdx % 2 == 0 { result += String(ch).uppercased() } 
        else { result += String(ch).lowercased() }
        curIdx += 1
    }
    
    return result
}