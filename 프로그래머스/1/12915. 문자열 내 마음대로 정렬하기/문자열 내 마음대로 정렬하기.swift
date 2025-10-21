func solution(_ strings:[String], _ n:Int) -> [String] {
    // n번째 index의 문자를 추출
    // 해당 문자를 정렬 -> 어디 출신인지 알아야됨
    // 해당 출신지로 다시 정렬 결과 반환
    
    return strings.sorted {
        let str1 = $0[$0.index($0.startIndex, offsetBy: n)]
        let str2 = $1[$1.index($1.startIndex, offsetBy: n)]
        if str1 == str2 { return $0 < $1 }
        else { return str1 < str2 }
    }
}