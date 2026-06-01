/*
 *Given a connected undirected graph containing V vertices, represented by a 2-d adjacency list adj[][], where each adj[i] represents the list of vertices connected to vertex i. Perform a Breadth First Search (BFS) traversal starting from vertex 0, visiting vertices from left to right according to the given adjacency list, and return a list containing the BFS traversal of the graph.

  Note: Do traverse in the same order as they are in the given adjacency list.
Input: adj[][] = [[2, 3, 1], [0], [0, 4], [0], [2]]
Output: [0, 2, 3, 1, 4]
Explanation: Starting from 0, the BFS traversal will follow these steps: 
Visit 0 → Output: 0 
Visit 2 (first neighbor of 0) → Output: 0, 2 
Visit 3 (next neighbor of 0) → Output: 0, 2, 3 
Visit 1 (next neighbor of 0) → Output: 0, 2, 3, 1
Visit 4 (neighbor of 2) → Final Output: 0, 2, 3, 1, 4
 
Constraints:
1 ≤ V = adj.size() ≤ 104
0 ≤ adj[i][j] ≤ 104
 */
private func bfs(_ v: Int,_ adj: [[Int]]) -> [Int]{
    var q:[Int] = []
    var visited: Array<Bool> = Array(repeating: false, count: v)
    var ans: [Int] = []
    q.append(0)
    visited[0] = true
    while !q.isEmpty {
        let node = q.removeFirst()
        ans.append(node)
        for neighbour in adj[node] {
          if (!visited[neighbour]) {
            visited[neighbour] = true
            q.append(neighbour)
          }
        }
    }
  return ans
}

public func bfsDemo() {
  let ans = bfs(6,[[1, 2],    // Neighbors of 0
    [0, 3, 4], // Neighbors of 1
    [0, 5],    // Neighbors of 2
    [1],       // Neighbors of 3
    [1],[2]]       // Neighbors of 4
  )

  print(ans)
}

 
