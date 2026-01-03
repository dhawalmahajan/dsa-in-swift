import Foundation

final class Input {
  static func read<T>() -> T? {
    guard let input = readLine() else { return nil }
    switch T.self {
    case is Int.Type:
      return Int(input) as? T
    case is Double.Type:
      return Double(input) as? T
    case is String.Type:
      return input as? T
    default:
      return nil
    }
  }

  static func readArray<T>() -> [T] {
    guard let input = readLine() else { return [] }

    return
      input
      .split(separator: " ")
      .compactMap { value in
        switch T.self {
        case is Int.Type:
          return Int(value) as? T
        case is Double.Type:
          return Double(value) as? T
        case is String.Type:
          return String(value) as? T
        default:
          return nil
        }
      }
  }

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
