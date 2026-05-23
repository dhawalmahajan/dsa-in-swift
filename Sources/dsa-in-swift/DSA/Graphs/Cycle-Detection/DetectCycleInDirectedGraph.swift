//
//  DetectCycleInDirectedGraph.swift
//  dsa-in-swift
//
//  Created by Dhawal Mahajan on 14/05/26.
//

private func isCyclicDirectedGraph(_ v: Int,edges: inout [[Int]]) -> Bool {
    var path = Array<Bool>(repeating: false, count: v)
    var visited = Array<Bool>(repeating: false, count: v)
    for i in 0..<v {
        if !visited[i] && detectCycleUsingDFSInDirectedGraph(i, edges: &edges, path: &path, visited: &visited) {
            return true
        }
    }
    return false
}
private func detectCycleUsingDFSInDirectedGraph(_ node: Int, edges: inout [[Int]], path: inout [Bool], visited: inout [Bool]) -> Bool {
    visited[node] = true
    path[node] = true
    //Look at adjacent nodes.
    for neighbour in edges[node] {
        if path[neighbour] {
            return true
        }
        //If neighbour already visited then skip it
        if visited[neighbour] == true {
            continue
        }
        if detectCycleUsingDFSInDirectedGraph(neighbour, edges: &edges, path: &path, visited: &visited) {
            return true
        }
    }
    path[node] = false
    return false
}
func detectCycleInDirectedGraphDemo() {
     
    let nodeCount = 6
    var adj = [
        [5, 2], [5, 0], [4, 0], [4, 1], [2, 3], [3, 1]
      
    ]
    
    let result = isCyclicDirectedGraph(nodeCount, edges: &adj)
    print(result)
}

/*
 [1, 2], // 0 -> 1, 0 -> 2
 [3],    // 1 -> 3
 [3, 4], // 2 -> 3, 2 -> 4
 [],     // 3
 []      // 4
 
 */
