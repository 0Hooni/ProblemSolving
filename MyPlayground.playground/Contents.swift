import Foundation

var anyArr = [1, 1, 2, 2, 3, 3, 3]

var uniqued = [Int](Set(anyArr))

var sorted = uniqued.sorted()
