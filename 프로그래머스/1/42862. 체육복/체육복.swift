import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var lostSet = Set(lost)
    var reserveSet = Set(reserve)
    
    let realLost = lostSet.subtracting(reserveSet)     // 진짜 잃어버린 사람
    let realReserve = reserveSet.subtracting(lostSet)  // 진짜 빌려줄 수 있는 사람
    
    var lost = Array(realLost).sorted()
    var reserve = Array(realReserve).sorted()
    
    print("찐 잃어버림:", lost, "찐 빌려주기 가능:", reserve)
    
    // 전체 학생 - 더이상 빌릴 사람이 없는 잃어버린 학생
    var helpme: [Int] = []
    while !lost.isEmpty {
        let curLost = lost.removeFirst()
        
        if reserve.contains(curLost - 1), let idx = reserve.firstIndex(of: curLost - 1) {
            reserve.remove(at: idx)
        } else if reserve.contains(curLost + 1), let idx = reserve.firstIndex(of: curLost + 1) {
            reserve.remove(at: idx)
        } else {
            helpme.append(curLost)
        }
    }
    
    print(helpme)
    
    return n - helpme.count
}