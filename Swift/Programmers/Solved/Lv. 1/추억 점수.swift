import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var result = [Int]()
    for album in photo {
        var score = 0
        for i in 0..<name.count {
            if album.contains(name[i]) {
                score += yearning[i]
            }
        }
        result.append(score)
    }
    
    return result
}
