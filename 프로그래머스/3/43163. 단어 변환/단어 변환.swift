import Foundation

struct Queue<T> {
    private var queue: [T] = []
    
    var count: Int { return queue.count }
    var isEmpty: Bool { return queue.isEmpty }
    mutating func push(_ e: T)  { queue.append(e) }
    mutating func pop() -> T? { return queue.isEmpty ? nil : queue.removeFirst() }
}

// 시작하는 단어에서 바꿀 수 있는 단어 중
// 타겟과 가까운 단어로 변경해야 됨
func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    guard words.contains(target), begin != target else { return 0 }
    
    // 2차원 배열로 만들어서 갈 수 있는지 확인
    // 갈 수 없다면 배제
    var queue = Queue<(String, Int)>()
    queue.push((begin, 0))

    while !queue.isEmpty {
        guard let (curWord, curDepth) = queue.pop() else { return -1 }
        
        if curWord == target { return curDepth }

        for word in words {
            if possible(curWord, word) { 
                queue.push((word, curDepth + 1)) 
            }
        }
    }
    
    return -1
}

func possible(_ word: String, _ target: String) -> Bool {
    if word == target { return false }
    
    let wordArr = Array(word)
    let targetArr = Array(target)
    var count = 0
    
    for i in 0..<wordArr.count {
        if wordArr[i] != targetArr[i] { count += 1 }
    }
    
    return count == 1 ? true : false
}