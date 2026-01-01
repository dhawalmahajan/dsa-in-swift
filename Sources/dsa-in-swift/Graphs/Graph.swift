import Foundation

func bfs(start: Int, graph: [[Int]]) {
  var visited = Array(repeating: false, count: graph.count)
  var queue = [start]
  visited[start] = true

  while !queue.isEmpty {
    let node = queue.removeFirst()
    print(node, terminator: " ")

    for neighbor in graph[node] where !visited[neighbor] {
      visited[neighbor] = true
      queue.append(neighbor)
    }
  }
  print()
}
