import Foundation

extension Graph {
  /// Print the graph's adjacency list
  func printGraph() {
    for (vertex, edges) in adjacencyList {
      let edgeDescriptions = edges.map { "\($0.vertex)(weight: \($0.weight))" }
      print("\(vertex) -> [\(edgeDescriptions.joined(separator: ", "))]")
    }
  }
}
// MARK: - Basic Operations
extension Graph {
  /// Add a vertex to the graph
  func addVertex(_ vertex: T) {
    if adjacencyList[vertex] == nil {
      adjacencyList[vertex] = []
    }
  }

  /// Add an edge between two vertices
  func addEdge(from source: T, to destination: T, weight: Int = 1) {
    addVertex(source)
    addVertex(destination)

    adjacencyList[source]?.append((destination, weight))

    if !isDirected {
      adjacencyList[destination]?.append((source, weight))
    }
  }

  /// Remove a vertex from the graph
  func removeVertex(_ vertex: T) {
    adjacencyList[vertex] = nil

    for key in adjacencyList.keys {
      adjacencyList[key] = adjacencyList[key]?.filter { $0.vertex != vertex }
    }
  }

  /// Remove an edge between two vertices
  func removeEdge(from source: T, to destination: T) {
    adjacencyList[source] = adjacencyList[source]?.filter { $0.vertex != destination }

    if !isDirected {
      adjacencyList[destination] = adjacencyList[destination]?.filter { $0.vertex != source }
    }
  }

  /// Get all vertices in the graph
  func getAllVertices() -> [T] {
    return Array(adjacencyList.keys)
  }

  /// Get neighbors of a vertex
  func getNeighbors(of vertex: T) -> [(vertex: T, weight: Int)]? {
    return adjacencyList[vertex]
  }

  /// Check if edge exists
  func hasEdge(from source: T, to destination: T) -> Bool {
    return adjacencyList[source]?.contains(where: { $0.vertex == destination }) ?? false
  }

  /// Get number of vertices
  func vertexCount() -> Int {
    return adjacencyList.count
  }

  /// Get number of edges
  func edgeCount() -> Int {
    let total = adjacencyList.values.reduce(0) { $0 + $1.count }
    return isDirected ? total : total / 2
  }

}
// MARK: - Graph Traversals
extension Graph where T: Hashable {

  /// Breadth-First Search (BFS)
  func bfs(start: T) -> [T] {
    var visited: Set<T> = []
    var queue: [T] = [start]
    var result: [T] = []

    while !queue.isEmpty {
      let vertex = queue.removeFirst()

      if !visited.contains(vertex) {
        visited.insert(vertex)
        result.append(vertex)

        if let neighbors = adjacencyList[vertex] {
          for neighbor in neighbors {
            if !visited.contains(neighbor.vertex) {
              queue.append(neighbor.vertex)
            }
          }
        }
      }
    }

    return result
  }
  /// Depth-First Search (DFS) - Iterative
  func dfs(start: T) -> [T] {
    var visited: Set<T> = []
    var stack: [T] = [start]
    var result: [T] = []

    while !stack.isEmpty {
      let vertex = stack.removeLast()

      if !visited.contains(vertex) {
        visited.insert(vertex)
        result.append(vertex)

        if let neighbors = adjacencyList[vertex] {
          for neighbor in neighbors.reversed() {
            if !visited.contains(neighbor.vertex) {
              stack.append(neighbor.vertex)
            }
          }
        }
      }
    }

    return result
  }

  /// Depth-First Search (DFS) - Recursive
  func dfsRecursive(start: T) -> [T] {
    var visited: Set<T> = []
    var result: [T] = []
    dfsHelper(vertex: start, visited: &visited, result: &result)
    return result
  }

  private func dfsHelper(vertex: T, visited: inout Set<T>, result: inout [T]) {
    visited.insert(vertex)
    result.append(vertex)

    if let neighbors = adjacencyList[vertex] {
      for neighbor in neighbors {
        if !visited.contains(neighbor.vertex) {
          dfsHelper(vertex: neighbor.vertex, visited: &visited, result: &result)
        }
      }
    }
  }

}
// MARK: - Cycle Detection
extension Graph where T: Hashable {
  func hasCycleHelper(vertex: T, parent: T?, visited: inout Set<T>) -> Bool {
    visited.insert(vertex)

    if let neighbors = adjacencyList[vertex] {
      for neighbor in neighbors {
        if !visited.contains(neighbor.vertex) {
          if hasCycleHelper(vertex: neighbor.vertex, parent: vertex, visited: &visited) {
            return true
          }
        } else if neighbor.vertex != parent {
          return true
        }
      }
    }
    return false
  }

  /// Detect if graph has a cycle (for undirected graphs)
  func hasCycleUndirected() -> Bool {
    var visited: Set<T> = []

    for vertex in adjacencyList.keys {
      if !visited.contains(vertex) {
        if hasCycleHelper(vertex: vertex, parent: nil, visited: &visited) {
          return true
        }
      }
    }
    return false
  }

  /// Detect if directed graph has a cycle
  func hasCycleDirected() -> Bool {
    var visited: Set<T> = []
    var recursionStack: Set<T> = []

    for vertex in adjacencyList.keys {
      if !visited.contains(vertex) {
        if hasCycleDirectedHelper(
          vertex: vertex, visited: &visited, recursionStack: &recursionStack)
        {
          return true
        }
      }
    }
    return false
  }

