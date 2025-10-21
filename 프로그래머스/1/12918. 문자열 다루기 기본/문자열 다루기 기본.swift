func solution(_ str:String) -> Bool {
    var isNotNum = false
    
    for ch in str {
        if "0" <= ch && ch <= "9" {}
        else { isNotNum = true }
    }
    
    return !isNotNum && (str.count == 4 || str.count == 6)
}