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