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

 