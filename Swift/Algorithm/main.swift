import Foundation

// 입력이 0일 때 최근 수를 지움
let size = Int(readLine()!)!
var total = [Int]()

for i in 0..<size {
    let num = Int(readLine()!)!
    if num == 0 { total.removeLast() }
    else { total.append(num) }
}

print(total.map { $0 }.reduce(0, +))
