import Foundation

final class Input {

  static func readInt() -> Int {
    Int(readLine() ?? "") ?? 0
  }

  static func readArray() -> [Int] {
    (readLine() ?? "").split(separator: " ").map { Int($0) ?? 0 }
  }

  static func readMatrix(rows: Int) -> [[Int]] {
    var matrix = [[Int]]()
    for _ in 0..<rows {
      matrix.append(readArray())
    }
    return matrix
  }

  static func readGraph(n: Int, m: Int, directed: Bool = false) -> [[Int]] {
    var graph = Array(repeating: [Int](), count: n)
    for _ in 0..<m {
      let edge = readArray()
      graph[edge[0]].append(edge[1])
      if !directed {
        graph[edge[1]].append(edge[0])
      }
    }
    return graph
  }
}
