import Foundation

func treeSize(_ start: Int, n: Int, tree: [Int: [Int]]) -> Int {
    var queue: [Int] = [start]
    var visit: [Bool] = Array(repeating: false, count: n + 1)
    var size = 0

    while !queue.isEmpty {
        let cur = queue.removeFirst()
        visit[cur] = true
        size += 1
        
        guard let children = tree[cur] else { return size }
        
        for child in children {
            if !visit[child] { queue.append(child) }
        }
    }

    return size
}

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var tree = [Int: [Int]]()
    var edge: [(Int, Int)] = []
    
    for wire in wires {
        let v1 = wire[0]
        let v2 = wire[1]
        
        if tree[v1] == nil { tree[v1] = [v2] }
        else { tree[v1]!.append(v2) }
        
        if tree[v2] == nil { tree[v2] = [v1] }
        else { tree[v2]!.append(v1) }
        
        edge.append((v1, v2))
    }
    
    var net1 = 101
    var net2 = 0
    
    for (v1, v2) in edge {
        var temp: [Int: [Int]] = tree
        
        temp[v1] = tree[v1]!.filter({ $0 != v2 })
        temp[v2] = tree[v2]!.filter({ $0 != v1 })
        
        let tree1Size = treeSize(v1, n: n, tree: temp)
        let tree2Size = treeSize(v2, n: n, tree: temp)
        
        if abs(net1 - net2) > abs(tree1Size - tree2Size) { 
            net1 = tree1Size
            net2 = tree2Size
        }
    }
    
    return abs(net1 - net2)
}