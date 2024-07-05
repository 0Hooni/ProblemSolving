import Foundation

let n = Int(readLine()!)!
let n2 = n*n
let target = Int(readLine()!)!
var arr = [[Int]]()

/*
n^2을 구하는 방법 찾기
달팽이 배열 만드는 방법 찾기(완탐)
*/

for i in 0..<n {
    for j in 0..<n {
        n2 - (5*i + j)
    }
}