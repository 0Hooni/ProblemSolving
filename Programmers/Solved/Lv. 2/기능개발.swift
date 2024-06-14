import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var remain: [Int] = []
    var release: [Int] = []
    
    for i in 0..<progresses.count {
        let curPro = progresses[i]
        let curSpeed = speeds[i]
        let remainPro = 100 - curPro
        
        var remainDay = (remainPro % curSpeed) == 0 ?
        remainPro/curSpeed :
        remainPro/curSpeed + 1
        
        remain.append(remainDay)
    }
    
    var maxRemain = remain[0]
    var count = 0
    for r in remain {
        if r > maxRemain {
            release.append(count)
            count = 1
            maxRemain = r
        } else {
            count += 1
        }
    }
    
    if count != 0 {
        release.append(count)
    }
    
    return release
}
