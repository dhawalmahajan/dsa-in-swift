/*
 *Given an undirected graph with V vertices and E edges, represented as a 2D vector edges[][], where each entry edges[i] = [u, v] denotes an edge between vertices u and v, determine whether the graph contains a cycle or not.

Note: The graph can have multiple component.
 
Input: V = 4, E = 4, edges[][] = [[0, 1], [0, 2], [1, 2], [2, 3]]
Output: true
Explanation: 1 -> 2 -> 0 -> 1 is a cycle.

Input: V = 4, E = 3, edges[][] = [[0, 1], [1, 2], [2, 3]]
Output: false
Explanation: No cycle in the graph.

Constraints:
1 ≤ V, E ≤ 10^5
0 ≤ edges[i][0], edges[i][1] < V


 */
//MARK: DFS Method

private func cycleDetect(_ node: Int, _ parent: Int, adj: [[Int]], visited: inout [Bool]) -> Bool {
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

private func isCycleUsingDFS(_ v: Int, _ adj: [[Int]]) -> Bool {
  var visited: [Bool] = Array(repeating: false, count: v)
  for i in 0..<v {
    if !visited[i] && cycleDetect(i, -1, adj: adj, visited: &visited) {
      return true
    }
  }
  return false
}

func detectCycleDemoUsingDFS() {
  // Data Setup
  let nodeCount = 4
  let adj = [
    [1, 2],  // Neighbors of node 0
    [0, 2],  // Neighbors of node 1 (Cycle here: 0-1-2-0)
    [0, 1, 3],  // Neighbors of node 2
    [2],  // Neighbors of node 3
  ]
  let result = isCycleUsingDFS(nodeCount, adj)
  if result == true {
    print("Cycle detected")
  } else {
    print("Cycle not detected")
  }
}

//MARK: BFS Method
private func isCycleUsingBFS(_ v: Int, _ adj: [[Int]]) -> Bool {
  var visited: [Bool] = Array(repeating: false, count: v)
  for i in 0..<v {
    if !visited[i] && detectCycle(vertex: i, adj: adj, visited: &visited) {
      return true
    }
  }
  return false
}

private func detectCycle(vertex: Int, adj: [[Int]], visited: inout [Bool]) -> Bool {
  var queue: [(Int, Int)] = []
  visited[vertex] = true
  queue.append((vertex, -1))
  while !queue.isEmpty {
    let (node, parent) = queue.removeFirst()
    for neighbour in adj[node] {
      if parent == neighbour {
        continue
      }
      if visited[neighbour] == true {
        return true
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
    [1, 2],  // Neighbors of node 0
    [0, 2],  // Neighbors of node 1 (Cycle here: 0-1-2-0)
    [0, 1, 3],  // Neighbors of node 2
    [2],  // Neighbors of node 3
  ]
  let result = isCycleUsingBFS(nodeCount, adj)
  if result == true {
    print("Cycle detected")
  } else {
    print("Cycle not detected")
  }
}
func detectCycleInUndirectedGraphDemo() {
    detectCycleUsingBFS()
    detectCycleDemoUsingDFS()
}
