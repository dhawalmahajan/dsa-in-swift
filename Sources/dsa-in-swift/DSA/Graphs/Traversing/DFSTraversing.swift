
//MARK: Rescursive Approch
private func dfs(_ node: Int,_ adj: [[Int]], _ visited:inout [Bool], _ ans:inout [Int]) {
    visited[node] = true
    ans.append(node)
    for neighbour in adj[node] {
        if(!visited[neighbour]) {
            dfs(neighbour, adj, &visited, &ans)
        }
    }

}

private func dfsOfGraph(_ v: Int,_ adj: [[Int]]) -> [Int] {
    var visited = Array<Bool>(repeating: false, count: v)
    var ans:[Int] = [] 
    dfs(0, adj, &visited, &ans)
    return ans
}

//MARK: Iterative approch
private func dfsIterative(_ startNode: Int, _ v: Int,_ adj: [[Int]]) -> [Int] {
    var visited = Array<Bool>(repeating: false, count: v)
    var ans: [Int] = []
    var stack: [Int] = [startNode]


    while !stack.isEmpty {
        let node = stack.removeLast()
        if(!visited[node]) {
            visited[node] = true
            ans.append(node)

            for neighbour in adj[node] {
                if (!visited[neighbour]) {
                    stack.append(neighbour)
                }
            }
        }
    }
    return ans
}

public func dfsDemo() {
    // Number of vertices
    let v = 5 
    
    // Adjacency List: index represents the node, value is its neighbors
    // Node 0: neighbors 1, 2
    // Node 1: neighbors 0, 3, 4
    // Node 2: neighbors 0
    // Node 3: neighbors 1
    // Node 4: neighbors 1
    let adj = [
        [1, 2],    // Neighbors of 0
        [0, 3, 4], // Neighbors of 1
        [0],       // Neighbors of 2
        [1],       // Neighbors of 3
        [1]        // Neighbors of 4
    ]
    
    let result = dfsOfGraph(v,adj)
    // let result = dfsIterative(0,v,adj)
    print("DFS Traversal starting from node 0: \(result)")
}

