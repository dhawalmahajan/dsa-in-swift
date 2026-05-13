//MARK: DFS Method

private func cycleDetect(_ node: Int,_ parent: Int, adj: [[Int]], visited: inout [Bool]) -> Bool {
    visited[node] = true
    for neighbour in adj[node] {
        if parent == neighbour {
            continue
        }
        if visited[neighbour] == true {
            return true
        }
        if cycleDetect(neighbour, node, adj: adj, visited: &visited) == true {
            return true
        }
    }
    return false
}

private func isCycleUsingDFS(_v: Int,_ adj: [[Int]]) -> Bool {
    var visited:[Bool] = Array(repeating: false, count: v)
    for i in 0..<v {
        if !visited[i] && cycleDetect(i, -1, adj: adj, visited: &visited){
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
    let result = isCycleUsingDFS(nodeCount, adj)
    if result == true {
        print("Cycle detected")
    } else {
        print("Cycle not detected")
    }
}

//MARK: BFS Method
private func isCycleUsingBFS(_ v: Int,_ adj: [[Int]]) -> Bool {
    var visited:[Bool] = Array(repeating: false, count: v)
    for i in 0..<v {
        if !visited[i] && detectCycle(vertex: i, adj: adj, visited: &visited) {
            return true
        }
    }
    return false
}

private func detectCycle(vertex: Int, adj: [[Int]], visited:inout [Bool]) -> Bool {
    var queue:[(Int, Int)] = []
    visited[vertex] = true
    queue.append((vertex,-1))
    while !queue.isEmpty {
        let (node,parent) = queue.removeFirst() 
        for neighbour in adj[node] {
            if parent == neighbour {
                continue
            }
            if (visited[neighbour] == true) {
                returnreturn true
            }
            visited[neighbour] = true
            queue.append((neighbour, node))
        }
    }
    return false
}

func detectCycleUsingBFS() {
    let nodeCount = 4
    let adj = [
        [1, 2],    // Neighbors of node 0
        [0, 2],    // Neighbors of node 1 (Cycle here: 0-1-2-0)
        [0, 1, 3], // Neighbors of node 2
        [2]        // Neighbors of node 3
    ]
    let result = isCycleUsingBFS(nodeCount, adj)
    if result == true {
        print("Cycle detected")
    } else {
        print("Cycle not detected")
    }
}
