func solution(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted {
        let str1 = Array($0)[n]
        let str2 = Array($1)[n]
        if str1 == str2 { return $0 < $1 }
        else { return str1 < str2 }
    }
}