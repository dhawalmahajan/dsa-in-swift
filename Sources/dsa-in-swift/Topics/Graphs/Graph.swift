class GraphNode<T: Hashable> {
  var value: T
  var neighbors: [GraphNode<T>]

  init(value: T) {
    self.value = value
    self.neighbors = []
  }
}
struct Edge<T: Hashable> {
  let from: T
  let to: T
  let weight: Int

  init(from: T, to: T, weight: Int = 1) {
    self.from = from
    self.to = to
    self.weight = weight
  }
}

class Graph<T: Hashable> {
  var adjacencyList: [T: [(vertex: T, weight: Int)]] = [:]
  var isDirected: Bool

  init(isDirected: Bool = false) {
    self.isDirected = isDirected
  }

}
