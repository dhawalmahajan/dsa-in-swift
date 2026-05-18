private func adjacencyMatrixDemo(isDirected: Bool = false, isWeighted: Bool = false) {
  print("Enter number of vertices and edges:", terminator: " ")
  let firstLine = Input.readArray()
  let vertex = firstLine[0]
  let edge = firstLine[1]

  var adjMatrix = Array(repeating: Array(repeating: 0, count: vertex), count: vertex)
  if isWeighted {
    print("Enter edges (u v weight):")
  } else {
    print("Enter edges (u v):")
  }
  for _ in 0..<edge {

    let values = Input.readArray()

    let u = values[0]

    let v = values[1]

    let weight = isWeighted ? values[2] : 1

    adjMatrix[u][v] = weight

    if !isDirected {
      adjMatrix[v][u] = weight
    }
  }
  print("\nAdjacency Matrix:")
  for row in adjMatrix {
    print(row.map(String.init).joined(separator: " "))
  }
}

public func adjacencyMatrixDemo() {
  adjacencyMatrixDemo(isDirected: false, isWeighted: false)
}
