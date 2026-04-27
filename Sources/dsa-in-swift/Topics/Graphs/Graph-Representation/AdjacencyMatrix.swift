public func adjacencyMatrixDemo() {
  //Undirected weighted graph representation using adjacency matrix
  print("Enter number of vertices and edges:", terminator: " ")
  let firstLine = Input.readArray()
  let vertex = firstLine[0]
  let edge = firstLine[1]
  var adjMatrix = Array(repeating: Array(repeating: 0, count: vertex), count: vertex)
  print("Enter edges (u v weight)")

  for _ in 0..<edge {
    let values = Input.readArray()
    let u = values[0]
    let v = values[1]
    let weight = values[2]
    adjMatrix[u][v] = weight
    adjMatrix[v][u] = weight
  }

  print("\n Adjacency Matrix: ")
  for i in 0..<vertex {
    for j in 0..<vertex {
      print(adjMatrix[i][j], terminator: " ")
    }
    print()
  }

}
