import Foundation

extension Int {
    func toBinary() -> String {
        return String(self, radix: 2)
    }
}

func sameOneTwo(_ n1: String, _ n2: String) -> Bool {
    let n1Count = n1.filter { $0 == "1"}.count
    let n2Count = n2.filter { $0 == "1"}.count
    
    return (n1Count == n2Count) 
}

func solution(_ n:Int) -> Int {
    var answer:Int = 0
    
    // 2진수로 1의 갯수가 같은 다음 수
    // 그 중 작은 수
    let binary = n.toBinary()
    answer = n + 1
    while !sameOneTwo(binary, answer.toBinary()) {
        answer += 1
    }
    
    return answer
}