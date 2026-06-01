/*
 *Given a connected undirected graph containing V vertices represented by a 2-d adjacency list adj[][], where each adj[i] represents the list of vertices connected to vertex i. Perform a Depth First Search (DFS) traversal starting from vertex 0, visiting vertices from left to right as per the given adjacency list, and return a list containing the DFS traversal of the graph.

Note: Do traverse in the same order as they are in the given adjacency list.

Input: adj[][] = [[2, 3, 1], [0], [0, 4], [0], [2]]

Output: [0, 2, 4, 3, 1]
Explanation: Starting from 0, the DFS traversal proceeds as follows:
Visit 0 → Output: 0 
Visit 2 (the first neighbor of 0) → Output: 0, 2 
Visit 4 (the first neighbor of 2) → Output: 0, 2, 4 
Backtrack to 2, then backtrack to 0, and visit 3 → Output: 0, 2, 4, 3 
Finally, backtrack to 0 and visit 1 → Final Output: 0, 2, 4, 3, 1

Input: adj[][] = [[1, 2], [0, 2], [0, 1, 3, 4], [2], [2]]

Output: [0, 1, 2, 3, 4]
Explanation: Starting from 0, the DFS traversal proceeds as follows: 
Visit 0 → Output: 0 
Visit 1 (the first neighbor of 0) → Output: 0, 1 
Visit 2 (the first neighbor of 1) → Output: 0, 1, 2 
Visit 3 (the first neighbor of 2) → Output: 0, 1, 2, 3 
Backtrack to 2 and visit 4 → Final Output: 0, 1, 2, 3, 4

Constraints:
1 ≤ V = adj.size() ≤ 10^4
0 ≤ adj[i][j] ≤ 10^4
 *
 * */
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

