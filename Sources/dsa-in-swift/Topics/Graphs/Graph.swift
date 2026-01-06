final class Graph<T: Hashable> {
  private var adj: [T: [T]] = [:]

  func addEdge(_ u: T, _ v: T) {
    adj[u, default: []].append(v)
    adj[v, default: []].append(u)
  }

  func bfs(from start: T) -> [T] {
    var visited = Set<T>()
    var queue = [start]
    var result: [T] = []

    visited.insert(start)

    while !queue.isEmpty {
      let node = queue.removeFirst()
      result.append(node)

      for neighbor in adj[node] ?? [] where !visited.contains(neighbor) {
        visited.insert(neighbor)
        queue.append(neighbor)
      }
    }
    return result
  }

  func dfs(from start: T) -> [T] {
    var visited = Set<T>()
    var result: [T] = []

    func dfsHelper(_ node: T) {
      visited.insert(node)
      result.append(node)
      for neighbor in adj[node] ?? [] where !visited.contains(neighbor) {
        dfsHelper(neighbor)
      }
    }

    dfsHelper(start)
    return result
  }
}