  func hasCycleDirectedHelper(
    vertex: T, visited: inout Set<T>, recursionStack: inout Set<T>
  ) -> Bool {
    visited.insert(vertex)
    recursionStack.insert(vertex)

    if let neighbors = adjacencyList[vertex] {
      for neighbor in neighbors {
        if !visited.contains(neighbor.vertex) {
          if hasCycleDirectedHelper(
            vertex: neighbor.vertex, visited: &visited, recursionStack: &recursionStack)
          {
            return true
          }
        } else if recursionStack.contains(neighbor.vertex) {
          return true
        }
      }
    }

    recursionStack.remove(vertex)
    return false
  }
}
// MARK: - Connectivity
extension Graph {
  /// Check if graph is connected (for undirected graphs)
  func isConnected() -> Bool {
    guard let start = adjacencyList.keys.first else { return true }
    let visited = bfs(start: start)
    return visited.count == adjacencyList.count
  }

  /// Find all connected components
  func connectedComponents() -> [[T]] {
    var visited: Set<T> = []
    var components: [[T]] = []

    for vertex in adjacencyList.keys {
      if !visited.contains(vertex) {
        let component = bfs(start: vertex)
        visited.formUnion(component)
        components.append(component)
      }
    }

    return components
  }

}

// MARK: - Topological Sort (for DAG - Directed Acyclic Graph)
extension Graph {
  /// Topological Sort using DFS
  func topologicalSort() -> [T]? {
    if hasCycleDirected() {
      return nil
    }

    var visited: Set<T> = []
    var stack: [T] = []

    for vertex in adjacencyList.keys {
      if !visited.contains(vertex) {
        topologicalSortHelper(vertex: vertex, visited: &visited, stack: &stack)
      }
    }

    return stack.reversed()
  }

  func topologicalSortHelper(vertex: T, visited: inout Set<T>, stack: inout [T]) {
    visited.insert(vertex)

    if let neighbors = adjacencyList[vertex] {
      for neighbor in neighbors {
        if !visited.contains(neighbor.vertex) {
          topologicalSortHelper(vertex: neighbor.vertex, visited: &visited, stack: &stack)
        }
      }
    }

    stack.append(vertex)
  }
}
// MARK: - Shortest Path Algorithms
extension Graph {
  /// Dijkstra's Algorithm - Find shortest path from source to all vertices
  func dijkstra(source: T) -> [T: Int] {
    var distances: [T: Int] = [:]
    var visited: Set<T> = []

    for vertex in adjacencyList.keys {
      distances[vertex] = Int.max
    }
    distances[source] = 0

    while visited.count < adjacencyList.count {
      guard
        let current =
          distances
          .filter({ !visited.contains($0.key) })
          .min(by: { $0.value < $1.value })?.key
      else {
        break
      }

      visited.insert(current)

      if let neighbors = adjacencyList[current] {
        for neighbor in neighbors {
          let newDistance = distances[current]! + neighbor.weight
          if newDistance < distances[neighbor.vertex]! {
            distances[neighbor.vertex] = newDistance
          }
        }
      }
    }

    return distances
  }

  /// Bellman-Ford Algorithm - Handles negative weights
  func bellmanFord(source: T) -> [T: Int]? {
    var distances: [T: Int] = [:]

    for vertex in adjacencyList.keys {
      distances[vertex] = Int.max
    }
    distances[source] = 0

    for _ in 0..<adjacencyList.count - 1 {
      for (vertex, neighbors) in adjacencyList {
        guard distances[vertex] != Int.max else { continue }

        for neighbor in neighbors {
          let newDistance = distances[vertex]! + neighbor.weight
          if newDistance < distances[neighbor.vertex]! {
            distances[neighbor.vertex] = newDistance
          }
        }
      }
    }

    // Check for negative cycles
    for (vertex, neighbors) in adjacencyList {
      guard distances[vertex] != Int.max else { continue }

      for neighbor in neighbors {
        if distances[vertex]! + neighbor.weight < distances[neighbor.vertex]! {
          return nil  // Negative cycle detected
        }
      }
    }

    return distances
  }

  // MARK: - Minimum Spanning Tree

  /// Kruskal's Algorithm - Find MST
  func kruskalMST() -> [(from: T, to: T, weight: Int)] {
    var edges: [Edge<T>] = []
    var result: [(from: T, to: T, weight: Int)] = []

    // Collect all edges
    for (vertex, neighbors) in adjacencyList {
      for neighbor in neighbors {
        edges.append(Edge(from: vertex, to: neighbor.vertex, weight: neighbor.weight))
      }
    }

    // Sort edges by weight
    edges.sort { $0.weight < $1.weight }

    var parent: [T: T] = [:]
    var rank: [T: Int] = [:]

    // Initialize disjoint set
    for vertex in adjacencyList.keys {
      parent[vertex] = vertex
      rank[vertex] = 0
    }

    func find(_ vertex: T) -> T {
      if parent[vertex] != vertex {
        parent[vertex] = find(parent[vertex]!)
      }
      return parent[vertex]!
    }

    func union(_ x: T, _ y: T) {
      let rootX = find(x)
      let rootY = find(y)

      if rootX != rootY {
        if rank[rootX]! < rank[rootY]! {
          parent[rootX] = rootY
        } else if rank[rootX]! > rank[rootY]! {
          parent[rootY] = rootX
        } else {
          parent[rootY] = rootX
          rank[rootX]! += 1
        }
      }
    }

    for edge in edges {
      let x = find(edge.from)
      let y = find(edge.to)

      if x != y {
        result.append((edge.from, edge.to, edge.weight))
        union(x, y)
      }
    }

    return result
  }
}
