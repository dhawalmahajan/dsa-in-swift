private func detectCycleUsingDFS(node: Int, parent: Int, adj: [[Int]], visited: inout [Bool]) -> Bool {
    visited[node] = true
    for neighbour in adj[node] {
        if parent == neighbour {
            continue
        }
        if visited[neighbour] == true {
            return true
        }
        if detectCycle(node: neighbour, parent: node, adj: adj, visited: &visited) == true {
            return true
        }
    }
    return false
}

private func isCycleUsingBFS(_v: Int, adj: [[Int]]) -> Bool {
    var visited:[Bool] = Array(repeating: false, count: v)
    for i in 0..<v {
        if !visited[i] {
            if detectCycle(startNode: i, adj: adj, visited: &visited) {
                return true
            }
        }
    }
    return false
}

private func detectCycle(adj:  [[Int]],inout visited: [Bool]) -> Bool {
    
    var queue:[(Int, Int)] = []
    visited[0] = true
    queue.append((0,-1))
    while !queue.isEmpty {
        let (node,parent) = queue.removeFirst() 
        
    }
}

func detectCycleDemoUsingDFS() {
        // Data Setup
    let nodeCount = 4
    let adj = [
        [1, 2],    // Neighbors of node 0
        [0, 2],    // Neighbors of node 1 (Cycle here: 0-1-2-0)
        [0, 1, 3], // Neighbors of node 2
        [2]        // Neighbors of node 3
    ]

    var visited = Array(repeating: false, count: nodeCount)
    for i in 0..<nodeCount {
        if !visited[i] && detectCycleUsingDFS(node: i, parent: -1, adj: adj, visited: &visited){
            print("Cycle detected") // Should print true
        } else {
            print("Cycle not detected") // Should print true
        }
    }

}