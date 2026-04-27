public func adjacencyMatrixDemo() {

  print("Enter number of vertices and edges:", terminator: " ")
  if let input = readLine() {
    let values = input.split(separator: " ").compactMap { Int($0) }
    if values.count == 2 {
      let vertex = values[0]
      let edge = values[1]
      var adjMatrix = Array(repeating: Array(repeating: 0, count: vertex), count: vertex)
      print("Enter edges (u v weight)")

      for _ in 0..<edge {
        if let edgeInput = readLine() {
          let edgeValues = edgeInput.split(separator: " ").compactMap { Int($0) }
          if edgeValues.count == 3 {
            let u = edgeValues[0]
            let v = edgeValues[1]
            let weight = edgeValues[2]
            adjMatrix[u][v] = weight
            adjMatrix[v][u] = weight
          }
        }
      }
      print("\n Adjacency Matrix: ")
      for i in 0..<vertex {
        for j in 0..<vertex {
          print(adjMatrix[i][j], terminator: " ")
        }
        print()
      }
    }
  }

}
