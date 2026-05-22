//
//  DetectCycleInDirectedGraph.swift
//  dsa-in-swift
//
//  Created by Dhawal Mahajan on 14/05/26.
//

private func isCyclicDirectedGraph(_ v: Int,edges: inout [[Int]]) -> Bool {
    var path = Array<Bool>(repeating: false, count: v)
    return detectCycleUsingDFSInDirectedGraph(v, edges: &edges, path: &path)
}
private func detectCycleUsingDFSInDirectedGraph(_ node: Int, edges: inout [[Int]], path:inout [Bool]) -> Bool {
    path[node] = true
    for neighbour in edges[node] {
        if path[neighbour] {
            return true
        }
        if detectCycleUsingDFSInDirectedGraph(node, edges: &edges, path: &path) {
            return true
        }
    }
    path[node] = false
    return false
}
func detectCycleInDirectedGraphDemo() {
     
    let nodeCount = 5
    var adj = [
        [1, 2], // 0 -> 1, 0 -> 2
        [3],    // 1 -> 3
        [3, 4], // 2 -> 3, 2 -> 4
        [],     // 3
        []      // 4
    ]
    let result = isCyclicDirectedGraph(nodeCount, edges: &adj)
    print(result)
}
