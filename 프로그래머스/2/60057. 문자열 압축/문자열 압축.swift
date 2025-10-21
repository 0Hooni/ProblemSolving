import Foundation

func solution(_ s:String) -> Int {
    // 문자열을 1부터 n개 단위로 다 잘라본다?
    // 그걸 배열로 만든다
    // 배열에서 순차적으로 돌면서 겹치면 카운트를 들리고 제거해줌
    // 아니면 딕셔너리에 넣어줌
    // 총합을 계산해줌
    // 만약 더 작다면 결과를 바꿔줌
    
    var result = 1001
    
    for i in 1...s.count {
        var str = Array(s)
        var curSliceArr: [String] = []
        
        while !str.isEmpty {
            let size = str.count < i ? str.count : i
            
            curSliceArr.append(String(str[0..<size]))
            str.removeSubrange(0..<size)
        }
        
        var prevSlice = curSliceArr[0]
        var sliceCount = 1
        var parsedStr = ""
        for (index, curSlice) in curSliceArr.enumerated() {
            if index == 0 { continue }
            
            if curSlice == prevSlice {
                sliceCount += 1
            } else {
                parsedStr += sliceCount == 1 ? prevSlice : "\(sliceCount)\(prevSlice)"
                sliceCount = 1
                prevSlice = curSlice
            }
        }
        
        parsedStr += sliceCount == 1 ? prevSlice : "\(sliceCount)\(prevSlice)"
        
        result = min(result, parsedStr.count)
    }
    
    return result
}