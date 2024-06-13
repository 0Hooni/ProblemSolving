import Foundation

func solution(_ array:[Int]) -> Int {
    var arr = array
    arr.sort()
    return arr[arr.count/2]
}
