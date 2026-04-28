//
//  AdjacencyList.swift
//  dsa-in-swift
//
//  Created by Dhawal Mahajan on 28/04/26.
//

private func undirectedUnweightedGraph() {
    print("Enter number of vertices and edges:", terminator: " ")
    let firstLine = Input.readArray()
    let vertex = firstLine[0]
    let edge = firstLine[1]
    
    var adjList = Array(repeating: [Int](), count: vertex)
    
    print("Enter edges (u v):")
    for _ in 0..<edge {
        let values = Input.readArray()
        let u = values[0]
        let v = values[1]
        adjList[u].append(v)
        adjList[v].append(u)
    }
    print("\nAdjacency List:")
    for i in 0..<vertex {
        print("\(i) -> ", terminator: "")
        for node in adjList[i] {
            print("\(node) ", terminator: "")
        }
        print()
    }
}

private func undirectedWeightedGraph() {
     print("Enter number of vertices and edges:", terminator: " ")
    let firstLine = Input.readArray()
    let vertex = firstLine[0]
    let edge = firstLine[1]
    var adjList = Array(repeating: [(Int,Int)](), count: vertex)
    for _ in 0..<edge {
        let values = Input.readArray()
        let u = values[0]
        let v = values[1]
        let weight = values[2]
        adjList[u].append((v,weight))
        adjList[v].append((u,weight))
    }
    for i in 0..<vertex {
        print("\(i) -> ", terminator: "")
        for node in adjList[i] {
            print("edge:\(node.0) weight: \(node.1) ", terminator: "")
        }
        print()
    }
}
func adjacencyListDemo() {
//    undirectedUnweightedGraph()
    undirectedWeightedGraph()
}
