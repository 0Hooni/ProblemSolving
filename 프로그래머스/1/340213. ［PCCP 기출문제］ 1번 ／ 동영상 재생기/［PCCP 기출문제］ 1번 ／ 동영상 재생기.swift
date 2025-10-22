import Foundation

func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    let maxSec = toSec(video_len)
    var curSec = toSec(pos)
    let opStart = toSec(op_start)
    let opEnd = toSec(op_end)
    
    // 시작 시점이 오프닝이면 즉시 건너뛰기
    if curSec >= opStart && curSec <= opEnd { curSec = opEnd }
    
    for cmd in commands {
        curSec += (cmd == "next") ? 10 : -10
        
        // 경계를 벗어나는 경우 처리
        curSec = max(0, min(curSec, maxSec))
        
        // 매 스텝마다 오프닝이면 즉시 건너뛰기
        if curSec >= opStart && curSec <= opEnd { curSec = opEnd }
    }
    
    return toTime(curSec)
}

func toSec(_ mmss: String) -> Int {
    let parts = mmss.split(separator: ":").map { Int($0)! }
    return parts[0] * 60 + parts[1]
}

func toTime(_ sec: Int) -> String {
    let m = sec / 60, s = sec % 60
    return String(format: "%02d:%02d", m, s)
}