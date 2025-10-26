import Foundation

struct Process: Equatable {
    static func == (_ lhs: Process, _ rhs: Process) -> Bool {
        return lhs.name == rhs.name
    }
    
    let name: String
    let priority: Int
}

func calculateASCII(_ str1: String, _ idx: Int) -> String {
    let scalar = Int(UnicodeScalar(str1)!.value)
    let newScalar = scalar + idx
    return String(UnicodeScalar(newScalar)!)
}

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var processes: [Process] = []
    
    for (idx, priority) in priorities.enumerated() {
        let curProcess = Process(name: calculateASCII("A", idx), priority: priority)
        processes.append(curProcess)
    }
    
    let target: Process = processes[location]
    
    var step: Int = 0
    
    while !processes.isEmpty {
        let maxProcess = processes.max { $0.priority < $1.priority }
        let maxIndex = processes.firstIndex { $0 == maxProcess }!
        processes = Array(processes[(maxIndex + 1)..<processes.count] + processes[0..<maxIndex])
        print(processes)
        step += 1
        
        if maxProcess == target { return step }
    }
    
    return step
}