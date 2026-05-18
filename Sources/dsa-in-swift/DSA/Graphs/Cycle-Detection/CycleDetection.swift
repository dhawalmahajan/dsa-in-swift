// MARK: - Graph Cycle Detection in Swift
// MARK: - Cycle Detection in Undirected Graph using BFS

func isCyclicBFS(src: Int, visited: inout [Int: Bool], adj: [Int: [Int]]) -> Bool {
  var parent: [Int: Int] = [:]
  parent[src] = -1
  visited[src] = true

  var queue: [Int] = [src]
  while !queue.isEmpty {
    let front = queue.removeFirst()
    if let neighbors = adj[front] {
      for nbr in neighbors {
        if visited[nbr] == true && nbr != parent[front] {
          return true
        } else if visited[nbr] != true {
          queue.append(nbr)
          visited[nbr] = true
          parent[nbr] = front
        }
      }
    }
  }
  return false
}
// MARK: - Cycle Detection in Directed Graph using DFS
func isCyclicDFS(
  node: Int, visited: inout [Int: Bool], dfsVisited: inout [Int: Bool], adj: [Int: [Int]]
)
  -> Bool
{
  visited[node] = true
  dfsVisited[node] = true
  if let neighbours = adj[node] {
    for nbr in neighbours {
      if visited[nbr] != true {
        let cycle = isCyclicDFS(
          node: nbr, visited: &visited, dfsVisited: &dfsVisited, adj: adj)
        if cycle {
          return true
        }
      } else if dfsVisited[nbr] == true {
        return true
      }
    }
  }
  dfsVisited[node] = false
  return false
}
// MARK: - Detect Cycle in Directed Graph
func detectCycleInDirectedGraph(n: Int, edges: [(Int, Int)]) -> Bool {
  //Build adjacency list
  var adj: [Int: [Int]] = [:]
  for edge in edges {
    let u = edge.0
    let v = edge.1
    adj[u, default: []].append(v)
  }
  //Handle disconnected components
  var visited: [Int: Bool] = [:]
  var dfsVisited: [Int: Bool] = [:]

  for i in 1...n {
    if visited[i] != true {
      let cycle = isCyclicDFS(node: i, visited: &visited, dfsVisited: &dfsVisited, adj: adj)
      if cycle {
        return true
      }
    }
  }
  return false
}

// MARK: - Detect Cycle in Undirected Graph
func cycleDetection(edges: [[Int]], n: Int, m: Int) -> String {
  // Build adjacency list for undirected graph
  var adj: [Int: [Int]] = [:]
  for i in 0..<m {
    let u = edges[i][0]
    let v = edges[i][1]
    adj[u, default: []].append(v)
    adj[v, default: []].append(u)
  }
  var visited: [Int: Bool] = [:]

  for i in 0..<n {
    if visited[i] != true {
      let ans = isCyclicBFS(src: i, visited: &visited, adj: adj)
      if ans {
        return "Yes"
      }
    }
  }
  return "No"
}
// MARK: - Example Usage
func runCycleDetectionExamples() {
  print("=== CYCLE DETECTION IN GRAPHS ===\n")

  // Example 1: Undirected Graph
  print("--- Undirected Graph ---")
  let undirectedEdges: [[Int]] = [
    [0, 1], [1, 2], [2, 3],
    [3, 4], [4, 1], [2, 4],
  ]

  let undirectedResult = cycleDetection(
    edges: undirectedEdges,
    n: 5,
    m: 6
  )
  print("Cycle in undirected graph: \(undirectedResult)")

  // Example 2: Directed Graph
  print("\n--- Directed Graph ---")
  let directedEdges: [(Int, Int)] = [
    (0, 1), (1, 2), (2, 3),
    (3, 4), (4, 1), (2, 4),
  ]

  let directedResult = detectCycleInDirectedGraph(
    n: 5,
    edges: directedEdges
  )
  print("Cycle in directed graph: \(directedResult)")

  // Example 3: Undirected Graph without Cycle
  print("\n--- Undirected Graph (No Cycle) ---")
  let noCycleEdges: [[Int]] = [
    [0, 1], [1, 2], [2, 3], [3, 4],
  ]

  let noCycleResult = cycleDetection(
    edges: noCycleEdges,
    n: 5,
    m: 4
  )
  print("Cycle in undirected graph: \(noCycleResult)")

  // Example 4: Directed Graph without Cycle (DAG)
  print("\n--- Directed Graph (No Cycle - DAG) ---")
  let dagEdges: [(Int, Int)] = [
    (1, 2), (2, 3), (3, 4), (1, 5),
  ]

  let dagResult = detectCycleInDirectedGraph(
    n: 5,
    edges: dagEdges
  )
  print("Cycle in directed graph: \(dagResult)")

  // Example 5: Disconnected Graph with Cycle
  print("\n--- Disconnected Graph with Cycle ---")
  let disconnectedEdges: [[Int]] = [
    [0, 1], [1, 2], [2, 0],  // Component 1 with cycle
    [3, 4],  // Component 2 without cycle
  ]

  let disconnectedResult = cycleDetection(
    edges: disconnectedEdges,
    n: 5,
    m: 4
  )
  print("Cycle in disconnected graph: \(disconnectedResult)")
}
